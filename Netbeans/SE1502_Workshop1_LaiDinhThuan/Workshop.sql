USE [master]
GO
/****** Object:  Database [SE1502_Workshop1_LaiDinhThuan]    Script Date: 2/24/2021 12:06:55 PM ******/
CREATE DATABASE [SE1502_Workshop1_LaiDinhThuan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301Workshop1_LaiDinhThuan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRJ301Workshop1_LaiDinhThuan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301Workshop1_LaiDinhThuan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRJ301Workshop1_LaiDinhThuan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SE1502_Workshop1_LaiDinhThuan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET ARITHABORT OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET RECOVERY FULL 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET  MULTI_USER 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SE1502_Workshop1_LaiDinhThuan', N'ON'
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET QUERY_STORE = OFF
GO
USE [SE1502_Workshop1_LaiDinhThuan]
GO
/****** Object:  User [Bear]    Script Date: 2/24/2021 12:06:55 PM ******/
CREATE USER [Bear] FOR LOGIN [Bear] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 2/24/2021 12:06:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookID] [int] NOT NULL,
	[Name] [nchar](50) NULL,
	[Author] [nchar](50) NULL,
	[PublishYear] [int] NULL,
	[ShortDescription] [nchar](200) NULL,
	[Status] [nchar](10) NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/24/2021 12:06:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nchar](50) NULL,
	[Description] [nchar](200) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/24/2021 12:06:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [varchar](50) NOT NULL,
	[Pass] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Books] ([BookID], [Name], [Author], [PublishYear], [ShortDescription], [Status], [CategoryID]) VALUES (2, N'python                                            ', N'Bear                                              ', 12222, N'This is a great book                                                                                                                                                                                    ', N'Avail     ', 4)
INSERT [dbo].[Books] ([BookID], [Name], [Author], [PublishYear], [ShortDescription], [Status], [CategoryID]) VALUES (3, N'PRJ                                               ', N'ThuanBaby                                         ', 1997, N'This is a good book                                                                                                                                                                                     ', N'NoAvail   ', 5)
INSERT [dbo].[Books] ([BookID], [Name], [Author], [PublishYear], [ShortDescription], [Status], [CategoryID]) VALUES (4, N'abc                                               ', N'Bear                                              ', 1990, N'This is a bad book                                                                                                                                                                                      ', N'Avail     ', 5)
INSERT [dbo].[Books] ([BookID], [Name], [Author], [PublishYear], [ShortDescription], [Status], [CategoryID]) VALUES (9, N'Bear                                              ', N'asdsasdcasdca                                     ', 1995, N'Gud book                                                                                                                                                                                                ', N'Avail     ', 4)
INSERT [dbo].[Books] ([BookID], [Name], [Author], [PublishYear], [ShortDescription], [Status], [CategoryID]) VALUES (44, N'sad                                               ', N'ThuanBaby                                         ', 1999, N'This is a sad book                                                                                                                                                                                      ', N'Avail     ', 3)
INSERT [dbo].[Books] ([BookID], [Name], [Author], [PublishYear], [ShortDescription], [Status], [CategoryID]) VALUES (55, N'thuan                                             ', N'ThuanBaby                                         ', 1990, N'                                                                                                                                                                                                        ', N'Avail     ', 4)
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'Novel                                             ', N'A fictitious prose narrative of book length, typically representing character and action with some degree of realism.                                                                                   ')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'Science                                           ', N'Stars and planets, rocks and soil, hurricanes and airplanes—science is all of these things and so much more                                                                                             ')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'DBI                                               ', N'cool
                                                                                                                                                                                                  ')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (4, N'CSI                                               ', N'kakakakak                                                                                                                                                                                               ')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (5, N'IOT                                               ', N'asdewdw                                                                                                                                                                                                 ')
GO
INSERT [dbo].[Users] ([Username], [Pass]) VALUES (N'Bear', N'031101')
INSERT [dbo].[Users] ([Username], [Pass]) VALUES (N'KimHoang', N'0906')
INSERT [dbo].[Users] ([Username], [Pass]) VALUES (N'KimQuang', N'1234')
INSERT [dbo].[Users] ([Username], [Pass]) VALUES (N'thuan', N'thuan')
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Categories]
GO
USE [master]
GO
ALTER DATABASE [SE1502_Workshop1_LaiDinhThuan] SET  READ_WRITE 
GO
