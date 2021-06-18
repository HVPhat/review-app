-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 18, 2021 at 08:55 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_review`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` bigint(20) NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gender` enum('Male','Female') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `birthday` date NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `exp_point` bigint(20) NOT NULL,
  `rank` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `is_locked` tinyint(4) NOT NULL DEFAULT '0',
  `is_admin` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `user_name`, `password`, `email`, `phone`, `first_name`, `last_name`, `gender`, `birthday`, `avatar`, `exp_point`, `rank`, `created_at`, `created_by`, `is_deleted`, `deleted_at`, `deleted_by`, `updated_at`, `updated_by`, `is_locked`, `is_admin`) VALUES
(1, 'VinhPhat', '$2y$10$lDmRRGR4AubSE4UGnrU2Kuo8dHUJ2S7OaX1.w/71XrFgSsrOXpH.y', 'phat@gmail.com', '0352559972', 'Huỳnh', 'Vinh Phát', 'Male', '2000-07-04', 'upload/users/1/avatar/avatar.jpg', 2000, 2, '2021-05-25 18:48:23', 1, 0, NULL, NULL, NULL, NULL, 0, 1),
(2, 'TamVipPro', '$2y$10$Tzmbtf1oCJjo87buza9zXekBYpCVKB9hWVM7iUrHC1Q4CnspIDVBy', 'tam@gmail.com', '0123456789', 'Nguyễn', 'Thành Tâm', 'Male', '2000-07-21', 'upload/users/2/avatar/avatar.jpg', 2000, 1, '2021-05-25 18:48:23', 1, 0, NULL, NULL, '2021-06-08 07:14:02', 1, 0, 0),
(3, 'ThongDauBuoi', '$2y$10$Tzmbtf1oCJjo87buza9zXekBYpCVKB9hWVM7iUrHC1Q4CnspIDVBy', 'thong@gmail.com', '0987654321', 'Cao Thị', 'Minh Thông ', 'Female', '2000-07-14', 'C:\\fakepath\\avata.jpg', 2000, 2, '2021-05-25 18:48:23', 1, 0, NULL, NULL, '2021-06-16 06:07:40', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE `auth` (
  `id` bigint(20) NOT NULL,
  `user` bigint(20) NOT NULL,
  `token` text COLLATE utf8mb4_general_ci NOT NULL,
  `expired_at` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth`
--

INSERT INTO `auth` (`id`, `user`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES
(3, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InBoYXRAZ21haWwuY29tIiwiaWF0IjoxNjI0MDA1NDY1LCJleHAiOjE2MjQzNjU0NjV9.5uV42axBKTSFI5sB8umxNLAelDsHbOqQPOtkol9cAgY', '2021-06-22 07:37:45', '2021-06-18 03:37:45', '2021-06-18 03:37:45');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `category_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `deleted_at` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`, `is_deleted`, `deleted_at`, `created_at`, `updated_at`, `updated_by`) VALUES
(1, 'Đồ ăn', 0, NULL, '2021-06-12 17:27:42', NULL, NULL),
(2, 'Đồ uống', 0, NULL, '2021-06-12 17:28:03', NULL, NULL),
(3, 'Du lịch', 0, NULL, '2021-06-12 17:29:24', NULL, NULL),
(4, 'Làm đẹp', 0, NULL, '2021-06-12 17:29:24', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` bigint(11) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comment_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `before_update_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `deleted_at` datetime NOT NULL,
  `deleted_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id` bigint(11) NOT NULL,
  `account_id_1` bigint(20) NOT NULL,
  `account_id_2` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `like_comment`
--

CREATE TABLE `like_comment` (
  `id` bigint(11) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `comment_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `like_post`
--

CREATE TABLE `like_post` (
  `id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` bigint(11) NOT NULL,
  `location_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `location_image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `open_time` time NOT NULL,
  `closed_time` time NOT NULL,
  `lowest_price` decimal(10,0) DEFAULT NULL,
  `hightgest_price` decimal(10,0) DEFAULT NULL,
  `rating` float NOT NULL DEFAULT '0',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `latitude` double NOT NULL,
  `longtitude` double NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_approval` tinyint(4) NOT NULL DEFAULT '0',
  `approved_by` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `location_name`, `location_image`, `open_time`, `closed_time`, `lowest_price`, `hightgest_price`, `rating`, `address`, `latitude`, `longtitude`, `phone_number`, `is_approval`, `approved_by`, `is_deleted`, `deleted_at`, `deleted_by`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'Bếp Chef Hó-Nguyễn Trãi', '[{\"0\":\"upload/post/3/img0.jpg\",\"1\":\"upload/post/3/img1.jpg\",\"2\":\"upload/post/3/img2.jpg\",\"3\":\"upload/post/5/img0.jpg\",\"4\":\"upload/post/5/img1.jpg\",\"5\":\"upload/post/5/img2.jpg\"}]', '08:00:00', '13:00:00', '55000', '75000', 5, '212B/D28/4 Nguyễn Trãi, Phường Nguyễn Cư Trinh, Quận 1, Hồ Chí Minh', 123.123456, 123.123456, '', 0, NULL, 0, NULL, NULL, '2021-06-10 10:27:35', 1, NULL, NULL),
(2, 'WELAX - Gội Đầu Thư Giãn', '[{\"0\":\"upload/post/4/img0.jpg\",\"1\":\"upload/post/4/img1.jpg\",\"2\":\"upload/post/4/img2.jpg\",\"3\":\"upload/post/4/img3.jpg\",\"4\":\"upload/post/4/img4.jpg\",\"5\":\"upload/post/4/img5.jpg\"}]', '10:00:00', '20:00:00', NULL, NULL, 5, '245 Tân Hương,Phường Tân Quý,Quận Tân Phú,Hồ Chí Minh', 123.123456, 123.123456, '0767634639', 0, NULL, 0, NULL, NULL, '2021-06-13 01:49:34', NULL, NULL, NULL),
(3, 'Nhà Hàng Las Vegas', '[{\"0\":\"upload/post/2/img0.jpg\",\"1\":\"upload/post/2/img1.jpg\",\"2\":\"upload/post/2/img2.jpg\",\"3\":\"upload/post/2/img3.jpg\",\"4\":\"upload/post/2/img4.jpg\",\"5\":\"upload/post/2/img5.jpg\"}]', '16:00:00', '23:00:00', '49000', '300000', 5, '188 - 190 - 192 Nguyễn Văn Linh, Phường Tân Thuận Tây, Quận 7, Hồ Chí Minh', 123.123456, 123.123456, '', 0, NULL, 0, NULL, NULL, '2021-06-13 01:57:58', NULL, NULL, NULL),
(4, 'Texas Chicken - Big C Nguyễn Thị Thập', '\r\n[{\"0\":\"upload/post/1/img0.jpg\",\"1\":\"upload/post/1/img1.jpg\",\"2\":\"upload/post/1/img2.jpg\",\"3\":\"upload/post/1/img3.jpg\",\"4\":\"upload/post/1/img4.jpg\",\"5\":\"upload/post/1/img5.jpg\",\"6\":\"upload/post/1/img6.jpg\"}]', '10:00:00', '22:00:00', NULL, NULL, 5, 'Shop 01, Quận 7, Hồ Chí Minh', 123.123456, 123.123456, '1900636091', 0, NULL, 0, NULL, NULL, '2021-06-13 01:57:58', NULL, NULL, NULL),
(5, 'Léon Bar', '[{\"0\":\"upload/post/6/img0.jpg\",\"1\":\"upload/post/6/img1.jpg\",\"2\":\"upload/post/7/img0.jpg\",\"3\":\"upload/post/7/img1.jpg\",\"4\":\"upload/post/7/img2.jpg\",\"5\":\"upload/post/7/img3.jpg\",\"6\":\"upload/post/7/img4.jpg\"}]', '08:00:00', '22:00:00', NULL, NULL, 5, '122 Hồ Tùng Mậu,Phường Bến Nghé,Quận 1,Hồ Chí Minh', 123.123456, 123.123456, '02632222239', 0, NULL, 0, NULL, NULL, '2021-06-13 08:13:56', NULL, NULL, NULL),
(6, 'Buôn Ma Thuột', '[{\"0\":\"upload/post/8/img0.jpg\",\"1\":\"upload/post/8/img1.jpg\",\"2\":\"upload/post/8/img2.jpg\",\"3\":\"upload/post/8/img3.jpg\",\"4\":\"upload/post/8/img4.jpg\",\"5\":\"upload/post/8/img5.jpg\",\"6\":\"upload/post/8/img6.jpg\",\"7\":\"upload/post/8/img7.jpg\",\"8\":\"upload/post/8/img8.jpg\",\"9\":\"upload/post/8/img9.jpg\",\"10\":\"upload/post/8/img10.jpg\",\"11\":\"upload/post/8/img11.jpg\",\"12\":\"upload/post/8/img12.jpg\",\"13\":\"upload/post/8/img13.jpg\",\"14\":\"upload/post/8/img14.jpg\",\"15\":\"upload/post/8/img15.jpg\",\"16\":\"upload/post/8/img16.jpg\"}]', '01:00:00', '24:00:00', NULL, NULL, 5, 'Thành phố BMT, Phường Thống Nhất, Thành phố Buôn Mê Thuột, Đắk Lắk', 123.123456, 123.123456, '', 0, NULL, 0, NULL, NULL, '2021-06-13 08:17:09', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` bigint(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hashtag` text COLLATE utf8mb4_general_ci,
  `rating` int(11) DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `location` bigint(20) NOT NULL,
  `post_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `post_video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `view_quantity` bigint(20) NOT NULL DEFAULT '0',
  `like_quantity` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `hashtag`, `rating`, `content`, `location`, `post_image`, `post_video`, `view_quantity`, `like_quantity`, `created_at`, `created_by`, `updated_at`, `updated_by`, `is_deleted`, `deleted_at`) VALUES
(1, 'gà rán Texas Chicken', NULL, 5, '<p><span class=\"text\">Nay thấy Texas chicken treo biển : \"d&ugrave;ng g&agrave; kh&ocirc;ng đ&ocirc;ng lạnh để chế biến\" nghe kh&aacute; hay n&ecirc;n v&agrave;o thử. 💸Combo m&igrave;nh 2 miếng g&agrave; chọn 1 miếng cay,1 kh&ocirc;ng + b&aacute;nh mật ong ,rau trộn v&agrave; ly nước refill gi&aacute; 89k. 🍗Miếng g&agrave; kh&ocirc;ng cay ăn vỏ mỏng gi&ograve;n,&iacute;t ngấm dầu ,b&ecirc;n trong phần thịt mọng nước v&agrave; vị ngọt thịt hơn hẳn trước. 🍗Miếng g&agrave; vị cay vị thơm hơn ,cay nhẹ nh&agrave;ng,tuy nhi&ecirc;n kh&aacute; mặn.Trong c&aacute;c loại miếng g&agrave; cay thấy đ&acirc;y vị mặn nhất hơn cả KFC,Mc donald. 🍗G&agrave; của texas miếng c&oacute; phần to nhỉnh hơn c&aacute;c miếng g&agrave; mọng nước của h&atilde;ng kh&aacute;c,v&agrave; kh&ocirc; hơn 1 ch&uacute;t n&ecirc;n bị cảm gi&aacute;c ng&aacute;n thịt ,kh&ocirc;ng hết nổi 2 miếng =&gt; g&oacute;i về cho con m&eacute;o vậy. 🥯B&aacute;nh phết mật ong rất ngon </span><span class=\"emoji-sizer emoji-outer \">👍</span><span class=\"text\"> 🥗Rau trộn nh&igrave;n kh&aacute; ch&aacute;n với h&igrave;nh quảng c&aacute;o nhưng ăn ổn. 🍅Tương c&agrave; kh&aacute; chua v&agrave; tương ớt kh&aacute; mặn </span><span class=\"emoji-sizer emoji-outer \">😃</span><span class=\"text\"> giống như tương của heniz nhưng được chỉnh vị lại đậm đ&agrave; hơn. 👉Tổng thể nếu ko lăn tăn về canh c tr&igrave;nh k m&atilde;i ăn g&agrave;,th&igrave; c&aacute;c bạn c&oacute; thể chọn Texas n&agrave;y ăn kh&aacute; ổn với gi&aacute;, m&agrave; kh&ocirc;ng cần chờ khuyến m&atilde;i.</span></p>', 4, '\r\n[{\"0\":\"upload/post/1/img0.jpg\",\"1\":\"upload/post/1/img1.jpg\",\"2\":\"upload/post/1/img2.jpg\",\"3\":\"upload/post/1/img3.jpg\",\"4\":\"upload/post/1/img4.jpg\",\"5\":\"upload/post/1/img5.jpg\",\"6\":\"upload/post/1/img6.jpg\"}]', NULL, 12300, 93, '2021-06-05 12:50:42', 1, NULL, NULL, 0, NULL),
(2, 'Cơm trưa nhà hàng Las Vegas', NULL, 5, '<p>Trời h&ocirc;m nay mưa từ s&aacute;ng tới trưa,đang ko biết ăn g&igrave; lại lười ra ngo&agrave;i thấy nh&agrave; h&agrave;ng quen đang đ&oacute;ng để d&atilde;n c&aacute;ch chuyển qua phục vụ cơm trưa giao h&agrave;ng n&ecirc;n lựa rồi đặt 2 phần về. 💸M&igrave;nh chọn cơm b&ograve; x&agrave;o v&agrave; cơm sườn non kho gi&aacute; 45k 1 phần, freehip Q7 ,thiệt trời mưa n&agrave;y lười đi mua bắt qu&aacute;n ship hơi ngại m&agrave; quy định 3 phần mới ship m&igrave;nh đặt 2 cũng ok th&igrave; n&oacute;i chung đ&aacute;nh gi&aacute; phục phụ ok n&egrave;. Cơm nhận trong hộp chịu nhiệt,sạch sẽ v&agrave; kh&aacute; nặng tay,mở ra cơm nhiều (qu&aacute;n c&oacute; dặn ăn nhiều cơm sẽ cho th&ecirc;m bịch cơm nữa) trong c&oacute; cả rau x&agrave;o v&agrave; kim chi,1 miếng dưa hấu tr&aacute;ng miệng nữa. 👉phần sườn non kho : rất hấp dẫn sườn kho mềm cắn v&agrave;o thơm ngọt thịt ,ngon . 👉phần b&ograve; x&agrave;o rau củ : b&ograve; d&ugrave;ng thịt xịn n&egrave; cắt miếng ko nhỏ x&iacute;u như qu&aacute;n cơm,dầy hơn,x&agrave;o hơi nhạt kiểu giữ ngọt thịt h&ograve;a rau củ, chan nước tương mix sa tế cho k&egrave;m l&ecirc;n ăn th&igrave; vừa. 👉Cơm gạo ngon nấu hơi nh&atilde;o 1 ch&uacute;t . 👉kim chi ngon nha, hồi xưa m&igrave;nh ăn g&agrave; nướng x&ocirc;i ở đ&acirc;y m&ecirc; t&iacute;t m&oacute;n kim chi lu&ocirc;n d&ugrave; chỉ l&agrave; cho ăn k&egrave;m. 👉Ch&eacute;n canh nh&igrave;n kh&aacute; ưng bụng,nấu rau ko bị sống như nhiều qu&aacute;n cơm,rau nhiều n&egrave;. 👍Tổng thể chất lượng cho 8 điểm chất lượng / gi&aacute; tiền + 1 phục vụ kh&aacute; ok ship tận nơi cho trong m&ugrave;a dịch v&agrave; vệ sinh tốt .</p>', 3, '[{\"0\":\"upload/post/2/img0.jpg\",\"1\":\"upload/post/2/img1.jpg\",\"2\":\"upload/post/2/img2.jpg\",\"3\":\"upload/post/2/img3.jpg\",\"4\":\"upload/post/2/img4.jpg\",\"5\":\"upload/post/2/img5.jpg\"}]', NULL, 1649, 33, '2021-06-05 12:50:42', 1, NULL, NULL, 0, NULL),
(3, 'gà bao to của Bếp Chef Hó ó ó ó', NULL, 5, '<p>Xin ch&agrave;o cả nh&agrave; lại l&agrave; Bếu đ&acirc;y 🖐️🖐️🖐️</p>\r\n<p>H&ocirc;m nay Bếu đi ri-viu bữa cơm l&uacute;c 11g khuya 😭😭😭 Bếu đặt đồ ăn qu&aacute;n Wow chicken m&agrave; Bếu đ&atilde; từng r&igrave; -viu trước đ&oacute; ( https://app.riviu.vn/03ljsJM9 ) nhưng kh&ocirc;ng để &yacute; bị a shipper nhận rồi hủy kh&ocirc;ng giao thế l&agrave; lượn t&igrave;m qu&aacute;n kh&aacute;c trong v&ocirc; vọng. &Acirc;y ch&agrave; h&ecirc;n chọn mặt gửi v&agrave;ng được 1 qu&aacute;n m&agrave; t&ecirc;n qu&aacute;n nghe kh&aacute; ngộ nghĩnh \"Bếp Chef H&oacute;\".</p>\r\n<p>Kh&ocirc;ng uổng c&ocirc;ng đợi đến 11g đ&ecirc;m để đặt qu&aacute;n n&agrave;y. Qu&aacute;n n&agrave;y m&igrave;nh thấy tr&ecirc;n app th&igrave; 8g s&aacute;ng đ&atilde; mở b&aacute;n cho đến tận 1g khuya mới đ&oacute;ng cửa --&gt; Đ&acirc;y đ&uacute;ng l&agrave; qu&aacute;n cứu đ&oacute;i với c&aacute;c c&uacute; đ&ecirc;m. 👍👍👍&nbsp;</p>\r\n<p>Bếu xin giới thiệu sơ về menu của qu&aacute;n:<br />👉 M&igrave; g&agrave; tiềm<br />👉 Cơm g&agrave; nướng mật ong<br />👉 M&igrave; trộn đ&ugrave;i g&agrave; nướng BBQ<br />👉 Cơm g&agrave; nướng x&iacute; mụi<br />C&aacute;c bạn c&oacute; thể tham khảo menu v&agrave; đặt m&oacute;n tại đ&acirc;y: https://www.now.vn/ho-chi-minh/bep-chef-ho-mi-thit-nuong</p>\r\n<p>Như ti&ecirc;u đề Bếu đề cập g&agrave; ở qu&aacute;n n&agrave;y b&aacute;n rất to v&agrave; chất lượng 👍 Thịt g&agrave; được ướp gia vị rất đậm đ&agrave; từ da đến thịt, cơm th&igrave; rất dẻo, thơm. Kh&ocirc;ng biết sao chứ Bếu đặt m&igrave; nhưng lại giao l&agrave; nui trong khi menu qu&aacute;n lại kh&ocirc;ng c&oacute; nui 😂😂😂 nhưng...nhưng nui cũng được ướp sốt x&agrave;o n&oacute;ng ăn với g&agrave; rất ngon lắm nha Bếu nghĩ khi ăn m&igrave; trộn chắc qu&aacute;n cũng ướp vị giống nui. Đặc biệt, đồ ăn qu&aacute;n n&agrave;y được g&oacute;i trong giấy bạc đựng tr&ecirc;n c&aacute;i dĩa m&uacute;t n&ecirc;n khi giao cơm tới nơi g&agrave; vẫn c&ograve;n đủ ấm để d&ugrave;ng ngon miệng.</p>\r\n<p>Về gi&aacute; th&igrave; kh&ocirc;ng hẵn qu&aacute; mắc, đối với phần ăn n&agrave;y gi&aacute; tầm 45.000₫ - 55.000₫ cũng ổn.</p>\r\n<p>H&atilde;y follow Bếu Bếu để theo d&otilde;i nhiều qu&aacute;n ăn Ngon - Bổ - Rẻ nh&eacute; 🥰🥰🥰</p>\r\n<p>▪️▪️▪️▪️▪️▪️▪️▪️▪️▪️<br />Bếp Chef H&oacute; - M&igrave; Thịt Nướng<br />🏠 212B/D28/4 Nguyễn Tr&atilde;i, P. Nguyễn Cư Trinh, Quận 1, TP. HCM<br />⏰ 08:00 - 01:00<br />🌐 App đặt m&oacute;n: https://www.now.vn/ho-chi-minh/bep-chef-ho-mi-thit-nuong</p>', 1, '[{\"0\":\"upload/post/3/img0.jpg\",\"1\":\"upload/post/3/img1.jpg\",\"2\":\"upload/post/3/img2.jpg\"}]', NULL, 2347, 52, '2021-06-05 12:50:42', 1, NULL, NULL, 0, NULL),
(4, 'WELAX SPA - GỘI ĐẦU SIÊU THƯ GIÃN', NULL, 5, '<p>🌼 WELAX SPA 🌼<br />🌿 Spa đ&ocirc;ng y dưỡng sinh ở S&agrave;i G&ograve;n, full combo gội, đắp, ấn, nhấn chỉ c&oacute; 169k (75p).&nbsp;</p>\r\n<p>🍃<br />Vừa bước vào l&agrave; c&oacute; cảm t&igrave;nh r&ograve;i, nghe thấy tiếng nhạc du dương vs m&ugrave;i tinh dầu thi&ecirc;n nhi&ecirc;n thơm thơm, tone v&agrave;ng ấm ấm nữa.</p>\r\n<p>Ban đầu m&igrave;nh t&iacute;nh thử g&oacute;i gội đầu 25k hoi, m&agrave; thấy combo 19 bước c&oacute; 169k (bữa đ&oacute; giảm 20% c&ograve;n 131k) được 75 ph&uacute;t trọn g&oacute;i: gội đầu, đắp mặt nạ, massage trị liệu (cổ, vai, g&aacute;y, lưng, tay, đầu, mặt) hợp l&yacute; n&ecirc;n chốt lu&ocirc;n.</p>\r\n<p>🍃<br />MẶT: Đầu ti&ecirc;n l&agrave; được l&agrave;m sạch da, rồi tẩy tế b&agrave;o chết bằng Muối hạt mơ + Olive. Sau đ&oacute; massage bằng Kem tr&agrave; xanh, rồi cuối c&ugrave;ng l&agrave; chọn mặt nạ để đắp, b&ecirc;n n&agrave;y c&oacute; mặt nạ bơ, tr&agrave; xanh, đậu đỏ... m&agrave; m&igrave;nh kho&aacute;i bơ n&ecirc;n chọn lu&ocirc;n. &nbsp;Được massage mặ ph&ecirc; qu&aacute; n&ecirc;n m&igrave;nh ngủ 1 l&uacute;c 🙄 Bạn k&ecirc;u mới dậy, đ&uacute;ng ngại.</p>\r\n<p>🍃&nbsp;<br />ĐẦU: nh&acirc;n vi&ecirc;n tư vấn chất t&oacute;c cho m&igrave;nh, rồi m&igrave;nh chọn gội Bồ kết, b&ecirc;n n&agrave;y bồ kết handmade lu&ocirc;n. Vừa gội mấy chỉ vừa massage da đầu, nhạc &ecirc;m &aacute;i nữa, ph&ecirc; tập 2 🥺 Xong rửa tai, gội lại lần nữa, cuối c&ugrave;ng l&agrave; ủ cao bồ kết bạc h&agrave; m&aacute;t lạnh.</p>\r\n<p>🍃<br />BODY: Nhẹ cái đầu rồi thì tới Body. Ở đây massage l&agrave; trọn bộ cổ vai g&aacute;y lưng tay đầu lu&ocirc;n. Mấy chị massage đ&atilde; lắm, kiểu lực vừa m&agrave; đ&uacute;ng huyệt lu&ocirc;n. Trong l&uacute;c l&agrave;m nh&acirc;n vi&ecirc;n cứ hỏi thoải m&aacute;i chưa, lực ntn ok kh&ocirc;ng, thân thiện và dễ thương d&atilde; man.</p>\r\n<p>Kết thúc chương trình là sấy tóc cho kh&ocirc;, xoa tinh dầu, xịt dưỡng chất. Thấy t&oacute;c mượt trơn hẳn lu&ocirc;n.</p>\r\n<p>🍃<br />L&uacute;c ngồi chờ về được uống tr&agrave; hoa đậu biếc handmade thơm thơm nữa, chu đ&aacute;o thiệt sự.</p>\r\n<p>M&igrave;nh kể hơi chi tiết, tại kh&ocirc;ng nghĩ một combo với giá này mà được chỉnh chu từng chút vậy &aacute;.</p>\r\n<p>😊 Nchung combo ok qu&aacute; lu&ocirc;n. Gi&aacute; ổn &aacute;p vầy mn đi thư gi&atilde;n, xả stress l&agrave; hợp l&yacute; lu&ocirc;n &aacute;.&nbsp;</p>\r\n<p>--<br />𝐖𝐄𝐋𝐀𝐗 &nbsp;𝐒𝐏𝐀<br />◽️ Đ/c: 245 T&acirc;n Hương, P. T&acirc;n Qu&yacute;, Q. T&acirc;n Ph&uacute;, TPHCM&nbsp;</p>', 2, '[{\"0\":\"upload/post/4/img0.jpg\",\"1\":\"upload/post/4/img1.jpg\",\"2\":\"upload/post/4/img2.jpg\",\"3\":\"upload/post/4/img3.jpg\",\"4\":\"upload/post/4/img4.jpg\",\"5\":\"upload/post/4/img5.jpg\"}]', NULL, 1771, 52, '2021-06-05 12:50:42', 1, NULL, NULL, 0, NULL),
(5, 'set shasimi cá hồi báo ngậy', NULL, 5, '<p><span class=\"text\">Thấy nay qu&aacute;n quen hưởng ứng việc chỉ thị mua đồ ăn mang về giảm 10% + free ship , th&igrave; m&igrave;nh cũng k&ecirc;u &iacute;t phile c&aacute; hồi chấm m&ugrave;ng tạt . 💸Phần n&agrave;y khoảng 3 lạng,th&aacute;i kh&aacute; dầy v&agrave; c&aacute; nay b&eacute;o ngậy ,thiệt hại 300k thấy l&agrave; vừa cho 3 người ăn c&ugrave;ng m&oacute;n kh&aacute;c. Ưu điểm l&agrave; c&aacute; rất tươi ,v&igrave; chưa chuẩn bị đ&aacute; kh&ocirc; kịp n&ecirc;n qu&aacute;n cho mượn c&aacute;i t&ocirc; đ&aacute; lu&ocirc;n bảo lần sau đặt giao th&igrave; sẽ lấy lại haha 👉Địa chỉ qu&aacute;n las vegas 192 Ng Văn Linh Quận 7. 👉Qu&aacute;n n&agrave;y đang k m&atilde;i 10% to&agrave;n bộ menu khi mua mang về +freeship khu vực Q4 v&agrave; Q7 ,kh&aacute; ổn mua ăn tại nh&agrave;. </span><span class=\"emoji-sizer emoji-outer \">👉</span><span class=\"text\"> link bản đồ dưới nh&eacute; c&aacute;c bạn c&oacute; số hotline đặt lu&ocirc;n: </span><a class=\"text-is-link\" target=\"_blank\" rel=\"noopener noreferrer\">https://g.page/Lasvegas-district7?share</a></p>', 1, '[{\"0\":\"upload/post/5/img0.jpg\",\"1\":\"upload/post/5/img1.jpg\",\"2\":\"upload/post/5/img2.jpg\"}]', NULL, 804, 14, '2021-06-13 14:50:05', 1, NULL, NULL, 0, NULL),
(6, '100 điểm đủ chưa', NULL, 5, 'Còn gì tuyệt vời hơn là một đêm trăng thanh mà ngồi uống nước trong một quán bar mà mình yêu thích Leon\r\nDịch cũng hơi lâu, sau kỳ này, khi hết dịch sẽ trở lại quán quen 1 bữa.\r\nQuán này được cái khá ấm cúng, tối tối đốt đèn cầy tạo nên không khí huyền ảo lắm mn ơi\r\nNước ở đây khá ngon, rất hợp với khẩu vị của mình. \r\nỞ đây thường mình hay gọi món cà phê sữa (buổi sáng) và nếu có ghé qua buổi tối sẽ dùng cocktail\r\nHighly recommend nha mn ơi\r\nLéon Bar - 112 Hồ Tùng Mậu, Quận 1', 5, '[{\"0\":\"upload/post/6/img0.jpg\",\"1\":\"upload/post/6/img1.jpg\"}]', NULL, 752, 15, '2021-06-13 14:51:19', 1, NULL, NULL, 0, NULL),
(7, 'Cuối tuần hay giữa tuần thì vẫn đi chill khi stress', NULL, 5, '<p><span class=\"text\">Stress qu&aacute; nhiều rủ ngay 2 đứa bạn đi chill thư gi&atilde;n lấy lại năng lượng t&iacute;ch cực. Qu&aacute;n n&agrave;y m&igrave;nh đến v&agrave;i lần. V&igrave; kh&ocirc;ng gian ở đ&acirc;y y&ecirc;n tĩnh, nhạc hợp l&yacute; để giải ph&oacute;ng ti&ecirc;u cực </span><span class=\"emoji-sizer emoji-outer \">🔥</span><span class=\"text\"> Concept qu&aacute;n kh&aacute; lạ so với c&aacute;c qu&aacute;n kh&aacute;c, c&oacute; nhiều g&oacute;c đẹp để chụp h&igrave;nh cực CHẤT 🖤 Buổi s&aacute;ng c&oacute; b&aacute;n cafe với gi&aacute; kh&aacute; ổn ở trung t&acirc;m quận 1 tầm 60k g&igrave; đấy </span><span class=\"emoji-sizer emoji-outer \">💸</span><span class=\"text\"> Buổi tối c&oacute; b&aacute;n cocktail v&agrave; shisha, c&oacute; th&ecirc;m bắp rang được refill thoải m&aacute;i nữa nha 👍🏻 </span><span class=\"emoji-sizer emoji-outer \">🏠</span><span class=\"text\"> L&Eacute;ON BAR - 112 Hồ T&ugrave;ng Mậu, Q1</span></p>', 5, '[{\"0\":\"upload/post/7/img0.jpg\",\"1\":\"upload/post/7/img1.jpg\",\"2\":\"upload/post/7/img2.jpg\",\"3\":\"upload/post/7/img3.jpg\",\"4\":\"upload/post/7/img4.jpg\"}]', NULL, 732, 86, '2021-06-13 14:51:46', 1, NULL, NULL, 0, NULL),
(8, 'CÙNG NHAU VỀ BUÔN MA THUỘT 3N2D', NULL, 5, '<p>Nhắc đến Bu&ocirc;n Ma Thuột (hay c&ograve;n gọi l&agrave; Ban M&ecirc; Thuột) - một th&agrave;nh phố thuộc tỉnh Đắk Lắk - địa điểm nghe t&ecirc;n l&agrave; mọi người nghĩ ngay đến: n&uacute;i rừng, Coffee, những ngọn th&aacute;c cao h&ugrave;ng vĩ&hellip;.cộng th&ecirc;m ch&uacute;t hiếu k&igrave; về th&agrave;nh phố lớn nhất v&ugrave;ng T&acirc;y Nguy&ecirc;n, n&ecirc;n nh&oacute;m m&igrave;nh đ&atilde; quyết định x&aacute;ch balo l&ecirc;n kh&aacute;m ph&aacute; ngay Bu&ocirc;n M&ecirc; trong 3N2Đ với những trải nghiệm th&uacute; vị.</p>\r\n<p>Thời tiết cuối th&aacute;ng 5, khi tụi m&igrave;nh đi th&igrave; kh&aacute; n&oacute;ng, c&aacute;i n&oacute;ng của v&ugrave;ng đất T&acirc;y Nguy&ecirc;n rất oi ả, l&acirc;u l&acirc;u được một v&agrave;i cơn mưa r&agrave;o nhẹ nhưng vẫn kh&ocirc;ng xua đi được hết c&aacute;i nắng n&oacute;ng nơi đ&acirc;y. Kinh nghiệm cho c&aacute;c bạn n&ecirc;n mang theo đầy đủ: &aacute;o kho&aacute;c, kem chống nắng, n&oacute;n, d&ugrave;&hellip;để bảo vệ sức khoẻ nha 😁! Dưới đ&acirc;y l&agrave; một chiếc Review nhỏ sau chuyến đi ngắn ng&agrave;y của tụi m&igrave;nh, c&aacute;c bạn c&oacute; thể tham khảo thử ha 👇👇👇</p>\r\n<p>---------------------------------------------------</p>\r\n<p>1. DI CHUYỂN ĐẾN BU&Ocirc;N MA THUỘT:</p>\r\n<p>&bull; Từ TP.Hồ Ch&iacute; Minh &ndash; Bu&ocirc;n Ma Thuột: Nh&oacute;m m&igrave;nh chọn xe ph&ograve;ng nằm Tiến Oanh (Gi&aacute; v&eacute; 300k/ng), xe c&oacute; ghế nằm massage, chỗ nằm rộng, thoải m&aacute;i ngủ cả chuyến đi, xe c&oacute; đ&oacute;n ở dọc đường đi n&ecirc;n c&aacute;c bạn gọi điện v&agrave; hỏi trước với b&ecirc;n nh&agrave; xe để hẹn chỗ đ&oacute;n trước nh&eacute;.</p>\r\n<p>&bull; Từ Bu&ocirc;n Ma Thuột &ndash; TP.Hồ Ch&iacute; Minh: L&uacute;c về th&igrave; bọn m&igrave;nh đi xe giường nằm Loan S&aacute;ng (Gi&aacute; v&eacute; 220k/ng).</p>\r\n<p>2. Ở Đ&Acirc;U TẠI BU&Ocirc;N MA THUỘT:</p>\r\n<p>Lần đi n&agrave;y, quyết định thu&ecirc; căn hộ cho 7 người để được thoải m&aacute;i, v&igrave; vậy m&igrave;nh đ&atilde; chọn TV Homestay (4/17 Trung Trực, TP.Bu&ocirc;n Ma Thuột). Ở đ&acirc;y c&oacute; 2 loại: căn hộ nhỏ 1tr2, căn lớn th&igrave; 1tr7, bọn m&igrave;nh book căn hộ lớn gồm: 3 ph&ograve;ng ngủ, 2 nh&agrave; vệ sinh, ph&ograve;ng rộng, c&oacute; đầy đủ nội thất, bếp n&uacute;c để nấu ăn, tủ lạnh, dầu gội, sữa tắm&hellip;.đầy đủ hết (ri&ecirc;ng nước suối th&igrave; 10k/chai). Gi&aacute; ph&ograve;ng cho 3 ng&agrave;y 2 đ&ecirc;m: 3tr (do được chị chủ hỗ trợ giảm gi&aacute; th&ecirc;m nữa chứ&hellip;). Điểm trừ duy nhất m&agrave; m&igrave;nh kh&ocirc;ng th&iacute;ch khi ở đ&acirc;y l&agrave; ban ng&agrave;y, ph&ograve;ng kh&aacute;ch v&agrave; hai ph&ograve;ng tr&ecirc;n lầu kh&ocirc;ng được m&aacute;t, hơi n&oacute;ng, về đ&ecirc;m th&igrave; cũng đủ lạnh m&agrave; đ&oacute; chỉ l&agrave; vấn đề nhỏ, chị chủ dễ thương, hỗ trợ nhiệt t&igrave;nh n&ecirc;n cũng kh&ocirc;ng vấn đề g&igrave; cả.</p>\r\n<p>3. ĐI LẠI TRONG BU&Ocirc;N MA THUỘT:</p>\r\n<p>Ở Bu&ocirc;n M&ecirc; Thuột, bọn m&igrave;nh thu&ecirc; xe m&aacute;y di chuyển trong 3 ng&agrave;y 2 đ&ecirc;m với gi&aacute; 100k-120k/xe số, 150k/xe tay ga (do thu&ecirc; 4 xe n&ecirc;n tụi m&igrave;nh deal được gi&aacute; 100k/ng&agrave;y :))))</p>\r\n<p>4. CHƠI G&Igrave; Ở BU&Ocirc;N MA THUỘT</p>\r\n<p>&bull; Bảo t&agrave;ng Thế giới C&agrave; Ph&ecirc; - Nguyễn Đ&igrave;nh Chiểu, Phường T&acirc;n Lợi, TP.Bu&ocirc;n Ma Thuột (địa điểm &ldquo;đinh&rdquo; m&agrave; ai đến Bu&ocirc;n Ma Thuột cũng phải đến tham quan rồi n&egrave;). Đến đ&acirc;y bạn tha hồ chụp ảnh với mọi ng&oacute;c ng&aacute;ch, đ&acirc;u đ&acirc;u l&ecirc;n h&igrave;nh cũng đẹp cả.<br />Gi&aacute; v&eacute; v&agrave;o cổng: 75k/1ng để tham quan khu vực ph&iacute;a tr&ecirc;n, 100k tham quan khu tầng hầm, 150k/ng trọn g&oacute;i cả hai khu nh&eacute; (nhưng theo m&igrave;nh thấy chỉ n&ecirc;n tham quan ở tr&ecirc;n l&agrave; đủ, v&igrave; dưới hầm kh&aacute; nhỏ, kh&ocirc;ng đặc sắc lắm).<br />Gi&aacute; nước ở đ&acirc;y tầm &asymp; tr&ecirc;n 50k/ly cũng tạm ổn.</p>\r\n<p>&bull; Th&aacute;c Dray Nur (nằm c&aacute;ch th&agrave;nh phố Bu&ocirc;n Ma Thuột 25 km đi theo quốc lộ 14) c&oacute; độ cao khoảng 50m, d&agrave;i 100m, đ&acirc;y l&agrave; ngọn th&aacute;c đẹp v&agrave; h&ugrave;ng vĩ nhất khi đến với T&acirc;y Nguy&ecirc;n. Ở đ&acirc;y vừa c&oacute; th&aacute;c, vừa c&oacute; hồ nước xanh, cầu treo nhỏ bắc ngang qua s&ocirc;ng Serep&ocirc;k để đến th&aacute;c Dray Sp n&ecirc;n c&aacute;c bạn tha hồ sống ảo hoặc mang theo đồ ăn để l&agrave;m bữa tiệc picnic cũng rất vui. Tuy nhi&ecirc;n, đường v&agrave;o th&aacute;c c&oacute; nhiều đ&aacute; dăm v&agrave; bụi do xe tải chở đ&aacute; n&ecirc;n hơi kh&oacute; đi, nhất l&agrave; khi mưa xuống sẽ trơn trượt, mọi người ch&uacute; &yacute; chạy cẩn thận nh&eacute;. Gi&aacute; v&eacute; v&agrave;o cổng: 30k/người</p>\r\n<p>&bull; Lee&rsquo;s House (55 đường số 3 thuộc x&atilde; Cư &Ecirc; Bur, TP.Bu&ocirc;n Ma Thuột). Lee&rsquo;s House l&agrave; một Homestay nhưng được thiết kế, trang tr&iacute; với nhiều tiểu cảnh để kh&aacute;ch tham quan, chụp ảnh, tổ chức tiệc&hellip;Bọn m&igrave;nh đến đ&acirc;y tầm &asymp;11h trưa th&igrave; trời rất n&oacute;ng, thời tiết oi bức, kinh nghiệm n&ecirc;n đến l&uacute;c s&aacute;ng sớm hoặc buổi chiều &asymp;3h trở đi khi nắng chiều bu&ocirc;ng xuống sẽ m&aacute;t mẻ, dễ chịu hơn để tha hồ chụp choẹt.<br />Gi&aacute; v&eacute; khu phim trường: 100k/người (khu n&agrave;y d&agrave;nh cho chụp ảnh cưới l&agrave; ch&iacute;nh th&ocirc;i nha).<br />Gi&aacute; v&eacute; khu Homestay với bối cảnh Bali: 50k/người B&ecirc;n trong Lee&rsquo;s House cũng c&oacute; b&aacute;n đồ ăn, c&aacute;c bạn c&oacute; thể thử m&oacute;n: cơm lam nướng trong ống nứa, g&agrave; nướng chấm muối ớt xanh, kh&aacute; l&agrave; ngon đấy!!!</p>\r\n<p>&bull; Hẻm HongKong - (Hẻm 188 AMa Khu&ecirc; - TP. Bu&ocirc;n Ma Thuột). Thiết kế qu&aacute;n Tr&agrave; sữa ở đ&acirc;y giống một đoạn đường trong phim HongKong n&ecirc;n rất rất nhiều g&oacute;c để sống ảo lu&ocirc;n.<br />Về nước uống th&igrave; c&oacute; c&aacute;c loại tr&agrave; sữa &asymp; 30k-40k/tuỳ loại, b&aacute;nh bao &asymp; 20k, x&uacute;c x&iacute;ch &asymp; 45k/phần. Đồ ăn theo m&igrave;nh chỉ dừng lại l&agrave; tạm được chứ kh&ocirc;ng ngon lắm.</p>\r\n<p>5. MỘT V&Agrave;I ĐIỂM N&Ecirc;N ĐI NẾU C&Oacute; THỜI GIAN:</p>\r\n<p>&bull; Ch&ugrave;a Sắc tứ Khải Đoan<br />&bull; N&uacute;i Đ&aacute; voi Yang Tao - C&aacute;ch trung t&acirc;m th&agrave;nh phố 36km.<br />&bull; Hồ Lắk - C&aacute;ch trung t&acirc;m th&agrave;nh phố 50km. Từ Đ&aacute; Voi Mẹ v&ocirc; đ&acirc;y th&ecirc;m khoảng 20km.<br />&bull; Bu&ocirc;n Đ&ocirc;n (Bản Đ&ocirc;n) - C&aacute;ch trung t&acirc;m 47km.<br />&bull; Khu du lịch Troh Bư - C&aacute;ch Bản đ&ocirc;n 31km đi theo hướng về lại th&agrave;nh phố. Gi&aacute; v&eacute; 30k/ người.<br />&bull; Khu du lịch sinh th&aacute;i<br />&bull; Hồ Ea Kao<br />&bull; Khu du lịch Đồi Th&ocirc;ng<br />&bull; T&agrave; Đ&ugrave;ng Topview - được mệnh danh Vịnh Hạ Long T&acirc;y Nguy&ecirc;n.</p>\r\n<p>6. ĂN G&Igrave; Ở BU&Ocirc;N MA THUỘT:</p>\r\n<p>&bull; B&uacute;n ch&igrave;a C&ocirc; Chua (226 Nguyễn Tất Th&agrave;nh). Gi&aacute; 1 t&ocirc; b&uacute;n ch&igrave;a l&agrave;: 65k/t&ocirc;, bạn phải n&ecirc;n ăn thử m&oacute;n b&uacute;n ch&igrave;a n&agrave;y rồi vị l&agrave; sự pha trộn giữa b&uacute;n b&ograve; với b&uacute;n mọc, những m&oacute;n c&ograve;n lại m&igrave;nh thấy kh&ocirc;ng ngon lắm. Ăn hết được c&aacute;i ch&igrave;a TO Đ&Ugrave;NG th&igrave; cũng gian nan lắm nha.</p>\r\n<p>&bull; Nem nướng Thanh Loan (226 Y Jut, Thắng Lợi, Th&agrave;nh phố Bu&ocirc;n Ma Thuột). Nem nướng ở đ&acirc;y rất ngo</p>', 6, '[{\"0\":\"upload/post/8/img0.jpg\",\"1\":\"upload/post/8/img1.jpg\",\"2\":\"upload/post/8/img2.jpg\",\"3\":\"upload/post/8/img3.jpg\",\"4\":\"upload/post/8/img4.jpg\",\"5\":\"upload/post/8/img5.jpg\",\"6\":\"upload/post/8/img6.jpg\",\"7\":\"upload/post/8/img7.jpg\",\"8\":\"upload/post/8/img8.jpg\",\"9\":\"upload/post/8/img9.jpg\",\"10\":\"upload/post/8/img10.jpg\",\"11\":\"upload/post/8/img11.jpg\",\"12\":\"upload/post/8/img12.jpg\",\"13\":\"upload/post/8/img13.jpg\",\"14\":\"upload/post/8/img14.jpg\",\"15\":\"upload/post/8/img15.jpg\",\"16\":\"upload/post/8/img16.jpg\"}]', NULL, 2104, 30, '2021-06-13 14:53:39', 1, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rank_board`
--

CREATE TABLE `rank_board` (
  `id` int(11) NOT NULL,
  `rank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rank_exp_point` bigint(20) NOT NULL,
  `rank_badge` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(10) NOT NULL,
  `ratingcount` int(10) DEFAULT NULL,
  `ratingtotal` int(10) DEFAULT NULL,
  `location_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_comment`
--

CREATE TABLE `report_comment` (
  `id` bigint(11) NOT NULL,
  `comment_id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `report_title` int(11) NOT NULL,
  `report_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_approval` tinyint(4) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_post`
--

CREATE TABLE `report_post` (
  `id` bigint(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `report_title` int(11) NOT NULL,
  `report_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `is_approval` tinyint(4) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_title`
--

CREATE TABLE `report_title` (
  `id` int(11) NOT NULL,
  `title` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `like_post`
--
ALTER TABLE `like_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rank_board`
--
ALTER TABLE `rank_board`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_comment`
--
ALTER TABLE `report_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_post`
--
ALTER TABLE `report_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_title`
--
ALTER TABLE `report_title`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth`
--
ALTER TABLE `auth`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `like_post`
--
ALTER TABLE `like_post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `rank_board`
--
ALTER TABLE `rank_board`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_comment`
--
ALTER TABLE `report_comment`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_post`
--
ALTER TABLE `report_post`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_title`
--
ALTER TABLE `report_title`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
