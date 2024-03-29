USE [master]
GO
/****** Object:  Database [SkillMatrix]    Script Date: 19-09-2019 16:34:14 ******/
CREATE DATABASE [SkillMatrix]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SkillMatrix', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SkillMatrix.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SkillMatrix_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SkillMatrix_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SkillMatrix] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SkillMatrix].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SkillMatrix] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SkillMatrix] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SkillMatrix] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SkillMatrix] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SkillMatrix] SET ARITHABORT OFF 
GO
ALTER DATABASE [SkillMatrix] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SkillMatrix] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SkillMatrix] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SkillMatrix] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SkillMatrix] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SkillMatrix] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SkillMatrix] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SkillMatrix] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SkillMatrix] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SkillMatrix] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SkillMatrix] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SkillMatrix] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SkillMatrix] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SkillMatrix] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SkillMatrix] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SkillMatrix] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SkillMatrix] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SkillMatrix] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SkillMatrix] SET  MULTI_USER 
GO
ALTER DATABASE [SkillMatrix] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SkillMatrix] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SkillMatrix] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SkillMatrix] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SkillMatrix] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SkillMatrix] SET QUERY_STORE = OFF
GO
USE [SkillMatrix]
GO
/****** Object:  UserDefinedFunction [dbo].[GETDATEDIFFERENCE]    Script Date: 19-09-2019 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GETDATEDIFFERENCE]
(
   @FROMDATE DATETIME, @TODATE DATETIME
)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @YEARS INT, @MONTHS INT, @DAYS INT, @TMPFROMDATE DATETIME
    SET @YEARS = DATEDIFF(YEAR, @FROMDATE, @TODATE)
     - (CASE WHEN DATEADD(YEAR, DATEDIFF(YEAR, @FROMDATE, @TODATE),
              @FROMDATE) > @TODATE THEN 1 ELSE 0 END) 
    
    SET @TMPFROMDATE = DATEADD(YEAR, @YEARS , @FROMDATE)
    SET @MONTHS =  DATEDIFF(MONTH, @TMPFROMDATE, @TODATE)
     - (CASE WHEN DATEADD(MONTH,DATEDIFF(MONTH, @TMPFROMDATE, @TODATE),
              @TMPFROMDATE) > @TODATE THEN 1 ELSE 0 END) 
    
    SET @TMPFROMDATE = DATEADD(MONTH, @MONTHS , @TMPFROMDATE)
    SET @DAYS =  DATEDIFF(DAY, @TMPFROMDATE, @TODATE)
     - (CASE WHEN DATEADD(DAY, DATEDIFF(DAY, @TMPFROMDATE, @TODATE),
              @TMPFROMDATE) > @TODATE THEN 1 ELSE 0 END) 
   
   
    RETURN 'YEARS: ' + CAST(@YEARS AS VARCHAR(4)) +
            ' MONTHS: ' + CAST(@MONTHS AS VARCHAR(2)) +
            ' DAYS: ' + CAST(@DAYS AS VARCHAR(2)) 
END
GO
/****** Object:  Table [dbo].[Employee_Master]    Script Date: 19-09-2019 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Master](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Emp_ID] [int] NOT NULL,
	[Emp_FirstName] [varchar](20) NULL,
	[Emp_MiddleName] [varchar](20) NULL,
	[Emp_LastName] [varchar](20) NULL,
	[Designation] [varchar](50) NULL,
	[Emp_Category] [nchar](10) NULL,
	[Emp_Mobile] [varchar](20) NULL,
	[Emp_Email] [varchar](30) NULL,
 CONSTRAINT [PK_Employee_Master] PRIMARY KEY CLUSTERED 
(
	[Emp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 19-09-2019 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[name] [text] NOT NULL,
 CONSTRAINT [PK__students__DDDFDD36553B238A] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Login]    Script Date: 19-09-2019 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Login](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Emp_Id] [int] NULL,
	[Emp_Password] [varchar](50) NULL,
	[Password_Expire] [datetime] NULL,
	[Password_Reset] [varchar](5) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Tbl_Login] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Project_Master]    Script Date: 19-09-2019 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Project_Master](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Project_Name] [varchar](100) NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Tbl_Project_Master] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Resource_Transaction]    Script Date: 19-09-2019 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Resource_Transaction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Emp_Id] [int] NULL,
	[Project_Id] [int] NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Duration] [varchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Tbl_Resource_Transaction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Skill_Master]    Script Date: 19-09-2019 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Skill_Master](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Skill_Category_Code] [varchar](10) NULL,
	[Skill_Category_Description] [varchar](50) NULL,
	[Skill_Name] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Created_By] [varchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Tbl_Skill_Master] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Skill_Transaction]    Script Date: 19-09-2019 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Skill_Transaction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Emp_Id] [int] NULL,
	[Skill_Code] [varchar](10) NULL,
	[Skill_Id] [int] NULL,
	[Skill_Score] [int] NULL,
	[Submitted_Date] [datetime] NULL,
 CONSTRAINT [PK_Tbl_Skill_Transaction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee_Master] ON 

INSERT [dbo].[Employee_Master] ([ID], [Emp_ID], [Emp_FirstName], [Emp_MiddleName], [Emp_LastName], [Designation], [Emp_Category], [Emp_Mobile], [Emp_Email]) VALUES (1, 15131, N'Mohd', N'Saqib', N'Ansari', N'Software Engineer', N'E5        ', N'9773161660', N'mohd_ansari@onwardgroup.com')
INSERT [dbo].[Employee_Master] ([ID], [Emp_ID], [Emp_FirstName], [Emp_MiddleName], [Emp_LastName], [Designation], [Emp_Category], [Emp_Mobile], [Emp_Email]) VALUES (2, 15132, N'Aditya', NULL, N'Pandya', N'Software Engineer', N'E5        ', N'9773161660', N'mohd_ansari@onwardgroup.com')
INSERT [dbo].[Employee_Master] ([ID], [Emp_ID], [Emp_FirstName], [Emp_MiddleName], [Emp_LastName], [Designation], [Emp_Category], [Emp_Mobile], [Emp_Email]) VALUES (3, 15133, N'Shilpa', NULL, N'Sawant', N'Software Engineer', N'E5        ', N'9773161660', N'mohd_ansari@onwardgroup.com')
INSERT [dbo].[Employee_Master] ([ID], [Emp_ID], [Emp_FirstName], [Emp_MiddleName], [Emp_LastName], [Designation], [Emp_Category], [Emp_Mobile], [Emp_Email]) VALUES (4, 15134, N'Ganesh', NULL, NULL, N'Software Engineer', N'E5        ', N'9773161660', N'mohd_ansari@onwardgroup.com')
INSERT [dbo].[Employee_Master] ([ID], [Emp_ID], [Emp_FirstName], [Emp_MiddleName], [Emp_LastName], [Designation], [Emp_Category], [Emp_Mobile], [Emp_Email]) VALUES (5, 15135, N'Neepa', NULL, N'Gandhi', N'Software Engineer', N'E5        ', N'9773161660', N'mohd_ansari@onwardgroup.com')
INSERT [dbo].[Employee_Master] ([ID], [Emp_ID], [Emp_FirstName], [Emp_MiddleName], [Emp_LastName], [Designation], [Emp_Category], [Emp_Mobile], [Emp_Email]) VALUES (6, 15136, N'Irvind', NULL, N'Singh', N'Software Engineer', N'E5        ', N'9773161660', N'mohd_ansari@onwardgroup.com')
INSERT [dbo].[Employee_Master] ([ID], [Emp_ID], [Emp_FirstName], [Emp_MiddleName], [Emp_LastName], [Designation], [Emp_Category], [Emp_Mobile], [Emp_Email]) VALUES (7, 15137, N'Ram', NULL, NULL, N'Software Engineer', N'E5        ', N'9773161660', N'mohd_ansari@onwardgroup.com')
INSERT [dbo].[Employee_Master] ([ID], [Emp_ID], [Emp_FirstName], [Emp_MiddleName], [Emp_LastName], [Designation], [Emp_Category], [Emp_Mobile], [Emp_Email]) VALUES (8, 15138, N'Ramesh', NULL, NULL, N'Software Engineer', N'E5        ', N'9773161660', N'mohd_ansari@onwardgroup.com')
INSERT [dbo].[Employee_Master] ([ID], [Emp_ID], [Emp_FirstName], [Emp_MiddleName], [Emp_LastName], [Designation], [Emp_Category], [Emp_Mobile], [Emp_Email]) VALUES (9, 15139, N'Rajiv', NULL, NULL, N'Software Engineer', N'E5        ', N'9773161660', N'mohd_ansari@onwardgroup.com')
INSERT [dbo].[Employee_Master] ([ID], [Emp_ID], [Emp_FirstName], [Emp_MiddleName], [Emp_LastName], [Designation], [Emp_Category], [Emp_Mobile], [Emp_Email]) VALUES (10, 15140, N'Rajesh', NULL, NULL, N'Software Engineer', N'E5        ', N'9773161660', N'mohd_ansari@onwardgroup.com')
SET IDENTITY_INSERT [dbo].[Employee_Master] OFF
SET IDENTITY_INSERT [dbo].[students] ON 

INSERT [dbo].[students] ([sid], [name]) VALUES (1, N'Simon')
INSERT [dbo].[students] ([sid], [name]) VALUES (2, N'Alvin')
INSERT [dbo].[students] ([sid], [name]) VALUES (3, N'Theo')
INSERT [dbo].[students] ([sid], [name]) VALUES (4, N'Brittany')
INSERT [dbo].[students] ([sid], [name]) VALUES (5, N'Jenette')
INSERT [dbo].[students] ([sid], [name]) VALUES (6, N'Elenor')
INSERT [dbo].[students] ([sid], [name]) VALUES (7, N'Stu')
INSERT [dbo].[students] ([sid], [name]) VALUES (8, N'saqib')
INSERT [dbo].[students] ([sid], [name]) VALUES (9, N'saqib')
INSERT [dbo].[students] ([sid], [name]) VALUES (10, N'saqib')
INSERT [dbo].[students] ([sid], [name]) VALUES (11, N'saqib')
INSERT [dbo].[students] ([sid], [name]) VALUES (12, N'saqib')
INSERT [dbo].[students] ([sid], [name]) VALUES (13, N'Ansari')
INSERT [dbo].[students] ([sid], [name]) VALUES (14, N'Ansari')
INSERT [dbo].[students] ([sid], [name]) VALUES (15, N'saqib')
INSERT [dbo].[students] ([sid], [name]) VALUES (16, N'saqib')
INSERT [dbo].[students] ([sid], [name]) VALUES (17, N'Ansari')
INSERT [dbo].[students] ([sid], [name]) VALUES (18, N'Ansari')
INSERT [dbo].[students] ([sid], [name]) VALUES (19, N'Ansari')
INSERT [dbo].[students] ([sid], [name]) VALUES (20, N'Ansari')
INSERT [dbo].[students] ([sid], [name]) VALUES (21, N'Ansari')
INSERT [dbo].[students] ([sid], [name]) VALUES (22, N'Ansari')
INSERT [dbo].[students] ([sid], [name]) VALUES (23, N'Ansari')
INSERT [dbo].[students] ([sid], [name]) VALUES (24, N'Ansari')
SET IDENTITY_INSERT [dbo].[students] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Login] ON 

INSERT [dbo].[Tbl_Login] ([ID], [Emp_Id], [Emp_Password], [Password_Expire], [Password_Reset], [Active]) VALUES (1, 15131, N'15131', NULL, N'N', 1)
INSERT [dbo].[Tbl_Login] ([ID], [Emp_Id], [Emp_Password], [Password_Expire], [Password_Reset], [Active]) VALUES (2, 15132, N'15132', NULL, N'N', 1)
INSERT [dbo].[Tbl_Login] ([ID], [Emp_Id], [Emp_Password], [Password_Expire], [Password_Reset], [Active]) VALUES (3, 15133, N'15133', NULL, N'N', 1)
INSERT [dbo].[Tbl_Login] ([ID], [Emp_Id], [Emp_Password], [Password_Expire], [Password_Reset], [Active]) VALUES (4, 15134, N'15134', NULL, N'N', 1)
INSERT [dbo].[Tbl_Login] ([ID], [Emp_Id], [Emp_Password], [Password_Expire], [Password_Reset], [Active]) VALUES (5, 15135, N'15135', NULL, N'N', 1)
INSERT [dbo].[Tbl_Login] ([ID], [Emp_Id], [Emp_Password], [Password_Expire], [Password_Reset], [Active]) VALUES (6, 15136, N'15136', NULL, N'N', 1)
INSERT [dbo].[Tbl_Login] ([ID], [Emp_Id], [Emp_Password], [Password_Expire], [Password_Reset], [Active]) VALUES (7, 15137, N'15137', NULL, N'N', 1)
INSERT [dbo].[Tbl_Login] ([ID], [Emp_Id], [Emp_Password], [Password_Expire], [Password_Reset], [Active]) VALUES (8, 15138, N'15138', NULL, N'N', 1)
INSERT [dbo].[Tbl_Login] ([ID], [Emp_Id], [Emp_Password], [Password_Expire], [Password_Reset], [Active]) VALUES (9, 15139, N'15139', NULL, N'N', 1)
INSERT [dbo].[Tbl_Login] ([ID], [Emp_Id], [Emp_Password], [Password_Expire], [Password_Reset], [Active]) VALUES (10, 15140, N'15140', NULL, N'N', 1)
SET IDENTITY_INSERT [dbo].[Tbl_Login] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Project_Master] ON 

INSERT [dbo].[Tbl_Project_Master] ([ID], [Project_Name], [Start_Date], [End_Date], [Active]) VALUES (1, N'LinkIntime', NULL, NULL, 1)
INSERT [dbo].[Tbl_Project_Master] ([ID], [Project_Name], [Start_Date], [End_Date], [Active]) VALUES (2, N'TCS', NULL, NULL, 1)
INSERT [dbo].[Tbl_Project_Master] ([ID], [Project_Name], [Start_Date], [End_Date], [Active]) VALUES (3, N'Wipro', NULL, NULL, 1)
INSERT [dbo].[Tbl_Project_Master] ([ID], [Project_Name], [Start_Date], [End_Date], [Active]) VALUES (4, N'Accenture', NULL, NULL, 1)
INSERT [dbo].[Tbl_Project_Master] ([ID], [Project_Name], [Start_Date], [End_Date], [Active]) VALUES (5, N'Reliance', NULL, NULL, 1)
INSERT [dbo].[Tbl_Project_Master] ([ID], [Project_Name], [Start_Date], [End_Date], [Active]) VALUES (6, N'Hpcl', NULL, NULL, 1)
INSERT [dbo].[Tbl_Project_Master] ([ID], [Project_Name], [Start_Date], [End_Date], [Active]) VALUES (7, N'Bpcl', NULL, NULL, 1)
INSERT [dbo].[Tbl_Project_Master] ([ID], [Project_Name], [Start_Date], [End_Date], [Active]) VALUES (8, N'Capgenimi', NULL, NULL, 1)
INSERT [dbo].[Tbl_Project_Master] ([ID], [Project_Name], [Start_Date], [End_Date], [Active]) VALUES (9, N'Mercedes-Benz', NULL, NULL, 1)
INSERT [dbo].[Tbl_Project_Master] ([ID], [Project_Name], [Start_Date], [End_Date], [Active]) VALUES (10, N'Infosys', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Tbl_Project_Master] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Resource_Transaction] ON 

INSERT [dbo].[Tbl_Resource_Transaction] ([ID], [Emp_Id], [Project_Id], [Start_Date], [End_Date], [Duration], [Active]) VALUES (1, 15131, 1, CAST(N'2017-09-16T00:00:00.000' AS DateTime), CAST(N'2019-07-16T00:00:00.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Tbl_Resource_Transaction] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Skill_Master] ON 

INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (1, N'PL', N'Programming Language', N'C#', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (2, N'PL', N'Programming Language', N'VB.Net', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (3, N'PL', N'Programming Language', N'Java', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (4, N'PL', N'Programming Language', N'C++', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (5, N'PL', N'Programming Language', N'C', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (6, N'PL', N'Programming Language', N'Python', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (7, N'PL', N'Programming Language', N'PHP', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (8, N'PL', N'Programming Language', N'Swift', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (9, N'PL', N'Programming Language', N'R', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (10, N'PL', N'Programming Language', N'Kotlin', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (11, N'PL', N'Programming Language', N'Scala', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (12, N'DB', N'Database', N'SQL Server', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (13, N'DB', N'Database', N'Oracle', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (14, N'DB', N'Database', N'PostgreSQL', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (15, N'DB', N'Database', N'Microsoft Access', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (16, N'DB', N'Database', N'SQL Azure ( Cloud SQL Server )', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (17, N'DB', N'Database', N'MySQL', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (18, N'DB', N'Database', N'Teradata', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (19, N'DB', N'Database', N'MongoDB', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (20, N'DB', N'Database', N'IBM DB2', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (21, N'DB', N'Database', N'Sybase', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (22, N'DB', N'Database', N'SQLite', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (23, N'DB', N'Database', N'Amazon RDS', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (24, N'DB', N'Database', N'Redis', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (25, N'DB', N'Database', N'MariaDB', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (26, N'WD', N'Website Designing', N'HTML', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (27, N'WD', N'Website Designing', N'CSS', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (28, N'WD', N'Website Designing', N'Bootstrap', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (29, N'WD', N'Website Designing', N'Wordpress', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (30, N'WD', N'Website Designing', N'Joomla', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (31, N'SL', N'Scripting Language', N'Javascript', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (32, N'SL', N'Scripting Language', N'JQuery', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (33, N'SL', N'Scripting Language', N'Angular', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (34, N'SL', N'Scripting Language', N'React', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (35, N'SL', N'Scripting Language', N'Vue', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (36, N'SL', N'Scripting Language', N'TypeScript', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (37, N'SL', N'Scripting Language', N'ECMA Script', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (38, N'SL', N'Scripting Language', N'Node', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (39, N'SL', N'Scripting Language', N'JQuery Mobile', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (40, N'OS', N'Operating System', N'Windows', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (41, N'OS', N'Operating System', N'Mac', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (42, N'OS', N'Operating System', N'Linux', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (43, N'FMS', N'Facility Management Service', N'Hardware', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (44, N'FMS', N'Facility Management Service', N'Site Support', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
INSERT [dbo].[Tbl_Skill_Master] ([ID], [Skill_Category_Code], [Skill_Category_Description], [Skill_Name], [Created_Date], [Created_By], [Active]) VALUES (45, N'FMS', N'Facility Management Service', N'Field Support', CAST(N'2019-08-20T15:43:57.230' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Tbl_Skill_Master] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Skill_Transaction] ON 

INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (4, 15131, N'DB', 17, 3, CAST(N'2019-09-10T16:37:15.480' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (5, 15131, N'DB', 13, 4, CAST(N'2019-09-10T16:37:15.483' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (6, 15131, N'DB', 12, 5, CAST(N'2019-09-10T16:37:15.483' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (7, 15131, N'WD', 28, 3, CAST(N'2019-09-10T16:37:15.487' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (8, 15131, N'WD', 27, 4, CAST(N'2019-09-10T16:37:15.487' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (9, 15131, N'WD', 26, 4, CAST(N'2019-09-10T16:37:15.487' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (10, 15131, N'SL', 31, 4, CAST(N'2019-09-10T16:37:15.487' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (11, 15131, N'SL', 32, 4, CAST(N'2019-09-10T16:37:15.487' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (12, 15131, N'SL', 36, 3, CAST(N'2019-09-10T16:37:15.487' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (13, 15131, N'OS', 40, 5, CAST(N'2019-09-10T16:37:15.487' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (14, 15132, N'PL', 5, 4, CAST(N'2019-09-10T16:38:38.770' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (15, 15132, N'PL', 1, 5, CAST(N'2019-09-10T16:38:38.770' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (16, 15132, N'WD', 28, 3, CAST(N'2019-09-10T16:38:38.770' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (17, 15132, N'WD', 27, 4, CAST(N'2019-09-10T16:38:38.773' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (18, 15132, N'OS', 42, 4, CAST(N'2019-09-10T16:38:38.773' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (19, 15132, N'OS', 41, 3, CAST(N'2019-09-10T16:38:38.773' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (20, 15132, N'FMS', 45, 1, CAST(N'2019-09-10T16:38:38.773' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (21, 15132, N'FMS', 43, 3, CAST(N'2019-09-10T16:38:38.773' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (22, 15133, N'PL', 10, 3, CAST(N'2019-09-10T16:39:13.317' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (23, 15133, N'PL', 6, 4, CAST(N'2019-09-10T16:39:13.320' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (24, 15133, N'DB', 20, 3, CAST(N'2019-09-10T16:39:13.320' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (25, 15133, N'DB', 25, 2, CAST(N'2019-09-10T16:39:13.320' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (26, 15133, N'SL', 37, 3, CAST(N'2019-09-10T16:39:13.320' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (27, 15133, N'SL', 31, 2, CAST(N'2019-09-10T16:39:13.320' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (28, 15133, N'OS', 42, 5, CAST(N'2019-09-10T16:39:13.323' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (29, 15133, N'OS', 41, 4, CAST(N'2019-09-10T16:39:13.323' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (30, 15134, N'PL', 10, 4, CAST(N'2019-09-10T16:39:59.897' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (31, 15134, N'PL', 7, 3, CAST(N'2019-09-10T16:39:59.897' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (32, 15134, N'DB', 23, 4, CAST(N'2019-09-10T16:39:59.897' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (33, 15134, N'DB', 20, 3, CAST(N'2019-09-10T16:39:59.900' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (34, 15134, N'DB', 15, 4, CAST(N'2019-09-10T16:39:59.900' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (35, 15134, N'WD', 28, 5, CAST(N'2019-09-10T16:39:59.900' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (36, 15134, N'WD', 27, 4, CAST(N'2019-09-10T16:39:59.903' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (37, 15134, N'OS', 42, 4, CAST(N'2019-09-10T16:39:59.903' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (38, 15134, N'OS', 41, 3, CAST(N'2019-09-10T16:39:59.907' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (39, 15135, N'DB', 23, 2, CAST(N'2019-09-10T16:40:35.150' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (40, 15135, N'DB', 20, 3, CAST(N'2019-09-10T16:40:35.150' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (41, 15135, N'DB', 25, 4, CAST(N'2019-09-10T16:40:35.150' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (42, 15135, N'OS', 41, 4, CAST(N'2019-09-10T16:40:35.153' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (43, 15135, N'OS', 40, 2, CAST(N'2019-09-10T16:40:35.153' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (44, 15135, N'FMS', 45, 5, CAST(N'2019-09-10T16:40:35.153' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (45, 15135, N'FMS', 43, 4, CAST(N'2019-09-10T16:40:35.153' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (46, 15135, N'FMS', 44, 3, CAST(N'2019-09-10T16:40:35.157' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (47, 15136, N'PL', 1, 3, CAST(N'2019-09-10T16:41:03.060' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (48, 15136, N'PL', 10, 3, CAST(N'2019-09-10T16:41:03.063' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (49, 15136, N'DB', 20, 2, CAST(N'2019-09-10T16:41:03.063' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (50, 15136, N'DB', 15, 3, CAST(N'2019-09-10T16:41:03.067' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (51, 15136, N'WD', 28, 4, CAST(N'2019-09-10T16:41:03.067' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (52, 15136, N'WD', 26, 3, CAST(N'2019-09-10T16:41:03.067' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (53, 15136, N'OS', 41, 5, CAST(N'2019-09-10T16:41:03.070' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (54, 15136, N'OS', 40, 2, CAST(N'2019-09-10T16:41:03.070' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (55, 15137, N'PL', 5, 1, CAST(N'2019-09-10T16:41:47.033' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (56, 15137, N'PL', 1, 2, CAST(N'2019-09-10T16:41:47.033' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (57, 15137, N'PL', 3, 3, CAST(N'2019-09-10T16:41:47.037' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (58, 15137, N'DB', 17, 1, CAST(N'2019-09-10T16:41:47.037' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (59, 15137, N'DB', 13, 1, CAST(N'2019-09-10T16:41:47.040' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (60, 15137, N'DB', 24, 1, CAST(N'2019-09-10T16:41:47.043' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (61, 15137, N'WD', 27, 1, CAST(N'2019-09-10T16:41:47.043' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (62, 15137, N'WD', 26, 1, CAST(N'2019-09-10T16:41:47.043' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (63, 15137, N'SL', 32, 1, CAST(N'2019-09-10T16:41:47.047' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (64, 15137, N'SL', 38, 1, CAST(N'2019-09-10T16:41:47.047' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (65, 15137, N'SL', 36, 1, CAST(N'2019-09-10T16:41:47.047' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (66, 15137, N'FMS', 45, 1, CAST(N'2019-09-10T16:41:47.050' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (67, 15137, N'FMS', 43, 1, CAST(N'2019-09-10T16:41:47.050' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (68, 15138, N'DB', 20, 1, CAST(N'2019-09-10T16:42:23.230' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (69, 15138, N'DB', 25, 2, CAST(N'2019-09-10T16:42:23.230' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (70, 15138, N'DB', 19, 1, CAST(N'2019-09-10T16:42:23.233' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (71, 15139, N'PL', 5, 1, CAST(N'2019-09-10T16:42:43.287' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (72, 15139, N'PL', 4, 2, CAST(N'2019-09-10T16:42:43.297' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (73, 15139, N'PL', 7, 3, CAST(N'2019-09-10T16:42:43.300' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (74, 15139, N'DB', 23, 3, CAST(N'2019-09-10T16:42:43.300' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (75, 15139, N'DB', 25, 2, CAST(N'2019-09-10T16:42:43.303' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (76, 15139, N'DB', 19, 1, CAST(N'2019-09-10T16:42:43.303' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (77, 15139, N'WD', 28, 3, CAST(N'2019-09-10T16:42:43.303' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (78, 15139, N'WD', 26, 4, CAST(N'2019-09-10T16:42:43.303' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (79, 15139, N'OS', 41, 5, CAST(N'2019-09-10T16:42:43.303' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (80, 15139, N'OS', 40, 3, CAST(N'2019-09-10T16:42:43.307' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (81, 15139, N'FMS', 45, 3, CAST(N'2019-09-10T16:42:43.307' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (82, 15139, N'FMS', 43, 1, CAST(N'2019-09-10T16:42:43.307' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (83, 15140, N'PL', 7, 1, CAST(N'2019-09-10T16:43:27.267' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (84, 15140, N'PL', 6, 3, CAST(N'2019-09-10T16:43:27.270' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (85, 15140, N'PL', 9, 4, CAST(N'2019-09-10T16:43:27.270' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (86, 15140, N'DB', 23, 3, CAST(N'2019-09-10T16:43:27.270' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (87, 15140, N'WD', 28, 2, CAST(N'2019-09-10T16:43:27.270' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (88, 15140, N'WD', 27, 4, CAST(N'2019-09-10T16:43:27.273' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (89, 15140, N'SL', 37, 1, CAST(N'2019-09-10T16:43:27.273' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (90, 15140, N'SL', 31, 2, CAST(N'2019-09-10T16:43:27.273' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (91, 15140, N'SL', 32, 1, CAST(N'2019-09-10T16:43:27.273' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (92, 15140, N'SL', 39, 2, CAST(N'2019-09-10T16:43:27.277' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (93, 15140, N'OS', 42, 3, CAST(N'2019-09-10T16:43:27.277' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (94, 15140, N'OS', 41, 4, CAST(N'2019-09-10T16:43:27.277' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (95, 15140, N'OS', 40, 5, CAST(N'2019-09-10T16:43:27.277' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (96, 15140, N'FMS', 45, 3, CAST(N'2019-09-10T16:43:27.280' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (97, 15140, N'FMS', 43, 1, CAST(N'2019-09-10T16:43:27.280' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (103, 15131, N'PL', 1, 5, CAST(N'2019-09-19T12:50:15.457' AS DateTime))
INSERT [dbo].[Tbl_Skill_Transaction] ([ID], [Emp_Id], [Skill_Code], [Skill_Id], [Skill_Score], [Submitted_Date]) VALUES (105, 15131, N'PL', 2, 4, CAST(N'2019-09-19T12:50:30.880' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_Skill_Transaction] OFF
/****** Object:  StoredProcedure [dbo].[addnewstudent]    Script Date: 19-09-2019 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addnewstudent] @StudentName VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from  
	-- interfering with SELECT statements.  
	SET NOCOUNT ON;

	INSERT INTO STUDENTS ([name])
	VALUES (@StudentName)

	SELECT 'Record Added' AS customMessage

	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[Getstudentcount]    Script Date: 19-09-2019 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Getstudentcount]     
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
 SET NOCOUNT ON;    
    
SELECT * FROM STUDENTS;  
    
   
 RETURN    
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GETALL_RESOURCE_DETAILS]    Script Date: 19-09-2019 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GETALL_RESOURCE_DETAILS] @MODE CHAR(1)
AS
BEGIN
	IF (@MODE = 'P')
	BEGIN
		SELECT ID
			,PROJECT_NAME
		FROM [DBO].[TBL_PROJECT_MASTER]
		ORDER BY PROJECT_NAME
	END
END



GO
/****** Object:  StoredProcedure [dbo].[USP_GETALL_SKILLS]    Script Date: 19-09-2019 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GETALL_SKILLS]  
@SKILL_CODE VARCHAR(10)
AS  
BEGIN  
 SELECT ID  
  ,SKILL_CATEGORY_CODE  
  ,SKILL_CATEGORY_DESCRIPTION  
  ,SKILL_NAME  
 FROM [DBO].[TBL_SKILL_MASTER]  
 WHERE SKILL_CATEGORY_CODE = @SKILL_CODE  
 ORDER BY SKILL_NAME   
END  
  
GO
/****** Object:  StoredProcedure [dbo].[USP_INSERT_SKILLS]    Script Date: 19-09-2019 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_INSERT_SKILLS] @EMP_ID INT
	,@SKILL_CODE VARCHAR(10)
	,@SKILL_ID INT
	--,@COUNTER INT
AS
BEGIN
	--IF (@COUNTER = 0)
	--BEGIN
		IF NOT EXISTS (
				SELECT 1
				FROM [TBL_SKILL_TRANSACTION]
				WHERE EMP_ID = @EMP_ID
					AND SKILL_ID = @SKILL_ID
				)
			--DELETE
			--FROM [TBL_SKILL_TRANSACTION]
			--WHERE EMP_ID = @EMP_ID
				--AND SKILL_CODE = @SKILL_CODE

		INSERT INTO [DBO].[TBL_SKILL_TRANSACTION] (
			EMP_ID
			,SKILL_CODE
			,SKILL_ID
			,SUBMITTED_DATE
			)
		VALUES (
			@EMP_ID
			,@SKILL_CODE
			,@SKILL_ID
			,GETDATE()
			)
	--END
	--ELSE
	--BEGIN
	--	INSERT INTO [DBO].[TBL_SKILL_TRANSACTION] (
	--		EMP_ID
	--		,SKILL_CODE
	--		,SKILL_ID
	--		,SUBMITTED_DATE
	--		)
	--	VALUES (
	--		@EMP_ID
	--		,@SKILL_CODE
	--		,@SKILL_ID
	--		,GETDATE()
	--		)
	--END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LOGINDETAILS]    Script Date: 19-09-2019 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LOGINDETAILS] @EMP_ID INT
	,@PASSWORD VARCHAR(50)
	,@MODE VARCHAR(5)
AS
BEGIN
	--SET NOCOUNT ON;
	IF (@MODE = 'S')
	BEGIN
		DECLARE @EMPID INT

		SELECT @EMPID = EMP_ID
		FROM [DBO].[TBL_LOGIN]
		WHERE EMP_ID = @EMP_ID

		--AND EMP_PASSWORD = @PASSWORD
		IF @EMPID IS NOT NULL
		BEGIN
			IF NOT EXISTS (
					SELECT 1
					FROM [DBO].[TBL_LOGIN]
					WHERE EMP_ID = @EMP_ID
						AND EMP_PASSWORD = @PASSWORD
						AND ACTIVE = 1
					)
			BEGIN
				IF EXISTS (
						SELECT 1
						FROM [DBO].[TBL_LOGIN]
						WHERE EMP_ID = @EMP_ID
							AND EMP_PASSWORD = @PASSWORD
							AND ACTIVE = 0
						)
				BEGIN
					SELECT RESULT = 1
				END
				ELSE
				BEGIN
					SELECT RESULT = 2
				END
			END
			ELSE
			BEGIN
				SELECT EMP_ID
					,EMP_PASSWORD
					,ACTIVE
				FROM [DBO].[TBL_LOGIN]
				WHERE EMP_ID = @EMP_ID
			END
		END
		ELSE
		BEGIN
			SELECT RESULT = 0
		END
	END

	IF (@MODE = 'C')
	BEGIN
		UPDATE [TBL_LOGIN]
		SET EMP_PASSWORD = @PASSWORD
			,ACTIVE = 1
		WHERE EMP_ID = @EMP_ID

		SELECT @@ROWCOUNT
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SUBMITTED_SKILLS]    Script Date: 19-09-2019 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SUBMITTED_SKILLS] @EMP_ID INT
	,@MODE VARCHAR(10)
	,@SKILLSCORE INT = 0
	,@SKILLID INT = 0
AS
BEGIN
	IF (@MODE = 'S')
	BEGIN
		SELECT EMP_ID
			,SKILL_ID
			,SKILL_CODE
			,SM.SKILL_NAME
			,SKILL_SCORE
		FROM [DBO].[TBL_SKILL_TRANSACTION] ST
		INNER JOIN [TBL_SKILL_MASTER] SM ON ST.SKILL_ID = SM.ID
		WHERE EMP_ID = @EMP_ID
		ORDER BY SM.SKILL_NAME
	END
	IF (@MODE = 'U')
	BEGIN
		UPDATE [TBL_SKILL_TRANSACTION]
		SET SKILL_SCORE = @SKILLSCORE
		WHERE EMP_ID = @EMP_ID
			AND SKILL_ID = @SKILLID	
	END
	IF (@MODE = 'D')
	BEGIN
		DELETE FROM [TBL_SKILL_TRANSACTION]
		WHERE EMP_ID = @EMP_ID
			AND SKILL_ID = @SKILLID	 
	END
END
GO
USE [master]
GO
ALTER DATABASE [SkillMatrix] SET  READ_WRITE 
GO
