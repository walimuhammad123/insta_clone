using backend.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PostController : ControllerBase
    {

        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;
        private readonly IConfiguration _config;
        private readonly ApplicationDbContext _context;

        public PostController(
            UserManager<User> userManager,
            SignInManager<User> signInManager,
            IConfiguration config,
            ApplicationDbContext context)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _config = config;
            _context = context;
        }

        [HttpGet("posts/{userId}")]
        public async Task<IActionResult> GetPost(string userId)
        {
            var user = await _userManager.FindByIdAsync(userId);
            if (user == null)
                return BadRequest(new { message = "User Not Found!" });

            var posts = await _context.Posts.Where(p => p.UserId == userId).ToListAsync();
            if(posts.Count <= 0)
                return BadRequest(new { message = "Post Not Found!" });

            return Ok(posts);
        }

        [HttpGet("posts")]
        public async Task<IActionResult> GetAllPost()
        {
            var posts = await _context.Posts
                .Include(c => c.User)
                .ToListAsync();
            if (posts.Count <= 0)
                return BadRequest(new { message = "Post's Not Found!" });

            return Ok(posts);
        }

        [HttpPost("posts")]
        public async Task<IActionResult> CreatePost([FromForm] CreatePostModel model)   
        {
            if (model.MediaFile == null || model.MediaFile.Length == 0)
                return BadRequest(new { message = "No file uploaded." });

            if (model.MediaFile.Length > 5 * 1024 * 1024) 
                return BadRequest(new { message = "File size exceeds the 5 MB limit." });

            var allowedExtensions = new[] { ".jpg", ".jpeg", ".png", ".gif", ".mp4", ".mov" };
            var fileExtension = Path.GetExtension(model.MediaFile.FileName).ToLower();
            if (!allowedExtensions.Contains(fileExtension))
                return BadRequest(new { message = "Invalid file type. Only images (JPG, JPEG, PNG, GIF) and videos (MP4, MOV) are allowed." });

            var user = await _userManager.FindByIdAsync(model.UserId);
            if (user == null)
                return NotFound(new { message = "User not found" });

            var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/uploads/content");
            if (!Directory.Exists(uploadsFolder))
                Directory.CreateDirectory(uploadsFolder);

            var uniqueFileName = Guid.NewGuid().ToString() + fileExtension;
            var filePath = Path.Combine(uploadsFolder, uniqueFileName);

            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await model.MediaFile.CopyToAsync(stream);
            }

            var staticUrl = $"/uploads/content/{uniqueFileName}";

            // Create the post
            var post = new Post
            {
                Content = model.Content,
                MediaUrl = staticUrl,
                UserId = model.UserId,
                CreatedAt = DateTime.UtcNow,
                IsPublic = model.IsPublic
            };

            _context.Posts.Add(post);
            await _context.SaveChangesAsync();

            return Ok(new { message = "Post created successfully", post });
        }


        [HttpDelete("{postId}")]
        public async Task<IActionResult> DeletePostAsync(Guid postId)
        {
            var post = await _context.Posts
                .Include(p => p.Comments)
                .FirstOrDefaultAsync(p => p.Id == postId);

            if (post == null)
                return NotFound(new {message = "Post not found" });

            _context.Comments.RemoveRange(post.Comments);

            _context.Posts.Remove(post);

            await _context.SaveChangesAsync();

            return Ok(new { message = "Post Deleted successfully" });
        }

        [HttpPut("posts/{postId}")]
        public async Task<IActionResult> UpdatePost(Guid postId, [FromBody] UpdatePostModel model)
        {
            var post = await _context.Posts.FindAsync(postId);

            if (post == null)
                return NotFound(new { message = "Post not found" });

            if (post.UserId != model.UserId)
                return Unauthorized(new { message = "You can only edit your own posts" });

            post.Content = model.Content;
            post.MediaUrl = model.MediaUrl;
            post.IsPublic = model.IsPublic;
            post.UpdatedAt = DateTime.UtcNow;

            await _context.SaveChangesAsync();

            return Ok(new { message = "Post updated successfully" });
        }


    }
}
