use master
go

create database QuanLyGiangVienDeTai
go

use QuanLyGiangVienDeTai
go

create table GIANGVIEN(
  MAGV nvarchar(20) primary key,
  TENGV nvarchar(100) not null,
  LINHVUCNGHIENCUU nvarchar(250), 
  SODIENTHOAI nvarchar(50)
)
go

create table DETAI(
 MADT nvarchar(20) primary key,
 TENDT nvarchar(100) not null,
 NAMDANGKY int,
 MOTADETAI nvarchar(250),
 MAGV nvarchar(20) references GIANGVIEN(MAGV) on delete cascade on update cascade
)
go

insert into GIANGVIEN values(N'GV0001',N'Nguyễn Bùi Thanh Hòa', N'Lĩnh vực về Khoa học cơ bản', '0909123456')
insert into GIANGVIEN values(N'GV0002',N'Hồ Huỳnh Thùy An', N'Lĩnh vực về Công nghệ thông tin', '0918456894')
insert into GIANGVIEN values(N'GV0003',N'Lê Hoàng Hóa', N'Lĩnh vực về Kỹ thuật phần mềm', '0988345576')
insert into GIANGVIEN values(N'GV0004',N'Trần Bảo Châu', N'Lĩnh vực về Hệ thống thông tin', '0914324578')
insert into GIANGVIEN values(N'GV0005',N'Nguyễn Lê Giao', N'Lĩnh vực về Khoa học máy tính', '0978123453')
insert into GIANGVIEN values(N'GV0006',N'Hoàng Thị Ngọc Ánh', N'Điện tử công nghiệp', '0988765434')
go

insert into DETAI values(N'DT0001',N'Tìm hiểu Mikrotik Router',2016, N'Tìm hiểu Mikrotik Router và xây dựng Demo hệ thống Hotspot Gateway cho dịch vụ Internet LAN Wifi có chứng thực trình bày các nội dung về các khái quát về công nghệ Wireless LAN',N'GV0002')
insert into DETAI values(N'DT0002',N'Xây dựng website thương mại điện tử',2015, N'Thiết kế và xây dựng website thương mại điện tử cho công ty X',N'gV0004')
insert into DETAI values(N'DT0003',N'Xây dựng hệ thống quản lý hệ thống siêu thị Coop Mart',2015, N'Nhiệm vụ của đề tài là trình bày, phân tích và thiết kế phần mềm về tổ chức siêu thị, xác định mô hình hoạt động, xác định hiện trạng và phạm vi của hệ thống.',N'GV0003')
insert into DETAI values(N'DT0004',N'Xây dựng phần mềm quản lý nhân sự, tiền lương',2015, N'Phân tích, thiết kế, xây dựng phần mềm quản lý nhân sự, tiền lương cho công ty Y',N'GV0004')
insert into DETAI values(N'DT0005',N'Xây dựng ứng dụng quản lý thư viện',2015, N'Phân tích, thiết kế, xây dựng phần mềm quản lý thư viện cho trường cao đẳng N',N'GV0004')




