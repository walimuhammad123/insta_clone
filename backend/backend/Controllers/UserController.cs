using backend.Models;
using backend.Models.Validators;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;


namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {

        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;
        private readonly IConfiguration _config;
        private readonly ApplicationDbContext _context;
        private readonly IWebHostEnvironment _environment;

        public UserController(
            UserManager<User> userManager,
            SignInManager<User> signInManager,
            IConfiguration config,
            ApplicationDbContext context,
            IWebHostEnvironment environment)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _config = config;
            _context = context;
            _environment = environment;
        }








        private string GenerateJwtToken(User user)
        {
            // Get JWT settings from configuration
            var jwtKey = _config["Jwt:Key"];
            var jwtIssuer = _config["Jwt:Issuer"];
            var jwtAudience = _config["Jwt:Audience"];
            var jwtExpiryInMinutes = Convert.ToInt32(_config["Jwt:ExpiryInMinutes"]);

            // Ensure the key is not null or empty
            if (string.IsNullOrEmpty(jwtKey))
            {
                throw new ArgumentNullException(nameof(jwtKey), "JWT Key is missing in configuration.");
            }

            // Create security key
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtKey));

            // Create signing credentials
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            // Create claims for the token
            var claims = new[]
            {
        new Claim(JwtRegisteredClaimNames.Sub, user.UserName), // Subject (username)
        new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()), // Unique token ID
        new Claim("UserId", user.Id), // User ID
        new Claim("UserEmail", user.Email), // User email
        new Claim("FullName", user.FullName), // Custom claim for full name
        new Claim("ProfilePicture", user.ProfilePicture) // Custom claim for profile picture
    };

            // Create the token
            var token = new JwtSecurityToken(
                issuer: jwtIssuer, 
                audience: jwtAudience,
                claims: claims,
                expires: DateTime.UtcNow.AddMinutes(jwtExpiryInMinutes), // Token expiry time
                signingCredentials: credentials
            );

            // Serialize the token to a string
            var tokenHandler = new JwtSecurityTokenHandler();
            return tokenHandler.WriteToken(token);
        }
























        [HttpPost("register")]

        [Consumes("multipart/form-data")]
        public async Task<IActionResult> Register([FromForm] RegisterModel model)
        {
            var validator = new RegisterModelValidator();
            var validationResult = validator.Validate(model);

            if (!validationResult.IsValid)
                return BadRequest(validationResult.Errors.Select(e => e.ErrorMessage));

            if (model.Password != model.ConfirmPassword)
                return BadRequest(new { message = "Passwords do not match" });

            if (await _userManager.FindByEmailAsync(model.Email) != null)
                return BadRequest(new { message = "Email already exists" });

            string profilePicturePath = "user.png";
            string coverPhotoPath = "user_coverPhoto.jpg";

            try
            {
                if (model.ProfilePicture != null)
                {
                    profilePicturePath = await SaveFile(model.ProfilePicture, "profile-pictures");
                }

                if (model.CoverPhoto != null)
                {
                    coverPhotoPath = await SaveFile(model.CoverPhoto, "cover-photos");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Error saving file", error = ex.Message });
            }

            var user = new User
            {
                FullName = model.FullName,
                UserName = model.UserName,
                Bio = model.Bio,
                Email = model.Email,
                PhoneNumber = model.PhoneNumber,
                ProfilePicture = profilePicturePath,
                CoverPhoto = coverPhotoPath,
                IsPrivate = model.IsPrivate,
                JoinedAt = DateTime.UtcNow,
            };

            var result = await _userManager.CreateAsync(user, model.Password);
            if (!result.Succeeded)
                return BadRequest(result.Errors);

            var token = GenerateJwtToken(user);

            return Ok(new
            {
                token = token,
                user = new
                {
                    Id = user.Id,
                    Email = user.Email,
                    UserName = user.UserName,
                    FullName = user.FullName,
                    Bio = user.Bio,
                    PhoneNumber = user.PhoneNumber,
                    ProfilePicture = user.ProfilePicture,
                    CoverPhoto = user.CoverPhoto,
                    IsPrivate = user.IsPrivate
                }
            });
        }


        private async Task<string> SaveFile(IFormFile file, string folder)
        {
            var uploadsFolder = Path.Combine(_environment.WebRootPath, "uploads", folder);
            if (!Directory.Exists(uploadsFolder))
            {
                Directory.CreateDirectory(uploadsFolder);
            }

            var uniqueFileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
            var filePath = Path.Combine(uploadsFolder, uniqueFileName);

            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            return $"/uploads/{folder}/{uniqueFileName}";
        }



        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginModel model)
        {
            var user = await _userManager.FindByEmailAsync(model.Email);
            if (user == null)
                return BadRequest(new { message = "Invalid email or password" });

            var result = await _signInManager.CheckPasswordSignInAsync(user, model.Password, false);
            if (!result.Succeeded)
                return BadRequest(new { message = "Invalid email or password" });

            // Generate JWT token
            var token = GenerateJwtToken(user);
            return Ok(new { token = token });
        }

        [HttpPost("logout")]
        public async Task<IActionResult> Logout()
        {
            await _signInManager.SignOutAsync();
            return Ok(new { message = "Logged out successfully" });
        }

        [HttpGet("profile/{userId}")]
        public async Task<IActionResult> GetProfile(string userId)
        {
            var user = await _userManager.FindByIdAsync(userId);
            if (user == null)
                return NotFound(new { message = "User not found" });
            var posts = await _context.Posts
                .Where(p => p.UserId == user.Id)
                .OrderByDescending(p => p.CreatedAt)
                .Include(i => i.User)
                .Select(p => new {
                    p.Id,
                    p.CommentsCount,
                    p.LikesCount,
                    p.MediaUrl,
                    p.SharesCount,
                    p.Content,
                    p.UserId,
                    User = new
                    {
                        userId = p.UserId,
                        p.User.FullName,
                        p.User.ProfilePicture,

                    }
                })
                .ToListAsync();

            return Ok(new {user, posts});
        }

        [HttpPut("profile/{userId}")]
        public async Task<IActionResult> UpdateProfile(string userId, [FromBody] UpdateProfileModel model)
        {
            var user = await _userManager.FindByIdAsync(userId);
            if (user == null)
                return NotFound(new { message = "User not found" });

            user.FullName = model.FullName;
            user.Bio = model.Bio;
            user.ProfilePicture = model.ProfilePicture;
            user.CoverPhoto = model.CoverPhoto;

            var result = await _userManager.UpdateAsync(user);
            if (!result.Succeeded)
                return BadRequest(result.Errors);

            return Ok(new { message = "Profile updated successfully" });
        }

        [HttpGet("socialData/{userId}")]
        public async Task<IActionResult> GetUserSocialData(string userId)
        {
            var followersCount = await _context.Followers.CountAsync(f => f.FollowingId == userId);
            var followingCount = await _context.Followers.CountAsync(f => f.FollowerId == userId);
            var postCount = await _context.Posts.CountAsync(p => p.UserId == userId);

            var userSocialData = new
            {
                UserId = userId,
                FollowersCount = followersCount,
                FollowingCount = followingCount,
                PostCount = postCount
            };

            return Ok(userSocialData);
        }

        //[HttpGet("followingPosts/{userId}")]
        //public async Task<IActionResult> GetFollowingPosts(string userId)
        //{
        //    var followingIds = await _context.Followers
        //        .Where(f => f.FollowerId == userId)
        //        .Select(f => f.FollowingId)
        //        .ToListAsync();

        //    if (!followingIds.Any())
        //    {
        //        return NotFound(new { message = "User is not following anyone." });
        //    }

        //    var posts = await _context.Posts
        //        .Where(p => followingIds.Contains(p.UserId) && p.IsPublic)
        //        .OrderByDescending(p => p.CreatedAt)
        //        .Select(p => new
        //        {
        //            p.Id,
        //            p.Content,
        //            p.MediaUrl,
        //            p.CreatedAt,
        //            p.UserId,
        //            User = new
        //            {
        //                p.User.Id,
        //                p.User.FullName,
        //                p.User.UserName,
        //                p.User.ProfilePicture
        //            },
        //            p.LikesCount,
        //            p.CommentsCount,
        //            p.SharesCount
        //        })
        //        .ToListAsync();

        //    if (!posts.Any())
        //    {
        //        return NotFound(new { message = "No posts found from followings" });
        //    }

        //    return Ok(posts);
        //}


        [HttpGet("getUsers/{query}")]
        public async Task<IActionResult> GetUsers(string query)
        {
            if (string.IsNullOrEmpty(query))
            {
                return BadRequest("Query cannot be empty.");
            }

            try
            {
                var filteredUsers = await _context.Users
                    .Where(u => EF.Functions.Like(u.UserName, $"%{query}%"))
                    .Select(u => new
                    {
                        u.Id,
                        u.UserName,
                        u.ProfilePicture
                    })
                    .ToListAsync();

                return Ok(filteredUsers);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "An error occurred while fetching users.");
            }
        }

    }
}
