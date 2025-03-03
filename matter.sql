USE [master]
GO
/****** Object:  Database [matter]    Script Date: 20/02/2025 11:44:48 ******/
CREATE DATABASE [matter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'matter', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\matter.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'matter_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\matter_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [matter] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [matter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [matter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [matter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [matter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [matter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [matter] SET ARITHABORT OFF 
GO
ALTER DATABASE [matter] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [matter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [matter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [matter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [matter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [matter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [matter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [matter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [matter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [matter] SET  DISABLE_BROKER 
GO
ALTER DATABASE [matter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [matter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [matter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [matter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [matter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [matter] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [matter] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [matter] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [matter] SET  MULTI_USER 
GO
ALTER DATABASE [matter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [matter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [matter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [matter] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [matter] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [matter] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [matter] SET QUERY_STORE = ON
GO
ALTER DATABASE [matter] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [matter]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 20/02/2025 11:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 20/02/2025 11:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 20/02/2025 11:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 20/02/2025 11:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 20/02/2025 11:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 20/02/2025 11:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 20/02/2025 11:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Bio] [nvarchar](max) NOT NULL,
	[ProfilePicture] [nvarchar](max) NOT NULL,
	[CoverPhoto] [nvarchar](max) NOT NULL,
	[IsPhoneVerified] [bit] NOT NULL,
	[IsEmailVerified] [bit] NOT NULL,
	[FollowersCount] [int] NOT NULL,
	[FollowingCount] [int] NOT NULL,
	[JoinedAt] [datetime2](7) NOT NULL,
	[IsVerified] [bit] NOT NULL,
	[IsPrivate] [bit] NOT NULL,
	[AllowMessagesFromAnyone] [bit] NOT NULL,
	[AllowTagging] [bit] NOT NULL,
	[NotifyOnFollow] [bit] NOT NULL,
	[NotifyOnLike] [bit] NOT NULL,
	[NotifyOnComment] [bit] NOT NULL,
	[NotifyOnMention] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 20/02/2025 11:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 20/02/2025 11:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[PostId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Followers]    Script Date: 20/02/2025 11:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Followers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FollowerId] [nvarchar](450) NOT NULL,
	[FollowingId] [nvarchar](450) NOT NULL,
	[FollowedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Followers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 20/02/2025 11:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[PostId] [uniqueidentifier] NOT NULL,
	[LikedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Likes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 20/02/2025 11:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[IsRead] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 20/02/2025 11:44:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[MediaUrl] [nvarchar](max) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsPublic] [bit] NOT NULL,
	[LikesCount] [int] NOT NULL,
	[CommentsCount] [int] NOT NULL,
	[SharesCount] [int] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250201132427_InitialCreate', N'9.0.1')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Bio], [ProfilePicture], [CoverPhoto], [IsPhoneVerified], [IsEmailVerified], [FollowersCount], [FollowingCount], [JoinedAt], [IsVerified], [IsPrivate], [AllowMessagesFromAnyone], [AllowTagging], [NotifyOnFollow], [NotifyOnLike], [NotifyOnComment], [NotifyOnMention], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3c4e69ce-e919-445c-bf45-74bedf174e9c', N'Zohaib Khan', N'This is the bio ', N'string', N'string', 0, 0, 2, 0, CAST(N'2025-02-01T13:53:46.0359283' AS DateTime2), 0, 1, 0, 0, 0, 0, 0, 0, N'Zohaikhan', N'ZOHAIKHAN', N'zohaib@gmail.com', N'ZOHAIB@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEHnXyH44omKQq9VpUDlKEEGkLSb3pZVE/BKMNKK2YFshCs1yUV3cVvvkQJvLjNE2TA==', N'ZPILDPBFVVO4WHHTG277IS77JQH4JAQO', N'a61d3746-617c-4c44-9e82-de174b595d97', N'+923481809798', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Bio], [ProfilePicture], [CoverPhoto], [IsPhoneVerified], [IsEmailVerified], [FollowersCount], [FollowingCount], [JoinedAt], [IsVerified], [IsPrivate], [AllowMessagesFromAnyone], [AllowTagging], [NotifyOnFollow], [NotifyOnLike], [NotifyOnComment], [NotifyOnMention], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4c91181f-b5d8-497b-b5b8-04cd0378c60c', N'Hope Moreno', N'Cumque non tempora s', N'/uploads/profile-pictures/5a7f2d81-d6a1-489d-ace9-4e4501762b7d.jpg', N'/uploads/cover-photos/4a5959a5-10d6-4606-8359-71bc5be41544.JPG', 0, 0, 0, 0, CAST(N'2025-02-14T13:09:26.0715557' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, N'kaqaxuzelu', N'KAQAXUZELU', N'cyxy@mailinator.com', N'CYXY@MAILINATOR.COM', 0, N'AQAAAAIAAYagAAAAEORZc8J7kl3ntol6mWoh9aAbiyW0VINtpM2//uhhLZjuNLYShF4H/SLM1Mnr5ZvyzA==', N'AQUEWI3UIYP4IIE5ZX6GSSJKMFTHJIBR', N'f110d360-8cbd-4f94-a745-5dfbcb8cb36d', N'+19719996095', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Bio], [ProfilePicture], [CoverPhoto], [IsPhoneVerified], [IsEmailVerified], [FollowersCount], [FollowingCount], [JoinedAt], [IsVerified], [IsPrivate], [AllowMessagesFromAnyone], [AllowTagging], [NotifyOnFollow], [NotifyOnLike], [NotifyOnComment], [NotifyOnMention], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'88b6dce8-9341-4d38-985e-0ec155ff275c', N'Asad Ali', N'This is my bio', N'string', N'string', 0, 0, 0, 1, CAST(N'2025-02-01T14:59:01.9102986' AS DateTime2), 0, 1, 0, 0, 0, 0, 0, 0, N'Asad_Ali', N'ASAD_ALI', N'Asad@email.com', N'ASAD@EMAIL.COM', 0, N'AQAAAAIAAYagAAAAEGkRS8ifmTWoJYHKxMe51BJxI9v6f7KD13XjN8Dpr8on6xI5fbhDAD/FEuwUuBPbhA==', N'WCABIQ4OUGSR5LKEJO4CMK23T76BIMFL', N'1991fd4f-e398-48f7-b5dd-52b12034464c', N'+921313131313', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Bio], [ProfilePicture], [CoverPhoto], [IsPhoneVerified], [IsEmailVerified], [FollowersCount], [FollowingCount], [JoinedAt], [IsVerified], [IsPrivate], [AllowMessagesFromAnyone], [AllowTagging], [NotifyOnFollow], [NotifyOnLike], [NotifyOnComment], [NotifyOnMention], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'cd03778d-3408-4914-b11f-0e6852cf93e2', N'Asad Ali', N'This is my Bio', N'/uploads/profile-pictures/3ac17e85-0f2a-44ac-85af-9373d9d2427d.jpg', N'/uploads/cover-photos/3a685608-b445-4247-8eba-33d28af0e8bc.JPG', 0, 0, 0, 1, CAST(N'2025-02-14T13:22:02.2856761' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0, N'Asad_Ali123', N'ASAD_ALI123', N'asad@gmail.com', N'ASAD@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEFI56ob9BXlS8kBfrpKNDvMEf2lfkNJUt9pBORmeSURbY8BYNxiyhSYrxk8RfMSwmg==', N'CD3S5MYVV62THC5B7BVLSQAGVXFZPCRJ', N'8bb55c80-1d93-4b37-95d0-a7fa07ea3e43', N'+923481809798', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [PostId], [CreatedAt], [UpdatedAt]) VALUES (N'e3a368fd-c044-46a9-b6c1-01753e8d3a63', N'THis is the edit First comment', N'3c4e69ce-e919-445c-bf45-74bedf174e9c', N'67369001-7590-4d0d-8aab-aff1d491bc2e', CAST(N'2025-02-01T18:25:16.6580776' AS DateTime2), CAST(N'2025-02-01T18:26:27.3206516' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [PostId], [CreatedAt], [UpdatedAt]) VALUES (N'4859c67c-5c0f-4ab8-94f3-088a2368edc8', N'This is my second comment', N'cd03778d-3408-4914-b11f-0e6852cf93e2', N'67369001-7590-4d0d-8aab-aff1d491bc2e', CAST(N'2025-02-18T13:43:43.0018707' AS DateTime2), NULL)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [PostId], [CreatedAt], [UpdatedAt]) VALUES (N'a1ed3056-8f74-4244-919c-17ef1b1242b2', N'This is the final comment', N'cd03778d-3408-4914-b11f-0e6852cf93e2', N'67369001-7590-4d0d-8aab-aff1d491bc2e', CAST(N'2025-02-18T14:35:50.1482626' AS DateTime2), NULL)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [PostId], [CreatedAt], [UpdatedAt]) VALUES (N'2fd3b30f-b18c-46e3-8c4b-1f10d588a7d9', N'THis is my 3 comment', N'cd03778d-3408-4914-b11f-0e6852cf93e2', N'67369001-7590-4d0d-8aab-aff1d491bc2e', CAST(N'2025-02-18T13:44:12.8788379' AS DateTime2), NULL)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [PostId], [CreatedAt], [UpdatedAt]) VALUES (N'b59b75db-2922-4a2d-bf06-4df5b74ed50d', N'asd', N'cd03778d-3408-4914-b11f-0e6852cf93e2', N'f46962e0-6405-438b-b352-39fb65f5990e', CAST(N'2025-02-20T05:06:36.9573813' AS DateTime2), NULL)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [PostId], [CreatedAt], [UpdatedAt]) VALUES (N'e8f22e57-6e1a-4a1d-b811-a57e8328ffe4', N'Testing', N'cd03778d-3408-4914-b11f-0e6852cf93e2', N'67369001-7590-4d0d-8aab-aff1d491bc2e', CAST(N'2025-02-18T15:40:54.2020095' AS DateTime2), NULL)
INSERT [dbo].[Comments] ([Id], [Content], [UserId], [PostId], [CreatedAt], [UpdatedAt]) VALUES (N'16f9e5ec-7d0a-48ff-9cc5-c6ed87b00fe3', N'This is the first comment on this post', N'cd03778d-3408-4914-b11f-0e6852cf93e2', N'34c61f78-ecff-4206-969d-7e9f0838ba3a', CAST(N'2025-02-18T17:02:08.9532221' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[Followers] ON 

INSERT [dbo].[Followers] ([Id], [FollowerId], [FollowingId], [FollowedAt]) VALUES (2, N'88b6dce8-9341-4d38-985e-0ec155ff275c', N'3c4e69ce-e919-445c-bf45-74bedf174e9c', CAST(N'2025-02-01T15:11:08.3834886' AS DateTime2))
INSERT [dbo].[Followers] ([Id], [FollowerId], [FollowingId], [FollowedAt]) VALUES (3, N'cd03778d-3408-4914-b11f-0e6852cf93e2', N'3c4e69ce-e919-445c-bf45-74bedf174e9c', CAST(N'2025-02-17T19:10:16.2812126' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Followers] OFF
GO
INSERT [dbo].[Likes] ([Id], [UserId], [PostId], [LikedAt]) VALUES (N'c85a49cc-2bec-4be8-8448-0d9fc0d11c9e', N'cd03778d-3408-4914-b11f-0e6852cf93e2', N'f46962e0-6405-438b-b352-39fb65f5990e', CAST(N'2025-02-20T05:06:28.3162895' AS DateTime2))
INSERT [dbo].[Likes] ([Id], [UserId], [PostId], [LikedAt]) VALUES (N'45a494d4-6673-4a51-8dbd-15c89fd09ea1', N'cd03778d-3408-4914-b11f-0e6852cf93e2', N'34c61f78-ecff-4206-969d-7e9f0838ba3a', CAST(N'2025-02-18T17:01:56.0263929' AS DateTime2))
INSERT [dbo].[Likes] ([Id], [UserId], [PostId], [LikedAt]) VALUES (N'0bba5fec-256a-428e-bc6f-682e34779015', N'3c4e69ce-e919-445c-bf45-74bedf174e9c', N'67369001-7590-4d0d-8aab-aff1d491bc2e', CAST(N'2025-02-01T15:32:06.0808012' AS DateTime2))
INSERT [dbo].[Likes] ([Id], [UserId], [PostId], [LikedAt]) VALUES (N'94282767-6ec2-4950-8601-b29ad3834d3b', N'cd03778d-3408-4914-b11f-0e6852cf93e2', N'67369001-7590-4d0d-8aab-aff1d491bc2e', CAST(N'2025-02-18T15:40:42.8017145' AS DateTime2))
INSERT [dbo].[Likes] ([Id], [UserId], [PostId], [LikedAt]) VALUES (N'89d1a062-1a16-4f76-b1dc-c561ba02078f', N'88b6dce8-9341-4d38-985e-0ec155ff275c', N'67369001-7590-4d0d-8aab-aff1d491bc2e', CAST(N'2025-02-01T15:32:45.9937403' AS DateTime2))
INSERT [dbo].[Likes] ([Id], [UserId], [PostId], [LikedAt]) VALUES (N'59315b50-22fb-4ff2-a4fc-cc4e9f731a38', N'cd03778d-3408-4914-b11f-0e6852cf93e2', N'bac99316-6929-423a-801c-2403cce7ea9e', CAST(N'2025-02-18T17:06:41.1411974' AS DateTime2))
GO
INSERT [dbo].[Posts] ([Id], [Content], [MediaUrl], [UserId], [CreatedAt], [UpdatedAt], [IsPublic], [LikesCount], [CommentsCount], [SharesCount]) VALUES (N'a6132c25-8dd4-476c-adda-1e84e9ff93fc', N'This is for testing ', N'/uploads/content/500449ef-3cd2-4d29-b079-7a23042f8302.jpeg', N'cd03778d-3408-4914-b11f-0e6852cf93e2', CAST(N'2025-02-18T18:32:42.9938064' AS DateTime2), NULL, 1, 0, 0, 0)
INSERT [dbo].[Posts] ([Id], [Content], [MediaUrl], [UserId], [CreatedAt], [UpdatedAt], [IsPublic], [LikesCount], [CommentsCount], [SharesCount]) VALUES (N'bac99316-6929-423a-801c-2403cce7ea9e', N'This is the post created by frontend', N'/uploads/content/3d9ebb0d-3942-4bda-808f-13348ef49283.jpg', N'cd03778d-3408-4914-b11f-0e6852cf93e2', CAST(N'2025-02-18T16:24:34.4543823' AS DateTime2), NULL, 1, 1, 0, 0)
INSERT [dbo].[Posts] ([Id], [Content], [MediaUrl], [UserId], [CreatedAt], [UpdatedAt], [IsPublic], [LikesCount], [CommentsCount], [SharesCount]) VALUES (N'f46962e0-6405-438b-b352-39fb65f5990e', N'This is my wallpaper', N'/uploads/content/9ec77bb9-8f3e-4592-b156-584e4e193b3a.jpg', N'cd03778d-3408-4914-b11f-0e6852cf93e2', CAST(N'2025-02-18T18:33:21.8404409' AS DateTime2), NULL, 1, 1, 1, 0)
INSERT [dbo].[Posts] ([Id], [Content], [MediaUrl], [UserId], [CreatedAt], [UpdatedAt], [IsPublic], [LikesCount], [CommentsCount], [SharesCount]) VALUES (N'34c61f78-ecff-4206-969d-7e9f0838ba3a', N'This is the video post', N'/uploads/content/00f5a8fa-7e77-4517-836e-72c381a90c6e.mp4', N'cd03778d-3408-4914-b11f-0e6852cf93e2', CAST(N'2025-02-18T16:43:59.2781742' AS DateTime2), NULL, 1, 1, 1, 0)
INSERT [dbo].[Posts] ([Id], [Content], [MediaUrl], [UserId], [CreatedAt], [UpdatedAt], [IsPublic], [LikesCount], [CommentsCount], [SharesCount]) VALUES (N'67369001-7590-4d0d-8aab-aff1d491bc2e', N'This is the updated first post', N'/uploads/content/00f5a8fa-7e77-4517-836e-72c381a90c6e.mp4', N'3c4e69ce-e919-445c-bf45-74bedf174e9c', CAST(N'2025-02-01T14:09:03.5368129' AS DateTime2), CAST(N'2025-02-01T18:37:03.9249888' AS DateTime2), 1, 3, 5, 0)
INSERT [dbo].[Posts] ([Id], [Content], [MediaUrl], [UserId], [CreatedAt], [UpdatedAt], [IsPublic], [LikesCount], [CommentsCount], [SharesCount]) VALUES (N'cc6dead7-870b-46ec-af2d-f1cd813f7e70', N'This is also for testing 
', N'/uploads/content/984b648d-75e4-4fc2-b265-627605261255.png', N'cd03778d-3408-4914-b11f-0e6852cf93e2', CAST(N'2025-02-18T18:32:59.7909912' AS DateTime2), NULL, 1, 0, 0, 0)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 20/02/2025 11:44:48 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 20/02/2025 11:44:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 20/02/2025 11:44:48 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 20/02/2025 11:44:48 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 20/02/2025 11:44:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 20/02/2025 11:44:49 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 20/02/2025 11:44:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_PostId]    Script Date: 20/02/2025 11:44:49 ******/
CREATE NONCLUSTERED INDEX [IX_Comments_PostId] ON [dbo].[Comments]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 20/02/2025 11:44:49 ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Followers_FollowerId]    Script Date: 20/02/2025 11:44:49 ******/
CREATE NONCLUSTERED INDEX [IX_Followers_FollowerId] ON [dbo].[Followers]
(
	[FollowerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Followers_FollowingId]    Script Date: 20/02/2025 11:44:49 ******/
CREATE NONCLUSTERED INDEX [IX_Followers_FollowingId] ON [dbo].[Followers]
(
	[FollowingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Likes_PostId]    Script Date: 20/02/2025 11:44:49 ******/
CREATE NONCLUSTERED INDEX [IX_Likes_PostId] ON [dbo].[Likes]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Likes_UserId]    Script Date: 20/02/2025 11:44:49 ******/
CREATE NONCLUSTERED INDEX [IX_Likes_UserId] ON [dbo].[Likes]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Notifications_UserId]    Script Date: 20/02/2025 11:44:49 ******/
CREATE NONCLUSTERED INDEX [IX_Notifications_UserId] ON [dbo].[Notifications]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Posts_UserId]    Script Date: 20/02/2025 11:44:49 ******/
CREATE NONCLUSTERED INDEX [IX_Posts_UserId] ON [dbo].[Posts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts_PostId]
GO
ALTER TABLE [dbo].[Followers]  WITH CHECK ADD  CONSTRAINT [FK_Followers_AspNetUsers_FollowerId] FOREIGN KEY([FollowerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Followers] CHECK CONSTRAINT [FK_Followers_AspNetUsers_FollowerId]
GO
ALTER TABLE [dbo].[Followers]  WITH CHECK ADD  CONSTRAINT [FK_Followers_AspNetUsers_FollowingId] FOREIGN KEY([FollowingId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Followers] CHECK CONSTRAINT [FK_Followers_AspNetUsers_FollowingId]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_Likes_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_Likes_Posts_PostId]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [matter] SET  READ_WRITE 
GO
