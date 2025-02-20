using System.ComponentModel.DataAnnotations;

namespace backend.Models
{
    public class UpdateCommentModel
    {
        [Required]
        public string UserId { get; set; }

        [Required]
        public string Content { get; set; }
    }
}
