using System;
using System.ComponentModel.DataAnnotations;

namespace backend.Models
{
    public class Post
    {
        public Guid Id { get; set; } = Guid.NewGuid(); // Unique Post ID

        /* Post Content */
        [Required]
        public string Content { get; set; } // Post text (required)

        public string MediaUrl { get; set; } // Image/Video (optional)

        /* User Info */
        [Required]
        public string UserId { get; set; } // Reference to the User who posted it

        public User User { get; set; } // Navigation Property

        /* Timestamps */
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public DateTime? UpdatedAt { get; set; }

        /* Privacy & Visibility */
        public bool IsPublic { get; set; } = true; // True = Everyone can see, False = Followers only

        /* Engagement Stats */
        public int LikesCount { get; set; } = 0;
        public int CommentsCount { get; set; } = 0;
        public int SharesCount { get; set; } = 0;

        /* Relationships */
        public ICollection<Comment> Comments { get; set; } = new List<Comment>();
        public ICollection<Like> Likes { get; set; } = new List<Like>();
    }
}