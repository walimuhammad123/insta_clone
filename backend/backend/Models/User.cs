using Microsoft.AspNetCore.Identity;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace backend.Models
{
    public class User : IdentityUser
    {
        /* User Info */
        public string FullName { get; set; }
        public string Bio { get; set; }
        public string ProfilePicture { get; set; } = "default.png";
        public string CoverPhoto { get; set; } = "default_cover.jpg";

        /* Contact Info */
        public bool IsPhoneVerified { get; set; }
        public bool IsEmailVerified { get; set; }

        /* Account Stats */
        public int FollowersCount { get; set; }
        public int FollowingCount { get; set; }
        public DateTime JoinedAt { get; set; } = DateTime.UtcNow;
        public bool IsVerified { get; set; }

        /* Privacy & Settings */
        public bool IsPrivate { get; set; }
        public bool AllowMessagesFromAnyone { get; set; }
        public bool AllowTagging { get; set; }

        /* Notifications Preferences */
        public bool NotifyOnFollow { get; set; }
        public bool NotifyOnLike { get; set; }
        public bool NotifyOnComment { get; set; }
        public bool NotifyOnMention { get; set; }

        /* Relationships */
        public ICollection<Follower> Followers { get; set; } = new List<Follower>();
        public ICollection<Follower> Following { get; set; } = new List<Follower>();
        [JsonIgnore]
        public ICollection<Post> Posts { get; set; } = new List<Post>();
    }
}