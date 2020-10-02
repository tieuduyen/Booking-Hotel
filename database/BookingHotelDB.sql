-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 30, 2020 lúc 04:25 AM
-- Phiên bản máy phục vụ: 10.4.13-MariaDB
-- Phiên bản PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bookinghotel`
--
CREATE DATABASE IF NOT EXISTS `bookinghotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bookinghotel`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `advantages`
--

CREATE TABLE `advantages` (
  `advantagesid` int(11) NOT NULL,
  `advantages_images` varchar(50) DEFAULT NULL,
  `advantages_text` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `advantages`
--

INSERT INTO `advantages` (`advantagesid`, `advantages_images`, `advantages_text`) VALUES
(1, 'check.png', 'Khách thực, đánh giá thực'),
(2, 'card.png', 'Phương thức thanh toán an toàn và linh hoạt'),
(3, 'chat.png', 'Hỗ trợ khách hàng 24/7'),
(4, 'deal.png', 'Giá rẻ mỗi ngày với ưu đãi đặc biệt dành riêng cho ứng dụng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking`
--

CREATE TABLE `booking` (
  `BookingID` int(11) NOT NULL,
  `BookingDate` date DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `CreditCardID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `booking`
--

INSERT INTO `booking` (`BookingID`, `BookingDate`, `Amount`, `CreditCardID`, `UserID`) VALUES
(1, '2020-09-10', 2000000, 1, 1),
(2, '2019-05-05', 4000000, 1, 1),
(3, '2020-06-10', 1000000, 1, 1),
(4, '2018-06-30', 8000000, 1, 1),
(5, '2020-08-30', 8000000, 1, 1),
(6, '2020-08-30', 8000000, 1, 1),
(7, '2020-08-30', 8000000, 1, 1),
(8, '2020-08-30', 8000000, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bookingdetails`
--

CREATE TABLE `bookingdetails` (
  `BookingDetailsID` int(11) NOT NULL,
  `NumberOfPeople` int(11) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `CheckInDate` date DEFAULT NULL,
  `CheckOutDate` date DEFAULT NULL,
  `BookingID` int(11) DEFAULT NULL,
  `RoomID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bookingdetails`
--

INSERT INTO `bookingdetails` (`BookingDetailsID`, `NumberOfPeople`, `Price`, `CheckInDate`, `CheckOutDate`, `BookingID`, `RoomID`) VALUES
(1, 2, 300000, '2020-09-07', '2020-09-09', 1, 1),
(2, 3, 400000, '2020-09-07', '2020-09-09', 1, 2),
(3, 4, 500000, '2020-09-07', '2020-09-09', 1, 3),
(4, 1, 200000, '2016-09-07', '2020-09-09', 1, 4),
(5, 2, 200000, '2016-09-07', '2020-09-09', 5, 5),
(6, 5, 200000, '2016-09-07', '2020-09-09', 6, 6),
(7, 6, 200000, '2016-09-07', '2020-09-09', 7, 2),
(8, 2, 200000, '2016-09-07', '2020-09-09', 8, 4),
(9, 2, 200000, '2016-09-07', '2020-09-09', 8, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `city`
--

CREATE TABLE `city` (
  `CityID` int(11) NOT NULL,
  `CityName` varchar(50) DEFAULT NULL,
  `CityImages` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `city`
--

INSERT INTO `city` (`CityID`, `CityName`, `CityImages`) VALUES
(1, 'Hà Nội', 'ha_noi.jpg'),
(2, 'Hải Phòng', 'hai_phong.jpg'),
(3, 'Quảng Ninh', 'quang_ninh.jpg'),
(4, 'Huế', 'hue.jpg'),
(5, 'Đà Nẵng', 'da_nang.jpg'),
(6, 'Nha Trang', 'nha_trang.jpg'),
(7, 'Vũng Tàu', 'vung_tau.jpg'),
(8, 'Hồ Chí Minh', 'ho_chi_minh.jpg'),
(9, 'Cà Mau', 'ca_mau.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `CommentID` int(11) NOT NULL,
  `CommentDate` date DEFAULT NULL,
  `Rate` double DEFAULT NULL,
  `Content` varchar(255) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `HotelID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`CommentID`, `CommentDate`, `Rate`, `Content`, `UserID`, `HotelID`) VALUES
(1, '2020-09-10', 5, 'Good', 2, 1),
(2, '2020-09-10', 5, 'Good', 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `creditcard`
--

CREATE TABLE `creditcard` (
  `CreditCardID` int(11) NOT NULL,
  `CreditCardType` varchar(50) DEFAULT NULL,
  `CreditCardNumber` varchar(19) DEFAULT NULL,
  `CardholdersName` varchar(30) DEFAULT NULL,
  `ExpirationDate` date DEFAULT NULL,
  `Surplus` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `creditcard`
--

INSERT INTO `creditcard` (`CreditCardID`, `CreditCardType`, `CreditCardNumber`, `CardholdersName`, `ExpirationDate`, `Surplus`) VALUES
(1, 'Visa', '1111-2222-3333-4444', 'Phạm Văn Trực', '2020-12-30', 40000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hotel`
--

CREATE TABLE `hotel` (
  `HotelID` int(11) NOT NULL,
  `HotelName` varchar(50) DEFAULT NULL,
  `HotelPhone` varchar(13) DEFAULT NULL,
  `HotelEmail` varchar(50) DEFAULT NULL,
  `HotelImages` varchar(50) DEFAULT NULL,
  `HotelAddress` varchar(255) DEFAULT NULL,
  `Promotion` varchar(50) DEFAULT NULL,
  `Introduction` longtext DEFAULT NULL,
  `Evaluate` double DEFAULT NULL,
  `RateID` int(11) DEFAULT NULL,
  `CityID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `hotel`
--

INSERT INTO `hotel` (`HotelID`, `HotelName`, `HotelPhone`, `HotelEmail`, `HotelImages`, `HotelAddress`, `Promotion`, `Introduction`, `Evaluate`, `RateID`, `CityID`) VALUES
(1, 'HACINCO HOTEL', '02438574040', 'info@hacincohotel.com', 'hachico_hotel.jpg', '110 phố Thái Thịnh, Đống Đa, Hà Nội', '0', 'Toạ lạc tại trung tâm Quận Đống Đa, một trong những trung tâm tài chính – kinh tế lớn của thủ đô Hà Nội, Khách sạn Hacinco ngay từ thời điểm khai trương (tháng 11 năm 1999) đã trở thành sự lựa chọn của du khách trong nước và quốc tế. Với 140 phòng nghỉ tiêu chuẩn quốc tế 3 sao, hệ thống dịch vụ tiện nghi hiện đại, phong cách phục vụ chu đáo và chuyên nghiệp, khách sạn Hacinco đã thực sự mang đến cho du khách cảm giác dễ chịu, thân tình và thoải mái như đang ở chính ngôi nhà của mình.', 9.5, 4, 1),
(2, 'GREEN HOTEL', '02432252683', 'achau.cec@gmail.com', 'green_hotel.jpg', 'Số 5/72, Phố Tôn Thất Tùng, Đống Đa, Hà Nội', '0', 'Tọa lạc ở thành phố Đà Nẵng, Green Hotel Da Nang có nhà hàng, hồ bơi ngoài trời, quán bar và sảnh khách chung. Khách sạn 3 sao này có khu vườn và phòng nghỉ gắn máy điều hòa với WiFi miễn phí cùng phòng tắm riêng. Chỗ nghỉ cũng cung cấp dịch vụ lễ tân 24 giờ, dịch vụ phòng và dịch vụ thu đổi ngoại tệ cho khách.', 10, 5, 1),
(3, 'Khách sạn Golden Star', '02363919168', 'info@goldenstarhoteldn.com', 'golden_star.jpg', 'Võ Giáp Nguyễn, Phường Khuê Mỹ, Ngũ Hành Sơn, Đà Nẵng', '0', 'Golden Star Hotel tọa lạc gần trung tâm thành phố Đà Nẵng và cách Sân bay Quốc tế Đà Nẵng chỉ 3 km. Nơi nghỉ tọa lạc ở một vị trí thuận tiện trong bán kính chỉ 5 phút đi bộ từ Bãi biển Mỹ Khê. Tại đây có nhà hàng trong khuôn viên phục vụ các món ăn quốc tế và Việt Nam, cũng như đáp ứng các yêu cầu ăn uống tại phòng 24 giờ.', 8.7, 4, 5),
(4, 'Furama Resort Đà Nẵng', '0511 3847333', 'reservation@furamavietnam.com', 'furama_resort.jpeg', '110 phố Thái Thịnh, Đống Đa, Hà Nội', '0', 'Kỳ nghỉ sang trọng tại Furama Resort Danang sẽ mở đầu hành trình của du khách tới các di sản được UNESCO công nhận như Kinh thành Huế, cách resort 2 giờ lái xe. Các tiện nghi đẳng cấp thế giới như hồ bơi nước ngọt, spa và 4 lựa chọn ăn uống đang chờ đón du khách tại resort này.', 8, 5, 1),
(5, 'Khách sạn Khải Hoàn', '08 39756420', 'info@khaihoanapartments.com.vn', 'khai_hoan.jpg', '624 Lạc Long Quân, P 5, Quận 11, Hồ Chí Minh', '0', 'Phòng nghỉ tại Khải Hoàn Hotel được bố trí khu vực ghế ngồi. Phòng tắm chung được trang bị chậu rửa vệ sinh (bidet), máy sấy tóc và đồ vệ sinh cá nhân miễn phí. Các phòng còn có bàn làm việc, TV màn hình phẳng và phòng tắm riêng.', 9, 3, 8),
(6, 'Havana HotelL', '058 3889999', 'info@havanahotel.vn', 'havana.jpg', '38 Trần Phú St, phường Lộc Thọ, Nha Trang', '0', 'Khách Sạn Havana Nha Trang là một trong 140 khách sạn hạng sang của tập đoàn Best Western. Đây là tổ hợp khách sạn cao nhất và có quy mô lớn nhất tại Nha Trang với 41 tầng và trên 1200 phòng hướng biển.', 10, 4, 6),
(7, 'Hotel Nikko Hai Phong', '0225 3265 66', 'reservation@hotelnikkohaiphong.com.vn', 'hotel_nikko.jpg', 'No. 1, Road. 1, Waterfront City, Vinh Niem Ward, Le Chan District, Hai Phong City,', '0', 'Hotel Nikko Hai Phong tọa lạc tại thành phố Hải Phòng, cách Nhà hát thành phố 4,5 km. Chỗ nghỉ có trung tâm thể dục, quầy bar và tầm nhìn ra sông. Các tiện nghi của chỗ nghỉ bao gồm nhà hàng, dịch vụ lễ tân 24 giờ, dịch vụ phòng và WiFi miễn phí.', 9.8, 4, 2),
(8, 'Halios Hotel Halong', '058 3889999', 'info@havanahotel.vn', 'halios_hotel.webp', '38 Nguyen Du, Hạ Long, Việt Nam ', '0', 'Tọa lạc tại thành phố Hạ Long, cách trung tâm thương mại Vincom Plaza Hạ Long 1,2 km, Halios Hotel Halong cung cấp chỗ nghỉ với nhà hàng, chỗ đỗ xe riêng miễn phí, xe đạp cho khách sử dụng miễn phí và quầy bar. Khách sạn 3 sao này có sảnh khách chung cũng như phòng nghỉ gắn máy điều hòa đi kèm WiFi miễn phí và phòng tắm riêng. Chỗ nghỉ cũng cung cấp dịch vụ lễ tân 24 giờ và dịch vụ phòng cho khách.', 8.7, 3, 3),
(9, 'Moonlight Hotel Hue', '0225 3265 66', 'info@havanahotel.vn', 'moonlight_hotel.jpg', '20 Phạm Ngũ Lão, Thành phố Huế, Huế', '0', 'Tọa lạc tại trung tâm Thành phố Huế, nằm trong bán kính chỉ 5 phút lái xe từ Chợ Đông Ba nổi tiếng, Moonlight Hotel Hue có hồ bơi trong nhà riêng. Các phòng hiện đại tại đây được trang trí nội thất tuyệt đẹp và có truy cập Wi-Fi miễn phí.', 7.9, 5, 4),
(10, 'Sun Beach Hote', '0225 3265 66', 'info@havanahotel.vn', 'sun_beach.webp', ' i1 Thái Văn Lung, phường 2, thành phố Vũng Tàu, Bà Rịa Vũng Tàu', '0', 'Sun Beach Hôtel ở thành phố Cotonou này có hồ bơi trong nhà và nhà hàng. Quý khách có thể truy cập Wi-Fi miễn phí.', 9.4, 5, 7),
(11, ' Muong Thanh Luxury Ca Mau Hotel ', '0225 3265 66', 'info@havanahotel.vn', 'luxury.jpg', 'Lot C03A, Ca Mau Administrative and Political Center Zone, Cà Mau', '0', 'Khách sạn Mường Thanh Luxury Cà Mau – một trong những khách sạn cao cấp hàng đầu khu vực Đồng Bằng sông Cửu Long, tọa lạc tại Khu trung tâm hành chính – chính trị thành phố Cà Mau. Khách sạn là điểm dừng chân lý tưởng cho những chuyến du lịch hay công tác với vị trí thuận tiện để tiếp cận trung tâm thành phố và những điểm du lịch đặc trưng của vùng.', 10, 4, 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rate`
--

CREATE TABLE `rate` (
  `RateID` int(11) NOT NULL,
  `TypeRate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `rate`
--

INSERT INTO `rate` (`RateID`, `TypeRate`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room`
--

CREATE TABLE `room` (
  `RoomID` int(11) NOT NULL,
  `RoomTypeID` int(11) DEFAULT NULL,
  `RoomName` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `room`
--

INSERT INTO `room` (`RoomID`, `RoomTypeID`, `RoomName`) VALUES
(1, 1, '105'),
(2, 1, '106'),
(3, 2, '205'),
(4, 3, '212'),
(5, 4, '303'),
(6, 1, '307'),
(7, 2, '703'),
(8, 3, '703'),
(9, 4, '503'),
(10, 1, '703');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roomtype`
--

CREATE TABLE `roomtype` (
  `RoomTypeID` int(11) NOT NULL,
  `RoomTypeName` varchar(50) DEFAULT NULL,
  `Descriptions` varchar(50) DEFAULT NULL,
  `Size` varchar(20) DEFAULT NULL,
  `RoomImages` varchar(50) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `HotelID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `roomtype`
--

INSERT INTO `roomtype` (`RoomTypeID`, `RoomTypeName`, `Descriptions`, `Size`, `RoomImages`, `Price`, `Quantity`, `HotelID`) VALUES
(1, 'STANDARD', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'hachico_standard.jpg', 500000, 99, 1),
(2, 'SUPERIOR', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'hachico_superior.jpg', 600000, 99, 1),
(3, 'DELUXE', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'hachico_deluxe.jpg', 900000, 99, 1),
(4, 'LUXURY', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'hachico_luxury.jpg', 1000000, 99, 1),
(5, 'SUPPERIOR DOUBLE', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 400000, 99, 3),
(6, 'SUPPERIOR TWINS', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 700000, 59, 3),
(7, 'DELUXE DOUBLE', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 1000000, 99, 3),
(8, 'DELUXE TWINS', 'Phòng nghỉ thông thoáng, cao cấp sang trọng', '2 nguoi', 'anh1.png', 1500000, 99, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `service`
--

CREATE TABLE `service` (
  `ServiceID` int(11) NOT NULL,
  `ServiceName` varchar(50) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `HotelID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `servicedetails`
--

CREATE TABLE `servicedetails` (
  `ServiceDetailsID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `BookingDetailsID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `SlideID` int(11) NOT NULL,
  `SlideImages` varchar(255) DEFAULT NULL,
  `SlideTitle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`SlideID`, `SlideImages`, `SlideTitle`) VALUES
(1, 'ha_noi.jpg', 'Hà Nội'),
(2, 'da_nang.jpg', 'Đà Nẵng'),
(3, 'ho_chi_minh.jpg', 'Hồ Chí Minh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Phone` varchar(13) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Password` longtext DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  `username` varchar(50) DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`UserID`, `Email`, `Name`, `Phone`, `Sex`, `BirthDate`, `Password`, `enabled`, `username`, `Role`) VALUES
(1, 'truckt12a3@gmail.com', 'Phạm Văn Trực', '0123456789', 'Nam', '2000-08-19', '$2a$10$gLHIEMOEUrvC.cjlWE2Kqu2hRJvFOqDA2b.1yajmwMtMKZvOhh7eS', 1, 'truc19082000', 'ROLE_USER'),
(2, 'nva@gmail.com', 'Nguyen Van A', '034234234', 'Nam', '1999-07-18', '$2a$10$mcgrQS.r9YTt5nQWdorpmeY0y0KXWRhok6BPIHdiPdEu9.bE21c5W', 1, 'nvanvan', 'ROLE_USER'),
(13, 'truckt12a34@gmail.com', NULL, NULL, NULL, NULL, '$2a$10$TaVnlsoYZAIfUAh3rCdG6O1zACWZXRCB5onXxNZeyl//yjohLohHy', 1, 'phamvantruc', 'ROLE_USER');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `fk_payment_creditCard` (`CreditCardID`),
  ADD KEY `fk_booking_users` (`UserID`);

--
-- Chỉ mục cho bảng `bookingdetails`
--
ALTER TABLE `bookingdetails`
  ADD PRIMARY KEY (`BookingDetailsID`),
  ADD KEY `fk_bookingDetails_booking` (`BookingID`),
  ADD KEY `fk_room_bookingDetails` (`RoomID`);

--
-- Chỉ mục cho bảng `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`CityID`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`CommentID`),
  ADD KEY `fk_comment_users` (`UserID`),
  ADD KEY `fk_comment_roomType` (`HotelID`);

--
-- Chỉ mục cho bảng `creditcard`
--
ALTER TABLE `creditcard`
  ADD PRIMARY KEY (`CreditCardID`);

--
-- Chỉ mục cho bảng `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`HotelID`),
  ADD KEY `fk_hotel_city` (`CityID`),
  ADD KEY `fk_hotel_rate` (`RateID`);

--
-- Chỉ mục cho bảng `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`RateID`);

--
-- Chỉ mục cho bảng `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`RoomID`),
  ADD KEY `fk_room_roomType` (`RoomTypeID`);

--
-- Chỉ mục cho bảng `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`RoomTypeID`),
  ADD KEY `fk_roomType_hotel` (`HotelID`);

--
-- Chỉ mục cho bảng `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`ServiceID`),
  ADD KEY `fk_service_hotel` (`HotelID`);

--
-- Chỉ mục cho bảng `servicedetails`
--
ALTER TABLE `servicedetails`
  ADD PRIMARY KEY (`ServiceDetailsID`),
  ADD KEY `fk_serviceDetails_BookingDetails` (`BookingDetailsID`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`SlideID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `booking`
--
ALTER TABLE `booking`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `bookingdetails`
--
ALTER TABLE `bookingdetails`
  MODIFY `BookingDetailsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `city`
--
ALTER TABLE `city`
  MODIFY `CityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `CommentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `creditcard`
--
ALTER TABLE `creditcard`
  MODIFY `CreditCardID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `hotel`
--
ALTER TABLE `hotel`
  MODIFY `HotelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `rate`
--
ALTER TABLE `rate`
  MODIFY `RateID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `room`
--
ALTER TABLE `room`
  MODIFY `RoomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `RoomTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `service`
--
ALTER TABLE `service`
  MODIFY `ServiceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `SlideID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_booking_users` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `fk_payment_creditCard` FOREIGN KEY (`CreditCardID`) REFERENCES `creditcard` (`CreditCardID`);

--
-- Các ràng buộc cho bảng `bookingdetails`
--
ALTER TABLE `bookingdetails`
  ADD CONSTRAINT `fk_bookingDetails_booking` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`),
  ADD CONSTRAINT `fk_room_bookingDetails` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_roomType` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`),
  ADD CONSTRAINT `fk_comment_users` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Các ràng buộc cho bảng `creditcard`
--
ALTER TABLE `creditcard`
  ADD CONSTRAINT `fk_creditCard_users` FOREIGN KEY (`CreditCardID`) REFERENCES `users` (`UserID`);

--
-- Các ràng buộc cho bảng `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `fk_hotel_city` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`),
  ADD CONSTRAINT `fk_hotel_rate` FOREIGN KEY (`RateID`) REFERENCES `rate` (`RateID`);

--
-- Các ràng buộc cho bảng `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `fk_room_roomType` FOREIGN KEY (`RoomTypeID`) REFERENCES `roomtype` (`RoomTypeID`);

--
-- Các ràng buộc cho bảng `roomtype`
--
ALTER TABLE `roomtype`
  ADD CONSTRAINT `fk_roomType_hotel` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`);

--
-- Các ràng buộc cho bảng `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `fk_service_hotel` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`HotelID`);

--
-- Các ràng buộc cho bảng `servicedetails`
--
ALTER TABLE `servicedetails`
  ADD CONSTRAINT `fk_serviceDetails_BookingDetails` FOREIGN KEY (`BookingDetailsID`) REFERENCES `bookingdetails` (`BookingDetailsID`),
  ADD CONSTRAINT `fk_serviceDetails_Service` FOREIGN KEY (`ServiceDetailsID`) REFERENCES `service` (`ServiceID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
