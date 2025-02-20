using System.ComponentModel.DataAnnotations;

namespace backend.Models
{
    public class CreateCommentModel
    {
        [Required]
        public string UserId { get; set; }

        [Required]
        public Guid PostId { get; set; }

        [Required]
        public string Content { get; set; }
    }
}
