using System;
using System.ComponentModel.DataAnnotations;

namespace backend.Models
{
    public class Comment
    {
        public Guid Id { get; set; } = Guid.NewGuid(); // Unique Comment ID

        [Required]
        public string Content { get; set; } // Comment text

        [Required]
        public string UserId { get; set; } // User who commented
        public User User { get; set; } // Navigation Property

        [Required]
        public Guid PostId { get; set; } // Post being commented on
        public Post Post { get; set; } // Navigation Property

        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public DateTime? UpdatedAt { get; set; }
    }
}