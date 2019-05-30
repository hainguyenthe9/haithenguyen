-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 30, 2019 lúc 02:30 PM
-- Phiên bản máy phục vụ: 10.1.36-MariaDB
-- Phiên bản PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `project`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employees`
--

CREATE TABLE `employees` (
  `msnv` int(11) NOT NULL,
  `ten_nv` varchar(100) NOT NULL,
  `ma_nguoi_phe_duyet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `host`
--

CREATE TABLE `host` (
  `ma_nguoi_phe_duyet` int(11) NOT NULL,
  `ten_nguoi_phe_duyet` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `leave_request`
--

CREATE TABLE `leave_request` (
  `msnv` int(11) NOT NULL,
  `ma_so_nghi_phep` int(11) NOT NULL,
  `ngay_bat_dau` date NOT NULL,
  `ngay_ket_thuc` date NOT NULL,
  `ly_do` varchar(255) NOT NULL,
  `ten_nguoi_phe_duyet` varchar(100) NOT NULL,
  `ma_nguoi_phe_duyet` int(11) NOT NULL,
  `ten_nguoi_duoc_thong_bao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tai_khoan`
--

CREATE TABLE `tai_khoan` (
  `stt` int(11) NOT NULL,
  `msnv` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `pass_word` varchar(100) NOT NULL,
  `chu_thich` varchar(100) NOT NULL,
  `quyen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tai_khoan`
--

INSERT INTO `tai_khoan` (`stt`, `msnv`, `user_name`, `pass_word`, `chu_thich`, `quyen`) VALUES
(1, 2, 'admin', 'admin', 'qu?n lý', 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`msnv`),
  ADD KEY `ma_nguoi_phe_duyet` (`ma_nguoi_phe_duyet`);

--
-- Chỉ mục cho bảng `host`
--
ALTER TABLE `host`
  ADD PRIMARY KEY (`ma_nguoi_phe_duyet`);

--
-- Chỉ mục cho bảng `leave_request`
--
ALTER TABLE `leave_request`
  ADD PRIMARY KEY (`ma_so_nghi_phep`),
  ADD KEY `msnv` (`msnv`),
  ADD KEY `ma_nguoi_phe_duyet` (`ma_nguoi_phe_duyet`);

--
-- Chỉ mục cho bảng `tai_khoan`
--
ALTER TABLE `tai_khoan`
  ADD PRIMARY KEY (`msnv`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`ma_nguoi_phe_duyet`) REFERENCES `host` (`ma_nguoi_phe_duyet`);

--
-- Các ràng buộc cho bảng `leave_request`
--
ALTER TABLE `leave_request`
  ADD CONSTRAINT `leave_request_ibfk_1` FOREIGN KEY (`msnv`) REFERENCES `employees` (`msnv`),
  ADD CONSTRAINT `leave_request_ibfk_2` FOREIGN KEY (`ma_nguoi_phe_duyet`) REFERENCES `host` (`ma_nguoi_phe_duyet`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
