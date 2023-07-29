create database DUAN;
 
 use DUAN;
 go


CREATE TABLE ACCOUNT(
	 USERNAME NVARCHAR(50) NOT NULL
	 CONSTRAINT PK_USERNAME PRIMARY KEY(USERNAME)
	,GMAIL NVARCHAR(50)
	,PASSWORD NVARCHAR(50) 
	,ROLE NVARCHAR(50) 
);
GO

INSERT INTO ACCOUNT VALUES('admin','witchspringeirudy@gmail.com','123456','quanly');
INSERT INTO ACCOUNT VALUES('maihang','maithihang@gmail.com','123456','nhanvien');
INSERT INTO ACCOUNT VALUES('giakhiem','titaniaratsu@gmail.com','123456','nhanvien');

GO
 create table nhanvien(
	id int identity(1,1) primary key,
	ten nvarchar(100),
	sdt nvarchar(11),
	diachi nvarchar(200),
	gioitinh bit,
	luong int,
	pass nvarchar(50)
 )
 go

 select * from nhanvien
 where sdt = '0987654321' and pass = '12345Ab';
 
 create table khachhang(
	id int identity(1,1) primary key,
	ten nvarchar(100),
	sdt nvarchar(11),
	gioitinh bit,
	diemthuong int
 )

 go 

 create table loaihang(
	id int identity(1,1) primary key,
	loaihang nvarchar(100)
 )

 go

 create table sanpham(
	id int identity(1,1) primary key,
	ten nvarchar(100),
	gia int,
	dvt nvarchar(50),
	soluong int,
	mota nvarchar(300),
	idLoai int,
	constraint fk_sanpham foreign key(idLoai) references loaihang(id)
)

 go

 go

 create table khohang(
	id int identity(1,1) primary key,
	idLoai int,
	tenSP nvarchar(200),
	soluong int,
	constraint fk_khohang foreign key(idLoai) references loaihang(id)
 )

 go

 create table khuyenmai(
	id int identity(1,1) primary key,
	ten nvarchar(50),
	mota nvarchar(300),
	ngayBD date,
	ngayKT date,
	donvigiam int
 )
 go
 
 create table hoadon(
	id int identity(1,1) primary key,
	idKH int, 
	idNV int,
	idKM int,
	diemthuong int,
	ngaylap date,
	constraint fk_hoadon_KH foreign key(idKH) references khachhang(id),
	constraint fk_hoadon_NV foreign key(idNV) references nhanvien(id),
	constraint fk_hoadon_KM foreign key(idKM) references khuyenmai(id)
 )
 
  go
  
 create table hoadonchitiet(
	id int identity(1,1) primary key,
	idHD int,
	idSP int,
	soluong int,
	constraint fk_hdct_HD foreign key(idHD) references hoadon(id),
	constraint fk_hdct_SP foreign key(idSP) references sanpham(id)
 )

 go

 go
 insert into nhanvien values
 (N'Trần Gia Khiêm', '0987654321', N'Quận Gò Vấp, TPHCM', '1', 2000000, '12345Ab'),
 (N'Trần Bá Hộp', '0983276541', N'Ngã tư An Sương, Quận 12, TPHCM', '1', 2580000, '12345Ab'),
 (N'Cao Văn Khải', '0329876541', N'Bà Điểm, Huyện Hóc Môn, TPHCM', '1', 3200000, '12345Ab');

 go
 select * from nhanvien
  insert into khachhang values
  (N'Nguyễn Thái Duy Khang', '0338550709', '1', 0),
  (N'Nguyễn Thị Như Ý', '0358270841', '0', 0),
  (N'Bùi Thị Thanh Thúy', '0977351712', '0', 0),
  (N'Nguyễn Trường Hải', '0397216838', '1', 0),
  (N'Lê Tú Anh', '0339233933', '0', 0),
  (N'Cao Xuân Trường', '0385725452', '1', 0),
  (N'Cao Ngọc Quý', '0393232539', '1', 0),
  (N'Lê Văn Khải Định', '0773206813', '1', 0),
  (N'Trần Huyền Ly', '0866614308', '0', 0),
  (N'Lê Thanh Hương', '0335303913', '0', 0),
  (N'Nguyễn Thị Thùy Dung', '0961233419', '0', 0),
  (N'Lâm Chí Tường', '0948487550', '1', 0),
  (N'Lê Thị Thu Thảo', '0369188099', '0', 0),
  (N'Hoàng Ánh Nguyệt', '0369849973', '0', 0),
  (N'Lê Thị Nguyệt Hằng', '0931316292', '0', 0),
  (N'Nguyễn Phương Anh', '0931841111', '0', 0),
  (N'Cao Thị Huyền Trang', '0768479615', '0', 0),
  (N'Trần Đức Kiên', '0389947092', '1', 0),
  (N'Nguyễn Trung Hiếu', '0399259832', '1', 0),
  (N'Ngô Ngọc Khánh', '0767427395', '1', 0);
  go

  insert into loaihang values
  (N'Mĩ phẩm'),
  (N'Nước giải khát'),
  (N'Gia vị'),
  (N'Thực phẩm chay'),
  (N'Thực phẩm chế biến sẵn'),
  (N'Đồ ăn nhanh'),
  (N'Các loại bánh kẹo'),
  (N'Thực phẩm đóng hộp'),
  (N'Đồ dùng cá nhân'),
  (N'Dụng cụ bếp'),
  (N'Thực phẩm sữa');
  select * from loaihang

  go

   insert into sanpham values
   (N'Kem chống nắng', 158000,N'Tuýp', 2,N'Sản phẩm dùng cho da dầu và hỗn hợp', 1),
   (N'Toner', 250000,N'Lọ', 1,N'Sản phẩm dùng cho da nhạy cảm', 1),
   (N'Kem nền', 580000,N'Lọ', 33,N'Sản phẩm dùng chống bám nước, lâu trôi', 1),
   (N'Eyesliner', 100000,N'Cây', 27,N'Sản phẩm không lem, trôi, thích hợp cho mọi lứa tuổi', 1),
   (N'Nước tẩy trang', 375000,N'Chai', 19,N'Sản phẩm không chứa cồn, dùng cho da nhạy cảm', 1),
   (N'Sting', 12000,N'Lon', 24,N'Bật năng lượng, sống bứt phá', 2),
   (N'Number1', 11500,N'Lon', 24,N'Thức tỉnh mọi năng lượng', 2),
   (N'Milk tea', 30000,N'Chai', 15,N'Đậm vị trà từ Thái Nguyên', 2),
   (N'Tăng lực 247', 15800,N'Chai', 24,N'Bổ sung thêm Vitamin và các chất cần thiết cho cơ thể', 2),
   (N'Nước khoáng Lavi', 5000,N'Chai', 10,N'Nước khoáng nguyên chất 100%', 2),
   (N'Nước mắm cá cơm', 58000,N'Chai 1 lít', 7,N'Nước mắm nguyên chất từ những con cá cơm tươi ngon', 3),
   (N'Tương ớt Chinsu', 15800,N'Chai 0.5kg', 44,N'Bùng nổ vị cay', 3),
   (N'Dầu ăn đậu nành', 85000,N'Chai 1 lít', 23,N'Được chắt lọc từ 100% hạt đậu nành, không tạp chất', 3),
   (N'Đường cát Thọ Xuân', 25000,N'Kilogram', 23,N'Sản phẩm được làm thủ công từ 100% mía tươi', 3),
   (N'Hạt nêm Ajinomoto', 112000,N'Kilogram', 12,N'Sản phẩm dùng cho da dầu và hỗn hợp', 3),
   (N'Mỳ tôm chay', 3500,N'Chai', 20,N'Sản phẩm dùng cho người ăn chay', 4),
   (N'Nước mắm chay', 55000,N'Chai', 11,N'Sản phẩm dùng cho người ăn chay', 4),
   (N'Đậu hũ ky', 20000,N'Kilogram', 2,N'Sản phẩm dùng cho người ăn chay', 4),
   (N'Xúc xích giả mặn', 58000,N'Túi', 50,N'Sản phẩm dùng cho người ăn chay', 4),
   (N'Giò lụa giả mặn', 98000,N'Túi', 50,N'Sản phẩm dùng cho người ăn chay', 4),
   (N'Cá biển', 45000,N'Hộp', 28,N'Cá tươi không ướp đá hoặc chất làm tươi', 5),
   (N'Thịt bò', 350000,N'Hộp', 12,N'Bò Mỹ nhập khẩu', 5),
   (N'Thịt heo', 155000,N'Hộp', 45,N'Heo sạch nhà làm', 5),
   (N'Thịt gà', 109000,N'Hộp', 30,N'Gà ta không sử dụng chất tây rửa', 5),
   (N'Tôm', 280000,N'Hộp', 10,N'Tôm biển tươi Nha Trang', 5),
   (N'Mì trộn', 15800,N'Hộp', 23,N'Mì ăn liền', 6),
   (N'Tokbokki', 45000,N'Hộp', 75,N'Tokbokki phô mai kéo sợi', 6),
   (N'Cơm tam giác (cơm nắm)', 16800,N'Gói', 35,N'Cơm cá ngừ', 6),
   (N'Bánh mì tươi', 15800,N'Gói', 24,N'Bánh mì tươi nguyên chất', 6),
   (N'Snack phô mai', 10000,N'Gói', 27,N'Bổ sung chất cần thiết sau một ngày dài', 6),
   (N'Kẹo dẻo', 22000,N'Gói', 62,N'Kựo dẻo vị dâu chua chua ngọt ngọt', 7),
   (N'Bánh gạo An', 218000,N'Gói', 9,N'Bổ sung thêm chất cần thiết mỗi ngày', 7),
   (N'Kẹo Oishi thập cẩm', 10500,N'Gói', 11,N'Kẹo oishi thập cẩm với nhiều vị khác nhau', 7),
   (N'Kẹo chupachup', 34400,N'Gói', 35,N'Kẹo chupachup gắn kết tình bạn', 7),
   (N'Bánh đồng tiền', 45800,N'Gói', 66,N'Bánh đồng tiền, hương vị Việt', 7),
   (N'Cá ngừ hộp', 15000,N'Hộp', 39,N'Đồ ăn đóng hộp tiện lợi, không chất bảo quản', 8),
   (N'Pates', 88000,N'Hộp', 64,N'Pates bò đóng hộp, không chất phụ gia', 8),
   (N'Thịt bò đóng hộp', 100000,N'Hộp', 75,N'Bò Úc đóng hộp', 8),
   (N'Kim chi muối', 15800,N'Hộp', 24,N'Kim chi muối cải thảo', 8),
   (N'Xúc xích đóng hộp', 58000,N'Hộp', 46,N'Xíc xích đóng hộp, không chất phụ gia', 8),
   (N'Băng vệ sinh Sensi Cool', 45000,N'Túi', 35,N'Khử mùi và luôn khô thoáng', 9),
   (N'Bông tẩy trang', 32000,N'Túi', 75,N'Sợi bông mảnh, chất liệu dai', 9),
   (N'Khăn giấy', 22000,N'Túi', 24,N'Sản phẩm giấy tiện lợi', 9),
   (N'Kẹp tóc kiểu Hàn', 15000,N'Cái', 72,N'Giúp mái tóc chị em luôn xinh', 9),
   (N'Sữa tắm LifeBuoy', 183000,N'Chai', 11,N'Sữa tắm diệt khuẩn, bảo vệ gia đình bạn', 9),
   (N'Nồi cơm điện', 550000,N'Cái', 10,N'Nấu cơm nhanh chỉ với 10 phút', 10),
   (N'Ấm siêu tốc', 190000,N'Cái', 53,N'Nấu nước siêu nhanh, giữ nhiệt siêu tốt', 10),
   (N'Chảo chống dính', 430000,N'Cái', 16,N'Thách thức mọi món ăn', 10),
   (N'Bếp điện từ', 980000,N'Cái', 22,N'Bếp điện từ, sử dụng tiết kiệm điện', 10),
   (N'Dao', 30000,N'Cái', 61,N'Sắt bén từng milimet', 10),
   (N'Sữa chua Vinamilk', 158000,N'Lốc', 53,N'Sữa chua có đường', 11),
   (N'Sữa TH true milk', 158000,N'Hộp', 22,N'Sữa tươi có đường, bổ sung Vitamin', 11),
   (N'Sữa đậu nành', 158000,N'Hộp', 63,N'Sữa tươi có đường được làm từ đậu nành tươi, bổ sung Vitamin', 11),
   (N'Bơ lạt', 158000,N'Hộp', 44,N'Sản phẩm được làm từ sữa dùng cho mọi bữa ăn', 11);

   select * from sanpham
   go

   select id, sdt, pass from nhanvien where sdt = ? and pass = ?;