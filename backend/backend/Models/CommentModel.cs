namespace backend.Models
{
    public class CommentModel
    {
        public string UserId { get; set; }
        public Guid PostId { get; set; }
        public string Comment { get; set; }
    }
}
