using backend.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FollowController : ControllerBase
    {

        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;
        private readonly IConfiguration _config;
        private readonly ApplicationDbContext _context;

        public FollowController(
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


        [HttpPost("{followerId}/{followingId}")]
        public async Task<IActionResult> FollowUser(string followerId, string followingId)
        {
            if (followerId == followingId)
                return BadRequest(new { message = "You cannot follow yourself." });

            var follower = await _userManager.FindByIdAsync(followerId);
            var following = await _userManager.FindByIdAsync(followingId);

            if (follower == null || following == null)
                return NotFound(new { message = "User not found" });

            // Check if already following
            var existingFollow = await _context.Followers
                .FirstOrDefaultAsync(f => f.FollowerId == followerId && f.FollowingId == followingId);

            if (existingFollow != null)
                return BadRequest(new { message = "Already following this user." });

            // Add new follow relationship
            var follow = new Follower
            {
                FollowerId = followerId,
                FollowingId = followingId,
                FollowedAt = DateTime.UtcNow
            };

            _context.Followers.Add(follow);
            following.FollowersCount++;
            follower.FollowingCount++;

            await _context.SaveChangesAsync();

            return Ok(new { message = "Followed successfully", followersCount = following.FollowersCount });
        }

        [HttpDelete("unfollow/{followerId}/{followingId}")]
        public async Task<IActionResult> UnfollowUser(string followerId, string followingId)
        {
            var follow = await _context.Followers
                .FirstOrDefaultAsync(f => f.FollowerId == followerId && f.FollowingId == followingId);

            if (follow == null)
                return NotFound(new { message = "Follow relationship not found" });

            _context.Followers.Remove(follow);

            var follower = await _userManager.FindByIdAsync(followerId);
            var following = await _userManager.FindByIdAsync(followingId);

            if (follower != null) follower.FollowingCount--;
            if (following != null) following.FollowersCount--;



            await _context.SaveChangesAsync();

            return Ok(new { message = "Unfollowed successfully", followersCount = following?.FollowersCount });
        }


        [HttpGet("followers/{userId}")]
        public async Task<IActionResult> GetFollowers(string userId)
        {
            var followers = await _context.Followers
                .Where(f => f.FollowingId == userId)
                .Select(f => new { f.FollowerId, f.FollowedAt })
                .ToListAsync();

            return Ok(followers);
        }


        [HttpGet("following/{userId}")]
        public async Task<IActionResult> GetFollowing(string userId)
        {
            var following = await _context.Followers
                .Where(f => f.FollowerId == userId)
                .Select(f => new { f.FollowingId, f.FollowedAt })
                .ToListAsync();

            return Ok(following);
        }

    }
}
