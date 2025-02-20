using System;
using System.ComponentModel.DataAnnotations;

namespace backend.Models
{
    public class Notification
    {
        public Guid Id { get; set; } = Guid.NewGuid(); // Unique Notification ID

        [Required]
        public string UserId { get; set; } // User who receives the notification
        public User User { get; set; } // Navigation Property

        [Required]
        public string Message { get; set; } // Notification message

        public bool IsRead { get; set; } = false; // Whether the notification has been read
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    }
}