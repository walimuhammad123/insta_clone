using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    public class Follower
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string FollowerId { get; set; } // Who is following

        [Required]
        public string FollowingId { get; set; } // Who is being followed

        public DateTime FollowedAt { get; set; } = DateTime.UtcNow;

        [ForeignKey("FollowerId")]
        public User FollowerUser { get; set; }

        [ForeignKey("FollowingId")]
        public User FollowingUser { get; set; }
    }
}