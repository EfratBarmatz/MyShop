USE [master]
GO
/****** Object:  Database [MyShop_327707238]    Script Date: 29/01/2025 19:16:07 ******/
CREATE DATABASE [MyShop_327707238]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyShop_327707238', FILENAME = N'D:\SqlData\MSSQL15.PUPILS\MSSQL\DATA\MyShop_327707238.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'MyShop_327707238_log', FILENAME = N'D:\SqlData\MSSQL15.PUPILS\MSSQL\DATA\MyShop_327707238_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MyShop_327707238] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyShop_327707238].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyShop_327707238] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyShop_327707238] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyShop_327707238] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyShop_327707238] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyShop_327707238] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyShop_327707238] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyShop_327707238] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyShop_327707238] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyShop_327707238] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyShop_327707238] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyShop_327707238] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyShop_327707238] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyShop_327707238] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyShop_327707238] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyShop_327707238] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyShop_327707238] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyShop_327707238] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyShop_327707238] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyShop_327707238] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyShop_327707238] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyShop_327707238] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyShop_327707238] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyShop_327707238] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyShop_327707238] SET  MULTI_USER 
GO
ALTER DATABASE [MyShop_327707238] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyShop_327707238] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyShop_327707238] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyShop_327707238] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MyShop_327707238] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyShop_327707238] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyShop_327707238', N'ON'
GO
ALTER DATABASE [MyShop_327707238] SET QUERY_STORE = ON
GO
ALTER DATABASE [MyShop_327707238] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MyShop_327707238]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 29/01/2025 19:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 29/01/2025 19:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quentity] [int] NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 29/01/2025 19:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Sum] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 29/01/2025 19:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nchar](20) NULL,
	[Descreaption] [nvarchar](max) NOT NULL,
	[Price] [float] NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Quentity] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RATING]    Script Date: 29/01/2025 19:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RATING](
	[RATING_ID] [int] IDENTITY(1,1) NOT NULL,
	[HOST] [nvarchar](50) NULL,
	[METHOD] [nchar](10) NULL,
	[PATH] [nvarchar](50) NULL,
	[REFERER] [nvarchar](100) NULL,
	[USER_AGENT] [nvarchar](max) NULL,
	[Record_Date] [datetime] NULL,
 CONSTRAINT [PK_RATING] PRIMARY KEY CLUSTERED 
(
	[RATING_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29/01/2025 19:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nchar](50) NOT NULL,
	[Password] [nchar](50) NOT NULL,
	[FirstName] [nchar](20) NULL,
	[LastName] [nchar](20) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'aa                                                ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'bb                                                ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'cc                                                ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'dd                                                ')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (1, 15, 6, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (2, 15, 6, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (3, 15, 6, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (4, 15, 1, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (5, 15, 1, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (6, 15, 6, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (7, 16, 4, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (8, 16, 4, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (9, 16, 6, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (10, 16, 4, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (11, 16, 4, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (12, 16, 1, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (13, 17, 5, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (14, 17, 5, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (15, 17, 4, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (16, 17, 4, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (17, 17, 5, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (18, 17, 1, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (19, 17, 1, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (20, 18, 4, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (21, 18, 4, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (22, 18, 4, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (23, 18, 1, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (24, 18, 1, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (25, 18, 6, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (26, 18, 6, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (27, 18, 4, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (28, 18, 4, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (29, 19, 4, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (30, 19, 4, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (31, 19, 1, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (32, 19, 1, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (33, 19, 4, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (34, 19, 4, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (35, 20, 4, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (36, 20, 1, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (37, 20, 1, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (38, 20, 6, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (39, 20, 4, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (40, 21, 4, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (41, 21, 6, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (42, 21, 1, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (43, 23, 1, 0)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (44, 24, 1, 0)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (45, 25, 1, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (46, 25, 1, 1)
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Quentity]) VALUES (47, 25, 1, 1)
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (1, 1, CAST(N'2024-12-08' AS Date), 23)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (2, 1, CAST(N'2024-12-22' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (3, 4, CAST(N'2024-12-22' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (4, 3, CAST(N'2024-12-22' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (5, 6, CAST(N'2024-12-22' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (6, 5, CAST(N'2024-12-22' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (7, 5, CAST(N'2024-12-22' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (8, 5, CAST(N'2024-12-22' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (9, 5, CAST(N'2024-12-22' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (10, 5, CAST(N'2024-12-22' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (11, 2, CAST(N'2024-12-22' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (12, 1, CAST(N'2024-12-22' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (13, 1, CAST(N'2024-12-22' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (14, 1, CAST(N'2024-12-22' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (15, 8, CAST(N'2025-01-05' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (16, 8, CAST(N'2025-01-05' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (17, 8, CAST(N'2025-01-05' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (18, 8, CAST(N'2025-01-05' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (19, 8, CAST(N'2025-01-05' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (20, 8, CAST(N'2025-01-05' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (21, 9, CAST(N'2025-01-05' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (23, 1, CAST(N'2025-01-15' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (24, 1, CAST(N'2025-01-15' AS Date), NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Date], [Sum]) VALUES (25, 8, CAST(N'2025-01-05' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Descreaption], [Price], [Image], [Quentity]) VALUES (1, 1, N'סוס                 ', N'מגגגגגניב', 33, N'1.jpg', 3)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Descreaption], [Price], [Image], [Quentity]) VALUES (4, 2, N'קוביות              ', N'פירות, חיות ועוד', 335, N'2.jpg', 5)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Descreaption], [Price], [Image], [Quentity]) VALUES (5, 4, N'rrrrrrrrrr          ', N'rrrrrrrrrrr', 44444, N'fffffffff', 3)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Descreaption], [Price], [Image], [Quentity]) VALUES (6, 3, N'ddddd               ', N'ddddd', 44, N'ddddd', 5)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[RATING] ON 

INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'HTTP/2', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (2, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'HTTP/2', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (3, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (4, N'localhost:5224', N'GET       ', N'/Products.html', N'', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (5, N'localhost:5224', N'GET       ', N'/Products.html', N'', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (6, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (7, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (8, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (9, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (10, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (11, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (12, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (13, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (14, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (15, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (16, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (17, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (18, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (19, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (20, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (21, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (22, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (23, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (24, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (25, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (26, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (27, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (28, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (29, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (30, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (31, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (32, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (33, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (34, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (35, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (36, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (37, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (38, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (39, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (40, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (41, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (42, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (43, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (44, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (45, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (46, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (47, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (48, N'localhost:5224', N'GET       ', N'/api/Products', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (49, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (50, N'localhost:5224', N'GET       ', N'/api/Categories', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (51, N'localhost:5224', N'GET       ', N'/api/Products', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (52, N'localhost:5224', N'GET       ', N'/api/Categories', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (53, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (54, N'localhost:5224', N'GET       ', N'/api/Products', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (55, N'localhost:5224', N'GET       ', N'/api/Categories', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (56, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (57, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (58, N'localhost:5224', N'GET       ', N'/api/Categories', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (59, N'localhost:5224', N'GET       ', N'/api/Products', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (60, N'localhost:5224', N'GET       ', N'/api/Categories', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (61, N'localhost:5224', N'GET       ', N'/api/Products', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (62, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (63, N'localhost:5224', N'GET       ', N'/api/Categories', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (64, N'localhost:5224', N'GET       ', N'/api/Products', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (65, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (66, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (67, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (68, N'localhost:5224', N'GET       ', N'/Scripts/Products.js', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (69, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (70, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (71, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (72, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (73, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (74, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (75, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (76, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (77, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (78, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (79, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (80, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (81, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (82, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (83, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (84, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (85, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (86, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (87, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (88, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (89, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (90, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (91, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (92, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (93, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (94, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (95, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (96, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (97, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (98, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (99, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
GO
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (100, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (101, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (102, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (103, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (104, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (105, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (106, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (107, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (108, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (109, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (110, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (111, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (112, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (113, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (114, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (115, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (116, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (117, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (118, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (119, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (120, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (121, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (122, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (123, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (124, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (125, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (126, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (127, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (128, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (129, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (130, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (131, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (132, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (133, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (134, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (135, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (136, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (137, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (138, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (139, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (140, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (141, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (142, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (143, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (144, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (145, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (146, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (147, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (148, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (149, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (150, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (151, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (152, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (153, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (154, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (155, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (156, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (157, N'localhost:5224', N'GET       ', N'/favicon.ico', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL)
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (158, N'localhost:5224', N'GET       ', N'/api/Products', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:04.023' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (159, N'localhost:5224', N'GET       ', N'/api/Categories', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:04.023' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (160, N'localhost:5224', N'GET       ', N'/Images/1.jpg', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:04.520' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (161, N'localhost:5224', N'GET       ', N'/Images/fffffffff', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:04.520' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (162, N'localhost:5224', N'GET       ', N'/Images/2.jpg', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:04.520' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (163, N'localhost:5224', N'GET       ', N'/api/Products', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:07.123' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (164, N'localhost:5224', N'GET       ', N'/api/Products', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:08.523' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (165, N'localhost:5224', N'GET       ', N'/Images/fffffffff', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:08.537' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (166, N'localhost:5224', N'GET       ', N'/Images/ddddd', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:08.537' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (167, N'localhost:5224', N'GET       ', N'/api/Products', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:10.603' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (168, N'localhost:5224', N'GET       ', N'/api/Products', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:14.323' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (169, N'localhost:5224', N'GET       ', N'/api/Products', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:18.453' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (170, N'localhost:5224', N'GET       ', N'/api/Products', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:21.557' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (171, N'localhost:5224', N'GET       ', N'/Products.html', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:24.683' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (172, N'localhost:5224', N'GET       ', N'/api/Categories', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:24.737' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (173, N'localhost:5224', N'GET       ', N'/api/Products', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:24.737' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (174, N'localhost:5224', N'GET       ', N'/Images/fffffffff', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:24.753' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (175, N'localhost:5224', N'GET       ', N'/Images/ddddd', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:24.753' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (176, N'localhost:5224', N'GET       ', N'/Scripts/ShoppingBag.js', N'https://localhost:5224/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:29.977' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (177, N'localhost:5224', N'GET       ', N'/Images/fffffffff', N'https://localhost:5224/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:30.060' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (178, N'localhost:5224', N'GET       ', N'/Images/icn-remove.png', N'https://localhost:5224/Style/ShoppingBag.css', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:30.060' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (179, N'localhost:5224', N'GET       ', N'/Images/fffffffff', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:38.190' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (180, N'localhost:5224', N'GET       ', N'/Images/ddddd', N'https://localhost:5224/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:38.190' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (181, N'localhost:5224', N'POST      ', N'/api/Orders', N'https://localhost:5224/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:51.723' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (182, N'localhost:5224', N'GET       ', N'/Scripts/Home.js', N'https://localhost:5224/Home.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:54.230' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (183, N'localhost:5224', N'GET       ', N'/Style/Home.css', N'https://localhost:5224/Home.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:58:54.230' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (184, N'localhost:5224', N'POST      ', N'/api/Users/checkPassword', N'https://localhost:5224/Home.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:59:12.093' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (185, N'localhost:5224', N'POST      ', N'/api/Users/checkPassword', N'https://localhost:5224/Home.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:59:20.197' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (186, N'localhost:5224', N'POST      ', N'/api/Users/checkPassword', N'https://localhost:5224/Home.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:59:32.660' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (187, N'localhost:5224', N'POST      ', N'/api/Users', N'https://localhost:5224/Home.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:59:39.307' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (188, N'localhost:5224', N'POST      ', N'/api/Users', N'https://localhost:5224/Home.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T13:59:48.930' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (189, N'localhost:5224', N'POST      ', N'/api/Users/login', N'https://localhost:5224/Home.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T14:00:05.940' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (190, N'localhost:5224', N'POST      ', N'/api/Users/login', N'https://localhost:5224/Home.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T14:00:14.677' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (191, N'localhost:5224', N'POST      ', N'/api/Users/login', N'https://localhost:5224/Home.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', CAST(N'2025-01-20T14:00:21.950' AS DateTime))
SET IDENTITY_INSERT [dbo].[RATING] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName]) VALUES (1, N'a@a                                               ', N'32775896412                                       ', N'hh                  ', N'hh                  ')
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName]) VALUES (2, N'aaaaa                                             ', N'a\szfxgfdgv3h4r                                   ', N'qwert               ', N'qwaer               ')
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName]) VALUES (3, N's@s                                               ', N'dsxfg324e5tyhngb                                  ', N'sdf                 ', N'sdfg                ')
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName]) VALUES (4, N'a@s                                               ', N'A1s@swf1`2eghtr                                   ', N'sssss               ', N'ssssssss            ')
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName]) VALUES (5, N'a@wsdxfg                                          ', N'azesxdcfvg34e56d                                  ', N'gffdf               ', N'ghfff               ')
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName]) VALUES (6, N'a@a                                               ', N'0567278285                                        ', N'sss                 ', N'ssss                ')
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName]) VALUES (7, N'f2xv                                              ', N'564821 874512                                     ', N'fvd                 ', N'xfdcb               ')
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName]) VALUES (8, N's@s                                               ', N'A0556737828                                       ', N'aa                  ', N'aa                  ')
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName]) VALUES (9, N'שד@געץק''רע.fds                                    ', N'lEAH5157!                                         ', N'DSCSD               ', N'SDCSD               ')
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName]) VALUES (10, N'efrat                                             ', N'Ax13aX1324                                        ', N'ff                  ', N'ff                  ')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Orders]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [MyShop_327707238] SET  READ_WRITE 
GO
