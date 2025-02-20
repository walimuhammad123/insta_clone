using backend.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommentController : ControllerBase
    {
        private readonly UserManager<User> _userManager;
        private readonly IConfiguration _config;
        private readonly ApplicationDbContext _context;

        public CommentController(
            UserManager<User> userManager,
            IConfiguration config,
            ApplicationDbContext context)
        {
            _userManager = userManager;
            _config = config;
            _context = context;
        }

      
            [HttpPost]
            public async Task<IActionResult> AddComment([FromBody] CreateCommentModel model)
            {
                var user = await _userManager.FindByIdAsync(model.UserId);
                var post = await _context.Posts.FirstOrDefaultAsync(p => p.Id == model.PostId);

                if (user == null)
                    return NotFound(new { message = "User not found" });
                if (post == null)
                    return NotFound(new { message = "Post not found" });

                var comment = new Comment
                {
                    Content = model.Content,
                    UserId = model.UserId,
                    PostId = model.PostId,
                    CreatedAt = DateTime.UtcNow
                };

                _context.Comments.Add(comment);
                post.CommentsCount++;

                await _context.SaveChangesAsync();

                return Ok(new { message = "Comment added successfully", commentId = comment.Id });
            }

            [HttpPut("{commentId}")]
            public async Task<IActionResult> EditComment(Guid commentId, [FromBody] UpdateCommentModel model)
            {
                var comment = await _context.Comments.FindAsync(commentId);

                if (comment == null) return NotFound(new { message = "Comment not found" });

                if (comment.UserId != model.UserId)
                    return Unauthorized(new { message = "You can only edit your own comments" });

                comment.Content = model.Content;
                comment.UpdatedAt = DateTime.UtcNow;

                await _context.SaveChangesAsync();

                return Ok(new { message = "Comment updated successfully" });
            }

            [HttpDelete("{commentId}")]
            public async Task<IActionResult> DeleteComment(Guid commentId)
            {
                var comment = await _context.Comments.FindAsync(commentId);
                if (comment == null)
                    return NotFound(new { message = "Comment not found" });

                var post = await _context.Posts.FirstOrDefaultAsync(p => p.Id == comment.PostId);
                if (post != null)
                    post.CommentsCount--;

                _context.Comments.Remove(comment);
                await _context.SaveChangesAsync();

                return Ok(new { message = "Comment deleted successfully" });
            }

            [HttpGet("{postId}")]
            public async Task<IActionResult> GetComments(Guid postId)
            {
                var comments = await _context.Comments
                    .Where(c => c.PostId == postId)
                    .OrderByDescending(c => c.CreatedAt)
                    .Include(c => c.User) 
                    .Select(c => new
                    {
                        c.Id,
                        c.Content,
                        c.UserId,
                        UserFullName = c.User.FullName, 
                        UserProfilePicture = c.User.ProfilePicture,
                        c.CreatedAt,
                        c.UpdatedAt
                    })
                    .ToListAsync();

                return Ok(comments);
            }


    }
    }