using System;
using System.ComponentModel.DataAnnotations;

namespace backend.Models
{
    public class Like
    {
        public Guid Id { get; set; } = Guid.NewGuid(); // Unique Like ID

        [Required]
        public string UserId { get; set; } // User who liked the post
        public User User { get; set; } // Navigation Property

        [Required]
        public Guid PostId { get; set; } // Post being liked
        public Post Post { get; set; } // Navigation Property

        public DateTime LikedAt { get; set; } = DateTime.UtcNow;
    }
}