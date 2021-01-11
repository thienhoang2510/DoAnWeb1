-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th1 11, 2021 lúc 01:12 PM
-- Phiên bản máy phục vụ: 5.7.31
-- Phiên bản PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopgiay_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdondathang`
--

DROP TABLE IF EXISTS `chitietdondathang`;
CREATE TABLE IF NOT EXISTS `chitietdondathang` (
  `MaChiTietDonDatHang` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `GiaBan` int(11) DEFAULT NULL,
  `MaDonDatHang` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `MaSanPham` int(11) NOT NULL,
  PRIMARY KEY (`MaChiTietDonDatHang`),
  KEY `fk_ChiTietDonDatHang_DonDatHang1_idx` (`MaDonDatHang`),
  KEY `fk_ChiTietDonDatHang_SanPham1_idx` (`MaSanPham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietdondathang`
--

INSERT INTO `chitietdondathang` (`MaChiTietDonDatHang`, `SoLuong`, `GiaBan`, `MaDonDatHang`, `MaSanPham`) VALUES
('08012100100', 1, 43800000, '080121001', 80),
('08012100200', 1, 2000000, '080121002', 36),
('08012100201', 1, 16000000, '080121002', 60),
('08101200100', 3, 50000000, '081012001', 11),
('08101200101', 1, 43900000, '081012001', 4),
('08101200102', 3, 7900000, '081012001', 10),
('08101200103', 1, 15000000, '081012001', 9),
('08101200200', 1, 23000000, '081012002', 7),
('08101200300', 2, 7900000, '081012003', 10),
('11012100100', 1, 1499000, '110121001', 35),
('13121200100', 4, 43900000, '131212001', 4),
('13121200200', 1, 37000000, '131212002', 5),
('13121200201', 2, 260000, '131212002', 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dondathang`
--

DROP TABLE IF EXISTS `dondathang`;
CREATE TABLE IF NOT EXISTS `dondathang` (
  `MaDonDatHang` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `NgayLap` datetime DEFAULT NULL,
  `TongThanhTien` int(11) DEFAULT NULL,
  `MaTaiKhoan` int(11) NOT NULL,
  `MaTinhTrang` int(11) NOT NULL,
  PRIMARY KEY (`MaDonDatHang`),
  KEY `fk_DonDatHang_TaiKhoan1_idx` (`MaTaiKhoan`),
  KEY `fk_DonDatHang_TinhTrang1_idx` (`MaTinhTrang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `dondathang`
--

INSERT INTO `dondathang` (`MaDonDatHang`, `NgayLap`, `TongThanhTien`, `MaTaiKhoan`, `MaTinhTrang`) VALUES
('080121001', '2021-01-08 09:04:02', 43800000, 8, 3),
('080121002', '2021-01-08 10:01:53', 18000000, 2, 1),
('081012001', '2019-10-08 00:00:00', 380000, 6, 2),
('081012002', '2019-10-08 00:00:00', 380000, 6, 2),
('081012003', '2019-10-08 00:00:00', 440000, 1, 2),
('110121001', '2021-01-11 09:18:02', 1499000, 2, 1),
('131212001', '2019-12-13 00:00:00', 640000, 6, 1),
('131212002', '2019-12-13 00:00:00', 700000, 6, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangsanxuat`
--

DROP TABLE IF EXISTS `hangsanxuat`;
CREATE TABLE IF NOT EXISTS `hangsanxuat` (
  `MaHangSanXuat` int(11) NOT NULL AUTO_INCREMENT,
  `TenHangSanXuat` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LogoURL` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BiXoa` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`MaHangSanXuat`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hangsanxuat`
--

INSERT INTO `hangsanxuat` (`MaHangSanXuat`, `TenHangSanXuat`, `LogoURL`, `BiXoa`) VALUES
(1, 'Adidas', 'logoadidas.jpg', 0),
(2, 'Balenciaga', 'logobalenciaga.jpg', 0),
(3, 'Vans', 'logovans.jpg', 0),
(4, 'Converse', 'logoconverse', 0),
(5, 'Nike', 'logonike.jpg', 0),
(6, 'Supra', 'logosupra.jpg', 0),
(7, 'Palladium', 'logopalladium.jpg', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

DROP TABLE IF EXISTS `loaisanpham`;
CREATE TABLE IF NOT EXISTS `loaisanpham` (
  `MaLoaiSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiSanPham` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BiXoa` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`MaLoaiSanPham`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`MaLoaiSanPham`, `TenLoaiSanPham`, `BiXoa`) VALUES
(1, 'Đời sống', 0),
(2, 'Thể thao', 0),
(3, 'Bóng đá', 0),
(4, 'Bóng rổ', 0),
(5, 'Chạy bộ', 0),
(6, 'Hàng order', 0),
(7, 'Chỉ bán onlinne', 0),
(8, 'Mới nhập', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaitaikhoan`
--

DROP TABLE IF EXISTS `loaitaikhoan`;
CREATE TABLE IF NOT EXISTS `loaitaikhoan` (
  `MaLoaiTaiKhoan` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiTaiKhoan` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaLoaiTaiKhoan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loaitaikhoan`
--

INSERT INTO `loaitaikhoan` (`MaLoaiTaiKhoan`, `TenLoaiTaiKhoan`) VALUES
(1, 'User'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE IF NOT EXISTS `sanpham` (
  `MaSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `TenSanPham` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HinhURL` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GiaSanPham` int(11) DEFAULT NULL,
  `NgayNhap` datetime DEFAULT NULL,
  `SoLuongTon` int(11) DEFAULT NULL,
  `SoLuongBan` int(11) DEFAULT NULL,
  `SoLuocXem` int(11) DEFAULT NULL,
  `MoTa` text COLLATE utf8_unicode_ci,
  `BiXoa` tinyint(1) DEFAULT '0',
  `MaLoaiSanPham` int(11) NOT NULL,
  `MaHangSanXuat` int(11) NOT NULL,
  PRIMARY KEY (`MaSanPham`),
  KEY `fk_SanPham_LoaiSanPham1_idx` (`MaLoaiSanPham`),
  KEY `fk_SanPham_HangSanXuat1_idx` (`MaHangSanXuat`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MaSanPham`, `TenSanPham`, `HinhURL`, `GiaSanPham`, `NgayNhap`, `SoLuongTon`, `SoLuongBan`, `SoLuocXem`, `MoTa`, `BiXoa`, `MaLoaiSanPham`, `MaHangSanXuat`) VALUES
(4, 'Superstar', 'adidas1.jpg', 2400000, '2021-01-08 00:00:00', 20, 15, 29, 'Có dây buộc\r\nThân giày bằng da\r\nBiểu tượng giày da', 0, 5, 1),
(5, 'Continental 80', 'adidas2.jpg', 2500000, '2019-05-01 00:00:00', 21, 11, 32, 'Ôm vừa\r\nCó dây buộc\r\nThân giày bằng da cật\r\nĐế cupsole bằng cao su phân tách \r\nLớp lót bằng vải thun da cá\r\nLót giày OrthoLite® Đệm đế giữa bằng chất liệu EVA nhẹ\r\nMàu sản phẩm: Cloud White / Scarlet / Collegiate Navy', 0, 5, 1),
(7, 'Ultraboost 20', 'adidas3.jpg', 5000000, '2019-09-12 00:00:00', 25, 2, 9, 'Vừa vặn như đi tất\r\nCó dây buộc\r\nThân giày bằng vải dệt\r\nLớp lót bằng vải dệt\r\nĐế giữa công nghệ Boost\r\nTrọng lượng: 310 g \r\nĐế ngoài công nghệ Stretchweb\r\nMàu sản phẩm: Core Black / Iron Metallic / Football Blue', 0, 5, 1),
(8, 'Untra 4D 5', 'adidas4.jpg', 6000000, '2019-07-03 00:00:00', 30, 0, 9, 'Dáng regular fit\r\nCó dây buộc\r\nThân giày bằng vải dệt\r\nĐế giữa adidas 4D\r\nĐế ngoài bằng cao su Continental™\r\nTrọng lượng: 369 gram \r\nLớp lót bằng vải dệt\r\nMàu sản phẩm: Core Black / Core Black / Carbon', 0, 5, 1),
(9, 'Ultraboost 20 DNA', 'adidas5.jpg', 5000000, '2019-01-01 00:00:00', 24, 6, 20, 'Vừa vặn như đi tất\r\nCó dây buộc\r\nThân giày bằng vải dệt\r\nLớp lót bằng vải dệt\r\nĐế giữa công nghệ Boost\r\nTrọng lượng: 310 g \r\nĐế ngoài công nghệ Stretchweb làm từ cao su Continental™\r\nPrimeblue\r\nMàu sản phẩm: Dash Grey / Silver Metallic / Halo Silver', 0, 7, 1),
(10, 'Fluidstreet', 'adidas6.jpg', 1500000, '2019-08-15 00:00:00', 28, 7, 9, 'Ôm vừa\r\nCó dây buộc\r\nThân giày bằng vải lưới\r\nCảm giác thoáng khí\r\nGiày chạy bộ siêu nhẹ\r\nĐế giữa công nghệ đệm Cloudfoam\r\nĐế ngoài bằng cao su\r\nMàu sản phẩm: Core Black / Cloud White / Core Black', 0, 3, 1),
(11, 'Galaxy 5', 'adidas7.jpg', 1400000, '2019-09-01 00:00:00', 38, 3, 41, 'Ôm vừa\r\nCó dây buộc\r\nThân giày bằng vải lưới\r\nCảm giác nhẹ nhàng\r\nGiày chạy bộ thoáng khí\r\nLót giày OrthoLite® và lớp lót bằng vải dệt\r\nĐế giữa công nghệ đệm Cloudfoam và đế ngoài bằng cao su\r\nMàu sản phẩm: Grey Five / Core Black / Cloud White', 0, 8, 1),
(12, 'Ultraboost Summer.RDY', 'adidas8.jpg', 5000000, '2019-10-02 00:00:00', 20, 0, 2, 'Ôm vừa\r\nCó dây buộc\r\nThân giày bằng vải dệt công nghệ adidas Primeknit\r\nGiày chạy bộ hoàn trả năng lượng\r\nĐế giữa công nghệ Boost đàn hồi\r\nTrọng lượng: 310 g\r\nCông nghệ SUMMER.RDY thoáng khí\r\nMàu sản phẩm: Cloud White / Core Black / Signal Pink', 0, 6, 1),
(13, 'Ultraboost DNA Prime', 'adidas9.jpg', 5000000, '2019-10-04 00:00:00', 10, 2, 15, 'Ôm vừa\r\nCó dây buộc\r\nThân giày bằng vải dệt công nghệ adidas Primeknit\r\nGiày chạy bộ nâng đỡ từ gót đến mũi chân\r\nĐế giữa công nghệ Boost đàn hồi\r\nMàu sản phẩm: Core Black / Cloud White / Core Black', 0, 4, 1),
(14, 'Supernova', 'adidas10.jpg', 2700000, '2019-09-25 00:00:00', 5, 5, 1, 'Ôm vừa\r\nCó dây buộc\r\nThân giày bằng vải lưới\r\nSiêu nhẹ và nâng đỡ\r\nGiày chạy bộ dễ chịu\r\nĐế giữa kết hợp công nghệ Bounce và Boost\r\nTrọng lượng: 315 g\r\nĐế ngoài bằng cao su\r\nĐôi giày này sử dụng công nghệ Primegreen\r\nMàu sản phẩm: Cloud White / Grey Five / Core Black', 0, 3, 1),
(15, '4D Run 1.0 Parley', 'adidas11.jpg', 5500000, '2019-08-27 00:00:00', 19, 3, 3, 'Ôm vừa\r\nCó dây buộc\r\nThân giày bằng vải lưới mono\r\nCảm giác nâng đỡ\r\nGiày chạy bộ đường phố\r\nĐế giữa in lỏng công nghệ adidas 4D\r\nTrọng lượng: 318 g \r\nMàu sản phẩm: Cloud White / Cloud White / Cloud White', 0, 3, 1),
(16, 'Stan Smith', 'adidas12.jpg', 2300000, '2019-07-13 00:00:00', 50, 34, 40, 'Dáng regular fit\r\nCó dây buộc\r\nThân giày bằng chất liệu tổng hợp\r\nLớp lót bằng chất liệu tổng hợp\r\nĐế ngoài bằng cao su\r\nPrimegreen\r\nMàu sản phẩm: Cloud White / Cloud White / Collegiate Navy', 0, 7, 1),
(17, 'Galaxy Run', 'adidas13.jpg', 2000000, '2019-09-15 00:00:00', 60, 44, 45, 'Dáng regular fit\r\nCó dây buộc\r\nThân giày bằng vải lưới co giãn không đường may\r\nCảm giác vững chãi\r\nĐế giữa Bounce\r\nLớp lót bằng vải dệt\r\nĐế ngoài bằng cao su\r\nPrimegreen\r\nMàu sản phẩm: Dash Grey / Cloud White / Solar Red', 0, 5, 1),
(18, 'Rapidarun', 'adidas14.jpg', 1600000, '2019-09-14 00:00:00', 30, 30, 22, 'Ôm vừa\r\nCó dây buộc\r\nThân giày bằng vải dệt kim\r\nLớp lót bằng vải dệt\r\nGiày chạy bộ lót đệm\r\nĐế giữa công nghệ Cloudfoam\r\nĐế ngoài bằng cao su\r\nMàu sản phẩm: Core Black / Cloud White / Cloud White', 0, 4, 1),
(19, 'Ultraboost 5.0 DNA', 'adidas15.jpg', 4200000, '2019-06-12 00:00:00', 19, 13, 25, 'Có dây buộc\r\nThân giày bằng vải dệt công nghệ adidas Primeknit\r\nCảm giác siêu nhẹ, thoáng khí\r\nLớp lót bằng vải dệt\r\nĐế giữa công nghệ Boost\r\nTrọng lượng: 312 g \r\nĐế ngoài công nghệ Stretchweb làm từ cao su Continental™\r\nPrimeblue\r\nMàu sản phẩm: Football Blue / Royal Blue', 0, 7, 1),
(20, 'NMD_R1', 'adidas16.jpg', 3400000, '2019-07-12 00:00:00', 20, 12, 13, 'Có dây buộc\r\nThân giày bằng vải dệt kim\r\nCảm giác ôm sát\r\nLớp lót bằng vải dệt\r\nĐế giữa Boost\r\nĐế ngoài bằng cao su\r\nMàu sản phẩm: Core Black / Silver Metallic / Solar Red', 0, 2, 1),
(21, 'Response Run', 'adidas17.jpg', 1500000, '2019-08-17 00:00:00', 35, 12, 12, 'Có dây buộc\r\nThân giày bằng vải dệt\r\nBền chắc và thoải mái\r\nĐế giữa công nghệ Cloudfoam\r\nLớp lót bằng vải dệt\r\nĐế ngoài bằng cao su\r\nMàu sản phẩm: Core Black / Cloud White / Grey Six', 0, 3, 1),
(22, 'Ultra4D', 'adidas18.jpg', 6000000, '2019-10-05 00:00:00', 24, 28, 30, 'Ôm vừa\r\nCó dây buộc\r\nThân giày bằng vải dệt\r\nGiày chạy bộ hiệu năng phù hợp với mọi điều kiện thời tiết\r\nĐế giữa adidas 4D\r\nĐế ngoài bằng cao su Continental™ cho độ ma sát tuyệt vời trong cả điều kiện thời tiết khô ráo và ẩm ướt.\r\nMàu sản phẩm: Chalk White / Chalk White / Cloud White', 0, 5, 1),
(23, 'Breaknet', 'adidas19.jpg', 1400000, '2019-10-07 00:00:00', 30, 2, 25, 'Có dây buộc\r\nThân giày bằng da tổng hợp\r\nLớp lót bằng vải dệt\r\nLót giày bằng chất liệu EVA\r\nĐế cupsole bằng cao su\r\nMàu sản phẩm: Cloud White / Royal Blue / Vivid Red', 0, 3, 1),
(24, 'Advantage', 'adidas20.jpg', 1700000, '2019-10-08 00:00:00', 39, 2, 10, 'Dáng regular fit\r\nCó dây buộc\r\nThân giày bằng da PU\r\nLớp lót bằng chất liệu tổng hợp\r\n3 Sọc đục lỗ\r\nLót giày Cloudfoam Comfort\r\nĐế cupsole bằng cao su\r\nMàu sản phẩm: Cloud White / Cloud White / Crew Navy', 0, 1, 1),
(25, 'Balenciaga Speed Trainer Black', 'balenciaga21.jpg', 2700000, '2019-09-07 00:00:00', 38, 2, 5, 'Phần upper thiết kế theo kiểu như một chiếc tất\r\nKết hợp 2 loại chất liệu Polyamide, Elastan được trộn với tỉ lệ 8 :2\r\nPhần đế được sử dụng chất liệu cao su tự nhiều', 0, 1, 2),
(26, 'Balenciaga Speed Trainer', 'balenciaga22.jpg', 2700000, '2019-10-07 00:00:00', 20, 12, 30, 'Phần upper thiết kế theo kiểu như một chiếc tất\r\nKết hợp 2 loại chất liệu Polyamide, Elastan được trộn với tỉ lệ 8 :2\r\nPhần đế được sử dụng chất liệu cao su tự nhiều', 0, 3, 2),
(27, 'Balenciaga Track 3.0 black', 'balenciaga23.jpg', 4500000, '2019-10-02 00:00:00', 20, 12, 3, 'Phần upper thiết kế hai lớp đan xen\r\nLớp ngoài được sử dụng chất liệu Polyester 47% , Polyurethane 40%, Nylon 13%\r\nĐôi giày này được Thêu size ở đầu mũi\r\nLogo BB được in nổi ở trước của đế ngoài\r\nLogo balenciaga dập nổi trên lưỡi gà\r\nĐế cao su', 0, 4, 2),
(28, 'Balenciaga Track 3.0 White Orange', 'balenciaga24.jpg', 4500000, '2019-10-01 00:00:00', 10, 1, 3, 'Phần upper thiết kế hai lớp đan xen\r\nLớp ngoài được sử dụng chất liệu Polyester 47% , Polyurethane 40%, Nylon 13%\r\nĐôi giày này được Thêu size ở đầu mũi\r\nLogo BB được in nổi ở trước của đế ngoài\r\nLogo balenciaga dập nổi trên lưỡi gà\r\nĐế cao su', 0, 4, 2),
(29, 'Balenciaga Triple S Allover Logo Black', 'balenciaga25.jpg', 4500000, '2019-09-30 00:00:00', 10, 3, 5, 'Thiết kế hầm hố, phá cách\r\nChất liệu da bền, đẹp\r\nBên trong sử dụng chất liệu vải mềm cực kỳ thoáng khí, giúp đôi chân luôn khô, thoải mái', 0, 2, 2),
(30, 'Balenciaga Triple S Black White Red', 'balenciaga26.jpg', 4500000, '2019-10-01 00:00:00', 4, 2, 2, 'Về tổng quan bên ngoài chúng được thiết kế rất to, và nặng\r\nForm cao, mông cao, chữ thêu BALENCIAGA đều và rất đẹp\r\nPhần upper được sử dụng chất liệu da dê từ thiên nhiên 100%\r\nĐược kết hợp với những lớp lưới nhằm tạo độ thoát khí và điều hòa cho giày.', 0, 1, 2),
(31, 'Balenciaga Triple S Full Black', 'balenciaga27.jpg', 4500000, '2019-10-05 00:00:00', 2, 6, 5, 'Về tổng quan bên ngoài chúng được thiết kế rất to, và nặng\r\nForm giáng đẹp hơn cùng như chữ thiêu đều và đẹp\r\nPhần upper được sử dụng chất liệu da dê từ thiên nhiên 100%\r\nĐược kết hợp với những lớp lưới nhằm tạo độ thoát khí và điều hòa cho giày.', 0, 1, 2),
(32, 'Balenciaga Triple S Clear Full Black', 'balenciaga28.jpg', 4500000, '2019-10-06 00:00:00', 3, 0, 0, 'Thiết kế to, nặng\r\nSử sụng công nghệ đế AIR được tích hợp nhằm giảm tối đa trọng lượng của sản phẩm\r\nPhong cách thiết kế theo kiểu chunky\r\nPhần upper bằng da dê kết hợp với lưới', 0, 1, 2),
(33, 'Balenciaga Speed Trainer Clear Sole', 'balenciaga29.jpg', 2700000, '2019-10-06 00:00:00', 4, 2, 5, 'Phần upper thiết kế theo kiểu như một chiếc tất\r\nKết hợp 2 loại chất liệu Polyamide, Elastan được trộn với tỉ lệ 8 :2\r\nPhần đế được sử dụng chất liệu cao su tự nhiều', 0, 3, 2),
(34, 'Balenciga Triple S Pink Yellow ', 'balenciaga30.jpg', 4500000, '2019-12-04 00:00:00', 5, 5, 7, 'Tổng quan to, nặng\r\nThiết kế hầm hố, phá cách\r\nChất liệu da bền, đẹp\r\nBên trong sử dụng chất liệu vải mềm cực kỳ thoáng khí, giúp đôi chân luôn khô, thoải mái\r\nSự kết hợp giữa màu vàng và màu hồng mang lại cảm giác mềm lại, phá cách cho người dùng\r\n\r\n', 0, 7, 2),
(35, 'Vans Old Skool Classic Black/White', 'vans35.jpg', 1499000, '2021-01-07 20:35:30', 9, 22, 81, 'Kiểu dáng Vans Old Skool cổ thấp cho sự tiện lợi khi mang tháo và linh hoạt khi vận động. Tone đen basic huyền bí tạo cảm giác mạnh mẽ, cho bạn một vẻ ngoài cá tính. Phần upper được làm kết hợp hai chất liệu là Canvas và Suede, cho độ bền bỉ tốt.', 0, 4, 3),
(36, 'Vans UA SK8-Hi Reissue Flame ', 'vans36.jpg', 2000000, '2021-01-07 20:35:30', 9, 22, 43, 'Kiểu dáng chú trọng đến sự thoải mái, phóng khoáng, đi kèm là cổ giày được đệm lớp lót êm ái, mềm mại. Ngoài ra, thiết kế SK8-Hi được tạo bởi phần Upper bằng vải Canvas, nổi bật là hình ảnh ngọn lửa mang đậm dấu ấn của nền văn hóa Punk Rock. Vans Flame SK8-Hi mang tinh thần mạnh mẽ, sắc bén của họa tiết “Flame”.', 0, 4, 3),
(37, 'Vans UA Era MoMA', 'vans37.jpg', 2200000, '2021-01-07 20:35:30', 10, 22, 56, 'BST Vans MoMA Era ra mắt gây ấn tượng với bức tranh “The Scream” mang đậm dấu ấn nghệ thuật. Mẫu giày mang tính biểu tượng với phần Upper Canvas được in toàn bộ bức tranh “The Scream” of Edvard Munch bằng công nghệ hiện đại. Đặc biệt với phối màu hiệu quả làm nổi bật tác phẩm nghệ thuật, cùng với đế cao su bánh quế chống trơn trượt hiệu quả.', 0, 5, 3),
(38, 'Vans UA Old Skool Tiger Floral', 'vans38.jpg', 1750000, '2021-01-07 20:35:30', 5, 5, 99, 'Không phụ lòng mong mỏi của các fan, lần này Vans lại cho ra mắt BST mới với họa tiết Tiger Floral bắt mắt. Sự kết hợp độc đáo của hai họa tiết “Hoa” và “Hổ” tưởng chừng như không liên quan lại làm nên một tổ hợp cực kì ăn ý và hài hòa. Kỹ thuật in Allover với công nghệ hiện đại đã giúp thành quả sáng tạo của các nhà thiết kế đến gần hơn với công chúng.', 0, 7, 3),
(39, 'Vans UA SK8-Hi Racer Edge', 'vans39.jpg', 1850000, '2021-01-07 20:35:30', 8, 4, 6, 'Vans SK8-Hi Racer Edge nổi bật với thiết kế những đường sọc đặc trưng, mô tả sống động biểu tượng của tốc độ bên cạnh là logo thương hiệu thu hút. Vans Racer Edge hỗ trợ cho các tay trượt ván một cách linh hoạt, mạnh mẽ.', 0, 6, 3),
(40, 'Vans UA SK8-Low', 'vans40.jpg', 1650000, '2021-01-07 20:35:30', 6, 7, 78, 'Kiểu dáng Vans SK8-Low cổ thấp cho sự tiện lợi khi mang tháo và linh hoạt khi vận động. Màu sắc Egret nhẹ nhàng, tinh tế cho tạo cảm giác dễ chịu cho người nhìn. Chất liệu kết hợp giữa vải Canvas và Suede cho độ bền chắc cao. Mặt đế Waffle truyền thống tạo độ bám, tăng ma sát giúp chống trơn trượt tốt.', 0, 4, 3),
(41, 'Vans UA Old Skool 36 Factory Skulls', 'vans41.jpg', 2200000, '2021-01-07 20:35:30', 6, 4, 101, 'Vans Old Skool 36 DX Anaheim Factory Skulls lột xác với thiết kế họa tiết đầu lâu xương chéo đầy mới lạ, phần đế trắng ngà cổ điển đồng bộ với màu sắc của thân giày tạo điểm nhấn “ăn tiền” cho thiết kế. Form dáng Old Skool cứng cáp trẻ trung, lớp đệm lót OrthoLite tạo độ êm ái thoải mái cho đôi bàn chân', 0, 5, 3),
(42, 'Vans UA SK8-Hi Ouroboros', 'vans42.jpg', 2500000, '2021-01-07 20:35:30', 12, 10, 133, 'Kiểu dáng Vans SK8-Hi Ouroboros cổ cao trẻ trung kết hợp cùng họa tiết OUROBOROS biểu trưng được bố trí bên hông thân giày tạo điểm nhấn ấn tượng cho dòng sản phẩm. Upper sử dụng chất liệu vải dệt thoáng khí tạo độ êm ái cho đôi chân khi vận động', 0, 23, 3),
(43, 'Vans UA Era Ouroboros', 'vans43.jpg', 2000000, '2021-01-07 20:35:30', 12, 7, 115, 'Vans Era Ouroboros là một bức tranh được đầu từ kỹ lưỡng khi sử dụng hình tượng OUROBOROS - một trong những biểu tượng linh thiêng của người Ai Cập cổ đại nhằm mang đến những trải nghiệm mới lạ. Kiểu dáng Era cổ điển càng làm tăng thêm độ Cool cho thiết kế.', 0, 21, 3),
(44, 'Vans Kids\' Old Skool ', 'vans44.jpg', 1000000, '2021-01-07 20:35:30', 6, 22, 221, 'Sử dụng chất liệu vải Canvas, thiết kế ôm gọn đôi bàn giúp bé mang giày một cách thoải mái nhất', 0, 14, 3),
(45, 'Vans Sport Suede', 'vans45.jpg', 1650000, '2021-01-07 20:35:30', 10, 13, 134, 'Suede Vans Sport với kiểu dáng đậm chất Retro của những năm 90 kết hợp cùng chất liệu da lộn mềm mại giúp bạn có được sản phẩm chất lượng và thời trang. Điểm nhấn của sản phẩm nằm ở tem logo lưỡi gà và dải Flying-V bên hông thân giày cùng tone màu trắng đen Basic dễ phối đồ.', 0, 5, 3),
(46, 'Vans BMX Era', 'vans46.jpg', 1450000, '2021-01-07 20:35:30', 6, 13, 118, 'Vans BMX Era nổi bật với đường viền Foxing đỏ khi kết hợp cùng tông màu xanh Navy của sản phẩm. Các icon “nút Like” cũng được biến tấu hài hòa hơn khi được đồng bộ với thân giày. Điểm nhấn tiếp theo là họa tiết Checker được bố trí hợp lý ở hai bên thân giày.', 0, 44, 3),
(47, 'Vans Sport Suede ', 'vans47.jpg', 1850000, '2021-01-07 20:35:30', 43, 34, 322, 'Vans Sport Suede với thiết kế Retro lấy cảm hứng từ những năm 90 kết hợp cùng tone màu trắng giúp bạn có được item lạ mắt. Chất liệu da lộn cao cấp cùng điểm nhấn nằm ở bên hông thân giày và lưỡi gà, mọi outfit dường như sẽ đặc biệt hơn khi mix với item này.', 0, 43, 3),
(48, 'Vans Slip On Checkerboard', 'vans48.jpg', 1850000, '2021-01-07 20:35:30', 22, 15, 155, 'Vans Slip-On Checkerboard Anaheim Factory với thiết kế với kiểu dáng slip - on quen thuộc kết hợp cùng họa tiết caro trắng đen kinh điển tạo điểm nhấn nổi bật. Nội thất bên trong thân giày được trang bị đệm lót OrthoLite® với nhiều lỗ thoáng khí tạo độ ẩm giúp đôi chân luôn được thoải mái.', 0, 1, 3),
(49, 'Vans UA Era National Geographic', 'vans49.jpg', 2200000, '2021-01-07 20:35:30', 6, 22, 43, 'Vans x National Geographic Era được bao phủ toàn bộ upper là các mẫu cover tiêu biểu của tạp chí NatGeo trong suốt hơn 130 năm qua. Đôi giày không chỉ đẹp mà còn mang tới trải nghiệm thoải mái, êm ái cho người mang nhờ chất liệu vải canvas mềm mịn và bộ đệm lót classic đàn hồi cao, chịu lực tốt.', 0, 4, 3),
(50, 'Vans x MoMA UA ComfyCush Old Skool', 'vans50.jpg', 1850000, '2021-01-07 20:35:30', 10, 22, 79, 'Vans x MoMA ComfyCush Old Skool là sản phẩm kết hợp của hãng giày Vans và Viện Bảo tàng Nghệ thuật Hiện đại (MoMA), mang đến sự đột phá trong thiết kế bên ngoài cũng như kết cấu bên trong. Chất liệu upper làm từ vải textile với họa tiết Checkerboard được biến tấu màu sắc độc đáo. Công nghệ ComfyCush hiện đại giúp giảm thiểu trọng lượng và đem lại cảm giác êm ái, nhẹ nhàng khi mang.', 0, 3, 3),
(51, 'Converse 1970s Black Ice', 'converse51.jpg', 2200000, '2021-01-07 20:35:30', 10, 22, 43, 'Mẫu giày Converse Black Ice Chuck 70 với thiết kế các chi tiết Translucent đầy ấn tượng cùng phối màu Earth Tone siêu sang và phong cách Color-popped đầy tươi mới sẽ cho bạn những trải nghiệm thật thú vị khi có thể xuống phố với một diện mạo đầy lôi cuốn.', 0, 4, 4),
(52, 'Converse Go Gold SL', 'converse52.jpg', 1850000, '2021-01-07 20:35:30', 10, 5, 55, 'BST Converse Go Gold SL dễ dàng gây sự chú ý và tò mò với những chi tiết mạ ánh vàng cực kì bắt mắt. Thêm vào đó là chất liệu da Synthetic cao cấp chắc chắn sẽ làm hài lòng những ai khó tính nhất. Một đôi giày cực sành điệu và cá tính với vẻ ngoài sang trọng như thế này, các nàng hẳn là không thể bỏ qua.', 0, 5, 4),
(53, 'Converse 1970s Mi Gente', 'converse53.jpg', 2200000, '2021-01-07 20:35:30', 10, 4, 43, 'BST Converse Mi Gente được tạo nên bởi những nữ thiết kế gia gốc Latin tài năng mang đến cho công chúng một làn gió lạ với phong cách đậm chất bản địa. Kết tinh từ những nét độc đáo của nền văn hóa Latin, đôi giày khiến cho mọi người phải chú ý và không khỏi ngỡ ngàng trước vẻ đẹp và sự cuốn hút không thể chối từ.', 0, 4, 4),
(54, 'Converse 1970s Rivals', 'converse54.jpg', 1850000, '2021-01-07 20:35:30', 10, 5, 78, 'Converse Chuck 70 Rivals với thiết kế vô cùng ấn tượng, sử dụng kết hợp hai tone màu đối lập là đen và trắng ngà trên phần thân giày được phân chia thành bốn mảng theo hai trục, từ đó tạo nên vẻ ngoài vô cùng cân xứng, hài hòa. Một sự trở lại không thể tuyệt vời hơn với phong cách mạnh mẽ thể hiện đẳng cấp xứng đáng.', 0, 3, 4),
(55, 'Converse Seasonal Color', 'converse55.jpg', 1650000, '2021-01-07 20:35:30', 10, 13, 99, 'Converse Seasonal Color đã trở lại với phiên bản Farro cực bắt mắt. Kế thừa những đặc điểm vốn có của dòng Classic, nay những mẫu giày Seasonal không chỉ thật thời thượng mà còn cho bạn vẻ ngoài bắt trend như mong muốn. Cùng đôi giày sống-ảo cực chất check-in qua từng địa điểm ưa thích nhé!', 0, 3, 4),
(56, 'Converse Digital Daze', 'converse56.jpg', 1850000, '2021-01-07 20:35:30', 6, 5, 78, 'BST Converse Chuck Taylor All Star Digital Daze với hình in da cá sấu sống động, đầy cá tính. Hình ảnh flock print (kỹ thuật tạo ra bề mặt nhung cho hình in) da cá sấu hấp dẫn thị giác được phối hài hòa với tông màu trắng ngà phân bổ trên những bộ phận còn lại của giày tạo cảm giác mẫu thiết kế cao cấp hơn rất nhiều.', 0, 4, 4),
(57, 'Converse Digital Daze', 'converse57.jpg', 1850000, '2021-01-07 20:35:30', 10, 4, 78, 'Nâng tầm mô hình Low-top của BST Digital Daze là sự đối lập giữa hai gam màu Black\\Egret tinh tế, không chỉ giúp lưỡi gà nổi bật mà hai bên hông upper màu trắng Egret còn đồng bộ với dây xỏ giày và đế giữa cao su đặc trưng. Họa tiết vân cá sấu với công nghệ kỹ thuật số hiện đại được ứng dụng trên phiên bản cổ thấp xuất hiện duy nhất trên lưỡi gà, cùng những chi tiết trên thiết kế thiết kế đặc trưng nhà Converse vẫn trường tồn mãi với thời gian.', 0, 4, 4),
(58, 'Converse Chuck Taylor All Star 1970s', 'converse58.jpg', 20000000, '2021-01-07 20:35:30', 10, 22, 55, 'Mẫu giày Converse Chuck 70 ALT Exploration lấy cảm hứng từ những chuyến đi khám phá, với gam màu Midnight Navy cho bạn vẻ ngoài thật thời trang, cá tính. Kết hợp các lớp overlays được làm từ chất liệu ripstop poly chống chịu thời tiết tốt, phủ gam màu cam Magma cực hiện đại. Bạn sẽ không nỡ chối từ một thiết kế vừa sáng tạo, độc đáo, lại thể hiện tính di sản của dòng giày 1970s kinh điển.', 0, 4, 4),
(59, 'Converse All Star Digital Daze', 'converse59.jpg', 16000000, '2021-01-02 18:24:47', 5, 4, 34, 'BST Converse Chuck Taylor All Star Digital Daze với hình in da cá sấu sống động, đầy cá tính. Hình ảnh flock print (kỹ thuật tạo ra bề mặt nhung cho hình in) da cá sấu hấp dẫn thị giác được phối hài hòa với tông màu trắng ngà phân bổ trên những bộ phận còn lại của giày tạo cảm giác mẫu thiết kế cao cấp hơn rất nhiều.', 0, 4, 4),
(60, 'Converse  All Star Hi-Vis ', 'converse60.jpg', 16000000, '2021-01-02 18:27:33', 11, 44, 22, 'Thiết kế mới lạ và độc đáo trong mẫu giày Converse Chuck Taylor All Star Hi-Vis sẽ khiến các fan bất ngờ. Ứng dụng các panel phản quang bên hông thân giày với chất liệu đặc biệt, kèm theo là hai sọc màu neon song song phân định rõ ranh giới với phần vải thông thường, đôi giày sẽ giúp bạn chiếm trọn spotlight ở mọi lúc, mọi nơi.', 0, 4, 4),
(61, 'Converse All Star 1970s Black Ice', 'converse61.jpg', 2100000, '2021-01-02 18:29:43', 33, 33, 44, 'Mẫu giày Converse Black Ice Chuck 70 với thiết kế các chi tiết Translucent đầy ấn tượng cùng phối màu Earth Tone siêu sang và phong cách Color-popped đầy tươi mới sẽ cho bạn những trải nghiệm thật thú vị khi có thể xuống phố với một diện mạo đầy lôi cuốn.', 0, 4, 4),
(62, 'Converse  All Star Go Gold SL ', 'converse62.jpg', 16000000, '2021-01-02 18:31:31', 22, 33, 44, 'BST Converse Go Gold SL dễ dàng gây sự chú ý và tò mò với những chi tiết mạ ánh vàng cực kì bắt mắt. Thêm vào đó là chất liệu da Synthetic cao cấp chắc chắn sẽ làm hài lòng những ai khó tính nhất. Một đôi giày cực sành điệu và cá tính với vẻ ngoài sang trọng như thế này, các nàng hẳn là không thể bỏ qua.', 0, 4, 4),
(63, 'Converse All Star Seasonal Color', 'converse64.jpg', 1400000, '2021-01-02 18:32:07', 22, 33, 44, 'Converse Seasonal Color đã trở lại với phiên bản Saffron Yellow cực bắt mắt. Kế thừa những đặc điểm vốn có của dòng Classic, nay những mẫu giày Seasonal không chỉ thật thời thượng mà còn cho bạn vẻ ngoài bắt trend như mong muốn. Cùng đôi giày sống-ảo cực chất check-in qua từng địa điểm ưa thích nhé!', 0, 4, 4),
(64, 'Converse  All Star 1970s Mi Gente', 'converse64.jpg', 1900000, '2021-01-02 18:33:01', 22, 33, 44, 'BST Converse Mi Gente được tạo nên bởi những nữ thiết kế gia gốc Latin tài năng mang đến cho công chúng một làn gió lạ với phong cách đậm chất bản địa. Kết tinh từ những nét độc đáo của nền văn hóa Latin, đôi giày khiến cho mọi người phải chú ý và không khỏi ngỡ ngàng trước vẻ đẹp và sự cuốn hút không thể chối từ.', 0, 4, 4),
(65, 'Converse All Star 1970s Renew', 'converse65.jpg', 2100000, '2021-01-02 18:34:08', 33, 33, 44, 'Đặc sắc hơn cùng phiên bản Converse 1970s Renew với những tone màu vô cùng bắt mắt và hiện đại. Được làm từ tổ hợp chất liệu tái chế nhưng vẫn thật bền bỉ và cuốn hút, BST giúp nhà Converse truyền đi thông điệp về một lối sống xanh, giảm thiểu rác thải để tương lai chúng ta được tốt đẹp hơn.\r\n', 0, 4, 4),
(66, 'Converse CPX Utility', 'converse66.jpg', 3000000, '2021-01-02 18:35:00', 22, 33, 44, 'Thiết kế lấy cảm hứng từ những đôi Chelsea Boots cổ điển, kết hợp cùng phong cách thời trang bóng rổ những năm 90, tạo nên một mẫu giày đẹp đến từng centimet. Ứng dụng đa dạng chất liệu, Converse CPX Utility là một tổ hợp của các chi tiết được kết nối bằng những đường may gia công tỉ mỉ, mang lại cho bạn những trải nghiệm tuyệt vời nhất.', 0, 4, 4),
(67, 'Converse All Star 1970s Popped Color', 'converse67.jpg', 1900000, '2021-01-02 18:35:44', 22, 33, 44, 'Converse đã trở lại với thiết kế ghép nối, xếp chồng tape ở đế giày cực kì cuốn hút trong BST Converse Popped Color có phối màu vô cùng ngọt ngào. Không những vậy, nhà sản xuất còn đem vào những gì tinh hoa nhất của dòng giày Chuck 70s cho đôi giày thêm phần êm ái và bền bỉ.', 0, 4, 4),
(68, 'LeBron Witness 4 EP', 'nike40.jpg', 42000000, '2021-01-02 16:32:37', 10, 36, 50, 'Trở thành một lực lượng trên sân trong LeBron Witness 4: một sự phù hợp tuyệt vời cho những người chơi mạnh mẽ, những người muốn hỗ trợ mắt cá chân tốt từ một đôi giày vẫn cảm thấy nhẹ. Được chế tạo lâu dài để chơi trên sân ngoài trời, cổ áo được điêu khắc, có đệm và bộ đếm gót bên ngoài mang lại cảm giác vừa vặn ổn định, đồng thời các bộ đệm có thể nhìn thấy dưới bàn chân trước sẽ trả lại năng lượng cho mỗi bước đi.', 0, 5, 5),
(69, 'Nike Phantom GT Elite Dynamic Fit FG', 'nike41.jpg', 50000000, '2021-01-02 16:34:58', 13, 2, 50, 'Nike Phantom GT Elite Dynamic Fit FG là một thiết kế theo hướng dữ liệu được thiết kế để tấn công chính xác. Cấu trúc Flyknit được bao phủ bởi một kết cấu mượt mà để cảm ứng tốt hơn, trong khi lực kéo chuyên dụng cho phép bạn kiểm soát trò chơi. Cổ áo co giãn tạo cảm giác an toàn để bạn có thể tập trung vào động tác chân của mình', 0, 5, 5),
(70, 'Nike Phantom GT Academy MG', 'nike42.jpg', 20000000, '2021-01-02 16:36:11', 10, 10, 10, 'Nike Phantom GT Academy MG được thiết kế để có độ chính xác mạnh mẽ. Viền ngoài trung tâm cung cấp một vùng tấn công sạch sẽ cho các cú đá tập trung, trong khi một đường vân nổi trong suốt giúp tạo độ xoáy tối ưu để kiểm soát đường bay của bóng.', 0, 5, 5),
(71, 'Nike Mercurial Superfly 7 Elite FG', 'nike43.jpg', 8000000, '2021-01-02 16:36:56', 10, 4, 154, 'Dựa trên cải tiến 360 của chiếc 6, Nike Mercurial Superfly 7 Elite FG Boot bổ sung thêm vùng Nike Aerowtrac cho bàn chân trước và khung cứng hơn một chút để giúp tăng cường lực kéo.', 0, 5, 5),
(72, 'Nike Phantom Scorpion Academy Dynamic Fit MG', 'nike44.jpg', 3000000, '2021-01-02 16:37:46', 10, 10, 10, 'Mở khóa kỹ năng của bạn trong Nike Phantom Scorpion Academy Dynamic Fit MG. Thiết kế thông tin dữ liệu được chế tạo để có khả năng chạm và bám đường chính xác trên nhiều bề mặt khác nhau. Các chi tiết về con bọ cạp được lấy cảm hứng từ chiến dịch quảng cáo \'Secret Tournament\' của Nike có sự góp mặt của 24 ngôi sao bóng đá toàn cầu.\r\n', 0, 5, 5),
(73, 'Nike Mercurial Vapor 13 Club MG', 'nike45.jpg', 1000000, '2021-01-02 16:38:19', 5, 12, 30, 'Nike Mercurial Vapor 13 Club MG ôm gọn bàn chân của bạn để có tốc độ hợp lý. Một tấm nền đa năng cung cấp lực kéo trên bề mặt cỏ tự nhiên và nhân tạo.\r\n', 0, 5, 5),
(74, 'Nike Mercurial Vapor 13 Academy Neymar Jr. TF', 'nike46.jpg', 15000000, '2021-01-02 16:39:00', 12, 12, 55, 'Phần trên mềm của Nike Mercurial Vapor 13 Academy Neymar Jr. TF ôm gọn bàn chân của bạn để tạo cảm giác vừa vặn với làn da thứ hai, trong khi đế ngoài bằng cao su giúp tăng lực kéo siêu tích điện trên sân cỏ nhân tạo.\r\n', 0, 5, 5),
(75, 'Nike Mercurial Vapor 13 Academy MDS TF', 'nike47.jpg', 16000000, '2021-01-02 16:39:47', 20, 30, 30, 'Hãy mơ về tốc độ và lối chơi nhanh trong Nike Mercurial Vapor 13 Academy MDS TF. Phần trên mềm mại ôm gọn bàn chân của bạn để tạo cảm giác vừa vặn với làn da thứ hai, trong khi đế cao su giúp tăng lực kéo siêu tốc trên sân cỏ.\r\n', 0, 5, 5),
(76, 'Nike Mercurial Vapor 13 Academy MDS IC', 'nike48.jpg', 20000000, '2021-01-02 16:40:21', 13, 13, 30, 'Hãy mơ về tốc độ và chơi bóng nhanh với Nike Mercurial Vapor 13 Academy MDS IC. Phần trên mềm mại ôm gọn bàn chân của bạn để tạo cảm giác vừa vặn với lớp da thứ hai, trong khi đế ngoài bằng cao su giúp tăng cường lực kéo trên sân hoặc đường phố.', 0, 5, 5),
(77, 'Nike Tiempo Legend 8 Academy TF', 'nike49.jpg', 24000000, '2021-01-02 16:41:16', 50, 45, 50, 'Nike Tiempo Legend 8 Academy TF lấy cảm giác huyền thoại của da bê và thêm đế ngoài bằng cao su dẻo để tạo lực kéo đa hướng.\r\n', 0, 5, 5),
(78, 'Nike Phantom Vision 2 Academy Dynamic Fit MG', 'nike50.jpg', 2000000, '2021-01-02 16:41:50', 30, 30, 30, 'Nike Phantom Vision 2 Academy Dynamic Fit MG mang đến một cấp độ mới về độ chính xác khốc liệt trên sân cỏ. Một ống tay áo bên trong ôm chân được giấu trong NIKESKIN phía trên để tạo ra một chiếc ủng cho những người hoàn thiện, những người cung cấp và những chiến binh của trò chơi ngày nay.\r\n', 0, 5, 5),
(79, 'Nike Air Max 1', 'nike51.jpg', 5000000, '2021-01-02 16:47:00', 20, 20, 133, 'Nike Air Max 1 khởi động lại thiết kế huyền thoại đã trị vì tối cao kể từ năm 1987. Kết hợp giữa thời trang đường phố với thể thao, nó sử dụng cùng một lớp đệm nhẹ và hình dáng cổ điển của OG và táo bạo làm lại nó với các vật liệu tận dụng, màu sắc tươi và đường khâu lộ ra ngoài.\r\n', 0, 5, 5),
(80, 'Nike Blazer Mid \'77 Vintage', 'nike52.jpg', 43800000, '2021-01-02 17:58:51', 123, 123, 1213, 'Nike Air Max 1 khởi động lại thiết kế huyền thoại đã trị vì tối cao kể từ năm 1987. Kết hợp giữa thời trang đường phố với thể thao, nó sử dụng cùng một lớp đệm nhẹ và hình dáng cổ điển của OG và táo bạo làm lại nó với các vật liệu tận dụng, màu sắc tươi và đường khâu lộ ra ngoài.\r\n', 0, 5, 5),
(81, 'Nike Air Force 1 Crater', 'nike53.jpg', 35800000, '2021-01-02 18:00:14', 4, 4, 1212, 'Đôi giày thể thao đã giúp xác định phong cách đường phố được tái tưởng tượng với Crater Foam, trọng lượng với ít nhất 20% vật liệu tái chế. Đế giữa của Crater Foam siêu mềm được làm từ hỗn hợp không gian của khoảng 11% vật liệu bọt và cao su Nike Grind. Với đế ngoài lốm đốm được làm từ 15% cao su Nike Grind, mỗi đôi Nike Air Force 1 Crater đều độc đáo và bền bỉ.\r\n', 0, 5, 5),
(82, 'Nike Air VaporMax 2020 Flyknit', 'nike54.jpg', 59800000, '2021-01-02 18:00:53', 20, 3, 42, 'Được thiết kế với tính bền vững, Nike Air VaporMax 2020 Flyknit được làm từ ít nhất 50% thành phần tái chế theo trọng lượng. Là một phần trong hành trình của Nike nhằm giảm tác động của chúng tôi, chúng tôi đang khám phá những cách mới để sử dụng tốt chất thải của mình. Bằng cách sử dụng các vật liệu còn sót lại, polyester tái chế, bọt tái chế và Nike Air-Sole làm từ ít nhất 75% TPU tái chế, VaporMax 2020 Flyknit đánh dấu bước tiếp theo hướng tới mục tiêu cuối cùng của chúng tôi là không carbon và không chất thải.\r\n', 0, 5, 5),
(83, 'Nike Blazer Mid \'77 Infinite', 'nike55.jpg', 35800000, '2021-01-02 18:01:29', 3, 32, 322, 'Nike Blazer Mid \'77 Infinite củng cố biểu tượng trường học cũ, quả bóng b-ball đã trở thành vật dụng phổ biến trên đường phố. Các chi tiết cao su bền ở ngón chân, gót chân và bên hông cho phép bạn mang nó đến nơi bạn muốn, ngày này qua ngày khác, trong khi đường ống và logo Swoosh bị bóp méo tạo thêm nét hiện đại.', 0, 5, 5),
(84, 'Nike Air Force 1 \'07 Craft', 'nike56.jpg', 39800000, '2021-01-02 18:02:18', 5, 22, 222, 'Sự rạng rỡ tồn tại trong Nike Air Force 1 \'07 Craft, quả bóng rổ OG mang đến một sự thay đổi mới mẻ về những gì bạn biết rõ nhất: chất liệu da sắc nét, màu sắc đậm và lượng đèn flash hoàn hảo giúp bạn tỏa sáng.\r\n', 0, 5, 5),
(85, 'Nike Challenger OG', 'nike57.jpg', 27800000, '2021-01-02 18:03:02', 23, 23, 44, 'Nike Challenger OG mang đến vẻ ngoài giống như bạn vừa bước ra khỏi đường đua sau một buổi tập khó khăn với Steve Prefontaine. Huyền thoại này kết hợp với da lộn mềm mại, phối màu gần như 1-1 với thiết kế ban đầu và lưới thoáng khí. Nhìn vào bảng điều khiển gót chân và bạn sẽ tìm thấy một thẻ nhãn, giống như những nhãn được tìm thấy trong DNA giày dép những năm 70 của chúng tôi. Lớp đệm sang trọng xung quanh mắt cá chân kết hợp với đế giữa có kiểu dáng đẹp, đàn hồi để biến nó trở thành người tạo xu hướng thoải mái — viên kim cương từ lòng đất\r\n', 0, 5, 5),
(86, 'Nike Air Force 1 \'07 LV8', 'nike58.jpg', 33000000, '2021-01-02 18:03:36', 31, 31, 313, 'Nike Air Force 1 \'07 LV8 kết hợp các tính năng hiệu suất lấy cảm hứng từ vòng cổ tương tự của \'82 OG trong khi nó được cập nhật các chi tiết đã được sử dụng trong các kho lưu trữ trước đây của chúng tôi. Bạn sẽ nhận thấy hệ thống ghi nhãn màu xanh lam trên  gót chân được lấy từ phong cách OG cũng như lớp phủ bên dưới màu vàng đậm tạo nên nét cổ điển chân thực.\r\n', 0, 5, 5),
(87, 'Nike Air Max 95', 'nike59.jpg', 51800000, '2021-01-02 18:04:11', 16, 10, 300, 'Lấy cảm hứng từ cơ thể con người và DNA chạy, Nike Air Max 95 kết hợp sự thoải mái đến khó tin với phong cách quay đầu. Các mặt bên mang tính biểu tượng thể hiện cơ bắp và có màu sắc sặc sỡ khác nhau giữa các đôi giày. Nike Air có thể nhìn thấy ở gót chân và bàn chân trước đệm cho mỗi bước đi của bạn.\r\n', 0, 5, 5),
(88, 'Palladium Pallabrouse Baggy', 'palla88.jpg', 1850000, '2021-01-07 20:35:30', 6, 13, 78, 'Một đôi giày đậm chất đường phố với phần cổ giày cao có thể lật xuống tạo ra hai cách mang giày khác nhau. Bạn có thể mang giày với một kiểu cổ cao trơn nhẵn, hoặc lật xuống để lộ ra logo Palladium được may giấu vào bên trong.', 0, 7, 7),
(89, 'Palladium Pampa Hi Change', 'palla89.jpg', 2300000, '2021-01-07 20:35:30', 44, 21, 121, 'BST Pampa Hi Change với thông điệp sống tích cực tin tưởng vào “Một ngày mai tươi sáng” cùng thiết kế hướng về môi trường với chất liệu tái chế. Điểm đặc biệt của BST chính là các patch logo trang trí có thể tháo rời để bạn tự do custom theo ý thích của mình.', 0, 7, 7),
(90, 'Palladium Blanc Hi ', 'palla90.jpg', 2500000, '2021-01-07 20:35:30', 23, 4, 221, 'Palladium Blanc Hi với thiết kế đơn giản cùng tone màu xám cá tính, logo phần lưỡi gà được may gia công chi tiết đến từng đường kim mũi chỉ. Phần thân giày sử dụng chất liệu vải Textile cao cấp khiến bạn cảm thấy thoải mái trong từng bước đi.', 0, 7, 7),
(91, 'Palladium Pampalicious Starlight Blue', 'palla91.jpg', 2350000, '2021-01-07 20:35:30', 56, 43, 234, 'Với kiến thức về chất liệu trong công nghiệp chế tạo bánh xe máy bay, đã tạo nên những chiếc đế bền bỉ, kết hợp với cách thiết kế độc đáo, dễ dàng phối hợp nhiều loại trang phục, giá bán lại hợp lý, đáp ứng mọi yêu cầu từ các bạn trẻ.', 0, 7, 7),
(92, 'Palladium Pampa Ox', 'palla92.jpg', 2100000, '2021-01-07 20:35:30', 32, 5, 53, 'Với kiến thức về chất liệu trong công nghiệp chế tạo bánh xe máy bay, đã tạo nên những chiếc đế bền bỉ, kết hợp với cách thiết kế độc đáo, dễ dàng phối hợp nhiều loại trang phục, giá bán lại hợp lý, đáp ứng mọi yêu cầu từ các bạn trẻ.', 0, 7, 7),
(94, 'Supra Breaker', 'supra94.jpg', 2200000, '2021-01-07 20:35:30', 12, 22, 78, 'Thiết kế cổ cao hiện đại được cải tiến nâng cấp tối ưu về mặt kiểu dáng. Thân giày được làm từ da lộn và da Pu mềm mại giúp cho đôi chân luôn được thoải mái. Nội thất bên trong là bộ đệm SUPRAFOAM êm nhẹ độc quyền, iconic hình vương miệng mang ý nghĩa biểu tượng được phố trí ở lưỡi gà, dây đai, phía sau thân giày tạo điểm nhấn nổi bật cho dòng sản phẩm.', 0, 6, 6),
(95, 'Supra Lizard', 'supra95.jpg', 2200000, '2021-01-07 20:35:30', 23, 44, 234, 'Tông màu xanh kết hợp với các chi tiết được nhấn nhá bằng màu đỏ nổi bật xung quanh đế giày cũng như ở phía sau gót giày. Toàn bộ phần thân trước của giày được làm từ chất liệu da lộn với các lỗ thoáng khí nhỏ để bạn cảm nhận được sự thông thoáng, êm ái từ bên trong.', 0, 6, 6),
(96, 'abc', NULL, 1000, '2021-01-11 02:52:10', 1, NULL, NULL, '2', 1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
CREATE TABLE IF NOT EXISTS `taikhoan` (
  `MaTaiKhoan` int(11) NOT NULL AUTO_INCREMENT,
  `TenDangNhap` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MatKhau` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TenHienThi` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DiaChi` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DienThoai` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BiXoa` tinyint(1) DEFAULT '0',
  `MaLoaiTaiKhoan` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `changepass` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaTaiKhoan`),
  KEY `fk_TaiKhoan_LoaiTaiKhoan_idx` (`MaLoaiTaiKhoan`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`MaTaiKhoan`, `TenDangNhap`, `MatKhau`, `TenHienThi`, `DiaChi`, `DienThoai`, `Email`, `BiXoa`, `MaLoaiTaiKhoan`, `code`, `changepass`) VALUES
(2, 'admin', 'admin', 'Quản trị', 'Smartphone Store', '0909123456', 'admin@smartphonestore.vn', 0, 2, NULL, NULL),
(8, 'anhkiet', '1', 'Giang', 'deqwewq', '0355286781', 'giangkiet.a1@gmail.com', 0, 1, NULL, NULL),
(9, 'anhkiet2', '1', 'Giang', '5a/5 Tran Phu', '', 'giangkiet.a1@gmail.com', 0, 1, 'TZng3yjV7l', NULL),
(10, 'anhkiet3', '1', 'Giang', 'deqwewq', '', 'giangkiet.a1@gmail.com', 0, 1, 'PM1u5cB7Pr', NULL),
(11, 'anhkiet4', '1', 'Giang', 'deqwewq', '', 'giangkiet.a1@gmail.com', 0, 1, 'ywh1QzdLrQ', NULL),
(12, 'anhkiet5', '1', 'Giang', 'deqwewq', '', 'giangkiet.a1@gmail.com', 0, 1, 'l4LH0cVk3U', NULL),
(13, 'anhkiet6', '1', 'Giang', 'deqwewq', '', 'giangkiet.a1@gmail.com', 0, 1, 'D6shVjPyuj', NULL),
(14, 'anhkiet7', '1', 'Giang', 'deqwewq', '', 'giangkiet.a1@gmail.com', 0, 1, 'giK5QwMClB', NULL),
(15, 'anhkiet8', '1', 'Giang', 'deqwewq', '', 'giangkiet.a1@gmail.com', 0, 1, 'TzHdPi1JHd', NULL),
(16, 'anhkiet9', '1', 'Giang', 'deqwewq', '', 'giangkiet.a1@gmail.com', 0, 1, 'ZlYiCgWAaI', NULL),
(17, 'anhkiet10', '1', 'Giang', 'deqwewq', '', 'giangkiet.a1@gmail.com', 0, 1, 'rODUJulDwv', NULL),
(18, 'anhkiet11', '1', 'Giang', 'deqwewq', '', 'giangkiet.a1@gmail.com', 0, 1, 'YPvKrvC46H', NULL),
(19, 'anhkiet12', '1', 'Giang', 'deqwewq', '', 'giangkiet.a1@gmail.com', 0, 1, 'U0qPji7aG0', NULL),
(20, 'anhkiet1111', '1', 'Giang', 'deqwewq', '0355286781', 'giangkiet.a1@gmail.com', 0, 1, 'UzDIo9UR9v', NULL),
(21, 'anhkiet1112', '1', 'Giang', 'deqwewq', '0355286781', 'giangkiet.a1@gmail.com', 0, 1, 'YzRDt7WugH', NULL),
(22, 'anhkiet1122', '1', 'Giang', 'deqwewq', '', 'giangkiet.a1@gmail.com', 0, 1, 'Mc1e2jun3R', NULL),
(23, 'anhkiet1133', '1', 'Giang', 'deqwewq', '0355286781', 'giangkiet.a1@gmail.com', 0, 1, NULL, NULL),
(24, 'anhkiet1123', '1', 'Giang', 'deqwewq', '0355286781', 'giangkiet.a1@gmail.com', 0, 1, NULL, NULL),
(25, 'anhkiet32', '1', 'Giang', 'deqwewq', '0355286781', 'giangkiet.a1@gmail.com', 0, 1, 'f3GE6RdgQz', NULL),
(26, 'grinfs', '1', '123', '123', '0355286781', 'giangkiet.a1@gmail.com', 0, 1, NULL, NULL),
(27, 'anhkiet22', '1', 'Giang', 'deqwewq', '0355286781', 'giangkiet.a1@gmail.com', 0, 1, NULL, NULL),
(28, 'anhkiet33', '1', 'Giang', 'deqwewq', '0355286781', 'giangkiet.a1@gmail.com', 0, 1, NULL, NULL),
(29, 'anhkiet44', '1', 'Giang', 'deqwewq', '0355286781', 'giangkiet.a1@gmail.com', 0, 1, NULL, NULL),
(30, 'anhkiet41', '123', 'Giang', 'deqwewq', '0355286781', 'giangkiet.a1@gmail.com', 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tinhtrang`
--

DROP TABLE IF EXISTS `tinhtrang`;
CREATE TABLE IF NOT EXISTS `tinhtrang` (
  `MaTinhTrang` int(11) NOT NULL AUTO_INCREMENT,
  `TenTinhTrang` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaTinhTrang`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tinhtrang`
--

INSERT INTO `tinhtrang` (`MaTinhTrang`, `TenTinhTrang`) VALUES
(1, 'Đặt hàng'),
(2, 'Đang giao hàng'),
(3, 'Thanh toán'),
(4, 'Hủy');

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitietdondathang`
--
ALTER TABLE `chitietdondathang`
  ADD CONSTRAINT `fk_ChiTietDonDatHang_DonDatHang1` FOREIGN KEY (`MaDonDatHang`) REFERENCES `dondathang` (`MaDonDatHang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ChiTietDonDatHang_SanPham1` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
