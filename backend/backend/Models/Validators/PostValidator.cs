using FluentValidation;

namespace backend.Models.Validators
{
    public class PostValidator : AbstractValidator<Post>
    {
        public PostValidator()
        {
            // 📌 Content Validation
            RuleFor(x => x.Content)
                .NotEmpty().WithMessage("Post content cannot be empty.")
                .MaximumLength(280).WithMessage("Post content cannot exceed 280 characters."); // Twitter-like limit

            // 📌 Media URL Validation (Optional)
            RuleFor(x => x.MediaUrl)
                .Must(BeAValidUrl)
                .When(x => !string.IsNullOrEmpty(x.MediaUrl))
                .WithMessage("Invalid media URL format.");

            // 📌 User ID Validation
            RuleFor(x => x.UserId)
                .NotEmpty().WithMessage("User ID is required.");

            // 📌 Privacy Settings Validation
            RuleFor(x => x.IsPublic)
                .NotNull().WithMessage("Privacy setting must be specified.");
        }

        // 🖼 Helper Method: Validate Media URL
        private bool BeAValidUrl(string mediaUrl)
        {
            return Uri.TryCreate(mediaUrl, UriKind.Absolute, out _);
        }
    }
}
