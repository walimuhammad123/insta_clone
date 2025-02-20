using backend.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LikeController : ControllerBase
    {
        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;
        private readonly IConfiguration _config;
        private readonly ApplicationDbContext _context;

        public LikeController(
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


        [HttpPost("{userId}/{postId}")]
        public async Task<IActionResult> LikePost(string userId, Guid postId)
        {
            var user = await _userManager.FindByIdAsync(userId);
            var post = await _context.Posts.FirstOrDefaultAsync(p => p.Id == postId);

            if (user == null)
                return NotFound(new { message = "User not found" });
            if (post == null)
                return NotFound(new { message = "Post not found" });

            // Check if user already liked the post
            var existingLike = await _context.Likes
                .FirstOrDefaultAsync(l => l.UserId == userId && l.PostId == postId);

            if (existingLike != null)
                return BadRequest(new { message = "Already liked this post." });

            // Add new like
            var like = new Like { UserId = userId, PostId = postId };
            _context.Likes.Add(like);
            post.LikesCount++;

            await _context.SaveChangesAsync();

            return Ok(new { message = "Liked successfully", likesCount = post.LikesCount });
        }

        [HttpDelete("{userId}/{postId}")]
        public async Task<IActionResult> UnlikePost(string userId, Guid postId)
        {
            var like = await _context.Likes
                .FirstOrDefaultAsync(l => l.UserId == userId && l.PostId == postId);

            if (like == null)
                return NotFound(new { message = "Like not found" });

            var post = await _context.Posts.FirstOrDefaultAsync(p => p.Id == postId);
            if (post != null)
                post.LikesCount--;

            _context.Likes.Remove(like);
            await _context.SaveChangesAsync();

            return Ok(new { message = "Unliked successfully", likesCount = post?.LikesCount ?? 0 });
        }

        [HttpGet("post/{postId}")]
        public async Task<IActionResult> GetLikes(Guid postId)
        {
            var likes = await _context.Likes
                .Where(l => l.PostId == postId)
                .Select(l => new { l.UserId, l.LikedAt })
                .ToListAsync();

            return Ok(likes);
        }

        [HttpGet("user/{userId}")]
        public async Task<IActionResult> GetLikedPosts(string userId)
        {
            var likedPosts = await _context.Likes
                .Where(l => l.UserId == userId)
                .Select(l => new { l.PostId, l.LikedAt })
                .ToListAsync();

            return Ok(likedPosts);
        }

        [HttpGet("check/{userId}/{PostId}")]
        public async Task<IActionResult> CheckUserLikedPost(string userId, Guid postId)
        {
            var isLiked = await _context.Likes
                .AnyAsync(like => like.UserId == userId && like.PostId == postId);

            return Ok(new { isLiked });
        }

    }
}
