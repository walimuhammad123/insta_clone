using backend.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FeedController : ControllerBase
    {

        private readonly IConfiguration _config;
        private readonly ApplicationDbContext _context;

        public FeedController(
            
            IConfiguration config,
            ApplicationDbContext context)
        {
            _config = config;
            _context = context;
        }


        [HttpGet("feed/{userId}")]
        public async Task<IActionResult> GetFeed(string userId)
        {
            var followingIds = await _context.Followers
             .Where(f => f.FollowerId == userId)
             .Select(f => f.FollowingId)
             .ToListAsync();

            var posts = await _context.Posts
            .Where(p => followingIds.Contains(p.UserId) || p.UserId == userId)
            .Include(c => c.User)
            .OrderByDescending(p => p.CreatedAt)
            .AsNoTracking()
            .ToListAsync();

            return Ok(posts);
        }

    }
}
