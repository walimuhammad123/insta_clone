namespace backend.Models
{
    public class RegisterModel
    {
        public string? FullName { get; set; }
        public string? Bio { get; set; }
        public string? UserName { get; set; }
        public string? Email { get; set; }
        public string? PhoneNumber { get; set; }
        public string? Password { get; set; }
        public string? ConfirmPassword { get; set; }
        public bool IsPrivate { get; set; } = false;
        public IFormFile ProfilePicture { get; set; }
        public IFormFile? CoverPhoto { get; set; }
    }
}