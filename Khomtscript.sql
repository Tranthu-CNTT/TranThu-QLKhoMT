USE [khomaytinh]
GO
/****** Object:  User [admin]    Script Date: 6/13/2020 4:27:30 PM ******/
CREATE USER [admin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [khach]    Script Date: 6/13/2020 4:27:30 PM ******/
CREATE USER [khach] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [nhanvien]    Script Date: 6/13/2020 4:27:30 PM ******/
CREATE USER [nhanvien] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [admin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [admin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [admin]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [admin]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [admin]
GO
ALTER ROLE [db_owner] ADD MEMBER [nhanvien]
GO
ALTER ROLE [db_datareader] ADD MEMBER [nhanvien]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [nhanvien]
GO
/****** Object:  Table [dbo].[Vattu]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vattu](
	[MaVT] [nchar](10) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [float] NULL,
	[Hang] [nvarchar](50) NULL,
	[ChungLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Vat tu] PRIMARY KEY CLUSTERED 
(
	[MaVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_vattu]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_vattu]
as
select * from Vattu
GO
/****** Object:  Table [dbo].[PhieuXuat]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuXuat](
	[Sopx] [nchar](10) NOT NULL,
	[NgayXuat] [datetime] NULL,
	[MaNV] [nchar](10) NULL,
	[MaKH] [nchar](10) NULL,
 CONSTRAINT [PK_PhieuXuat] PRIMARY KEY CLUSTERED 
(
	[Sopx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_phieuxuat]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--create view v_vattu
--as
--select * from Vattu
create view [dbo].[v_phieuxuat]
as
select * from PhieuXuat
GO
/****** Object:  Table [dbo].[Dong_PhieuXuat]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dong_PhieuXuat](
	[Sopx] [nchar](10) NULL,
	[MaVT] [nchar](10) NULL,
	[ChungLoai] [nvarchar](50) NULL,
	[SoLuong] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_dongphieuxuat]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_dongphieuxuat]
as
select * from Dong_PhieuXuat
GO
/****** Object:  Table [dbo].[Nhanvienkho]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhanvienkho](
	[MaNV] [nchar](10) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [nchar](10) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nchar](10) NULL,
 CONSTRAINT [PK_Nhanvienkho] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_nhanvien]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_nhanvien]
as
select * from Nhanvienkho
GO
/****** Object:  View [dbo].[v_ctpxuat]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_ctpxuat]
as
select Vattu.MaVT,Hang,Vattu.ChungLoai,DonGia,Dong_PhieuXuat.SoLuong,PhieuXuat.sopx,NgayXuat,MaNV,MaKH
from Vattu,Dong_PhieuXuat,PhieuXuat
where Vattu.MaVT = Dong_PhieuXuat.MaVT and
PhieuXuat.sopx = Dong_PhieuXuat.sopx
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[Sopn] [nchar](10) NOT NULL,
	[NgayNhap] [datetime] NULL,
	[MaNV] [nchar](10) NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[Sopn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dong_PhieuNhap]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dong_PhieuNhap](
	[TenNhaCC] [nvarchar](50) NOT NULL,
	[Sopn] [nchar](10) NOT NULL,
	[MaVT] [nchar](10) NULL,
	[ChungLoai] [nvarchar](50) NULL,
	[SoLuong] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_ctpnhap]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_ctpnhap]
as
select Vattu.MaVT,Hang,Vattu.ChungLoai,DonGia,Dong_PhieuNhap.SoLuong,PhieuNhap.sopn,TenNhaCC,NgayNhap,MaNV
from Vattu,Dong_PhieuNhap,PhieuNhap
where Vattu.MaVT = Dong_PhieuNhap.MaVT and
PhieuNhap.sopn = Dong_PhieuNhap.sopn
GO
/****** Object:  View [dbo].[v_dongphieunhap]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_dongphieunhap]
as
select * from Dong_PhieuNhap
GO
/****** Object:  View [dbo].[v_phieunhap]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_phieunhap]
as
select * from PhieuNhap
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nchar](10) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[CongTy] [nvarchar](50) NULL,
	[KieuThanhToan] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Trọng Hùng', N'002A      ', N'M100      ', N'Chuột     ', 300)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Minh Đức', N'011A      ', N'22B2L     ', N'DVD Rewrit', 413)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Trọng Hùng', N'022A      ', N'22B2S     ', N'DVD Rewrit', 323)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Phạm Duy', N'033A      ', N'22X       ', N'DVD Rewrit', 321)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Vũ Huy', N'044A      ', N'24B1LT    ', N'DVD Rewirt', 190)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Minh Đức', N'001B      ', N'3000      ', N'Chuột     ', 350)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Vũ Huy', N'044A      ', N'AM3 Athlon', N'CPU       ', 398)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Vũ Huy', N'044A      ', N'BX300     ', N'Màn Hình  ', 500)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Vũ Huy', N'044A      ', N'BX400     ', N'Màn Hình  ', 610)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Trọng Hùng', N'002C      ', N'DDR2-800  ', N'RAM       ', 800)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Minh Đức', N'001B      ', N'DDR2-800A ', N'RAM       ', 700)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Phạm Duy', N'003C      ', N'DDR2-800B ', N'RAM       ', 900)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Vũ Huy', N'004B      ', N'DDR3-1333 ', N'RAM       ', 1000)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Minh Đức', N'001A      ', N'G1        ', N'Bàn Phím  ', 310)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Vũ Huy', N'004A      ', N'G15       ', N'Bàn Phím  ', 430)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Phạm Duy', N'003A      ', N'G19       ', N'Bàn Phím  ', 450)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Minh Đức', N'011A      ', N'G31MX     ', N'Mother bro', 550)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Trọng Hùng', N'022A      ', N'G41MVF20  ', N'Mother bro', 800)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Phạm Duy', N'033A      ', N'GAEP41TUDL', N'Mother bro', 514)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Vũ Huy', N'044A      ', N'GAG41MT   ', N'Mother bro', 490)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Minh Đức', N'011A      ', N'i3-530    ', N'CPU       ', 235)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Trọng Hùng', N'022A      ', N'i3-540    ', N'CPU       ', 457)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Phạm Duy', N'033A      ', N'i7-920    ', N'CPU       ', 378)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Trọng Hùng', N'002A      ', N'K100      ', N'Bàn Phím  ', 200)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Minh Đức', N'001A      ', N'K340      ', N'Bàn Phím  ', 430)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Trọng Hùng', N'002A      ', N'K350      ', N'Bàn Phím  ', 160)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Minh Đức', N'011A      ', N'L32A10    ', N'Màn Hình  ', 486)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Trọng Hùng', N'022A      ', N'L32C20    ', N'Màn Hình  ', 321)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Trọng Hùng', N'022A      ', N'L42F10S   ', N'Màn Hình  ', 123)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Minh Đức', N'011A      ', N'LD310     ', N'Màn Hình  ', 324)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Phạm Duy', N'033A      ', N'LF20FR    ', N'Màn Hình  ', 567)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Phạm Duy', N'033A      ', N'LH70IR    ', N'Màn Hình  ', 256)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Minh Đức', N'001A      ', N'M100      ', N'Chuột     ', 320)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Vũ Huy', N'004A      ', N'M115      ', N'Chuột     ', 300)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Phạm Duy', N'003A      ', N'M125      ', N'Chuột     ', 210)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Trọng Hùng', N'002A      ', N'M215      ', N'Chuột     ', 250)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Phạm Duy', N'003A      ', N'M305      ', N'Chuột     ', 500)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Minh Đức', N'001A      ', N'M555      ', N'Chuột     ', 360)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Vũ Huy', N'004A      ', N'M950      ', N'Chuột     ', 500)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Minh Đức', N'001B      ', N'SATA2-1TB ', N'HDD       ', 700)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Vũ Huy', N'004B      ', N'SATA2-1TBA', N'HDD       ', 800)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Phạm Duy', N'003B      ', N'SATA2-2TB ', N'HDD       ', 600)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Trọng Hùng', N'002B      ', N'SATA2-2TBA', N'HDD       ', 750)
INSERT [dbo].[Dong_PhieuNhap] ([TenNhaCC], [Sopn], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'Minh Đức', N'001B      ', N'SATA2-80GB', N'HDD       ', 500)
INSERT [dbo].[Dong_PhieuXuat] ([Sopx], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'012A      ', N'Q8300     ', N'CPU', 100)
INSERT [dbo].[Dong_PhieuXuat] ([Sopx], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'012A      ', N'Q9550     ', N'CPU', 200)
INSERT [dbo].[Dong_PhieuXuat] ([Sopx], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'012A      ', N'EAH5450   ', N'Card Video', 150)
INSERT [dbo].[Dong_PhieuXuat] ([Sopx], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'013A      ', N'DDR3-1600 ', N'RAM', 200)
INSERT [dbo].[Dong_PhieuXuat] ([Sopx], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'013A      ', N'E818A3    ', N'DVD Rom', 300)
INSERT [dbo].[Dong_PhieuXuat] ([Sopx], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'013A      ', N'E818A6T   ', N'DVD Rom', 130)
INSERT [dbo].[Dong_PhieuXuat] ([Sopx], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'014A      ', N'GAG41MT   ', N'Mother broad', 160)
INSERT [dbo].[Dong_PhieuXuat] ([Sopx], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'014A      ', N'BX400     ', N'Màn Hình', 200)
INSERT [dbo].[Dong_PhieuXuat] ([Sopx], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'014A      ', N'M215      ', N'Chuột', 210)
INSERT [dbo].[Dong_PhieuXuat] ([Sopx], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'015A      ', N'M950      ', N'Chuột', 120)
INSERT [dbo].[Dong_PhieuXuat] ([Sopx], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'015A      ', N'LF20FR    ', N'Màn Hình', 300)
INSERT [dbo].[Dong_PhieuXuat] ([Sopx], [MaVT], [ChungLoai], [SoLuong]) VALUES (N'015A      ', N'SATA2-1TB ', N'HDD', 250)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT], [Email], [CongTy], [KieuThanhToan]) VALUES (N'121       ', N'Duy Khánh', N'6/189 Trần Quang Khải', N'09412345', N'Khanhcpn@gmail.com', N'VietKhanhcpn', N'cash')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT], [Email], [CongTy], [KieuThanhToan]) VALUES (N'122       ', N'Lưu Vỹ', N'67/12 Vũ Chí Thắng', N'09312567', N'Vycpn@gmail.com', N'ChiVycpn', N'credit crad')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT], [Email], [CongTy], [KieuThanhToan]) VALUES (N'123       ', N'Gia Minh', N'34 Giải Phóng', N'012345566', N'Minhcpn@gmail.com', N'PhamMinhcpn', N'cash')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT], [Email], [CongTy], [KieuThanhToan]) VALUES (N'1234      ', N'nguy?n thái', N'h?ng bàng', N'3434543', N'thái@yahoo.com', N'thaicompany', N'cash')
INSERT [dbo].[Nhanvienkho] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (N'001       ', N'Nguyễn Minh Hùng', CAST(N'1987-03-04T00:00:00.000' AS DateTime), N'Nam       ', N'6/167 Cát Dài', N'012135456 ')
INSERT [dbo].[Nhanvienkho] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (N'002       ', N'Phạm Minh Thắng', CAST(N'1984-08-09T00:00:00.000' AS DateTime), N'Nam       ', N'5/147 Minh Đức', N'012345643 ')
INSERT [dbo].[Nhanvienkho] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (N'003       ', N'Vũ Minh Tuyết', CAST(N'1980-09-10T00:00:00.000' AS DateTime), N'Nữ        ', N'56/43 Cầu Đất', N'097912345 ')
INSERT [dbo].[PhieuNhap] ([Sopn], [NgayNhap], [MaNV]) VALUES (N'00123     ', CAST(N'2010-12-10T00:00:00.000' AS DateTime), N'003       ')
INSERT [dbo].[PhieuNhap] ([Sopn], [NgayNhap], [MaNV]) VALUES (N'001A      ', CAST(N'2010-09-12T00:00:00.000' AS DateTime), N'001       ')
INSERT [dbo].[PhieuNhap] ([Sopn], [NgayNhap], [MaNV]) VALUES (N'001B      ', CAST(N'2010-07-28T00:00:00.000' AS DateTime), N'002       ')
INSERT [dbo].[PhieuNhap] ([Sopn], [NgayNhap], [MaNV]) VALUES (N'002A      ', CAST(N'2010-01-10T00:00:00.000' AS DateTime), N'003       ')
INSERT [dbo].[PhieuNhap] ([Sopn], [NgayNhap], [MaNV]) VALUES (N'002B      ', CAST(N'2010-06-07T00:00:00.000' AS DateTime), N'003       ')
INSERT [dbo].[PhieuNhap] ([Sopn], [NgayNhap], [MaNV]) VALUES (N'002C      ', CAST(N'2009-02-13T00:00:00.000' AS DateTime), N'003       ')
INSERT [dbo].[PhieuNhap] ([Sopn], [NgayNhap], [MaNV]) VALUES (N'003A      ', CAST(N'2010-02-13T00:00:00.000' AS DateTime), N'002       ')
INSERT [dbo].[PhieuNhap] ([Sopn], [NgayNhap], [MaNV]) VALUES (N'003B      ', CAST(N'2010-09-12T00:00:00.000' AS DateTime), N'001       ')
INSERT [dbo].[PhieuNhap] ([Sopn], [NgayNhap], [MaNV]) VALUES (N'003C      ', CAST(N'2009-09-12T00:00:00.000' AS DateTime), N'001       ')
INSERT [dbo].[PhieuNhap] ([Sopn], [NgayNhap], [MaNV]) VALUES (N'004A      ', CAST(N'2010-03-25T00:00:00.000' AS DateTime), N'002       ')
INSERT [dbo].[PhieuNhap] ([Sopn], [NgayNhap], [MaNV]) VALUES (N'004B      ', CAST(N'2009-03-25T00:00:00.000' AS DateTime), N'002       ')
INSERT [dbo].[PhieuNhap] ([Sopn], [NgayNhap], [MaNV]) VALUES (N'009       ', CAST(N'2010-12-09T00:00:00.000' AS DateTime), N'003       ')
INSERT [dbo].[PhieuNhap] ([Sopn], [NgayNhap], [MaNV]) VALUES (N'011A      ', CAST(N'2010-06-07T00:00:00.000' AS DateTime), N'001       ')
INSERT [dbo].[PhieuNhap] ([Sopn], [NgayNhap], [MaNV]) VALUES (N'02234     ', CAST(N'2010-12-10T00:00:00.000' AS DateTime), N'003       ')
INSERT [dbo].[PhieuNhap] ([Sopn], [NgayNhap], [MaNV]) VALUES (N'022A      ', CAST(N'2010-05-24T00:00:00.000' AS DateTime), N'003       ')
INSERT [dbo].[PhieuNhap] ([Sopn], [NgayNhap], [MaNV]) VALUES (N'033A      ', CAST(N'2010-04-12T00:00:00.000' AS DateTime), N'001       ')
INSERT [dbo].[PhieuNhap] ([Sopn], [NgayNhap], [MaNV]) VALUES (N'044A      ', CAST(N'2010-07-28T00:00:00.000' AS DateTime), N'003       ')
INSERT [dbo].[PhieuNhap] ([Sopn], [NgayNhap], [MaNV]) VALUES (N'12342     ', CAST(N'2010-12-10T00:00:00.000' AS DateTime), N'003       ')
INSERT [dbo].[PhieuXuat] ([Sopx], [NgayXuat], [MaNV], [MaKH]) VALUES (N'012A      ', CAST(N'2010-12-09T00:00:00.000' AS DateTime), N'002       ', N'121       ')
INSERT [dbo].[PhieuXuat] ([Sopx], [NgayXuat], [MaNV], [MaKH]) VALUES (N'013A      ', CAST(N'2010-09-24T00:00:00.000' AS DateTime), N'003       ', N'122       ')
INSERT [dbo].[PhieuXuat] ([Sopx], [NgayXuat], [MaNV], [MaKH]) VALUES (N'014A      ', CAST(N'2010-10-22T00:00:00.000' AS DateTime), N'001       ', N'123       ')
INSERT [dbo].[PhieuXuat] ([Sopx], [NgayXuat], [MaNV], [MaKH]) VALUES (N'015A      ', CAST(N'2010-11-23T00:00:00.000' AS DateTime), N'003       ', N'122       ')
INSERT [dbo].[PhieuXuat] ([Sopx], [NgayXuat], [MaNV], [MaKH]) VALUES (N'01s       ', CAST(N'2010-12-10T00:00:00.000' AS DateTime), N'002       ', N'123       ')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N' M100     ', 320, 9, NULL, N'Chuột                         ')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'1000      ', 300, 11, N'Rapoo', N'Chuột                         ')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'22B2L     ', 413, 32, N'ASUS', N'DVD Rewrite')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'22B2S     ', 323, 30, N'ASUS', N'DVD Rewrite')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'22X       ', 321, 26, N'Samsung', N'DVD Rewrite')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'24B1LT    ', 190, 34, N'ASUS', N'DVD Rewrite')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'24B1ST    ', 378, 31, N'ASUS', N'DVD Rewrite')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'3000      ', 350, 17, N'Rapoo', N'Chuột                         ')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'AM3 Athlon', 398, 61, N'AMD', N'CPU')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'AM3 Phenom', 456, 148, N'AMD', N'CPU')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'BX300     ', 500, 350, N'Sony', N'Màn hình')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'BX400     ', 610, 725, N'Sony', N'Màn hình')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'C350      ', 345, 320, N'Samsung', N'Màn Hình')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'C400      ', 325, 350, N'Samsung', N'Màn Hình')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'C450      ', 340, 250, N'Samsung', N'Màn Hình')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'D450      ', 230, 38, N'Intel', N'CPU')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'DDR2-800  ', 800, 38, N'Vdata', N'RAM')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'DDR2-800A ', 700, 20, N'Vdata', N'RAM')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'DDR2-800B ', 900, 26, N'KINGMAX', N'RAM')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'DDR3-1333 ', 1000, 27, N'KINGMAX', N'RAM')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'DDR3-1600 ', 890, 95, N'KINGMAX', N'RAM')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'DDR400    ', 600, 21, N'Vdata', N'RAM')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'E16x48    ', 235, 17, N'Samsung', N'DVD Rom')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'E3300     ', 145, 52, N'Intel', N'CPU')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'E818A3    ', 145, 20, N'ASUS', N'DVD Rom')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'E818A6T   ', 256, 20, N'ASUS', N'DVD Rom')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'EAH5450   ', 100, 75, N'ASUS', N'Video Card')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'ENGT2201  ', 570, 93, N'ASUS', N'Video Card')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'ENGTX275  ', 387, 178, N'ASUS', N'Video Card')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'G1        ', 310, 35, NULL, N'Bàn Phím')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'G110      ', 400, 85, NULL, N'Bàn Phím')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'G15       ', 430, 99, NULL, N'Bàn Phím')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'G19       ', 450, 198, NULL, N'Bàn Phím')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'G31MX     ', 550, 42, N'FOXCONN', N'Mother broad')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'G41MVF20  ', 800, 46, N'FOXCONN', N'Mother broad')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'GAEP41TUDL', 514, 81, N'GIGABYTE', N'Mother broad')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'GAG31MES2C', 589, 57, N'GIGABYTE', N'Mother broad')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'GAG41MT   ', 490, 65, N'GIGABYTE', N'Mother broad')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'GAP41TES3G', 467, 77, N'GIGABYTE', N'Mother broad')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'GVN210D2  ', 678, 66, N'GIGABYTE', N'Video Card')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'GVN240D3  ', 341, 119, N'GIGABYTE', N'Video Card')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'GVNX84S   ', 560, 47, N'GIGABYTE', N'Video Card')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'i3-530    ', 235, 118, N'Intel', N'CPU')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'i3-540    ', 457, 126, N'Intel', N'CPU')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'i5-660    ', 443, 250, N'Intel', N'CPU')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'i5-760    ', 532, 220, N'Intel', N'CPU')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'i7-920    ', 378, 326, N'Intel', N'CPU')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'i7-990    ', 180, 1000, N'Intel', N'CPU')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'K100      ', 200, 11, NULL, N'Bàn Phím')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'K120      ', 300, 13, NULL, N'Bàn Phím')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'K340      ', 430, 57, NULL, N'Bàn Phím')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'K350      ', 160, 63, NULL, N'Bàn Phím')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'L32A10    ', 486, 450, N'Panasonic', N'Màn hình')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'L32C20    ', 321, 300, N'Panasonic', N'Màn Hình')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'L42F10S   ', 123, 800, N'Panasonic', N'Màn Hình')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'LD310     ', 324, 310, N'LG', N'Màn Hình')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'LF20FR    ', 567, 890, N'LG', N'Màn Hình')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'LH70IR    ', 256, 470, N'LG', N'Màn Hình')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'M115      ', 300, 16, NULL, N'Chuột                         ')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'M125      ', 210, 16, NULL, N'Chuột                         ')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'M215      ', 250, 25, NULL, N'Chuột                         ')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'M305      ', 500, 13, NULL, N'Chuột                         ')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'M555      ', 360, 62, NULL, N'Chuột                         ')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'M950      ', 500, 113, NULL, N'Chuột                         ')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'MK140     ', 210, 30, NULL, N'Bàn Phím')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'N110      ', 600, 7, N'Rapoo', N'Chuột                         ')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'N3000     ', 550, 8, N'Rapoo', N'Chuột                         ')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'P5G41TM   ', 600, 79, N'ASUS', N'Mother broad')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'P5KPLAMSE ', 510, 52, N'ASUS', N'Mother broad')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'Q8300     ', 346, 165, N'Intel', N'CPU')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'Q9400     ', 568, 212, N'Intel', N'CPU')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'Q9550     ', 256, 306, N'Intel', N'CPU')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'SATA2-1TB ', 700, 82, N'Samsung', N'HDD')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'SATA2-1TBA', 800, 47, N'SEAGATE', N'HDD')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'SATA2-2TB ', 600, 48, N'Samsung', N'HDD')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'SATA2-2TBA', 750, 80, N'SEAGATE', N'HDD')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'SATA2-80GB', 500, 37, N'Samsung', N'HDD')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'V1        ', 650, 16, N'Rapoo', N'Chuột                         ')
INSERT [dbo].[Vattu] ([MaVT], [SoLuong], [DonGia], [Hang], [ChungLoai]) VALUES (N'V2        ', 540, 28, N'Rapoo', N'Chuột                         ')
ALTER TABLE [dbo].[Dong_PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_Dong_PhieuNhap_PhieuNhap] FOREIGN KEY([Sopn])
REFERENCES [dbo].[PhieuNhap] ([Sopn])
GO
ALTER TABLE [dbo].[Dong_PhieuNhap] CHECK CONSTRAINT [FK_Dong_PhieuNhap_PhieuNhap]
GO
ALTER TABLE [dbo].[Dong_PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_Dong_PhieuXuat_PhieuXuat] FOREIGN KEY([Sopx])
REFERENCES [dbo].[PhieuXuat] ([Sopx])
GO
ALTER TABLE [dbo].[Dong_PhieuXuat] CHECK CONSTRAINT [FK_Dong_PhieuXuat_PhieuXuat]
GO
ALTER TABLE [dbo].[Dong_PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_Dong_PhieuXuat_Vattu] FOREIGN KEY([MaVT])
REFERENCES [dbo].[Vattu] ([MaVT])
GO
ALTER TABLE [dbo].[Dong_PhieuXuat] CHECK CONSTRAINT [FK_Dong_PhieuXuat_Vattu]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_Nhanvienkho] FOREIGN KEY([MaNV])
REFERENCES [dbo].[Nhanvienkho] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_Nhanvienkho]
GO
ALTER TABLE [dbo].[PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_PhieuXuat_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_PhieuXuat_KhachHang]
GO
ALTER TABLE [dbo].[PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_PhieuXuat_Nhanvienkho] FOREIGN KEY([MaNV])
REFERENCES [dbo].[Nhanvienkho] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_PhieuXuat_Nhanvienkho]
GO
/****** Object:  StoredProcedure [dbo].[p_deletedongphieunhap]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_deletedongphieunhap]
@sopn nchar(10),
@mavt nchar(10)
as
begin
	if(@mavt = (select MaVT from Dong_PhieuNhap where MaVT = @mavt) and @sopn =(select Sopn from Dong_PhieuNhap where Sopn = @sopn))
		begin
			delete from Dong_PhieuNhap
			where MaVT = @mavt and Sopn = @sopn 
			print 'Xoa thanh cong dong phieu nhap' 
		end
	else
		begin
			print 'ERROR:khong tim thay dong phieu nhap  nhu tren'
		end
end
GO
/****** Object:  StoredProcedure [dbo].[p_deletedongphieuxuat]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_deletedongphieuxuat]
@sopx nchar(10),
@mavt nchar(10)
as
begin
	if(@mavt = (select MaVT from Dong_PhieuXuat where MaVT = @mavt) and @sopx =(select Sopx from Dong_PhieuXuat where Sopx = @sopx))
		begin
			delete from Dong_PhieuXuat
			where MaVT = @mavt and Sopx = @sopx 
			print 'Xoa thanh cong dong phieu xuat' 
		end
	else
		begin
			print 'ERROR:khong tim thay dong phieu xuat  nhu tren'
		end
end
GO
/****** Object:  StoredProcedure [dbo].[p_deletekhachhang]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_deletekhachhang]
@makh nchar(10)
as
begin
	if(@makh = (select MaKH from KhachHang where MaKH = @makh))
		begin
			delete from KhachHang
			where MaKH = @makh
			print 'Xoa thanh cong khach hang' 
		end
	else
		begin
			print 'ERROR:khong tim thay khach hang co ma nhu tren'
		end
end
GO
/****** Object:  StoredProcedure [dbo].[p_deletenhanvienkho]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_deletenhanvienkho]
@manv nchar(10)
as
begin
	if(@manv = (select MaNV from Nhanvienkho where MaNV = @manv))
		begin
			delete from Nhanvienkho
			where MaNV = @manv
			print 'xoa thanh cong nhan vien kho'  
		end
	else
		begin
			print 'ERROR:khong tim thay nhan vien co ma nhu tren'
		end
end
GO
/****** Object:  StoredProcedure [dbo].[p_deletephieunhap]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_deletephieunhap]
@sopn nchar(10)
as
begin
	if(@sopn = (select Sopn from PhieuNhap where Sopn = @sopn))
		begin
			delete from PhieuNhap
			where Sopn = @sopn
			print 'Xoa thanh cong phieu nhap' 
		end
	else
		begin
			print 'ERROR:khong tim thay phieu nhap co ma nhu tren'
		end
end
GO
/****** Object:  StoredProcedure [dbo].[p_deletevattu]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_deletevattu]
@mavt nchar(10)
as
begin
	if(@mavt = (select MaVT from Vattu where MaVT = @mavt))
		begin
			delete from Vattu
			where MaVT = @mavt
			print 'Xoa thanh cong vat tu' 
		end
	else
		begin
			print 'ERROR:khong tim thay vat tu co ma nhu tren'
		end
end
GO
/****** Object:  StoredProcedure [dbo].[p_insertdongphieunhap]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_insertdongphieunhap]
@tennhacc nvarchar(50),
@sopn nchar(10),
@mavt nchar(10),
@chungloai nvarchar(50),
@soluong int
as
begin
	insert into Dong_PhieuNhap
	values(@tennhacc,@sopn,@mavt,@chungloai,@soluong)
end
GO
/****** Object:  StoredProcedure [dbo].[p_insertdongphieuxuat]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_insertdongphieuxuat]
@sopx nchar(10),
@mavt nchar(10),
@chungloai nvarchar(50),
@soluong int
as
begin
	insert into Dong_PhieuXuat
	values(@sopx,@mavt,@chungloai,@soluong)
end
GO
/****** Object:  StoredProcedure [dbo].[p_insertkhachhang]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_insertkhachhang]
@makh nchar(10),
@tenkh nvarchar(50),
@dc nvarchar(50),
@sdt nvarchar(50),
@email nvarchar(50),
@congty nvarchar(50),
@kieuthanhtoan nvarchar(50)
as
begin
	if(@makh = (select MaKH from KhachHang where MaKH = @makh))
		begin
			print 'ERROR:loi tim thay khach hang trung ten'
		end
	else
		begin
			insert into KhachHang
			values(@makh,@tenkh,@dc,@sdt,@email,@congty,@kieuthanhtoan)
			print 'success' 
		end
end
GO
/****** Object:  StoredProcedure [dbo].[p_insertnhanvienkho]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[p_insertnhanvienkho]
@manv nchar(10),
@tennv nvarchar(50),
@ngaysinh datetime,
@gioitinh nchar(10),
@dc nvarchar(50),
@sdt nchar(10)
as
begin
	if(@manv = (select MaNV from Nhanvienkho where MaNV = @manv))
		begin
				print 'ERROR:loi tim thay nhan vien trung ten'
		end
	else
		begin
				insert into Nhanvienkho
				values(@manv,@tennv,@ngaysinh,@gioitinh,@dc,@sdt)
				print 'success'

		end
end
GO
/****** Object:  StoredProcedure [dbo].[p_insertphieunhap]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_insertphieunhap]
@sopn nchar(10),
@ngaynhap datetime,
@manv nchar(10)
as
begin
	if(@sopn = (select Sopn from PhieuNhap where Sopn = @sopn))
		begin 
			print 'ERROR: loi tim thay so phieu nhap bi trung'
		end
	else
		begin
			insert into PhieuNhap
			values(@sopn,@ngaynhap,@manv)
			print 'success'

		end

end	
GO
/****** Object:  StoredProcedure [dbo].[p_insertphieuxuat]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_insertphieuxuat]
@sopx nchar(10),
@ngayxuat datetime,
@manv nchar(10),
@makh nchar(10)
as
begin
	if(@sopx = (select Sopx from PhieuXuat where Sopx = @sopx))
		begin 
			print 'ERROR: loi tim thay so phieu xuat bi trung'
		end
	else
		begin
			insert into PhieuXuat
			values(@sopx,@ngayxuat,@manv,@makh)
			print 'success'

		end

end	
GO
/****** Object:  StoredProcedure [dbo].[p_themvattu]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[p_themvattu]
@mavt nchar(10),
@hang nvarchar(50),
@chungloai nvarchar(50),
@soluong int,
@dongia float
as
begin
if(@mavt=(select MaVT from Vattu where MaVT = @mavt))
	begin
		print 'ERROR'
	end
else 
	begin
		insert into Vattu
		values(@mavt,@hang,@chungloai,@soluong,@dongia)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[p_updatedongphieunhap]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_updatedongphieunhap]
@tennhacc nvarchar(50),
@sopn nchar(10),
@mavt nchar(10),
@chungloai nvarchar(50),
@soluong int
as
update Dong_PhieuNhap
set TenNhaCC = @tennhacc, MaVT = @mavt , ChungLoai = @chungloai , SoLuong = @soluong
where sopn = @sopn
GO
/****** Object:  StoredProcedure [dbo].[p_updatedongphieuxuat]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_updatedongphieuxuat]
@sopx nchar(10),
@mavt nchar(10),
@chungloai nvarchar(50),
@soluong int
as
update Dong_PhieuXuat
set MaVT = @mavt, ChungLoai = @chungloai, SoLuong = @soluong
where sopx = @sopx
GO
/****** Object:  StoredProcedure [dbo].[p_updatekhachhang]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_updatekhachhang]
@makh nchar(10),
@tenkh nvarchar(50),
@dc nvarchar(50),
@sdt nvarchar(50),
@email nvarchar(50),
@congty nvarchar(50),
@kieuthanhtoan nvarchar(50)
as
update KhachHang
set TenKH = @tenkh,DiaChi = @dc , SDT = @sdt,Email = @email , CongTy = @congty , KieuThanhToan = @kieuthanhtoan
where MaKH = @makh
GO
/****** Object:  StoredProcedure [dbo].[p_updatenhanvien]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_updatenhanvien]
@manv nchar(10),
@tennv nvarchar(50),
@ngaysinh datetime,
@gioitinh nchar(10),
@dc nvarchar(50),
@sdt nchar(10)
as 
update Nhanvienkho
set TenNV = @tennv, NgaySinh = @ngaysinh, GioiTinh = @gioitinh, DiaChi = @dc, SDT = @sdt
where MaNV = @manv
GO
/****** Object:  StoredProcedure [dbo].[p_updatephieunhap]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_updatephieunhap]
@sopn nchar(10),
@ngaynhap datetime,
@manv nchar(10)
as
update PhieuNhap
set NgayNhap = @ngaynhap, MaNV = @manv
where sopn = @sopn
GO
/****** Object:  StoredProcedure [dbo].[p_updatephieuxuat]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_updatephieuxuat]
@sopx nchar(10),
@ngayxuat datetime,
@manv nchar(10),
@makh nchar(10)
as
update PhieuXuat
set NgayXuat = @ngayxuat , MaNV = @manv , MaKH = @makh
where sopx = @sopx
GO
/****** Object:  StoredProcedure [dbo].[p_updatevattu]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_updatevattu]
@mavt nchar(10),
@soluong int,
@dongia float,
@hang nvarchar(50),
@chungloai nvarchar(50)
as
begin
update Vattu
set SoLuong = @soluong ,DonGia = @dongia,Hang = @hang, ChungLoai = @chungloai
where MaVT = @mavt
end
GO
/****** Object:  StoredProcedure [dbo].[sp_searchkhtheoma]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_searchkhtheoma]
@maKH nchar(10)
AS
	begin 
		if (@maKH = (select MaKH from KhachHang where MaKH = @maKH))
			begin 
				select * from KhachHang where MaKH = @maKH
			end
		else
			begin 
			print 'error' 
			end
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_searchkhtheoten]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_searchkhtheoten]
@tenKH nvarchar(50)
AS
	begin 
		if (@tenKH = (select tenKH from KhachHang where TenKH = @tenKH))
			begin 
				select * from KhachHang where TenKH = @tenKH
			end
		else
			begin 
			print 'error' 
			end
	end
GO
/****** Object:  StoredProcedure [dbo].[test]    Script Date: 6/13/2020 4:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[test] 
@mavt nchar(10)
as
select MaVT from Vattu where MaVT = @mavt
GO
