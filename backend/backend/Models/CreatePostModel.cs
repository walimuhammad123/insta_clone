namespace backend.Models
{
    public class CreatePostModel
    {
        public string Content { get; set; }
        public string UserId { get; set; }
        public bool IsPublic { get; set; } = true;
        public IFormFile MediaFile { get; set; } 
    }
}