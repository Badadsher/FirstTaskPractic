USE [master]
GO
/****** Object:  Database [AccountingDataBase]    Script Date: 01.11.2024 21:03:39 ******/
CREATE DATABASE [AccountingDataBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AccountingDataBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AccountingDataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AccountingDataBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AccountingDataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AccountingDataBase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AccountingDataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AccountingDataBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AccountingDataBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AccountingDataBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AccountingDataBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AccountingDataBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [AccountingDataBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AccountingDataBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AccountingDataBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AccountingDataBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AccountingDataBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AccountingDataBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AccountingDataBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AccountingDataBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AccountingDataBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AccountingDataBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AccountingDataBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AccountingDataBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AccountingDataBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AccountingDataBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AccountingDataBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AccountingDataBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AccountingDataBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AccountingDataBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AccountingDataBase] SET  MULTI_USER 
GO
ALTER DATABASE [AccountingDataBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AccountingDataBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AccountingDataBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AccountingDataBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AccountingDataBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AccountingDataBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AccountingDataBase] SET QUERY_STORE = ON
GO
ALTER DATABASE [AccountingDataBase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AccountingDataBase]
GO
/****** Object:  Table [dbo].[Deduc]    Script Date: 01.11.2024 21:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deduc](
	[DeductionID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[TaxAmount] [int] NOT NULL,
	[AlimonyAmount] [int] NOT NULL,
	[OtherDeductions] [int] NOT NULL,
	[TotalDeductions] [int] NOT NULL,
 CONSTRAINT [PK_Deduc] PRIMARY KEY CLUSTERED 
(
	[DeductionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 01.11.2024 21:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[ID] [int] NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 01.11.2024 21:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PositionID] [int] NOT NULL,
	[Profession] [nvarchar](50) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Password] [nvarchar](4) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payroll]    Script Date: 01.11.2024 21:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payroll](
	[ID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[BaseSalary] [int] NOT NULL,
	[Bonus] [int] NOT NULL,
	[SickCompensation] [int] NOT NULL,
	[DeductionsID] [int] NOT NULL,
	[TotalAmount] [int] NOT NULL,
	[PaymentDate] [date] NOT NULL,
 CONSTRAINT [PK_Payroll] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 01.11.2024 21:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[ID] [int] NOT NULL,
	[PositionName] [nvarchar](50) NOT NULL,
	[Salary] [int] NOT NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 01.11.2024 21:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[ID] [int] NOT NULL,
	[ReportDate] [date] NOT NULL,
	[TotalPaid] [int] NOT NULL,
	[PayrollID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_Reports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Deduc] ([DeductionID], [EmployeeID], [TaxAmount], [AlimonyAmount], [OtherDeductions], [TotalDeductions]) VALUES (1, 1, 1000, 0, 0, 1000)
INSERT [dbo].[Deduc] ([DeductionID], [EmployeeID], [TaxAmount], [AlimonyAmount], [OtherDeductions], [TotalDeductions]) VALUES (2, 2, 1000, 1000, 500, 2500)
INSERT [dbo].[Deduc] ([DeductionID], [EmployeeID], [TaxAmount], [AlimonyAmount], [OtherDeductions], [TotalDeductions]) VALUES (3, 3, 1000, 0, 100, 1100)
GO
INSERT [dbo].[Departments] ([ID], [DepartmentName]) VALUES (1, N'Информационные Технологии')
INSERT [dbo].[Departments] ([ID], [DepartmentName]) VALUES (2, N'Логистические вопросы')
INSERT [dbo].[Departments] ([ID], [DepartmentName]) VALUES (3, N'Юридические вопросы')
GO
INSERT [dbo].[Employees] ([ID], [Name], [PositionID], [Profession], [DepartmentID], [Password]) VALUES (1, N'Michael', 1, N'Программист', 1, N'5678')
INSERT [dbo].[Employees] ([ID], [Name], [PositionID], [Profession], [DepartmentID], [Password]) VALUES (2, N'Ann', 2, N'Логист', 2, N'9999')
INSERT [dbo].[Employees] ([ID], [Name], [PositionID], [Profession], [DepartmentID], [Password]) VALUES (3, N'Pavel', 3, N'Юрист', 3, N'1010')
INSERT [dbo].[Employees] ([ID], [Name], [PositionID], [Profession], [DepartmentID], [Password]) VALUES (4, N'John', 1, N'Таролог', 1, N'9865')
GO
INSERT [dbo].[Payroll] ([ID], [EmployeeID], [BaseSalary], [Bonus], [SickCompensation], [DeductionsID], [TotalAmount], [PaymentDate]) VALUES (1, 1, 40000, 5000, 2000, 1, 46000, CAST(N'2023-10-29' AS Date))
INSERT [dbo].[Payroll] ([ID], [EmployeeID], [BaseSalary], [Bonus], [SickCompensation], [DeductionsID], [TotalAmount], [PaymentDate]) VALUES (2, 2, 30000, 3500, 0, 2, 31000, CAST(N'2023-10-30' AS Date))
INSERT [dbo].[Payroll] ([ID], [EmployeeID], [BaseSalary], [Bonus], [SickCompensation], [DeductionsID], [TotalAmount], [PaymentDate]) VALUES (3, 3, 45000, 5500, 1000, 3, 50400, CAST(N'2023-10-31' AS Date))
GO
INSERT [dbo].[Positions] ([ID], [PositionName], [Salary]) VALUES (1, N'Айти Специалист', 40000)
INSERT [dbo].[Positions] ([ID], [PositionName], [Salary]) VALUES (2, N'Специалис по логистике', 30000)
INSERT [dbo].[Positions] ([ID], [PositionName], [Salary]) VALUES (3, N'Главный юрист', 45000)
GO
INSERT [dbo].[Reports] ([ID], [ReportDate], [TotalPaid], [PayrollID], [EmployeeID]) VALUES (1, CAST(N'2024-11-01' AS Date), 46000, 1, 1)
INSERT [dbo].[Reports] ([ID], [ReportDate], [TotalPaid], [PayrollID], [EmployeeID]) VALUES (2, CAST(N'2024-11-01' AS Date), 31000, 2, 2)
INSERT [dbo].[Reports] ([ID], [ReportDate], [TotalPaid], [PayrollID], [EmployeeID]) VALUES (3, CAST(N'2024-11-01' AS Date), 50400, 3, 3)
GO
ALTER TABLE [dbo].[Deduc]  WITH CHECK ADD  CONSTRAINT [FK_Deduc_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Deduc] CHECK CONSTRAINT [FK_Deduc_Employees]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([ID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Positions] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Positions] ([ID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Positions]
GO
ALTER TABLE [dbo].[Payroll]  WITH CHECK ADD  CONSTRAINT [FK_Payroll_Deduc] FOREIGN KEY([DeductionsID])
REFERENCES [dbo].[Deduc] ([DeductionID])
GO
ALTER TABLE [dbo].[Payroll] CHECK CONSTRAINT [FK_Payroll_Deduc]
GO
ALTER TABLE [dbo].[Payroll]  WITH CHECK ADD  CONSTRAINT [FK_Payroll_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Payroll] CHECK CONSTRAINT [FK_Payroll_Employees]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_Employees]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Payroll] FOREIGN KEY([PayrollID])
REFERENCES [dbo].[Payroll] ([ID])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_Payroll]
GO
USE [master]
GO
ALTER DATABASE [AccountingDataBase] SET  READ_WRITE 
GO
