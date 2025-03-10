USE [master]
GO
/****** Object:  Database [cakeshop]    Script Date: 6/5/2024 10:11:56 AM ******/
CREATE DATABASE [cakeshop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cakeshop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.GIAHAO222\MSSQL\DATA\cakeshop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cakeshop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.GIAHAO222\MSSQL\DATA\cakeshop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [cakeshop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cakeshop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cakeshop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cakeshop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cakeshop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cakeshop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cakeshop] SET ARITHABORT OFF 
GO
ALTER DATABASE [cakeshop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cakeshop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cakeshop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cakeshop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cakeshop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cakeshop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cakeshop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cakeshop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cakeshop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cakeshop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cakeshop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cakeshop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cakeshop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cakeshop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cakeshop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cakeshop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cakeshop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cakeshop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [cakeshop] SET  MULTI_USER 
GO
ALTER DATABASE [cakeshop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cakeshop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cakeshop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cakeshop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cakeshop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cakeshop] SET QUERY_STORE = OFF
GO
USE [cakeshop]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 6/5/2024 10:11:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[session_id] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[voucher] [float] NULL,
	[subtotal] [float] NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 6/5/2024 10:11:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[meta] [nvarchar](max) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category_news]    Script Date: 6/5/2024 10:11:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_news](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[meta] [nvarchar](max) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_category_news] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contact_us]    Script Date: 6/5/2024 10:11:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact_us](
	[address] [nvarchar](150) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menu]    Script Date: 6/5/2024 10:11:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[meta] [nvarchar](max) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news]    Script Date: 6/5/2024 10:11:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryid] [int] NULL,
	[name] [nvarchar](50) NULL,
	[img] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[link] [nvarchar](max) NULL,
	[detail] [ntext] NULL,
	[meta] [nvarchar](max) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_news] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news_comments]    Script Date: 6/5/2024 10:11:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news_comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[news_id] [int] NULL,
	[reply_id] [int] NULL,
	[username] [nvarchar](100) NULL,
	[img] [nvarchar](max) NULL,
	[email] [nvarchar](100) NULL,
	[message] [nvarchar](max) NULL,
	[order] [int] NULL,
	[hide] [bit] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_blog_comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 6/5/2024 10:11:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oderDate] [datetime] NULL,
	[customerName] [nvarchar](100) NULL,
	[productName] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[totalAmount] [float] NULL,
	[payment] [nvarchar](50) NULL,
	[lastUpdateDate] [datetime] NULL,
	[orderStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders_detail]    Script Date: 6/5/2024 10:11:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_orders_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 6/5/2024 10:11:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryid] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[img] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[size] [nvarchar](10) NULL,
	[meta] [nvarchar](max) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [datetime] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[team]    Script Date: 6/5/2024 10:11:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[team](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[job title] [nvarchar](50) NULL,
	[img] [nvarchar](max) NULL,
	[twitter] [nvarchar](100) NULL,
	[facebook] [nvarchar](100) NULL,
	[instagram] [nvarchar](100) NULL,
	[linked in] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[phone] [nvarchar](30) NULL,
	[date of birth] [smalldatetime] NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
 CONSTRAINT [PK_team] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voucher]    Script Date: 6/5/2024 10:11:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voucher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[datebegin] [smalldatetime] NULL,
	[hide] [bit] NULL,
	[value] [float] NULL,
 CONSTRAINT [PK_voucher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bill] ON 

INSERT [dbo].[bill] ([id], [product_id], [session_id], [name], [price], [quantity], [voucher], [subtotal], [total]) VALUES (85, 10, N'm2ogthneooytcwq3k5tohjby', N'Bánh kem Sữa tươi 002', 199000, 1, 0, 398000, 398000)
INSERT [dbo].[bill] ([id], [product_id], [session_id], [name], [price], [quantity], [voucher], [subtotal], [total]) VALUES (86, 11, N'm2ogthneooytcwq3k5tohjby', N'Bánh kem Socola 002', 199000, 1, 0, 398000, 398000)
SET IDENTITY_INSERT [dbo].[bill] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [name], [meta], [hide], [order], [datebegin]) VALUES (1, N'Bánh sinh nhật', N'banh-sinh-nhat', 1, 1, NULL)
INSERT [dbo].[category] ([id], [name], [meta], [hide], [order], [datebegin]) VALUES (2, N'Bánh cưới', N'banh-cuoi', 1, 2, NULL)
INSERT [dbo].[category] ([id], [name], [meta], [hide], [order], [datebegin]) VALUES (3, N'Bánh kem', N'banh-kem', 1, 3, NULL)
INSERT [dbo].[category] ([id], [name], [meta], [hide], [order], [datebegin]) VALUES (4, N'Tiramisu', N'tiramisu', 1, 4, NULL)
INSERT [dbo].[category] ([id], [name], [meta], [hide], [order], [datebegin]) VALUES (5, N'Bánh custom', N'banh-custom', 1, 5, NULL)
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[category_news] ON 

INSERT [dbo].[category_news] ([id], [name], [meta], [hide], [order], [datebegin]) VALUES (1, N'tin tức', N'tin-tuc', 1, 1, NULL)
INSERT [dbo].[category_news] ([id], [name], [meta], [hide], [order], [datebegin]) VALUES (2, N'công thức', N'cong-thuc', 1, 2, NULL)
INSERT [dbo].[category_news] ([id], [name], [meta], [hide], [order], [datebegin]) VALUES (3, N'bánh kem', N'banh-kem', 1, 3, NULL)
INSERT [dbo].[category_news] ([id], [name], [meta], [hide], [order], [datebegin]) VALUES (4, N'bánh cưới', N'banh-cuoi', 1, 4, NULL)
SET IDENTITY_INSERT [dbo].[category_news] OFF
GO
INSERT [dbo].[contact_us] ([address], [email], [phone]) VALUES (N'19 Nguyễn Hữu Thọ, phường Tân Phong, Quận 7, Thành phố Hồ Chí Minh', N'https://www.facebook.com/hao.gia.988/', N'(028) 37 755 035')
GO
SET IDENTITY_INSERT [dbo].[menu] ON 

INSERT [dbo].[menu] ([id], [name], [meta], [hide], [order], [datebegin]) VALUES (1, N'Trang chủ', N'trang-chu', 1, 1, NULL)
INSERT [dbo].[menu] ([id], [name], [meta], [hide], [order], [datebegin]) VALUES (2, N'Blogs', N'tin-tuc', 1, 4, NULL)
INSERT [dbo].[menu] ([id], [name], [meta], [hide], [order], [datebegin]) VALUES (3, N'Thông tin', N'thong-tin', 1, 2, NULL)
INSERT [dbo].[menu] ([id], [name], [meta], [hide], [order], [datebegin]) VALUES (4, N'Shop', N'san-pham', 1, 3, NULL)
INSERT [dbo].[menu] ([id], [name], [meta], [hide], [order], [datebegin]) VALUES (5, N'Liên hệ', N'lien-he', 1, 5, NULL)
INSERT [dbo].[menu] ([id], [name], [meta], [hide], [order], [datebegin]) VALUES (8, N'Giỏ hàng', N'gio-hang', 1, 6, NULL)
SET IDENTITY_INSERT [dbo].[menu] OFF
GO
SET IDENTITY_INSERT [dbo].[news] ON 

INSERT [dbo].[news] ([id], [categoryid], [name], [img], [description], [link], [detail], [meta], [hide], [order], [datebegin]) VALUES (1, 1, N'Tiramisu - Phiên bản truyền thống Italia', N'News/tiramisu-de-banh-bong-lan.jpg', N'Phiên bản Tiramisu truyền thống luôn có đế bánh là Savoiardi (lady fingers) xốp, mềm quyện với vị béo ngậy của Mascarpone và trứng, phảng phất mùi rượu và café. Tiramisu do Dolce  Vita chụp tại bar Pompi (Roma) nổi tiếng có Tiramisu ngon nhân chuyến training tháng 11/2012. Với Tiramisu truyền thống, Savoiardi sẽ được nhúng qua cà phê (có thể thêm ít rượu) để  bánh thơm, mềm và xốp (vì Savoiardi  giòn, cứng) và đặt ở dưới khuôn. Savoiardi chỉ thấm vừa cà phê cho mềm chứ không để quá ướt, sũng nước sẽ không ngon. Sau đó đến hỗn hợp Mascarpone, trứng (có thể thêm panna - tương tự Whipping cream) đã  được cho thêm ít rượu vào để khử mùi trứng. Thực ra, mùi rượu không nồng lắm, chỉ đủ để át đi mùi của trứng. Sau hai lớp Savoiardi và kem Mascarpone như vậy, cacao sẽ được phủ lên trên cùng.    “Savoiardi” có thể thay  bằng “Pan di Spagna” (bánh bông lan theo phương pháp Genoise mà Dolce Vita đang áp dụng). Rượu Marsala có thể thay bằng rượu Rhum, Kahlua, hoặc Amarretto. Nếu dùng “Pan di Spagna” trắng (bánh bông lan trắng), người ta sẽ phết cà phê nhiều hơn để cho đế bánh thơm.Nếu dùng “Pan di spagna al cacao” (bánh bông lan cacao) như Dolce Vita đang áp dụng, phần đế bánh đã thơm cacao nên không cần phết nhiều cà phê. Chỉ phết syrup vừa đủ để bánh mềm. Tiramisu với đế bánh bông lan cacao được phết syrup Và trên nền Savoiardi hay Pan di Spagna xốp mềm, thơm cà phê hay cacao quyến rũ là lớp kem Mascarpone và trứng vàng ngậy, mềm tan. Khác với cheese (phomai) có màu trắng, vị béo, chua, cấu trúc cứng và chắc,  Mascarpone có màu vàng nhạt, vị béo, không chua, rất mềm. Do đó Tiramisu được làm theo đúng kiểu truyền thống, với đúng nguyên liệu sẽ có màu vàng nhạt, béo ngậy và tan mềm trong miệng.Và dù là “Savoiardi”  hay “Pan di  Spagna”, Kahlua  hay Marsala,  Tiramisu vẫn là món tráng miệng được ưa thích và phổ biến nhất của Ý. Có thể xem đây là một sứ giả ngọt ngào của Italia xinh đẹp. ', NULL, N'Tiramisu Ký Sự - Phần 2', N'tin-tuc-01', 1, 1, CAST(N'2024-04-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[news] ([id], [categoryid], [name], [img], [description], [link], [detail], [meta], [hide], [order], [datebegin]) VALUES (2, 1, N'Tiramisu và Câu chuyện về chiếc bánh tình yêu', N'News/tiramisu-mousse-cake-banh-kem-y-quan-1.jpg', N'Xuất xứ từ nước Ý, ngày nay, tiramisu đã trở thành món bánh tráng miệng được yêu thích trên khắp thế giới. Chiếc bánh là sự kết hợp hòa quyện giữa hương thơm của cà phê, rượu nhẹ cùng vị béo của trứng và kem phô mai. Chỉ cần ăn một miếng là sẽ cảm nhận được tất cả các hương vị đó hòa quyện cùng một lúc, chính vì thế mà người ta còn gọi nó là “Thiên đường trong miệng của bạn” (Heaven in your mouth).



Tiramisu (tih-ruh-mee-soo) theo tiếng Ý có nghĩa là “pick me up”. Loại bánh tiramisu cổ điển giống như một loại bánh pudding tráng miệng mà vẫn thường bao gồm một miếng bánh gato hoặc bánh quy được thấm mùi rượu nhẹ, và được phủ lên trên bằng bột cacao và được làm từ rất nhiều trứng. Với bánh Tiramisu xưa, các lớp bánh được làm riêng từng lớp không kết dính, cho tới ngày nay, người ta mới dùng phô mai để làm cho chúng trở nên hấp dẫn hơn.



Có khá nhiều ý kiến về xuất xứ của Tiramisu, không ai biết được chính xác món bánh này được làm tại đâu và khi nào, nhưng điều mà mọi người chắc chắn biết rằng nó được làm ở một thành phố nào đó trên đất nước Ý. Một vài người khẳng định bánh Tiramisu đã được “phát minh” ra trong thời kì thế chiến thứ nhất bởi một người phụ nữ Ý vì bà muốn gửi những chiếc bánh của mình như một lời chúc ngọt ngào nhất đến tay những chiến binh đang chuẩn bị lên đường xông pha trận mạc. Có người lại cho rằng, loại bánh tráng miệng này thực ra chỉ là một cách để tiết kiệm những chiếc bánh ngọt cũ, cà phê cũ đã khô cứng trong các quán cà phê mà thôi. Tuy nhiên, ý kiến này đã bị nhiều người phản đối.



Cũng có những câu chuyện dài kể về nguồn gốc của loại bánh này. Đó là câu chuyện về quý ngày Medici đệ tam (1642-1723). Vào khoảng thế kỉ XVII, một món tráng miệng gần giống với tiramisu được tạo ra ở Siena (một thành phố ở Ý nơi có số lượng lớn người Tuscan sinh sống). Trong một chuyến ghé thăm của quý ngài Medici đệ tam tới thành phố, do quá ấn tượng với loại đồ tráng miệng này, ngài đã mang theo công thức cùng mình trở về Florence. Vào thế kỉ 19, bánh Tiramisu trở nên rất nổi tiếng trong giới tri thức cũng như nghệ sĩ người Anh sinh sống ở Florence. Và công thức về loại bánh này tiếp tục được lưu truyền đến với xứ sở sương mù nơi mà nó bắt đầu được sử dụng rộng rãi và được lan tuyền toàn thế giới.



Theo một bài báo có tựa đề “cuộc phiêu lưu của Tiramisu” tác giả bài báo là Jane Black ở thời báo Washington được đăng vào ngày 11 tháng 7 năm 2007 có nói đến loại bánh tiramisu ở thời điểm hiện tại đã được sáng tạo ra trong một nhà hàng ở Treviso (một thành phố nằm ở phía tây bắc của Venice, Ý) tên là Le Beccherie. Carminantonio Iannaccone – chủ nhà hàng, đã khẳng định rằng ông chính ra cha đẻ của loại bánh tiramisu có một không hai này. Bài báo đã viết về câu chuyện của Carminantonio Iannaccone theo lời kể của ông. Ban đầu ông học việc là một thợ làm bánh ngọt ở một thành phố phía nam của Avellino, và bắt đầu chuyển đến định cư ở Milan vào năm 12 tuổi để tìm việc. Vào năm 1969 ông kết hôn với Bruna và sau đó mở một nhà hàng cũng tên là Piedigrotta giống với một nhà hàng ở Treviso. Tại nơi đây ông bắt đầu sản xuất các loại bánh ngọt dựa theo cuốn sách “Hương vị mỗi ngày” và các loại bánh ngọt do ông sản xuất ra đều có vị café đậm đặc, thật nhiều trứng và phô mai, rượu Marsala (một loại rượu thuốc cổ của Ý) và bánh quy. Ông kể lại rằng mình đã mất 2 năm để hoàn thiện công thức tuyệt vời nhất của mình và ông đã phục vụ nó với một phong cách rất quý phái. Tiramisu được dịch sang tiếng Ý có nghĩa là “pick me up”, cái tên này được đặt dựa trên mùi vị espresso đặc trưng của món bánh và ngay lập tức tiramisu trở thành một hiện tượng. Iannaccone kể lại rằng các thực khách đã thưởng thức món bánh của ông và ngay sau đó họ về nhà và bắt đầu tạo ra những phiên bản khác của tiramisu theo phong cách của riêng họ. Và cho đến cuối những năm 1980 tiramisu đã có mặt khắp nơi trên toàn nước Ý và các vùng lân cận.

Bài viết này khá tương đồng với những nội dung được đề cập trong một cuốn sách của Fernando e Tina Raris mang tên “La Marca Gastronomica” xuất bản năm 1998, viết về ẩm thực vùng Treviso. Tác giả nhớ lại rằng có một người tên Giuseppe Maffioli viết trong một bài báo ở năm 1981: “Tiramisu đã được sinh ra cách đây 10 năm ở Treviso. Và nó lần đầu tiên xuất hiện ở một nhà hàng tên là Le Beccherie. Món tráng miệng này và tên của nó lập tức trở nên nổi tiếng, ngay sau đó loại bánh này cùng với tên gọi Tiramisu đã được sao chép và sản xuất tại tất cả các nhà hàng toàn vùng Treviso và sau đó là khắp nước Ý”. Cho đến ngày hôm nay, nhà hàng “Le Beccherie” vẫn làm món bánh Tiramisu theo công thức cũ: Bánh quy được nhúng trong bột café espresso cùng với phô mai và một chút bột cacao. Alba và Ado Campeol, chủ cửa hàng hối hận rằng họ đã không đăng kí bản quyền tên gọi của loại bánh này và đặc biệt để ngăn ngừa những phiên bản lậu kèm theo sự tò mò về nơi đầu tiên sinh ra loại bánh tiramisu.

Một nhà nghiên cứu về ẩm thực, ông Pietro Mascioni cũng đã theo dấu món ăn này trờ về những năm 1960 ở một thành phố tập trung đông người Tuscan có tên là Treviso. “Được sinh ra vào khoảng gần 2 thế kỉ trước tại Treviso, món bánh tiramisu được tạo ra lần đầu tiên ở một nhà hàng tên là Alle Beccherie và bởi một nghệ nhân làm bánh tên là Loly Linguanotto, câu truyện kể rằng bà đã có ý tưởng làm nên món bánh này sau khi sinh con, khi đó bà rất yếu, trong một thời gian dài nằm liệt giường bà đã được mẹ chồng chăm sóc bằng  bánh Zabaione trên có rắc rất nhiều hạt cà phê để tiếp thêm năng lượng cho bà”.



Tuy nhiên, trong cuốn sách “Nghệ thuật ẩm thực qua các thế kỉ ở Ý” của Anna Maria Volpi. Bà đã viết về Tiramisu và trong quá trình nghiên cứu của bà có nhắc đến lịch sử về loại bánh này: “Công thức lâu đời nhất của loại bánh Tiramisu được tìm thấy trong một cuốn sách viết bởi Giovanni Capnist mang tên “I Dolci del Veneto” (Các món tráng miệng của Veneto) được xuất bản lần đầu năm 1983 trong đó có công thức cơ bản nhất của món bánh tiramisu. Và công thức món bánh tiramisu hiện tại có những thay đổi đáng kể so với phiên bản ở Treviso.” Theo Anna Maria, món bánh này được phát minh tại vùng Treviso tại nhà hàng Le Beccherie bởi Francesca Valori, người có tên thời thiếu nữ là Tiramisu.

Ở Mỹ, bánh Tiramisu và những câu chuyện về tình yêu bắt đầu được sử dụng phổ biến lần đầu tiên khi nó xuất hiện tại San Francisco trong những năm 1990 và nhanh chóng lan rộng ra toàn nước Mỹ. Tiramisu hiện nay vẫn đang là sự lựa chọn số một cho món tráng miệng ở trên thực đơn của rất nhiều nhà hàng lớn hay tiệm cà phê và là món bánh được ưa thích tại các cửa hàng bánh ngọt.', NULL, N'Không phải xuất xứ từ những câu chuyện thật cảm động nhưng những con người làm nên loại bánh này lại khiến ta cảm động bởi tình cảm họ gửi gắm qua chiếc bánh mang đến cho những người thân yêu của mình. ', N'tin-tuc-02', 1, 2, CAST(N'2024-04-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[news] ([id], [categoryid], [name], [img], [description], [link], [detail], [meta], [hide], [order], [datebegin]) VALUES (3, 1, N'Tiramisu - Bản Tình Ca Ngọt Ngào', N'News/banh-tiramisu-ngot-ngao-01.jpg', N'Tiramisu tiếng Ý có nghĩa là “Tirare me su” (bring me up)- hãy nâng tôi lên, hãy truyền cho tôi thêm sức mạnh, hãy khơi dậy niềm đam mê, hãy thắp lên trong tôi niềm hứng khởi, sự phấn khích, lòng yêu đời và tình yêu người …
Bánh Tiramisu được cho là đã khai sinh từ nhiều vùng của nước Ý như Lombardia, Piemont, Veneto và Toscana (Tuscany). Tương truyền rằng Tiramisu được những thợ bánh vùng Siena (Toscana) phát minh ra nhân chuyến thăm của Công tước xứ Toscana, Cosimo III de Medici. Do đó, Tiramisu một thời được mệnh danh là “zuppa del duca” – bánh của Công tước và thường được vị công tước Medici dùng trước những buổi hẹn hò cùng tình nhân. Có thể vì lí do này mà Tiramisu cũng được gọi là “bánh tình yêu” chăng? 
 



(Hình Siena, nơi được cho khai sinh ra món Tiramisu do DolceVita chụp nhân chuyến training tháng 11/2012)
 
Không thể phủ nhận những nhân tố “tình yêu” trong chiếc bánh Tiramisu. Men rượu trong bánh có khác chi men tình làm ta say. Vị café nồng nàn như tăng đam mê và cảm xúc. Chưa dừng lại ở đó, lớp cacao đắng bên trên như đẩy sự nồng say ấy lên đỉnh điểm. Và mascarpone- sản phẩm tinh túy nhất từ sữa- với hương vị rất riêng và vô cùng đặc biệt đem đến vẻ mềm mại, quyến rũ khôn cùng.  
 
 
Mascarpone màu vàng nhạt, vị béo mềm tạo độ mềm, mịn và màu vàng hấp dẫn của Tiramisu.
 
Tiramisu là rất riêng và rất đặc biệt. Không có gì như Tiramisu! Các cung bậc ngọt, đắng, cay, nồng hòa quyện với nhau thành bài tình ca đẹp cho đời thêm đắm say và ngọt ngào.


', NULL, N'Tiramisu ký sự- Kỳ 1', N'tin-tuc-03', 1, 3, CAST(N'2024-04-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[news] ([id], [categoryid], [name], [img], [description], [link], [detail], [meta], [hide], [order], [datebegin]) VALUES (6, 1, N'tt', N'logo.png', N'<p>ttt</p>
', NULL, N'<p>ttt</p>
', N'tt', 1, 6, CAST(N'2024-04-09T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[news] OFF
GO
SET IDENTITY_INSERT [dbo].[news_comments] ON 

INSERT [dbo].[news_comments] ([id], [news_id], [reply_id], [username], [img], [email], [message], [order], [hide], [datebegin]) VALUES (2, 1, NULL, N'aksfj á', N'comment/comment-1.jpg', N'alskf al', N'alsfnalsfn', 1, 1, CAST(N'2024-04-20T00:00:00' AS SmallDateTime))
INSERT [dbo].[news_comments] ([id], [news_id], [reply_id], [username], [img], [email], [message], [order], [hide], [datebegin]) VALUES (3, 6, NULL, N'abc', N'comment/comment-1.jpg', N'ápicnaoscn', N'àonaosn', 1, 1, CAST(N'2024-04-20T00:00:00' AS SmallDateTime))
INSERT [dbo].[news_comments] ([id], [news_id], [reply_id], [username], [img], [email], [message], [order], [hide], [datebegin]) VALUES (4, 1, NULL, N'Gia Hào', N'comment/comment-1.jpg', N'giahao@gmail.com', N'một hai ba bốn năm sáu bảy tám chín mười', 1, 1, CAST(N'2024-04-20T00:00:00' AS SmallDateTime))
INSERT [dbo].[news_comments] ([id], [news_id], [reply_id], [username], [img], [email], [message], [order], [hide], [datebegin]) VALUES (4590, 6, NULL, N'comment 1', N'comment/comment-1.jpg', N'comment 1', N'comment 1
', 1, 1, CAST(N'2024-04-23T00:00:00' AS SmallDateTime))
INSERT [dbo].[news_comments] ([id], [news_id], [reply_id], [username], [img], [email], [message], [order], [hide], [datebegin]) VALUES (4591, 6, NULL, N'gia hao', N'comment/comment-1.jpg', N'giahao222@gmail.com', N'123', 1, 1, CAST(N'2024-05-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[news_comments] ([id], [news_id], [reply_id], [username], [img], [email], [message], [order], [hide], [datebegin]) VALUES (4592, 3, NULL, N'Gia Hào', N'comment/comment-1.jpg', N'giahao123@gmail.com', N'abcabcabc', 1, 1, CAST(N'2024-06-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[news_comments] ([id], [news_id], [reply_id], [username], [img], [email], [message], [order], [hide], [datebegin]) VALUES (4593, 3, NULL, N'Phạm Phụng', N'comment/comment-1.jpg', N'PhamPhung@gmail.com', N'123123123123', 1, 1, CAST(N'2024-06-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[news_comments] ([id], [news_id], [reply_id], [username], [img], [email], [message], [order], [hide], [datebegin]) VALUES (4594, 3, NULL, N'1', N'comment/comment-1.jpg', N'1', N'1111111', 1, 1, CAST(N'2024-06-02T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[news_comments] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [oderDate], [customerName], [productName], [address], [totalAmount], [payment], [lastUpdateDate], [orderStatus]) VALUES (12, CAST(N'2024-04-16T00:00:00.000' AS DateTime), N'alskfn', N'alskfna', NULL, 4617904, N'123', NULL, NULL)
INSERT [dbo].[orders] ([id], [oderDate], [customerName], [productName], [address], [totalAmount], [payment], [lastUpdateDate], [orderStatus]) VALUES (13, CAST(N'2024-04-16T00:00:00.000' AS DateTime), N'123', N'123', NULL, 123, N'123', NULL, NULL)
INSERT [dbo].[orders] ([id], [oderDate], [customerName], [productName], [address], [totalAmount], [payment], [lastUpdateDate], [orderStatus]) VALUES (14, CAST(N'2024-04-16T00:00:00.000' AS DateTime), N'999', N'999', NULL, 39483000, N'99', NULL, NULL)
INSERT [dbo].[orders] ([id], [oderDate], [customerName], [productName], [address], [totalAmount], [payment], [lastUpdateDate], [orderStatus]) VALUES (15, CAST(N'2024-04-16T00:00:00.000' AS DateTime), N'333', N'333', NULL, 333, N'33', NULL, NULL)
INSERT [dbo].[orders] ([id], [oderDate], [customerName], [productName], [address], [totalAmount], [payment], [lastUpdateDate], [orderStatus]) VALUES (16, CAST(N'2024-04-16T00:00:00.000' AS DateTime), N'444', N'444', NULL, 444, N'444', NULL, NULL)
INSERT [dbo].[orders] ([id], [oderDate], [customerName], [productName], [address], [totalAmount], [payment], [lastUpdateDate], [orderStatus]) VALUES (17, NULL, N'ânnan', N'ânnan', N'annaan', 333, N'ânnan', NULL, NULL)
INSERT [dbo].[orders] ([id], [oderDate], [customerName], [productName], [address], [totalAmount], [payment], [lastUpdateDate], [orderStatus]) VALUES (18, CAST(N'2024-04-17T00:00:00.000' AS DateTime), N'000', N'000', N'000', 66217, N'000', NULL, NULL)
INSERT [dbo].[orders] ([id], [oderDate], [customerName], [productName], [address], [totalAmount], [payment], [lastUpdateDate], [orderStatus]) VALUES (20, CAST(N'2024-04-19T00:00:00.000' AS DateTime), N'Luong Gia Hao', NULL, N'HCM', 625000, N'Momo', NULL, NULL)
INSERT [dbo].[orders] ([id], [oderDate], [customerName], [productName], [address], [totalAmount], [payment], [lastUpdateDate], [orderStatus]) VALUES (21, NULL, N'', NULL, N'', 0, NULL, NULL, NULL)
INSERT [dbo].[orders] ([id], [oderDate], [customerName], [productName], [address], [totalAmount], [payment], [lastUpdateDate], [orderStatus]) VALUES (22, NULL, N'', NULL, N'', 398000, NULL, NULL, NULL)
INSERT [dbo].[orders] ([id], [oderDate], [customerName], [productName], [address], [totalAmount], [payment], [lastUpdateDate], [orderStatus]) VALUES (23, NULL, N'', NULL, N'', 398000, NULL, NULL, NULL)
INSERT [dbo].[orders] ([id], [oderDate], [customerName], [productName], [address], [totalAmount], [payment], [lastUpdateDate], [orderStatus]) VALUES (24, NULL, N'', NULL, N'', 597000, NULL, NULL, NULL)
INSERT [dbo].[orders] ([id], [oderDate], [customerName], [productName], [address], [totalAmount], [payment], [lastUpdateDate], [orderStatus]) VALUES (25, NULL, N'', NULL, N'', 422450, NULL, NULL, NULL)
INSERT [dbo].[orders] ([id], [oderDate], [customerName], [productName], [address], [totalAmount], [payment], [lastUpdateDate], [orderStatus]) VALUES (26, NULL, N'', NULL, N'', 1401, NULL, NULL, NULL)
INSERT [dbo].[orders] ([id], [oderDate], [customerName], [productName], [address], [totalAmount], [payment], [lastUpdateDate], [orderStatus]) VALUES (27, NULL, N'', NULL, N'', 1231650, NULL, NULL, NULL)
INSERT [dbo].[orders] ([id], [oderDate], [customerName], [productName], [address], [totalAmount], [payment], [lastUpdateDate], [orderStatus]) VALUES (28, NULL, N'', NULL, N'', 398000, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[orders_detail] ON 

INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (2, 12, 36, 10, 125000, 1250000)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (3, 12, 2, 1, 12, 12)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (4, 12, 9, 123, 12, 1476)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (5, 12, 16, 12, 255000, 3060000)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (6, 12, 31, 12, 444, 5328)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (10, 17, 2, 123, 123, 15129)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (11, 17, 2, 123, 123, 15129)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (12, 18, 2, 124, 412, 51088)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (14, 14, 2, 123000, 321, 39483000)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (16, 15, 2, 123, 123, 15129)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (17, 16, 39, 123, 123, 15129)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (18, 18, 2, 123, 123, 15129)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (19, 12, 2, 125000, 2, 250000)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (20, 20, 2, 125000, 2, 250000)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (21, 20, 10, 125000, 3, 375000)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (23, 21, 11, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (24, 21, 13, 1, 99000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (25, 21, 16, 3, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (26, 21, 11, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (27, 21, 13, 1, 99000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (28, 21, 16, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (29, 21, 10, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (30, 21, 16, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (31, 21, 31, 1, 1250000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (32, 21, 10, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (33, 21, 31, 1, 1250000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (34, 21, 11, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (35, 21, 13, 1, 99000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (36, 22, 11, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (37, 22, 13, 1, 99000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (38, 22, 16, 3, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (39, 22, 11, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (40, 22, 13, 1, 99000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (41, 22, 16, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (42, 22, 10, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (43, 22, 16, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (44, 22, 31, 1, 1250000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (45, 22, 10, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (46, 22, 31, 1, 1250000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (47, 22, 11, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (48, 22, 13, 1, 99000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (49, 22, 11, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (50, 22, 13, 1, 99000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (51, 22, 11, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (52, 22, 13, 1, 99000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (53, 22, 16, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (54, 22, 11, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (55, 22, 13, 1, 99000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (56, 22, 16, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (57, 22, 11, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (58, 22, 14, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (59, 23, 11, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (60, 23, 16, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (61, 24, 10, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (62, 24, 16, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (63, 24, 11, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (64, 25, 11, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (65, 25, 13, 1, 99000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (66, 25, 10, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (67, 26, 31, 1, 1250000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (68, 26, 16, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (69, 26, 10, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (70, 26, 31, 1, 1250000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (71, 26, 16, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (72, 26, 10, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (73, 26, 31, 1, 1250000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (74, 26, 16, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (75, 26, 10, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (76, 27, 31, 3, 1250000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (77, 27, 16, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (78, 27, 31, 3, 1250000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (79, 27, 16, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (80, 28, 10, 1, 199000, NULL)
INSERT [dbo].[orders_detail] ([id], [order_id], [product_id], [quantity], [price], [total]) VALUES (81, 28, 11, 1, 199000, NULL)
SET IDENTITY_INSERT [dbo].[orders_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (2, 3, N'Bánh kem Sữa tươi 001', 199000, N'banh-kem/sua-tuoi-1.jpg', N'Bánh được làm từ sữa tươi với hương vị vani truyền thống, thơm đậm mùi sữa và xốp phồng không bị khô', N'S', N'banh-kem-sua-tuoi-001', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (3, 3, N'Bánh kem Socola 001', 199000, N'banh-kem/socola-1.jpg', N'Bánh socola 001', N'M', N'banh-kem-socola-001', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (4, 5, N'Bánh Bông lan trứng muối 001', 99000, N'custom/bong-lan-trung-muoi-1.jpg', N'Bánh Bông lan trứng muối 001', N'L', N'banh-bong-lan-trung-muoi-001', 1, 2, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (6, 4, N'Bánh Tiramisu 001', 199000, N'tiramisu/1.jpg', N'Bánh Tiramisu 001', N'XXL', N'banh-tiramisu-001', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (8, 4, N'Bánh Tiramisu 002', 199000, N'tiramisu/2.jpg', N'Bánh Tiramisu 002', N'X', N'banh-tiramisu-002', 1, 2, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (9, 3, N'Bánh Kem bắp hình tròn', 199000, N'banh-kem/bap-1.jpg', N'<p>B&aacute;nh Kem bắp h&igrave;nh tr&ograve;n</p>
', N'aow', N'banhkembaphinhtron', NULL, 2, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (10, 3, N'Bánh kem Sữa tươi 002', 199000, N'banh-kem/sua-tuoi-2.jpg', N'Bánh kem Sữa tươi 002', NULL, N'banh-kem-sua-tuoi-002', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (11, 3, N'Bánh kem Socola 002', 199000, N'banh-kem/socola-2.jpg', N'Bánh kem Socola 002', NULL, N'banh-kem-socola-002', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (12, 5, N'Bánh Bông lan trứng muối 002', 99000, N'custom/bong-lan-trung-muoi-2.jpg', N'<p>B&aacute;nh B&ocirc;ng lan trứng muối 002</p>
', NULL, N'banhbonglantrungmuoi002', NULL, 2, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (13, 5, N'Bánh Bông lan trứng muối 003', 99000, N'custom/bong-lan-trung-muoi-3.jpg', N'Bánh Bông lan trứng muối 003', NULL, N'banh-bong-lan-trung-muoi-003', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (14, 3, N'Bánh kem Socola 003', 199000, N'banh-kem/socola-3.jpg', N'Bánh kem Socola 003', NULL, N'banh-kem-socola-003', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (16, 3, N'Bánh kem Bắp 002', 199000, N'banh-kem/bap-2.jpg', N'Bánh kem Bắp 002', NULL, N'banh-kem-bap-002', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (25, 2, N'Bánh cưới 001', 1250000, N'banh-cuoi/1.jpg', N'<p>B&aacute;nh cưới 001</p>
', N'N', N'banhcuoi001', NULL, 2, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (31, 2, N'Bánh cưới 002', 1250000, N'banh-cuoi/2.jpg', N'Bánh cưới 002', NULL, N'banh-cuoi-002', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (33, 2, N'Bánh cưới 003', 1250000, N'banh-cuoi/3.jpg', N'Bánh cưới 003', NULL, N'banh-cuoi-003', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (34, 2, N'Bánh cưới 004', 1250000, N'banh-cuoi/4.jpg', N'Bánh cưới 004', NULL, N'banh-cuoi-004', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (35, 2, N'Bánh cưới 005', 1250000, N'banh-cuoi/5.jpg', N'Bánh cưới 005', NULL, N'banh-cuoi-005', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (36, 1, N'Bánh sinh nhật 001', 259000, N'banh-sinh-nhat/1.jpg', N'Bánh sinh nhật 001', NULL, N'banh-sinh-nhat-001', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (37, 1, N'Bánh sinh nhật 002', 259000, N'banh-sinh-nhat/2.jpg', N'Bánh sinh nhật 002', NULL, N'banh-sinh-nhat-002', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (38, 1, N'Bánh sinh nhật 003', 259000, N'banh-sinh-nhat/3.jpg', N'Bánh sinh nhật 003', NULL, N'banh-sinh-nhat-003', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (39, 1, N'Bánh sinh nhật 004', 259000, N'banh-sinh-nhat/4.jpg', N'Bánh sinh nhật 004', NULL, N'banh-sinh-nhat-004', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (40, 1, N'Bánh sinh nhật 005', 259000, N'banh-sinh-nhat/5.jpg', N'Bánh sinh nhật 005', NULL, N'banh-sinh-nhat-005', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (41, 1, N'Bánh sinh nhật 006', 259000, N'banh-sinh-nhat/6.jpg', N'Bánh sinh nhật 006', NULL, N'banh-sinh-nhat-006', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (45, 3, N'Bánh kem Socola 004', 199000, N'banh-kem/socola-4.jpg', N'Bánh kem Socola 004', NULL, N'banh-kem-socola-004', 1, 1, NULL)
INSERT [dbo].[product] ([id], [categoryid], [name], [price], [img], [description], [size], [meta], [hide], [order], [datebegin]) VALUES (48, 1, N'11', 11, N'logo.png', N'<p>1</p>
', N'1', N'1', NULL, 6, CAST(N'2024-04-16T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[team] ON 

INSERT [dbo].[team] ([id], [name], [job title], [img], [twitter], [facebook], [instagram], [linked in], [email], [phone], [date of birth], [hide], [order]) VALUES (1, N'Lương Gia Hào', N'Expert in Cake Making', N'chef/chef-2.jpg', NULL, N'https://www.facebook.com/hao.gia.988/', NULL, NULL, N'52100022@student.tdtu.edu.vn', NULL, NULL, 1, 1)
INSERT [dbo].[team] ([id], [name], [job title], [img], [twitter], [facebook], [instagram], [linked in], [email], [phone], [date of birth], [hide], [order]) VALUES (2, N'Phạm Long Phụng', N'Expert in Cake Making', N'chef/chef-3.jpg', NULL, N'https://www.facebook.com/profile.php?id=100011574424933', NULL, NULL, N'52100991@student.tdtu.edu.vn', NULL, NULL, 1, 2)
INSERT [dbo].[team] ([id], [name], [job title], [img], [twitter], [facebook], [instagram], [linked in], [email], [phone], [date of birth], [hide], [order]) VALUES (3, N'abc', N'Expert in Cake Making', N'chef/chef-1.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3)
SET IDENTITY_INSERT [dbo].[team] OFF
GO
SET IDENTITY_INSERT [dbo].[voucher] ON 

INSERT [dbo].[voucher] ([id], [name], [datebegin], [hide], [value]) VALUES (1, N'GIAHAO', NULL, NULL, 15)
INSERT [dbo].[voucher] ([id], [name], [datebegin], [hide], [value]) VALUES (2, N'2024', NULL, NULL, 30)
INSERT [dbo].[voucher] ([id], [name], [datebegin], [hide], [value]) VALUES (3, N'FULLOPTION', NULL, NULL, 50)
INSERT [dbo].[voucher] ([id], [name], [datebegin], [hide], [value]) VALUES (4, N'PHUNG', NULL, NULL, 10)
INSERT [dbo].[voucher] ([id], [name], [datebegin], [hide], [value]) VALUES (5, N'VOUCHER', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[voucher] OFF
GO
ALTER TABLE [dbo].[news]  WITH CHECK ADD  CONSTRAINT [FK_news_category_news] FOREIGN KEY([categoryid])
REFERENCES [dbo].[category_news] ([id])
GO
ALTER TABLE [dbo].[news] CHECK CONSTRAINT [FK_news_category_news]
GO
ALTER TABLE [dbo].[news_comments]  WITH CHECK ADD  CONSTRAINT [FK_news_comments_news] FOREIGN KEY([news_id])
REFERENCES [dbo].[news] ([id])
GO
ALTER TABLE [dbo].[news_comments] CHECK CONSTRAINT [FK_news_comments_news]
GO
ALTER TABLE [dbo].[news_comments]  WITH CHECK ADD  CONSTRAINT [FK_news_comments_news_comments] FOREIGN KEY([reply_id])
REFERENCES [dbo].[news_comments] ([id])
GO
ALTER TABLE [dbo].[news_comments] CHECK CONSTRAINT [FK_news_comments_news_comments]
GO
ALTER TABLE [dbo].[orders_detail]  WITH CHECK ADD  CONSTRAINT [FK_orders_detail_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[orders_detail] CHECK CONSTRAINT [FK_orders_detail_orders]
GO
ALTER TABLE [dbo].[orders_detail]  WITH CHECK ADD  CONSTRAINT [FK_orders_detail_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[orders_detail] CHECK CONSTRAINT [FK_orders_detail_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([categoryid])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
USE [master]
GO
ALTER DATABASE [cakeshop] SET  READ_WRITE 
GO
