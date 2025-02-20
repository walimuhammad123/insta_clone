using System.ComponentModel.DataAnnotations;

namespace backend.Models
{
    public class UpdatePostModel
    {
        [Required]
        public string UserId { get; set; } 

        [Required]
        public string Content { get; set; } 

        public string MediaUrl { get; set; } 

        public bool IsPublic { get; set; }
    }
}
