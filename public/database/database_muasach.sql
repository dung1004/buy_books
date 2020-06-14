-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 12, 2019 lúc 07:46 PM
-- Phiên bản máy phục vụ: 10.1.34-MariaDB
-- Phiên bản PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `muasach`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `password`) VALUES
(4, 'trần hoàng', 'admin', '123456');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home` tinyint(4) DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `images`, `home`, `status`, `created_at`, `update_at`) VALUES
(1, 'Đột phá 8+ thi THPT quốc gia 2019', 'dot-pha-8-thi-thpt-quoc-gia-2019', NULL, 1, 1, '2019-02-26 15:46:40', '2019-03-10 16:58:59'),
(4, 'Sách luyện thi toiec & ielts', 'sach-luyen-thi-toiec-ielts', NULL, 0, 1, '2019-02-27 04:36:18', '2019-02-28 09:36:35'),
(5, ' Sách bán chạy', 'sach-ban-chay', NULL, 1, 1, '2019-02-27 04:41:28', '2019-03-10 16:58:10'),
(7, 'Sách Môn Toán', 'sach-mon-toan', NULL, 0, 1, '2019-02-27 05:01:30', '2019-02-28 09:28:36'),
(10, 'Sách Môn Lý', 'sach-mon-ly', NULL, 0, 1, '2019-02-28 09:28:52', '2019-03-10 16:58:34'),
(11, 'Sách Môn Hóa', 'sach-mon-hoa', NULL, 0, 1, '2019-02-28 09:29:00', '2019-03-10 16:58:38'),
(12, 'Sách Môn Sinh', 'sach-mon-sinh', NULL, 0, 1, '2019-02-28 09:29:09', '2019-03-10 16:58:37'),
(13, ' Sách Lớp 11', 'sach-lop-11', NULL, 0, 1, '2019-02-28 09:30:11', '2019-03-08 05:06:44'),
(14, 'Sách Lớp 10', 'sach-lop-10', NULL, 0, 1, '2019-02-28 09:34:38', '2019-02-28 09:34:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(20) NOT NULL,
  `transaction_id` int(20) NOT NULL,
  `product_id` int(20) NOT NULL,
  `qty` int(20) NOT NULL,
  `price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `transaction_id`, `product_id`, `qty`, `price`) VALUES
(3, 2, 1, 1, 199000),
(4, 3, 18, 1, 199000),
(5, 4, 19, 1, 199000),
(6, 4, 20, 1, 199000),
(7, 4, 18, 1, 199000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(20) NOT NULL,
  `category_id` int(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(20) DEFAULT NULL,
  `sale` int(20) DEFAULT NULL,
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publishing_home` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `codebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkdrive` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `slug`, `price`, `sale`, `images`, `author`, `publishing_home`, `content`, `codebook`, `linkdrive`, `created_at`, `update_at`) VALUES
(1, 1, 'Mới Đọc thử Đột phá 8+ thi THPT quốc gia môn Địa lý', 'moi-doc-thu-dot-pha-8-thi-thpt-quoc-gia-mon-dia-ly', 199000, 250000, 'địa.jpg', '', 'NXB Đại học Quốc gia Hà Nội', 'Cuốn sách Đột phá 8+ thi THPT Quốc gia môn Địa lý là sản phẩm của đội ngũ giáo viên của CCBook. Kiến thức trong sách bao gồm 3 lớp 10, 11,12 với mong muốn hỗ trợ học sinh ôn thi THPT đạt điểm số môn Địa lý cao nhất trong kỳ thi THPT Quốc gia năm 2019.', '#TH1', 'https://drive.google.com/file/d/1QbqZVjHTao1EhJQuO-yCcXpaeNIEFqIL/view', NULL, NULL),
(2, 1, 'Sách Đột phá 8+ thi THPT quốc gia môn Lịch Sử', 'sach-dot-pha-8-thi-thpt-quoc-gia-mon-lich-su', 199000, 250000, 'sử.jpg', '', 'NXB Đại học Quốc gia Hà Nội', 'Cuốn sách Đột phá 8+ thi THPT Quốc gia môn Lịch sử là sản phẩm của đội ngũ giáo viên của CCBook. Kiến thức trong sách bao gồm 3 lớp 10, 11,12 với mong muốn hỗ trợ học sinh ôn thi THPT đạt điểm số môn Lịch sử cao nhất trong kỳ thi THPT Quốc gia năm 2019.', '#TH2', 'https://drive.google.com/file/d/1VY312z2KEBnKJdCbQzb6pqzGGrIuzN29/view', NULL, NULL),
(3, 1, 'Đột phá 8+ kì thi THPT Quốc gia môn Ngữ Văn', 'dot-pha-8-ki-thi-thpt-quoc-gia-mon-ngu-van', 199000, 250000, 'văn.jpg', '', 'NXB Đại học Quốc gia Hà Nội', 'Cuốn sách Đột phá 8+ thi THPT Quốc gia môn Ngữ văn là sản phẩm của đội ngũ giáo viên của THbook. Kiến thức trong sách bao gồm 3 lớp 10, 11,12 với mong muốn hỗ trợ học sinh ôn thi THPT đạt điểm số môn Ngữ văn cao nhất trong kỳ thi THPT Quốc gia năm 2019.\r\n\r\n', '#TH3', 'https://drive.google.com/file/d/1T2gRi9w4SJaPUDo2pRId4TFag44y2pH3/view', NULL, NULL),
(4, 1, 'Đột phá 8+ kì thi THPT Quốc gia môn Toán - Tập 2: Hình học', 'dot-pha-8-ki-thi-thpt-quoc-gia-mon-toan---tap-2-hinh-hoc', 199000, 250000, 'Toán-hình.png', 'Lê Phương Anh', 'NXB Đại học Quốc gia Hà Nội', 'Cuốn sách Đột phá 8+ thi THPT Quốc gia môn Toán – Tập 2: Hình học là sản phẩm của đội ngũ giáo viên của THbook. Kiến thức trong sách bao gồm 3 lớp 10, 11,12 với mong muốn hỗ trợ học sinh ôn thi THPT đạt điểm số môn Toán – Tập 2: Hình học cao nhất trong kỳ thi THPT Quốc gia năm 2019.\r\n\r\n', '#TH4', 'https://drive.google.com/file/d/18nM27T9TEbcrTc9P3aiwH3kYxLApIjEr/view', NULL, NULL),
(5, 1, 'Đột phá 8+ thi THPT quốc gia môn Toán - Tập 1: Đại số và giải tích', 'dot-pha-8-thi-thpt-quoc-gia-mon-toan---tap-1-dai-so-va-giai-tich', 199000, 250000, 'Đại-số-và-giải-tích.png', 'Nguyễn Thị Tuyết, Lê Phương Anh', 'NXB Đại học Quốc gia Hà Nội', 'Cuốn sách Đột phá 8+ thi THPT Quốc gia môn Toán là sản phẩm của đội ngũ giáo viên của THbook. Kiến thức trong sách bao gồm 3 lớp 10, 11,12 với mong muốn hỗ trợ học sinh ôn thi THPT đạt điểm số môn Toán cao nhất trong kỳ thi THPT Quốc gia năm 2019.\r\n\r\n', '#TH5', 'https://drive.google.com/file/d/1xfacdvqkP0OAimjW1j8K4TZ3RcKvcf72/view', NULL, NULL),
(6, 1, 'Đột phá 8+ thi THPT quốc gia môn Sinh học', 'dot-pha-8-thi-thpt-quoc-gia-mon-sinh-hoc', 199000, 250000, 'sinh.png', 'Hà Thị Ngọc Anh, Đoàn Ngọc Lâm', 'NXB Đại học Quốc gia Hà Nội', 'Cuốn sách Đột phá 8+ thi THPT Quốc gia môn Vật lý là sản phẩm của đội ngũ giáo viên của THook. Kiến thức trong sách bao gồm 3 lớp 10, 11,12 với mong muốn hỗ trợ học sinh ôn thi THPT đạt điểm số môn Vật lý cao nhất trong kỳ thi THPT Quốc gia năm 2019.\r\n\r\n', '#TH6', 'https://drive.google.com/file/d/1hpslPQyz7B9tg2ZfHnMDDUrQAmcgjxTy/view', NULL, NULL),
(7, 1, 'Đột phá 8+ thi THPT quốc gia môn Hóa học', 'dot-pha-8-thi-thpt-quoc-gia-mon-hoa-hoc', 199000, 250000, 'hóa.png', 'Nguyễn Thị Quỳnh Thơ, Phạm Thị Kim Ngân', 'NXB Đại học Quốc gia Hà Nội', 'Cuốn sách Đột phá 8+ thi THPT Quốc gia môn hóa học năm 2019 là sản phẩm của đội ngũ giáo viên của THbook. Kiến thức trong sách bao gồm đầy đủ cả 3 lớp 10, 11,12. Xuất phát từ mong muốn hỗ trợ học sinh ôn thi THPT đạt điểm số môn Hóa học cao nhất trong kỳ thi THPT Quốc gia năm 2019. Đây chắc chắn sẽ là trợ thủ đắc lực cho teen 2001.\r\n\r\n', '#TH7', 'https://drive.google.com/file/d/1PFnSVw_d698Dr28EJHQrMuy-H7E8Hy7r/view', NULL, NULL),
(8, 1, 'Đột phá 8+ thi THPT quốc gia môn Vật lý', 'dot-pha-8-thi-thpt-quoc-gia-mon-vat-ly', 199000, 250000, 'lý-1.png', 'Trịnh Lê Hoàng, Nguyễn Văn Tuyên', 'NXB Đại học Quốc gia Hà Nội', 'Cuốn sách Đột phá 8+ thi THPT Quốc gia môn Vật lý là sản phẩm của đội ngũ giáo viên của Thbook. Kiến thức trong sách bao gồm 3 lớp 10, 11,12 với mong muốn hỗ trợ học sinh ôn thi THPT đạt điểm số môn Vật lý cao nhất trong kỳ thi THPT Quốc gia năm 2019.\r\n\r\n', '#TH8', 'https://drive.google.com/file/d/1OkPK4ThYkHDsIGLEBCBKzUj8G1OMCBCy/view', NULL, NULL),
(9, 7, 'Đột phá 8+ thi THPT quốc gia môn Toán - Tập 1: Đại số và giải tích', 'dot-pha-8-thi-thpt-quoc-gia-mon-toan---tap-1-dai-so-va-giai-tich', 199000, 250000, 'Đại-số-và-giải-tích.png', 'Nguyễn Thị Tuyết, Lê Phương Anh', 'NXB Đại học Quốc gia Hà Nội', 'Cuốn sách Đột phá 8+ thi THPT Quốc gia môn Toán là sản phẩm của đội ngũ giáo viên của THbook. Kiến thức trong sách bao gồm 3 lớp 10, 11,12 với mong muốn hỗ trợ học sinh ôn thi THPT đạt điểm số môn Toán cao nhất trong kỳ thi THPT Quốc gia năm 2019.\r\n\r\n', '#TH10', 'https://drive.google.com/file/d/1xfacdvqkP0OAimjW1j8K4TZ3RcKvcf72/view', NULL, NULL),
(10, 7, 'Làm chủ môn Toán trong 30 ngày Giải tích 12 - Quyển 2', 'lam-chu-mon-toan-trong-30-ngay-giai-tich-12---quyen-2', 180000, 200000, 'lam-chu-toan-trong-30-ngay-giai-tich-lop-12-quyen-2.png', 'Nhóm tác giả Lê Hồng Đức', 'Đại Học Quốc Gia Hà Nội', 'Sách nằm trong Seri 8 cuốn Làm chủ môn Toán trong 30 ngày của tác giả Lê Hồng Đức, sách đi sâu vào việc cung cấp các kĩ năng để học sinh có thể làm tốt trắc nghiệm Toán chuyên đề Nguyên hàm, Tích phân, Số phức\r\n\r\n', '#TH11', 'https://drive.google.com/file/d/1R_GcjEaubzNErw_SbyUcg8EEcp6NYJkX/view', NULL, NULL),
(11, 7, 'Làm chủ môn Toán trong 30 ngày - Đại số và giải tích lớp 11 (tập 2)', 'lam-chu-mon-toan-trong-30-ngay---dai-so-va-giai-tich-lop-11-tap-2', 180000, 200000, 'lam-chu-toan-trong-30-ngay-lop11-tap-2.png', 'Nhóm tác giả Lê Hồng Đức', 'Đại Học Quốc Gia Hà Nội', 'Sách là 1 trong 3 cuốn của bộ Làm chủ môn Toán trong 30 ngày lớp 11. Sách được tích hợp cùng Hệ sinh thái Học dễ 6.0 của SPBook với các tiện ích bổ trợ cho việc học sách như: video, mindmap, ngân hàng đề thi thử, nhóm hỗ trợ học tập trọn đời sau mua sách...\r\n\r\n', '#TH12', 'https://drive.google.com/file/d/0Bx7_UjsCZD36R01yZTV0WmQ5dFk/view', NULL, NULL),
(12, 7, 'Làm chủ môn Toán trong 30 ngày Hình học 12', 'lam-chu-mon-toan-trong-30-ngay-hinh-hoc-12', 180000, 200000, 'lam-chu-mon-toan-trong-30-ngay-lop12-hinh-hoc.png', 'Nhóm tác giả Lê Hồng Đức', 'Đại Học Quốc Gia Hà Nội', 'Cuốn sách sẽ cung cấp cho các em học sinh tất cả kiến thức và kĩ năng cần thiết để có thể làm chủ được các nội dung Toán Hình học 12: khối đa diện, mặt nón - trụ -cầu, Tọa độ trong không gian. Những kiến thức và kĩ năng này, sẽ đảm bảo rằng: học sinh vừa hiểu được bản chất Toán của từng dạng bài, vừa có thể có tư duy nhanh để tìm ra đáp án của 1 đề Toán trắc nghiệm.\r\n\r\n', '#TH13', 'https://drive.google.com/file/d/0Bx7_UjsCZD36emZxeXhQdkt6dU0/view', NULL, '2019-03-10 05:27:48'),
(13, 7, 'Làm chủ môn Toán trong 30 ngày - Đại số và giải tích 11 tập 1', 'lam-chu-mon-toan-trong-30-ngay---dai-so-va-giai-tich-11-tap-1', 180000, 200000, 'lam-chu-toan-30-ngay-dai-so-và-giai-tich-11.png', 'Nhóm tác giả Lê Hồng Đức', 'Đại Học Quốc Gia Hà Nội', 'Sách thuộc seri sách Làm chủ môn Toán trong 30 ngày của THbook được tích hợp cùng Hệ sinh thái Học dễ 6.0. Nội dung sách tập trung vào các kiến thức lượng giác của Đại số 11 bao gồm: Góc lượng giác, công thức lượng giác, Hàm số lượng giác và phương trình lượng giác.\r\n\r\n', '#TH14', 'https://drive.google.com/file/d/0Bx7_UjsCZD36VHpwNzBuQi1uMmM/view', NULL, NULL),
(14, 7, 'Làm chủ môn Toán trong 30 ngày - Hình học 11', 'lam-chu-mon-toan-trong-30-ngay---hinh-hoc-11', 180000, 200000, 'Lam-chu-mon-toan-trong-30-ngay-lop-11-Hinh-hoc.png', 'Nhóm tác giả Lê Hồng Đức', 'Đại Học Quốc Gia Hà Nội', 'Cuốn sách này sẽ cung cấp cho các em những kiến thức từ cơ bản đến nâng cao thuộc chương trình Hình học 11 như: phép dời hình và đồng dạng trong mặt phẳng, quan hệ song song, quan hệ vuông góc... Đây là những kiến thức nền tảng quan trọng giúp em có thể học tốt được toàn bộ Hình học trong chương trình THPT\r\n\r\n', '#TH15', 'https://drive.google.com/file/d/0B-wNWw9WeJAhano1dVVXb2FlOTQ/view', NULL, NULL),
(15, 7, 'Làm chủ môn Toán trong 30 ngày Hình học 10', 'lam-chu-mon-toan-trong-30-ngay-hinh-hoc-10', 200000, 250000, 'LAM-CHU-MON-TOAN-TRONG-30-NGAY-HINHHOC.png', 'Nhóm tác giả Lê Hồng Đức', 'Đại Học Quốc Gia Hà Nội', 'Đây là một trong 8 cuốn thuộc seri sách Làm chủ môn Toán trong 30 ngày của THbook. Sách được tích hợp cùng Hệ sinh thái Học dễ 6.0 nhằm giúp em học và nắm chắc các kiến thức Hình học 10: Vec tơ, Tích vô hướng của 2 vec tơ và ứng dụng, phương pháp tọa độ trong mặt phẳng.\r\n\r\n', '#TH16', 'https://drive.google.com/file/d/0B-wNWw9WeJAhNmhrRFB0ZXpoZkU/view', NULL, NULL),
(16, 7, 'Làm chủ môn Toán trong 30 ngày Đại số 10', 'lam-chu-mon-toan-trong-30-ngay-dai-so-10', 225000, 250000, 'Lam-chu-mon-Toan10-trong-30-Dai-so-10.png', 'Nhóm tác giả Lê Hồng Đức', 'Đại Học Quốc Gia Hà Nội', 'Đây là một trong 8 cuốn thuộc seri sách Làm chủ môn Toán trong 30 ngày của THbook. Sách được tích hợp cùng Hệ sinh thái Học dễ 6.0 nhằm giúp em học và nắm chắc các kiến thức Đại số 10: Mệnh đề - Tổ hợp, Hàm số, Phương trình bậc nhất – bậc hai, Bất Đẳng thức – Bất phương trình, Thống kê.\r\n\r\n', '#TH17', 'https://drive.google.com/file/d/0B-wNWw9WeJAheUZObHdfTW5zRHM/view', NULL, NULL),
(17, 7, 'Phương pháp siêu tốc giải trắc nghiệm môn Toán chuyên đề Hình học giải tích trong không gian', 'phuong-phap-sieu-toc-giai-trac-nghiem-mon-toan-chuyen-de-hinh-hoc-giai-tich-trong-khong-gian', 125000, 150000, 'phương-pháp-siêu-tốc-giải-môn-Toán.png', 'Phạm Hoàng Hà, Lương Đức Trọng, Đặng Đình Hanh', 'Đại Học Quốc Gia Hà Nội', 'Đây là cuốn sách đầu tiên viết chuyên sâu về chuyên đề Hình học giải tích trong không gian áp dụng với hình thức thi trắc nghiệm. Tác giả biên soạn sách Cuốn sách được biên soạn bởi bộ 3 tác giả Lương Đức Trọng – Đặng Đình Hanh – Phạm Hoàng Hà\r\n\r\n', '#TH18', 'https://drive.google.com/file/d/0Bx7_UjsCZD36SWNCN2FzWVRrOTA/preview', NULL, NULL),
(18, 5, 'Đột phá 8+ thi THPT quốc gia môn Toán - Tập 1: Đại số và giải tích', 'dot-pha-8-thi-thpt-quoc-gia-mon-toan---tap-1-dai-so-va-giai-tich', 199000, 250000, 'Đại-số-và-giải-tích.png', 'Nguyễn Thị Tuyết, Lê Phương Anh', 'NXB Đại học Quốc gia Hà Nội', 'Cuốn sách Đột phá 8+ thi THPT Quốc gia môn Toán là sản phẩm của đội ngũ giáo viên của THbook. Kiến thức trong sách bao gồm 3 lớp 10, 11,12 với mong muốn hỗ trợ học sinh ôn thi THPT đạt điểm số môn Toán cao nhất trong kỳ thi THPT Quốc gia năm 2019.\r\n\r\n', '#TH19', 'https://drive.google.com/file/d/1xfacdvqkP0OAimjW1j8K4TZ3RcKvcf72/view', NULL, NULL),
(19, 5, 'Đột phá 8+ thi THPT quốc gia môn Sinh học', 'dot-pha-8-thi-thpt-quoc-gia-mon-sinh-hoc', 199000, 250000, 'sinh.png', 'Hà Thị Ngọc Anh, Đoàn Ngọc Lâm', 'NXB Đại học Quốc gia Hà Nội', 'Cuốn sách Đột phá 8+ thi THPT Quốc gia môn Vật lý là sản phẩm của đội ngũ giáo viên của THbook. Kiến thức trong sách bao gồm 3 lớp 10, 11,12 với mong muốn hỗ trợ học sinh ôn thi THPT đạt điểm số môn Vật lý cao nhất trong kỳ thi THPT Quốc gia năm 2019.\r\n\r\n', '#TH20', 'https://drive.google.com/file/d/1hpslPQyz7B9tg2ZfHnMDDUrQAmcgjxTy/view', NULL, NULL),
(20, 5, 'Đột phá 8+ thi THPT quốc gia môn Hóa học', 'dot-pha-8-thi-thpt-quoc-gia-mon-hoa-hoc', 199000, 250000, 'hóa.png', 'Nguyễn Thị Quỳnh Thơ, Phạm Thị Kim Ngân', 'NXB Đại học Quốc gia Hà Nội', 'Cuốn sách Đột phá 8+ thi THPT Quốc gia môn hóa học năm 2019 là sản phẩm của đội ngũ giáo viên của THbook. Kiến thức trong sách bao gồm đầy đủ cả 3 lớp 10, 11,12. Xuất phát từ mong muốn hỗ trợ học sinh ôn thi THPT đạt điểm số môn Hóa học cao nhất trong kỳ thi THPT Quốc gia năm 2019. Đây chắc chắn sẽ là trợ thủ đắc lực cho teen 2001.\r\n\r\n', '#TH21', 'https://drive.google.com/file/d/1PFnSVw_d698Dr28EJHQrMuy-H7E8Hy7r/view', NULL, NULL),
(21, 5, 'Đột phá 8+ thi THPT quốc gia môn Vật lý', 'dot-pha-8-thi-thpt-quoc-gia-mon-vat-ly', 199000, 250000, 'lý-1.png', 'Trịnh Lê Hoàng, Nguyễn Văn Tuyên', 'NXB Đại học Quốc gia Hà Nội', 'Cuốn sách Đột phá 8+ thi THPT Quốc gia môn Vật lý là sản phẩm của đội ngũ giáo viên của THbook. Kiến thức trong sách bao gồm 3 lớp 10, 11,12 với mong muốn hỗ trợ học sinh ôn thi THPT đạt điểm số môn Vật lý cao nhất trong kỳ thi THPT Quốc gia năm 2019.\r\n\r\n', '#Th21', 'https://drive.google.com/file/d/1OkPK4ThYkHDsIGLEBCBKzUj8G1OMCBCy/view', NULL, NULL),
(22, 5, 'Ngữ pháp và giải thích ngữ pháp tiếng Anh cơ bản và nâng cao 20/80 tập 1', 'ngu-phap-va-giai-thich-ngu-phap-tieng-anh-co-ban-va-nang-cao-2080-tap-1', 200000, 250000, 'tieng-anh-11.png', 'Vũ Mai Phương', 'Đại Học Quốc Gia Hà Nội', 'Đây là một trong những đầu sách bán chạy nhất trong tủ sách luyện thi của THbook. Sách hệ thống lại các kiến thức Ngữ pháp tiếng Anh thông dụng phù hợp với xu thế thi mới. Sách có độ phủ rộng về đối tượng sử dụng bao gồm: học sinh THCS, THPT, sinh viên, người đi làm hay bất kì ai muốn thi lấy chứng chỉ tiếng Anh quốc tế.\r\n\r\n', '#TH22', 'https://drive.google.com/file/d/0B_RGo9o9MoGyQkFadFA3VWtELTA/view', NULL, NULL),
(23, 10, 'Đột phá 8+ thi THPT quốc gia môn Vật lý', 'dot-pha-8-thi-thpt-quoc-gia-mon-vat-ly', 199000, 250000, 'lý-1.png', 'Trịnh Lê Hoàng, Nguyễn Văn Tuyên', 'NXB Đại học Quốc gia Hà Nội', 'Cuốn sách Đột phá 8+ thi THPT Quốc gia môn Vật lý là sản phẩm của đội ngũ giáo viên của Thbook. Kiến thức trong sách bao gồm 3 lớp 10, 11,12 với mong muốn hỗ trợ học sinh ôn thi THPT đạt điểm số môn Vật lý cao nhất trong kỳ thi THPT Quốc gia năm 2019.\r\n\r\n', '#Th23', 'https://drive.google.com/file/d/1OkPK4ThYkHDsIGLEBCBKzUj8G1OMCBCy/view', NULL, NULL),
(24, 10, 'Bí quyết 6.0 chinh phục môn Vật lý tập 2', 'bi-quyet-60-chinh-phuc-mon-vat-ly-tap-2', 199000, 225000, 'bi-quyet-6.0-chinh-phuc-mon-vat-ly-tap-2.jpg', 'Nhiều tác giả', 'Đại Học Quốc Gia Hà Nội', 'Sách được biên soạn dựa trên nền tảng của bộ Phương pháp siêu tốc giải trắc nghiệm KHTN môn Vật lý được Thbook phát hành vào tháng 1/2017. Đồng thời, sách có tích hợp cùng những tiện ích thuộc Hệ sinh thái Học dễ 6.0, nhằm giúp các em học sinh tự tin giải quyết các bài tập thuộc 4 chương: Dao động và Sóng điện từ, Sóng ánh sáng, Lượng tử ánh sáng, Hạt nhân nguyên tử trong chương trình Vật lý lớp 12.\r\n\r\n', '#TH24', 'https://drive.google.com/file/d/0B-wNWw9WeJAhd0c1ZzFSTFl5Rmc/view', NULL, NULL),
(25, 10, 'Bí quyết 6.0 chinh phục môn Vật lý tập 1', 'bi-quyet-60-chinh-phuc-mon-vat-ly-tap-1', 199000, 225000, 'bi-quyet-6.0-chinh-phuc-mon-vat-ly-tap-1.jpg', 'Nhiều tác giả', 'Đại Học Quốc Gia Hà Nội', 'Nội dung của sách Bí quyết 6.0 chinh phục môn Vật lý tập 1 được xây dựng dựa trên nền tảng là cuốn Phương pháp siêu tốc giải trắc nghiệm KHTN môn Vật lý tập 1 được Thbookphát hành vào tháng 1/2017– sách được chỉnh sửa bổ sung nhiều về nội dung, đồng thời có tích hợp 6 tiện ích trong Hệ sinh thái Học dễ 6.0 của SPBook.\r\n\r\n', '#TH25', 'https://drive.google.com/file/d/0B-wNWw9WeJAhUUxEdlRyMkpWMFU/view', NULL, NULL),
(26, 10, 'Phương pháp siêu tốc giải trắc nghiệm Khoa học tự nhiên môn Vật lý tập 1', 'phuong-phap-sieu-toc-giai-trac-nghiem-khoa-hoc-tu-nhien-mon-vat-ly-tap-1', 180000, 200000, 'phương-pháp-luyện-siêu-tốc-Vật-lí.png', 'Nguyễn Anh Vinh, Nguyễn Hoàn Long, Nguyễn Văn Tuyên', 'Đại Học Quốc Gia Hà Nội', 'Phương pháp siêu tốc giải trắc nghiệm KHTN môn Vật lý là một trong những đầu sách tham khảo chuyên sâu về môn Vật lý do THbook phát hành trong năm 2017. Sách gồm 2 tập, tập trung vào những kiến thức trọng tâm, cơ bản, đồng thời có mở rộng, đi sâu vào những dạng bài tập khó giúp các em chinh phục được điểm 9, 10. Sách có phân dạng đầy đủ, được trình bày theo lối dẫn dắt, chi tiết, dễ hiểu nhằm giúp em học với tâm lý nhẹ nhàng nhưng hoàn toàn có thể đạt điểm cao trong kì thi THPT Quốc gia sắp tới.\r\n\r\n', '#TH26', 'https://drive.google.com/file/d/0Bx7_UjsCZD36SXQ2cWtpdW1DNzA/preview', NULL, NULL),
(27, 10, 'Dạy học vật lý thông qua các nhà khoa học', 'day-hoc-vat-ly-thong-qua-cac-nha-khoa-hoc', 100000, 150000, 'Dạy-học-vật-lí-thông-qua-các-nhà-khoa-học.png', 'NGUYỄN PHÚC THUẦN, NGUYỄN TRỌNG DŨNG', 'Đại Học Quốc Gia Hà Nội', '… Câu chuyện về các nhà khoa học Vật lý luôn là cảm hứng mãnh liệt đối với những ai ưa thích quan sát, tìm tòi, lý giải các hiện tượng tự nhiên, đặc biệt là với các em học sinh ở cấp học Trung học cơ sở - lứa tuổi bắt đầu được tiếp xúc với môn học Vật lý. Và dù bạn là ai, nếu bạn có chung niềm yêu thích khám phá những câu chuyện thú vị về các nhà Vật lý học, hãy cùng SPBook trải nghiệm đầu sách mới – “Dạy học Vật lý thông qua các nhà khoa học”!\r\n\r\n', '#TH27', '', NULL, NULL),
(28, 10, 'Cẩm nang ôn luyện thi THPT quốc gia môn vật lý tập 2', 'cam-nang-on-luyen-thi-thpt-quoc-gia-mon-vat-ly-tap-2', 150000, 200000, 'Cam-nang-vat-ly-tap-2.png', 'Ths. Vương Văn Cường', 'Đại Học Quốc Gia Hà Nội', 'Cuốn sách vật lý được mong đợi nhất của năm 2015. Tập II bao gồm các phần: Dao động và sóng điện từ; Sóng ánh sáng; Lượng tử ánh sáng; Vật lý hạt nhân và Phụ lục các kiến thức thuộc chương trình nâng cao.\r\n\r\n', '#TH28', '', NULL, NULL),
(29, 10, 'Cẩm nang ôn luyện thi THPT quốc gia môn vật lý tập 1', 'cam-nang-on-luyen-thi-thpt-quoc-gia-mon-vat-ly-tap-1', 110000, 150000, 'vat-ly11.png', 'hs. Vương Văn Cường', 'Đại Học Quốc Gia Hà Nội', 'Đây là cuốn cẩm nang Vật lý được mong đợi nhất trong năm 2015, tập I bao gồm kiến thức thuộc các phần: Dao động điều hòa; Sóng cơ học và Dòng điện xoay chiều.\r\n\r\n', '#TH29', '', NULL, NULL),
(30, 11, 'Đột phá 8+ thi THPT quốc gia môn Hóa học', 'dot-pha-8-thi-thpt-quoc-gia-mon-hoa-hoc', 199000, 250000, 'hóa.png', ' Nguyễn Thị Quỳnh Thơ, Phạm Thị Kim Ngân', 'NXB Đại học Quốc gia Hà Nội', 'Cuốn sách Đột phá 8+ thi THPT Quốc gia môn hóa học năm 2019 là sản phẩm của đội ngũ giáo viên của THbook. Kiến thức trong sách bao gồm đầy đủ cả 3 lớp 10, 11,12. Xuất phát từ mong muốn hỗ trợ học sinh ôn thi THPT đạt điểm số môn Hóa học cao nhất trong kỳ thi THPT Quốc gia năm 2019. Đây chắc chắn sẽ là trợ thủ đắc lực cho teen 2001.\r\n\r\n', '#TH30', 'https://drive.google.com/file/d/1PFnSVw_d698Dr28EJHQrMuy-H7E8Hy7r/view', NULL, NULL),
(31, 11, 'Combo 2 cuốn Làm chủ môn Hóa trong 30 ngày Tập 1 + Tập 2', 'combo-2-cuon-lam-chu-mon-hoa-trong-30-ngay-tap-1-tap-2', 400000, 550000, 'combo-2-cuon-lam-chu-hoa.jpg', '', 'Đại Học Quốc Gia Hà Nội', 'Làm chủ môn Hóa trong 30 ngày là bộ sách gồm 2 tập Hữu Cơ và Vô cơ, khi nói về cuốn sách này, tác giả Lê Đăng Khương đã nhận định “ cuốn sách giúp bất kì một học sinh nào không biết về Hóa trở nên vô cùng tự tin và đương nhiên thi đại học trở nên quá đơn giản”\r\n\r\n', '#TH31', '', NULL, NULL),
(32, 11, 'Combo 4 cuốn Làm chủ ôn thi khối B', 'combo-4-cuon-lam-chu-on-thi-khoi-b', 800000, 950000, 'combo-4-cuon-lch-lcs-bo-de-sinh-.png', '', 'NXB Đại học Quốc gia Hà Nội', 'Khi mua Combo 4 cuốn thuộc bộ Làm chủ ôn thi Đại học khối B bạn sẽ tiết kiệm được 350.000 VNĐ\r\n\r\n', '#TH32', '', NULL, NULL),
(33, 11, 'Làm chủ môn Hóa trong 30 ngày - tập 1 - tái bản lần 2', 'lam-chu-mon-hoa-trong-30-ngay---tap-1---tai-ban-lan-2', 200000, 300000, 'hoa2.png', 'Lê Đăng Khương', 'Đại Học Quốc Gia Hà Nội', 'Làm chủ môn Hóa trong 30 ngày tập 1 - hóa Hữu cơ - tái bản lần 2 - là một trong những đầu sách bán chạy nhất tại THbook. Cuốn sách này cùng với cuốn tập 2 - hóa Vô cơ đã trở thành cuốn sách gối đầu giường và hiện thực hóa giấc mơ vào đại học của nhiều sĩ tử Việt.\r\n\r\n', '#TH33', 'https://drive.google.com/file/d/0Bx7_UjsCZD36dW9yN19aZHIydXc/view', NULL, NULL),
(34, 11, 'Làm chủ môn Hóa trong 30 ngày tập 1 Hóa Hữu cơ - Tái bản lần 3', 'lam-chu-mon-hoa-trong-30-ngay-tap-1-hoa-huu-co---tai-ban-lan-3', 200000, 250000, 'phoi-canh-sach-hoa-1.png', 'Lê Đăng Khương', 'Đại Học Quốc Gia Hà Nội', 'Tập 1 Hóa vô cơ là cuốn nằm  trong bộ sách gồm 2 tập \" Làm chủ môn Hóa trong 30 ngày\" của tác giả Lê Đăng Khương. Đây là phiên bản mới nhất được tái bản vào tháng 8 năm 2017 có tích hợp cùng Hệ sinh thái Học dễ 6.0 của THbook nhằm mục đích giúp việc học và ôn thi Hóa Hữu cơ của em trở nên dễ dàng và hứng thú hơn.\r\n\r\n', '#TH34', 'https://drive.google.com/file/d/0B_RGo9o9MoGyU1V0VUhaOHZkQ3M/view', NULL, NULL),
(35, 11, 'Phương pháp siêu tốc giải trắc nghiệm KHTN môn Hóa học tập 1', 'phuong-phap-sieu-toc-giai-trac-nghiem-khtn-mon-hoa-hoc-tap-1', 180000, 250000, 'PPSThoa-1.png', 'Lê Phạm Thành', 'Đại Học Quốc Gia Hà Nội', 'Đây là một trong 6 cuốn sách luyện thi đại học năm 2017 do SPBook phát hành. Sách đi sâu giải quyết các vấn đề lý thuyết, các dạng bài tập trong 5 chuyên đề: Este – Lipit, Cacbonhidrat, Amin – Amino axit – Protein, Polime. Đồng thời, sách có riêng 1 chuyên đề về các dạng bài tập nâng cao hay – lạ - khó, giúp các em chinh phục điểm 9, 10 hoặc ôn thi học sinh giỏi các cấp. Sách bao gồm: Sách màu + mindmap A5 rời+ nhóm kín\r\n\r\n', '#TH35', '', NULL, NULL),
(36, 11, 'Bộ đề Ôn luyện thi trắc nghiệm THPT Quốc gia năm 2017 KHTN môn Hóa học', 'bo-de-on-luyen-thi-trac-nghiem-thpt-quoc-gia-nam-2017-khtn-mon-hoa-hoc', 179000, 200000, 'Bộ-đề-ôn-luyện-trắc-nghiệm-Hóa-học.png', 'Nguyễn Thành Sơn, Lê Phạm Thành', 'Đại Học Quốc Gia Hà Nội', '“Bộ đề Ôn luyện thi trắc nghiệm THPT Quốc gia năm 2017 KHTN môn Hóa học” là tuyển tập 25 đề mẫu chuẩn theo định hướng thi THPT Quốc gia năm 2017 – đáp ứng được nhu cầu tìm đề trắc nghiệm Hóa tự luyện của các em hiện nay. Sách là một trong những cuốn tiêu biểu trong tủ sách luyện thi của THbook do thầy Lê Phạm Thành (chủ biên) – thầy Nguyễn Thành Sơn biên soạn.\r\n\r\n', '#TH36', 'https://drive.google.com/file/d/0Bx7_UjsCZD36SmtOQzJOcTN6Ymc/view', NULL, NULL),
(37, 11, 'Làm chủ môn hoá trong 30 ngày Tập 2 Hóa Vô cơ - tái bản lần 3', 'lam-chu-mon-hoa-trong-30-ngay-tap-2-hoa-vo-co---tai-ban-lan-3', 225000, 250000, 'hoa2.png', 'Lê Đăng Khương', 'Đại Học Quốc Gia Hà Nội', 'Nội dung của sách đi sâu vào việc cung cấp các kiến thức và kĩ năng cần thiết để các em có thể làm tốt mọi dạng bài tập hóa Vô Cơ. Đặc biệt hơn, sách khi được tái bản lần 3 vào tháng 8/2017 đã được tích hợp cùng Hệ sinh thái Học dễ 6.0 của THbook nhằm mục đích giúp việc học và ôn thi Hóa trở nên dễ dàng và hứng thú hơn.\r\n\r\n', '#TH37', 'https://drive.google.com/file/d/0Bx7_UjsCZD36UDdqTXNBa0l4dmc/preview', NULL, NULL),
(38, 11, 'BỘ ĐỀ LUYỆN THI THPT QUỐC GIA MÔN HOÁ', 'bo-de-luyen-thi-thpt-quoc-gia-mon-hoa', 99000, 150000, 'hoa.png', 'Nguyễn Văn Hải', 'Đại Học Quốc Gia Hà Nội', 'Kì thi Trung học phổ thông Quốc gia đầu tiên đang đến gần, trước nhiều băn khoăn, lo lắng của các em học sinh về môn thi Hoá học, cuốn sách “Bộ đề luyện thi THPT Quốc gia môn Hoá học” ra đời nhằm giúp các em ôn luyện hiệu quả cho kì thi này.\r\n\r\n', '#TH38', '', NULL, NULL),
(39, 12, 'Đột phá 8+ thi THPT quốc gia môn Sinh học', 'dot-pha-8-thi-thpt-quoc-gia-mon-sinh-hoc', 198999, 250000, 'sinh.png', 'Hà Thị Ngọc Anh, Đoàn Ngọc Lâm', 'NXB Đại học Quốc gia Hà Nội', 'Cuốn sách Đột phá 8+ thi THPT Quốc gia môn Vật lý là sản phẩm của đội ngũ giáo viên của THbook. Kiến thức trong sách bao gồm 3 lớp 10, 11,12 với mong muốn hỗ trợ học sinh ôn thi THPT đạt điểm số môn Vật lý cao nhất trong kỳ thi THPT Quốc gia năm 2019.\r\n\r\n', '#TH39', 'https://drive.google.com/file/d/1hpslPQyz7B9tg2ZfHnMDDUrQAmcgjxTy/view', NULL, NULL),
(40, 12, 'Bí quyết chinh phục lý thuyết Sinh học', 'bi-quyet-chinh-phuc-ly-thuyet-sinh-hoc', 225000, 250000, 'bi-quyet-chinh-phuc-ly-tuyet-mon-sinh.png', 'Thịnh Nam', 'Đại Học Quốc Gia Hà Nội', 'Đây là cuốn sách có đầy đủ các dạng bài tập, các câu hỏi khó liên quan đến bài tập đếm thuộc các chuyên đề: di truyền, biến dị, tiến hóa, sinh thái... Cuốn sách này phù hợp cho các bạn có học lực từ khá - giỏi, và có mục tiêu cầm chắc điểm 9, 10 Sinh trong tay.\r\n\r\n', '#TH40', 'https://drive.google.com/file/d/0Bx7_UjsCZD36RlQwYkM0clRjZ3c/view', NULL, NULL),
(41, 12, 'Phương pháp siêu tốc giải trắc nghiệm KHTN môn Sinh học tập 2', 'phuong-phap-sieu-toc-giai-trac-nghiem-khtn-mon-sinh-hoc-tap-2', 225000, 250000, 'phương-pháp-giải-trắc-nghiệm-siêu-tốc-sinh-học.png', 'Thịnh Nam', 'Đại Học Quốc Gia Hà Nội', 'Tiếp nối các chuyên đề trong tập 1, tập 2 tập trung vào giải quyết các vấn đề về lý thuyết, phân dạng bài tập thuộc 5 chuyên đề: Quy luật di truyền – một gen trên một NST, Quy luật di truyền – một gen trên nhiều NST; Di truyền học quần thể; Di truyền học người; Ứng dụng di truyền học.\r\n\r\n', '#TH41', 'https://drive.google.com/file/d/0Bx7_UjsCZD36VkRKck1RdXZlbW8/preview', NULL, NULL),
(42, 12, 'Phương pháp siêu tốc giải trắc nghiệm Khoa học tự nhiên môn Sinh học tập 1', 'phuong-phap-sieu-toc-giai-trac-nghiem-khoa-hoc-tu-nhien-mon-sinh-hoc-tap-1', 225000, 250000, 'phương-pháp-giải-trắc-nghiệm-siêu-tốc-sinh-học.png', 'Thịnh Nam', 'Đại Học Quốc Gia Hà Nội', 'Phương pháp siêu tốc giải trắc nghiệm Khoa học tự nhiên môn Sinh học là một trong các đầu sách được mong đợi nhất trong tủ sách luyện thi của SPBook. Sách sẽ nhấn mạnh, đi sâu giải quyết các vấn đề ở mức vận dụng, vận dụng cao, giúp các em hiện thực hóa mục tiêu chinh phục điểm 8, 9, 10 Sinh học.\r\n\r\n', '#TH42', 'https://drive.google.com/file/d/0Bx7_UjsCZD36eXJzNVZqUVR4RkE/preview', NULL, NULL),
(43, 12, 'Bộ đề ôn luyện thi trắc nghiệm THPT Quốc gia năm 2017 KHTN môn Sinh học', 'bo-de-on-luyen-thi-trac-nghiem-thpt-quoc-gia-nam-2017-khtn-mon-sinh-hoc', 179000, 200000, 'sinh_1.png', 'Thịnh Nam', 'Đại Học Quốc Gia Hà Nội', 'Kì thi THPT Quốc gia năm 2017 có nhiều đổi mới đặc biệt là cấu trúc đề thi cũng như hướng ra đề. Trước sự thay đổi đó buộc hướng giảng dạy cũng như sách tham khảo phải thay đổi để phù hợp với xu thế đề thi.Thấu hiểu những băn khoăn của các em khi tìm đề để tự luyện, THbook đã biên soạn và phát hành cuốn sách này\r\n\r\n', '#TH43', '', NULL, NULL),
(44, 14, 'Làm chủ môn Hóa trong 30 ngày - tập 1 - tái bản lần 2', 'lam-chu-mon-hoa-trong-30-ngay---tap-1---tai-ban-lan-2', 225000, 250000, 'hoa2.png', 'Lê Đăng Khương', 'Đại Học Quốc Gia Hà Nội', 'Làm chủ môn Hóa trong 30 ngày tập 1 - hóa Hữu cơ - tái bản lần 2 - là một trong những đầu sách bán chạy nhất tại THbook . Cuốn sách này cùng với cuốn tập 2 - hóa Vô cơ đã trở thành cuốn sách gối đầu giường và hiện thực hóa giấc mơ vào đại học của nhiều sĩ tử Việt.\r\n\r\n', '#TH43', 'https://drive.google.com/file/d/0Bx7_UjsCZD36dW9yN19aZHIydXc/view', NULL, NULL),
(45, 14, 'Làm chủ môn Toán trong 30 ngày Hình học 10', 'lam-chu-mon-toan-trong-30-ngay-hinh-hoc-10', 225000, 250000, 'LAM-CHU-MON-TOAN-TRONG-30-NGAY-HINHHOC.png', 'Nhóm tác giả Lê Hồng Đức', 'Đại Học Quốc Gia Hà Nội', 'Đây là một trong 8 cuốn thuộc seri sách Làm chủ môn Toán trong 30 ngày của Thbook . Sách được tích hợp cùng Hệ sinh thái Học dễ 6.0 nhằm giúp em học và nắm chắc các kiến thức Hình học 10: Vec tơ, Tích vô hướng của 2 vec tơ và ứng dụng, phương pháp tọa độ trong mặt phẳng.\r\n\r\n', '#TH44', 'https://drive.google.com/file/d/0B-wNWw9WeJAhNmhrRFB0ZXpoZkU/view', NULL, NULL),
(46, 14, 'Ngữ pháp và giải thích Ngữ pháp tiếng Anh cơ bản và nâng cao 20/80 tập 2', 'ngu-phap-va-giai-thich-ngu-phap-tieng-anh-co-ban-va-nang-cao-2080-tap-2', 200000, 255000, 'tieng-anh-1.png', 'Vũ Mai Phương', 'Đại Học Quốc Gia Hà Nội', 'Nếu như tập 1 của bộ sách tập trung vào 2 chương Ngữ pháp lớn là Từ loại và Các loại từ, thì ở tập 2, sách hệ thống lại các cấu trúc ngữ pháp về các loại thì, sự phối thì, các loại câu ...\r\n\r\n', '#TH45', 'https://drive.google.com/file/d/0B_RGo9o9MoGyVVRMWGN1OENDY3M/view', NULL, NULL),
(47, 13, 'Làm chủ môn Toán trong 30 ngày - Đại số và giải tích lớp 11 (tập 2)', 'lam-chu-mon-toan-trong-30-ngay---dai-so-va-giai-tich-lop-11-tap-2', 180000, 200000, 'lam-chu-toan-trong-30-ngay-lop11-tap-2 (1).png', 'Nhóm tác giả Lê Hồng Đức', 'Đại Học Quốc Gia Hà Nội', 'Sách là 1 trong 3 cuốn của bộ Làm chủ môn Toán trong 30 ngày lớp 11. Sách được tích hợp cùng Hệ sinh thái Học dễ 6.0 của THbook với các tiện ích bổ trợ cho việc học sách như: video, mindmap, ngân hàng đề thi thử, nhóm hỗ trợ học tập trọn đời sau mua sách...\r\n\r\n', '#TH46', 'https://drive.google.com/file/d/0Bx7_UjsCZD36R01yZTV0WmQ5dFk/view', NULL, NULL),
(48, 13, 'Bí quyết 6.0 chinh phục môn Vật lý tập 2', 'bi-quyet-60-chinh-phuc-mon-vat-ly-tap-2', 225000, 250000, 'bi-quyet-6.0-chinh-phuc-mon-vat-ly-tap-2.jpg', 'Nhiều tác giả', 'Đại Học Quốc Gia Hà Nội', 'Sách được biên soạn dựa trên nền tảng của bộ Phương pháp siêu tốc giải trắc nghiệm KHTN môn Vật lý được THbook phát hành vào tháng 1/2017. Đồng thời, sách có tích hợp cùng những tiện ích thuộc Hệ sinh thái Học dễ 6.0, nhằm giúp các em học sinh tự tin giải quyết các bài tập thuộc 4 chương: Dao động và Sóng điện từ, Sóng ánh sáng, Lượng tử ánh sáng, Hạt nhân nguyên tử trong chương trình Vật lý lớp 12.\r\n\r\n', '#TH47', 'https://drive.google.com/file/d/0B-wNWw9WeJAhd0c1ZzFSTFl5Rmc/view', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tran`
--

CREATE TABLE `tran` (
  `id` int(20) NOT NULL,
  `amount` int(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` int(20) DEFAULT NULL,
  `tel` int(20) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tran`
--

INSERT INTO `tran` (`id`, `amount`, `name`, `phone`, `tel`, `email`, `address`, `note`, `status`, `created_at`, `update_at`) VALUES
(2, 159000, 'nguyễn thanh dũng', 1682778240, 1682778240, 'dungsky482@gmail.com', 'hòa hải quận ngũ hành sơn đà nẵng', 'sad    ', 0, '2019-03-10 17:14:14', '2019-03-10 17:14:14'),
(3, 159000, 'lê văn hùng', 898162560, 898162560, 'dungsky482@gmail.com', 'hòa hải quận ngũ hành sơn đà nẵng', 'ok\r\n', 0, '2019-03-11 01:25:07', '2019-03-11 01:25:07'),
(4, 557000, 'Nguyễn Thanh Dũng', 898162560, 1682778240, 'dungsky482@gmail.com', '85 Trần đại nghĩa - Hòa quý - Quận ngũ hành sơn - Đa nẵng', 'Tôi không nhận được vào thứ 4, 5 hàng tuần', 1, '2019-03-11 13:14:31', '2019-03-11 13:14:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` int(15) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `phone`, `address`, `password`, `created_at`, `update_at`) VALUES
(2, 'tranhoang', 'tranhoang@gmail.com', 123456, 'đà nẵng, ', 'Dung1004@', NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `tran`
--
ALTER TABLE `tran`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `tran`
--
ALTER TABLE `tran`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `tran` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
