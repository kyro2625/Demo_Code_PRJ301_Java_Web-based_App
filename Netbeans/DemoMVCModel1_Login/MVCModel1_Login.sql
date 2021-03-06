USE [master]
GO
/****** Object:  Database [DataManagement]    Script Date: 10/16/20 4:45:05 PM ******/
CREATE DATABASE [DataManagement]
GO
USE [DataManagement]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [DataManagement]
GO
/****** Object:  Table [dbo].[UserInformation]    Script Date: 10/16/20 4:45:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInformation](
	[UserName] [nvarchar](20) NOT NULL,
	[UserPassword] [nvarchar](20) NULL,
	[FullName] [nvarchar](60) NULL,
	[UserRole] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[UserInformation] ([UserName], [UserPassword], [FullName], [UserRole]) VALUES (N'abc', N'abc', N'Test', 1)
GO
INSERT [dbo].[UserInformation] ([UserName], [UserPassword], [FullName], [UserRole]) VALUES (N'cde', N'123', N'Test 3', 1)
GO
USE [master]
GO
ALTER DATABASE [DataManagement] SET  READ_WRITE 
GO
