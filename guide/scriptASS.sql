USE [master]
GO
/****** Object:  Database [Ass2]    Script Date: 3/12/2022 7:15:14 PM ******/
CREATE DATABASE [Ass2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ass2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Ass2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ass2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Ass2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Ass2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ass2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ass2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ass2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ass2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ass2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ass2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ass2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ass2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ass2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ass2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ass2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ass2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ass2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ass2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ass2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ass2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ass2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ass2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ass2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ass2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ass2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ass2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ass2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ass2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ass2] SET  MULTI_USER 
GO
ALTER DATABASE [Ass2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ass2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ass2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ass2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ass2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ass2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Ass2] SET QUERY_STORE = OFF
GO
USE [Ass2]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 3/12/2022 7:15:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nvarchar](50) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 3/12/2022 7:15:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [nvarchar](50) NOT NULL,
	[orderDate] [nvarchar](50) NULL,
	[total] [nvarchar](50) NULL,
	[userID] [nvarchar](50) NOT NULL,
	[status] [nchar](10) NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 3/12/2022 7:15:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [nvarchar](50) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[orderID] [nvarchar](50) NOT NULL,
	[productID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 3/12/2022 7:15:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [nvarchar](50) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[image] [varchar](250) NULL,
	[price] [float] NOT NULL,
	[quantity] [nvarchar](50) NOT NULL,
	[categoryID] [nvarchar](50) NULL,
	[importDate] [nvarchar](50) NULL,
	[usingDate] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 3/12/2022 7:15:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](50) NOT NULL,
	[roleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 3/12/2022 7:15:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NULL,
	[birthday] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'F01', N'Fruit')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'V01', N'Vegetable')
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'F1', N'Cam vàng', N'https://cdn.tgdd.vn/Products/Images/8788/202933/bhx/cam-vang-valencia-uc-hop-1kg-4-5-trai-202101271645511757.jpg', 65500, N'10', N'F01', N'2022-01-03', N'2022-04-28', N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'F2', N'Táo', N'https://cdn.tgdd.vn/Products/Images/8788/233844/bhx/tao-rockit-ong-4-trai-202104030931153006.jpg', 149000, N'20', N'F01', N'2022-01-03', N'2022-04-28', N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'F3', N'Thanh long', N'https://cdn.tgdd.vn/Products/Images/8788/273351/bhx/thanh-long-tui-15kg-3-5-trai-202202261542599854.jpg', 24000, N'30', N'F01', N'2022-01-03', N'2022-04-28', N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'F4', N'Bưởi ', N'https://cdn.tgdd.vn/Products/Images/8788/245079/bhx/buoi-da-xanh-tui-15kg-202112111031523150.jpg', 76500, N'40', N'F01', N'2022-01-03', N'2022-04-28', N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'F5', N'Xoài ', N'https://cdn.tgdd.vn/Products/Images/8788/222842/bhx/xoai-cat-hoa-loc-tui-1kg-202103180811509891.jpg', 75100, N'50', N'F01', N'2022-01-03', N'2022-04-28', N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'F7', N'ca ngu', N'abcdasd', 7000, N'10', N'F01', N'2022-01-03', N'2022-04-28', N'False')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'V1', N'Bắp ', N'https://cdn.tgdd.vn/Products/Images/8785/222881/bhx/bap-my-2-trai-202012282219106049.jpg', 17000, N'50', N'V01', N'2022-01-03', N'2022-04-28', N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'V2', N'Bí xanh', N'https://cdn.tgdd.vn/Products/Images/8785/220461/bhx/bi-xanh-tui-1kg-202011092052402369.jpg', 9000, N'40', N'V01', N'2022-01-03', N'2022-04-28', N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'V3', N'Cà rốt', N'https://cdn.tgdd.vn/Products/Images/8785/271488/bhx/ca-rot-baby-khay-500g-202202121624120646.jpg', 42500, N'30', N'V01', N'2022-01-03', N'2022-04-28', N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'V4', N'Hành tây', N'https://cdn.tgdd.vn/Products/Images/8785/273072/bhx/hanh-tay-tui-300g-2-4-cu-202202231419142847.jpg', 7000, N'20', N'V01', N'2022-01-03', N'2022-04-28', N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'V5', N'Khoai lang', N'https://cdn.tgdd.vn/Products/Images/8785/234108/bhx/khoai-lang-mat-tui-1kg-202101252146214490.jpg', 40000, N'10', N'V01', N'2022-01-03', N'2022-04-28', N'True')
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'1', N'AD')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'2', N'US')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'SE150000', N'Chú Bé Đần', N'1                                                 ', N'2', N'Nguyễn Duy Trinh, Quận 2, Thành phố Hồ Chí Minh', N'2001-07-12', N'0987654321     ', N'chubedan2001@gmail.com', N'1')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'SE150001', N'Nguyễn Quốc Bảo Long', N'1                                                 ', N'2', N'Tân Bình, Thành phố Hồ Chí Minh', N'2001-06-28', N'0999996789     ', N'longbao2001@gmail.com', N'1')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'SE150002', N'Lê Đình Linh Nguyên', N'1                                                 ', N'1', N'FPT', N'2001-10-09', N'0868948888     ', N'nguyenldlse150492@fpt.edu.vn', N'1')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'SE150003', N'Lê Thị Hoài Thu', N'1', N'2', N'Tân Bình, Thành phố Hồ Chí Minh', N'1988-10-06', N'0868123888     ', N'thule1988@gmail.com', N'1')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'SE150004', N'Trần Trung Hiếu', N'1                                                 ', N'2', N'Thủ Đức. Thành phố Hồ Chí Minh', N'1999-03-22', N'0987651234     ', N'trunghieu1999@gmail.com', N'1')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'SE150005', N'Phạm Duy Tùng', N'1', N'2', N'Gò Vấp, Thành phố Hồ Chí Minh', N'2001-04-04', N'0868123321     ', N'tungduy2001@gmail.com', N'1')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'SE150006', N'Nguyễn Yến Vi', N'1', N'2', N'Buôn Ma Thuật, Đăk Lăk', N'2004-08-17', N'0999888777     ', N'vinguyen2004@gmail.com', N'1')
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUsers]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles1] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles1]
GO
USE [master]
GO
ALTER DATABASE [Ass2] SET  READ_WRITE 
GO
