using FluentValidation;

namespace backend.Models.Validators
{
    public class RegisterModelValidator : AbstractValidator<RegisterModel>
    {
        public RegisterModelValidator()
        {
            // 📌 Full Name (Required, Max Length: 50)
            RuleFor(x => x.FullName)
                .NotEmpty().WithMessage("Full Name is required.")
                .MaximumLength(50).WithMessage("Full Name cannot exceed 50 characters.");

            // 📌 Username (Required, Alphanumeric, Min 3, Max 20)
            RuleFor(x => x.UserName)
                .NotEmpty().WithMessage("Username is required.")
                .Matches("^[a-zA-Z0-9_]+$").WithMessage("Username can only contain letters, numbers, and underscores.")
                .MinimumLength(3).WithMessage("Username must be at least 3 characters long.")
                .MaximumLength(20).WithMessage("Username cannot exceed 20 characters.");

            // 📌 Email (Required, Valid Format)
            RuleFor(x => x.Email)
                .NotEmpty().WithMessage("Email is required.")
                .EmailAddress().WithMessage("Invalid email format.");

            // 📌 Phone Number (Optional, Must be a valid format if provided)
            RuleFor(x => x.PhoneNumber)
                .Matches(@"^\+?[1-9][0-9]{7,14}$")
                .WithMessage("Invalid phone number format.")
                .When(x => !string.IsNullOrEmpty(x.PhoneNumber));

            // 📌 Password (Required, Strong Policy)
            RuleFor(x => x.Password)
                .NotEmpty().WithMessage("Password is required.")
                .MinimumLength(8).WithMessage("Password must be at least 8 characters long.")
                .Matches(@"[A-Z]").WithMessage("Password must contain at least one uppercase letter.")
                .Matches(@"[a-z]").WithMessage("Password must contain at least one lowercase letter.")
                .Matches(@"[0-9]").WithMessage("Password must contain at least one number.")
                .Matches(@"[\W]").WithMessage("Password must contain at least one special character (!@#$%^&* etc.).");

            // 📌 Confirm Password (Must Match Password)
            RuleFor(x => x.ConfirmPassword)
                .Equal(x => x.Password).WithMessage("Passwords do not match.");

            // 📌 IsPrivate (Default: False)
            RuleFor(x => x.IsPrivate)
                .NotNull().WithMessage("Privacy setting is required.");
        }
    }
}
