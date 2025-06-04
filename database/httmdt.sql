-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2025 at 08:34 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `httmđt`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(7, '.', '', '/storage/photos/1/Banner/banner1.jpg', NULL, 'active', '2025-06-02 20:28:38', '2025-06-02 20:28:38'),
(8, '.', '-2506032859-496', '/storage/photos/1/Banner/hat-lua-muc-nat-www-ngonluanho-net.jpg', NULL, 'active', '2025-06-02 20:28:59', '2025-06-02 20:28:59'),
(9, '.', '-2506033040-320', '/storage/photos/1/Banner/Noi-Hoi-Tu-Dac-San-Viet.-copy.jpg', NULL, 'active', '2025-06-02 20:30:40', '2025-06-02 20:30:40');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Kỳ Anh', 'ky-anh', 'active', '2025-06-02 20:36:37', '2025-06-02 20:36:37'),
(8, 'Bảo Minh', 'bao-minh', 'active', '2025-06-02 20:37:22', '2025-06-02 20:37:22'),
(9, 'Nếp Hương', 'nep-huong', 'active', '2025-06-02 20:37:57', '2025-06-02 20:37:57'),
(10, 'Mai Hoa', 'mai-hoa', 'active', '2025-06-02 20:39:02', '2025-06-02 20:39:02'),
(11, 'Thanh Long', 'thanh-long', 'active', '2025-06-02 20:39:25', '2025-06-02 20:39:25');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(12, 11, NULL, 2, 144000.00, 'new', 1, 160000.00, '2025-06-03 00:06:04', '2025-06-03 00:10:46'),
(13, 24, 7, 31, 31500.00, 'new', 1, 31500.00, '2025-06-03 00:24:32', '2025-06-03 00:25:37');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(13, 'Miền Bắc', 'mien-bac', NULL, '/storage/photos/1/Category/Mien-bac.gif', 1, NULL, NULL, 'active', '2025-06-02 20:32:08', '2025-06-02 20:32:08'),
(14, 'Miền Trung', 'mien-trung', NULL, '/storage/photos/1/Category/mien-trung2-1.gif', 1, NULL, NULL, 'active', '2025-06-02 20:32:33', '2025-06-02 20:32:33'),
(15, 'Miền Nam', 'mien-nam', NULL, '/storage/photos/1/Category/mien-nam2.gif', 1, NULL, NULL, 'active', '2025-06-02 20:32:57', '2025-06-02 20:32:57'),
(16, 'Hà Nội', 'ha-noi', NULL, NULL, 0, 13, NULL, 'active', '2025-06-02 20:33:19', '2025-06-02 20:33:19'),
(17, 'Hải Dương', 'hai-duong', NULL, NULL, 0, 13, NULL, 'active', '2025-06-02 20:33:35', '2025-06-02 20:33:49'),
(18, 'Nghệ An', 'nghe-an', NULL, NULL, 0, 14, NULL, 'active', '2025-06-02 20:34:06', '2025-06-02 20:34:06'),
(19, 'Hà Tĩnh', 'ha-tinh', NULL, NULL, 0, 14, NULL, 'active', '2025-06-02 20:34:19', '2025-06-02 20:34:19'),
(20, 'Đà Lạt', 'da-lat', NULL, NULL, 0, 15, NULL, 'active', '2025-06-02 20:34:53', '2025-06-02 20:34:53'),
(21, 'Bến Tre', 'ben-tre', NULL, NULL, 0, 15, NULL, 'active', '2025-06-02 20:35:10', '2025-06-02 20:35:10');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 'fixed', 300.00, 'active', NULL, NULL),
(2, '111111', 'percent', 10.00, 'active', NULL, NULL),
(5, 'abcd', 'fixed', 250.00, 'active', '2020-08-17 20:54:58', '2020-08-17 20:54:58');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` text NOT NULL,
  `email` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `message` longtext NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(4, 'huy', 'Về giá cả và chất lượng', 'user@gmail.com', NULL, '0987110044', 'giá rẻ lắm shop, chất lượng k phải bàn', '2025-06-03 23:26:33', '2025-06-03 23:25:35', '2025-06-03 23:26:33');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1),
(21, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(22, '2023_06_21_164432_create_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('1a317764-5744-4af6-9a41-3b6b0bbe7f68', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/che-lam-xu-doai\",\"fas\":\"fas fa-comment\"}', NULL, '2025-06-03 00:05:05', '2025-06-03 00:05:05'),
('2145a8e3-687d-444a-8873-b3b2fb77a342', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:31:21', '2020-08-15 07:31:21'),
('3af39f84-cab4-4152-9202-d448435c67de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 07:54:52', '2020-08-15 07:54:52'),
('4054cdc1-3868-4ca3-aaaf-7a07d85484aa', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/danh-cho-cac-ban-yeu-tra\",\"fas\":\"fas fa-comment\"}', NULL, '2025-06-03 00:04:27', '2025-06-03 00:04:27'),
('4a0afdb0-71ad-4ce6-bc70-c92ef491a525', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:51', '2020-08-17 21:13:51'),
('530d0fcd-354f-4083-ac13-a88fa17efcdd', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2025-06-03 00:25:37', '2025-06-03 00:25:37'),
('540ca3e9-0ff9-4e2e-9db3-6b5abc823422', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', '2020-08-15 07:30:44', '2020-08-14 07:12:28', '2020-08-15 07:30:44'),
('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:51:02', '2020-08-15 07:51:02'),
('5e91e603-024e-45c5-b22f-36931fef0d90', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t\",\"fas\":\"fa-star\"}', NULL, '2020-08-15 07:44:07', '2020-08-15 07:44:07'),
('73a3b51a-416a-4e7d-8ca2-53b216d9ad8e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
('7541d913-3aef-4cbf-a069-d984d2e67890', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/banh-da-vung-den\",\"fas\":\"fa-star\"}', NULL, '2025-06-03 00:12:06', '2025-06-03 00:12:06'),
('8605db5d-1462-496e-8b5f-8b923d88912c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-14 07:20:44', '2020-08-14 07:20:44'),
('a6ec5643-748c-4128-92e2-9a9f293f53b5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-17 21:17:03', '2020-08-17 21:17:03'),
('b186a883-42f2-4a05-8fc5-f0d3e10309ff', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2020-08-15 04:17:24', '2020-08-14 22:14:55', '2020-08-15 04:17:24'),
('cf7a2cab-fafc-4c9a-a0df-c22a051fe807', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/keo-dau\",\"fas\":\"fa-star\"}', NULL, '2025-06-03 00:16:20', '2025-06-03 00:16:20'),
('d2fd7c33-b0fe-47d6-8bc6-f377d404080d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:08:50', '2020-08-14 07:08:50'),
('daf4843e-8014-40b2-b435-705abfcddb4b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/com-kho-lang-vong\",\"fas\":\"fa-star\"}', NULL, '2025-06-03 00:12:52', '2025-06-03 00:12:52'),
('dd06d61d-6b65-4bd4-a4d9-5217095be103', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2025-06-03 00:10:45', '2025-06-03 00:10:45'),
('dff78b90-85c8-42ee-a5b1-de8ad0b21be4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 06:40:54', '2020-08-15 06:40:54'),
('e10b906a-791f-4327-a6c1-2e2789f6f2db', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/keo-cu-do-ha-tinh\",\"fas\":\"fas fa-comment\"}', NULL, '2025-06-03 00:05:35', '2025-06-03 00:05:35'),
('e28b0a73-4819-4016-b915-0e525d4148f5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}', NULL, '2020-08-17 21:08:16', '2020-08-17 21:08:16'),
('ffffa177-c54e-4dfe-ba43-27c466ff1f4b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') NOT NULL DEFAULT 'new',
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `post_code` varchar(191) DEFAULT NULL,
  `address1` text NOT NULL,
  `address2` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(7, 'ORD-G1XNSZM1NZ', 31, 31500.00, 8, NULL, 91500.00, 1, 'cod', 'unpaid', 'delivered', 'Dai', 'Dai', 'nguyenquocdainqd03@gmail.com', '0987110044', 'AX', NULL, '1', NULL, '2025-06-03 00:25:37', '2025-06-03 00:28:52');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `quote` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Quy định ship hàng', 'quy-dinh-ship-hang', '<p><em style=\"font-family: Arial; font-weight: 700; text-transform: uppercase; background-color: rgb(255, 255, 0);\">Giờ làm việc: từ 7h30&nbsp; đến 19h tất cả các ngày trong tuần</em></p>', '<p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">&nbsp;Với đơn hàng nội thành, giao hàng trong khoảng từ 2 đến 6h ( Những đơn hàng nhận trước 14h sẽ giao trong ngày, sau 14h sẽ giao hàng vào sáng ngày hôm sau, nếu khách hàng cần vận chuyển nhanh hơn thời gian quy định sẽ thỏa thuận trực tiếp về giá giao hàng )</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">&nbsp;&nbsp;&nbsp;&nbsp; * Với đơn hàng ngoại thành, ngoại tỉnh khách hàng tham khảo quy định của đơn vị chuyển phát ( Nếp Hương không nhận Ship Cod, nếu khách hàng muốn Cod vui lòng đặt hàng tại shop của Nếp Hương trên các sàn thương mại điện tử )</p>', '<p>Dịch vụ giao hàng</p>', '/storage/photos/1/Blog/SHip2.png', 'Tag', 6, NULL, 1, 'active', '2025-06-02 23:47:20', '2025-06-02 23:47:20'),
(8, 'Kẹo cu đơ Hà Tĩnh', 'keo-cu-do-ha-tinh', '<p><span style=\"color: rgb(63, 63, 63); font-family: Arial; font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Ngày xưa…</span></p>', '<p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Có một gia đình nghèo, gồm một người cha và hai con trai tuấn tú. Sắp đến ngày cưới của cậu con trai cả mà nhà không có gì ngoài dăm bơ lạc giống và hũ mật mía. Người cha đành tặc lưỡi dốc vốn liếng ấy cho con. Ông đem sôi mật mía rồi cho lạc vào quấy thành một thứ kẹo để thiết đãi bà con đến chia vui. Không ngờ món kẹo ấy lại được mọi người trầm trồ tán thưởng. Thế là món kẹo ấy trở thành mặt hàng dân dã kiếm sống lúc nông nhàn. Ông đặt tên kẹo là “Hai Cu” (vì nhà ông có hai người con trai).</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">&nbsp;&nbsp;&nbsp;&nbsp; Quân Pháp xâm chiếm đất nước. Lính Pháp ăn kẹo Hai Cu thấy ngon quá bèn truyền tụng khắp quân ngũ với cái tên ngồ ngộ dịch từ tiếng Việt: Kẹo cu đơ (Deux: tiếng Pháp là hai).</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Ngày nay…</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">&nbsp;&nbsp;&nbsp;&nbsp; Từ một nhà làm kẹo cu đơ ở huyện Hương Sơn phát triển thành nhiều nhà rồi thành làng nghề như làng cu đơ Cầu Phủ phường Đại Nài, thành phố Hà Tĩnh. Có những cơ sở phát triển thành xưởng, cơ giới hóa các khâu sản xuất như Phong Nga ở quán Gạc, Thạch Đài, Hà Tĩnh. Kẹo cu đơ ngày nay không những chỉ có hai thành phần là đường mía và lạc mà còn thêm gừng, mạch nha, bánh đa, vừng, nước chanh.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">&nbsp;&nbsp;&nbsp;&nbsp; Để có kẹo ngon, khâu quan trọng là chọn nguyên, vật liệu. Lạc phải là lạc trồng ở vùng đồi, phải mẩy, khô, giòn, béo, không làm bong lớp vỏ lụa. Mật phải được lọc kỹ và có màu vàng sáng. Gừng phải được cạo rửa thật sạch. Bánh đa bọc kẹo phải được tráng vàng vừa đủ và sắc vàng đều. Các khâu hoán đường, trộn lạc, đổ ra bánh đa… đều phải tuân thủ nghiêm ngặt về thao tác và thời gian, giữ vệ sinh tuyệt đối để tăng sự tinh túy của đặc sản.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">&nbsp;&nbsp;&nbsp;&nbsp; Giữ vững truyền thống và chịu khó cải tiến cách làm, cơ sở làm kẹo cu đơ Phong Nga đã được đông đảo người dân Hà Tĩnh và cả nước biết đến và mến mộ.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">&nbsp;&nbsp;&nbsp;&nbsp; Du khách qua Hà Tĩnh, ai cũng nhớ mua món quà quý: Kẹo cu đơ. Đi cách xa nơi sản xuất một quãng dài đã thấy sực nức cái mùi quen thuộc của hỗn hợp đường mật, lạc, gừng… nồng nồng, thân thương.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\"><div class=\"blog-share text-center\" style=\"box-sizing: border-box; text-align: center; color: rgb(119, 119, 119); font-family: sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgba(222, 222, 169, 0.64); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div></p><p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px; font-family: Arial; color: rgb(63, 63, 63); font-style: normal; font-weight: 700; text-transform: uppercase; font-size: 16px; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgba(222, 222, 169, 0.64); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Kẹo cu đơ chứa đựng tâm hồn của người Hà Tĩnh, nơi khúc ruột miền Trung chịu nhiều gian khó bậc nhất nước. Tuy bề ngoài của kẹo sần sùi, thô nhám nhưng ăn vào thì còn để mãi một dư vị ngọt ngào, nồng ấm như tình người.</p>', '<p>....</p>', '/storage/photos/1/Blog/cu-do.jpg', 'Enjoy', 7, NULL, 1, 'active', '2025-06-02 23:48:54', '2025-06-02 23:48:54'),
(9, 'Dành cho các bạn yêu TRÀ', 'danh-cho-cac-ban-yeu-tra', '<p><span style=\"color: rgb(63, 63, 63); font-family: Arial; font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">THANH ĐẠM, GIỮA PHỒN HOA TA THẤY ĐƯỢC THUẦN CHÂN</span></p>', '<p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Người xưa nói: hoa có hương sắc của hoa, nước có ý vị của nước, ấm có tâm tình của ấm, mà trà lại có đạo lý của trà.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Uống trà, nếu coi như một thức uống sẽ chỉ thấy vị đắng của chén trà. Mà nếu coi như một niềm vui khi nhàn nhã lại thấy cái thú vị khi nâng lên tách trà nóng, hít hà một hơi cảm nhận hương thơm thanh khiết, sau đó khẽ nhấp một ngụm, từng giọt đăng đắng lan tỏa trong miệng rồi chuyển sang vị ngọt thanh mát tự lúc nào không hay.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Còn nếu coi trà như một phần của Đạo, một phần của thiền, thì lại thấy để thưởng thức trọn vẹn tách trà là cần phải tẩy đi lớp phấn hoa phù phiếm, cởi đi lớp xiêm y hào nhoáng, buông bỏ những âu lo phiền muộn, gác lại đằng sau hết thảy mọi huyên náo ồn ào của thế gian… Để lúc này ta trở lại là chính ta, chân thật và bình dị, ngồi bên tách trà nhâm nhi từng giọt thuần khiết, thuần chân.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">“Thánh trà” Lục Vũ và Trà Kinh</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Uống trà sẽ nhớ tới “Thánh trà” Lục Vũ, tác giả cuốn Trà Kinh nổi tiếng. Cuộc đời ông là một truyền kỳ, và tất cả đều liên quan đến trà và Đạo. Kể rằng, vào năm Khai Nguyên thứ 21 đời Đường, một ngày khi vừa ngủ dậy hòa thượng Tích Công nghe thấy có tiếng chim nhạn từ đâu vọng lại. Ông mở cửa thì thấy đàn chim đang dang cánh ủ ấm cho một em bé sơ sinh nằm lạnh cóng trên nền đất. Ông bèn đem đứa trẻ về nuôi, và vì đứa bé nằm dưới cánh chim nhạn nên ông đặt tên là Lục Vũ.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Hòa thượng Tích Công rất thích uống trà, nên cậu bé Lục Vũ phải thường xuyên pha trà cho ông. Dần dà, Tích Công hòa thượng chỉ uống trà do Lục Vũ pha, nếu không phải Lục Vũ pha thì không uống. Đến khi Lục Vũ rời đi, ai pha trà ông cũng thấy nhạt nhẽo vô vị, từ đó mà đành ngậm ngùi từ bỏ nhã thú uống trà.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Khi hoàng đế biết chuyện, ngài đã vời hòa thượng Tích Công vào cung để thưởng thức trà cung đình, nhưng vừa nhấp một ngụm ông đã nhăn mặt chau mày không uống nữa. Hoàng đế lại bí mật triệu Lục Vũ vào cung rồi ra lệnh pha trà, Tích Công hòa thượng vừa nhấm thử đã tấm tắc khen rằng: “Đây đích thị là trà do Lục Vũ pha”.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Những năm sau này, Lục Vũ đã dành toàn bộ thời gian vào việc nghiên cứu trà và tổng kết trong một cuốn sách gọi là Trà Kinh, nâng văn hóa thưởng trà lên một cảnh giới cao của tinh thần.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Tương truyền, người Hồi Hột ở phương Bắc có giống ngựa quý, hàng năm họ đều mang ngựa đến Đường triều để đổi lấy trà. Một lần sứ thần Hồi Hột mang ngàn con ngựa tới, nhưng không phải đổi trà mà là để đổi lấy cuốn sách quý tên là Trà Kinh. Lời đề nghị đường đột này khiến nhà Đường phải đi tìm khắp dân gian, hỏi thăm qua bao vùng đất, lặn lội qua bao địa danh, cuối cùng mới tìm thấy cuốn Trà Kinh mà sứ giả yêu cầu.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Dùng trà có thể hành Đạo, dùng trà có thể đạt được chí thanh cao</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Về sau người Nhật Bản nhờ học hỏi nghệ thuật trà Trung Hoa mà nâng lên thành Trà Đạo, khái quát lại trong bốn chữ: Hòa – Kính – Thanh – Tịch (和 – 敬 – 清 – 寂). Nhưng các triết lý về trà không dừng lại ở đó. Người yêu trà tổng kết ra “Trà đạo lục sự”, bao gồm trà lễ, trà quy, trà pháp, trà kỹ, trà nghệ, trà tâm – thông qua sáu yếu tố này mà chứng ngộ tinh thần của Đạo. Trong Ẩm trà thập đức cũng viết: “Dĩ trà khả hành đạo, dĩ trà khả nhã chí”, nghĩa là, dùng trà có thể hành Đạo, dùng trà có thể đạt được chí thanh cao.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Cũng chính từ đó mà văn hóa thưởng trà trở nên tinh tế, cầu kỳ và hoa mỹ. Người Nhật Bản thưởng trà là phải ngồi trong khung cảnh có thể nuôi dưỡng thiền tâm. Đó có thể là căn phòng nhỏ trang nhã, thanh tịnh, gọi là “trà thất”, hay cũng có thể là vườn cây bình yên, tĩnh tại, gọi là “trà viên”, được Kobiri Emshiu miêu tả là:</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">“Một chòm cây mùa hạ,<br>một nét biển xa xa,<br>một vừng trăng chiếu mờ nhạt.”</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">“Tôi nhìn ra,<br>không có hoa,<br>cũng không có lá.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Trên bờ biển,<br>một chòi tranh đứng trơ trọi,<br>trong ánh nắng nhạt chiều thu.”</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Còn với người Trung Hoa, trà ngon phải là cây trà được thiên nhiên nuôi dưỡng, mọc nơi núi cao rừng thẳm, không vương bụi trần, chỉ có gió núi mây ngàn. Rồi trà ấy lại phải được pha bằng thứ nước tinh khiết như nước ở Nam Nhũ, cất trong chiếc ấm nặn từ bùn đất đã chôn lâu ngày, kinh qua lửa thời gian hun đúc, và lại được tháng năm bào mòn thành bóng láng… Người thưởng trà cũng phải là bậc sâu sắc và cao khiết, có thể bỏ lại sau lưng mọi thế gian tục sự để toàn tâm toàn ý bên chén trà.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Thưởng trà, là phải giống như nàng Diệu Ngọc trong Hồng Lâu Mộng của Tào Tuyết Cần. Diệu Ngọc là một ni cô sống khép mình trong am Lũng Thúy, cô tịch, yên tĩnh, nằm ở một góc nhỏ của vườn Đại Quan hoa lệ. Cô giống như đóa hoa lan lặng lẽ, trang nhã, ngát hương, nhưng lại có phần tịch mịch. Cả đời mình Diệu Ngọc tâm đắc nhất với hai câu thơ: “Cửa sắt nghìn năm dầu vững chắc/ Đất bùn một nắm cũng chôn vùi”.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Xưa có một vị thiền sư rất giỏi thư pháp, nổi danh xa gần. Người đến xin chữ của ông nhiều không đếm xuể, chen lấn đến nỗi làm gãy cả bậu cửa, sau ông phải lấy lá thép bọc lại mới giữ cho bậu cửa được bền lâu. Nhưng nào hay biết rằng, người đời trong phồn hoa xô bồ, tranh tranh đoạt đoạt, giành giật cả một đời, nỗ lực cả một đời, vinh nhục cả một đời, cuối cùng đều phải ngậm ngùi kết thúc dưới nấm mồ.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Đây cũng chính là ý tứ đằng sau hai câu thơ: “Cửa sắt nghìn năm dầu vững chắc/ Đất bùn một nắm cũng chôn vùi”. Diệu Ngọc nhờ hai câu thơ đó mà thấu triệt cái lẽ sinh tử, ngộ ra đạo lý của nhân sinh. Bởi vậy, mặc dù chưa hoàn toàn dứt đoạn trần duyên, nhưng Diệu Ngọc vẫn luôn giữ thái độ dửng dưng với thế sự, sống bình thản trong am Lũng Thúy, an tĩnh mà cô tịch, giống như đóa hoa lan thanh khiết mặc kệ phồn hoa ngoài cửa thiền.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Một tâm hồn cao khiết như thế thì khi thưởng trà sẽ có bao nhiêu phần ý vị, bao nhiêu phần thanh tao?</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Trong truyện kể rằng, Diệu Ngọc pha trà là pha bằng nước tuyết đọng trên hoa mai, nghĩa là một thứ nước thanh khiết, và cũng là lấy từ một nơi thanh tịnh, đó là nước tuyết trên hoa mai trong chùa Huyền Mộ Bàn Hương từ 5 năm trước. Thứ nước ấy chỉ chứa đầy một lọ hoa xanh, chôn xuống đất, xưa nay vẫn tiếc không nỡ dùng.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Mà thứ trà thanh khiết ấy thì đựng bằng gì? Chén rót mời Bảo Thoa – một đóa mẫu đơn rực rỡ, đài các, đoan trang, nền nã – thì phải là chiếc chén cổ mang dòng chữ “Vương Khải trân ngoạn”, nghĩa là chiếc chén quý của Vương Khải ngày xưa. Còn chén rót mời Đại Ngọc – một tâm hồn băng thanh ngọc khiết, cao quý vô ngần – thì phải là chiếc chén khắc ba chữ “điểm tế kiều”, nghĩa là có tâm linh tương thông. Đại Ngọc và Diệu Ngọc cùng là phường cô tịch cao khiết, có thể giao cảm tâm linh, vậy nên chén quý mời khách quý cũng phải sánh với mối tình tri giao ấy.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">“Có thứ mùi vị là niềm vui thanh đạm, giữa phồn hoa lại thấy được thuần chân”</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Trước nay cứ ngỡ trà ở đâu vẫn chỉ là “trà” thôi, nào ngờ trà của mỗi vùng đất, mỗi con người, mỗi văn hóa lại khác nhau nhiều đến thế. Nếu như trà Nhật Bản là “Đạo”, trà Trung Hoa là “Mỹ”, trà Hàn Quốc là “Lễ”, thì trà Việt lại gắn liền với chữ “Chân” – mộc mạc, đơn sơ, dung dị, thuần phác.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Người Việt ngồi bên tách trà không phân sang hèn, không kể thân sơ, cũng có thể đàm đạo dăm ba câu chân tình. Người ta nói uống rượu là để say, càng uống lại càng say, uống cho quên hết sự đời, cho mê man, có khi say đến mức quên cả bản thân mình, quên cả đường về nhà. Nhưng uống trà lại là để tỉnh. Người ngồi bên tách trà không hấp tấp, không vội vàng, cứ thế nhàn tản mặc gió mưa.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Nâng chén trà thơm, có khi luận bàn chuyện nhân tình thế thái, có khi lại mường tượng về những tháng ngày xưa cũ, chuyện gì cũng có thể thổ lộ tâm tình nơi bàn trà. Uống trà là phải như người Việt, cứ thong thả mà trải lòng mình, mặc cho thời gian cứ thế trôi.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Dẫu không phải là người đã nếm đủ sự đời, nhưng sẽ đến một lúc nào đó ta chợt nhận ra rằng: Trần gian vạn nẻo, đều là để tìm về một chốn bình yên.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Nghe nhạc cũng vậy, âm nhạc đích thực là nên để tâm hồn thăng hoa, từng nốt nhạc du dương trầm bổng, khi cao vút, khi êm đềm, khi lắng đọng, giống như dòng suối nhẹ nhàng cuốn trôi đi lớp bụi phủ dày trong tâm trí. Tôi đã từng được nghe một bản nhạc như thế, trong veo, khiến tâm mình tĩnh tại mà hòa theo tiếng đàn. Xem vũ đạo cũng vậy, màn vũ đạo đích thực rất có thể sẽ khiến người xem như lạc vào tiên cảnh, tâm và thân hòa hợp, chỉ muốn rũ bỏ mọi hồng trần để đạt tới độ thánh khiết thanh cao.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Thưởng thức hội họa cũng vậy, hội họa đích thực là phải làm rung động mọi trái tim sắt đá, khiến những tâm hồn chai sạn và lạnh lùng kia được gột rửa mà trở nên thuần khiết hơn. Mà cái hồn ấy không phải đến từ thủ pháp nghệ thuật người ta chỉ cần bỏ tiền ra là học được, mà là kết tinh từ tâm hồn nghệ sĩ. Khi người nghệ sĩ đạt đến cảnh giới cao của tinh thần, thì phải chăng nét vẽ, tiếng đàn, hay điệu múa sẽ đạt đến độ mà người ta vẫn nói là “xuất thần nhập hóa”?</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Nói xa xôi vậy cũng chỉ là tản mạn bên chén trà. Nhà văn Bạch Lạc Mai có một câu rất hay rằng: “Có thứ mùi vị là niềm vui thanh đạm, giữa phồn hoa lại thấy được thuần chân”. Trà ngon cũng giống như ngọc dịch quỳnh tương, khi người thưởng thức có thể rũ bỏ mọi thế gian tục sự, buông xuống những ân oán thị phi, để tâm mình lắng lại, tĩnh tại, bình yên, thì không cần lễ nghi phiền phức, không cần bình ngọc chén vàng, vẫn có thể chạm đến cái “Đạo”, cái “Thiền” của trà…</p>', '<p><span style=\"color: rgb(63, 63, 63); font-family: Arial; font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">THANH ĐẠM, GIỮA PHỒN HOA TA THẤY ĐƯỢC THUẦN CHÂN</span></p>', '/storage/photos/1/Blog/91964999_10213255759028863_7510043611782709248_o.jpg', 'tra', 7, NULL, 1, 'active', '2025-06-02 23:50:35', '2025-06-02 23:50:35'),
(10, 'Chè lam xứ Đoài', 'che-lam-xu-doai', '<p><span style=\"color: rgb(63, 63, 63); font-family: Arial; font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Những ngày trời mát</span></p>', '<p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Những ngày trời mát, được thưởng thức món bánh này thật là thú vị. Thái bánh thành từng khoanh nhỏ, rồi ăn chậm rãi cùng với trà. Cắn một miếng bánh chè lam dẻo dẻo, uống một ngụm trà, vị ngọt lành biết bao!<br><br>&nbsp; &nbsp; &nbsp;Mỗi vùng miền của đất nước ta đều có những sản vật địa phương ngon, lạ miệng để nhớ mãi.<br><br>&nbsp; &nbsp; &nbsp;Chè lam là một loại bánh cổ truyền của người dân xã Thạch Xá, huyện Thạch Thất, Hà Nội. Ngày xưa, chè lam thường được làm trong các dịp lễ, Tết. Giờ đây, món bánh này không chỉ là đặc sản của người dân Hà Nội mà còn theo chân du khách đi tới mọi phương xa.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\"><br><br>&nbsp; &nbsp; &nbsp;Nguyên liệu để làm bánh chè lam rất đơn giản: bột nếp rang, đậu phộng rang, gừng, mạch nha. Thế nhưng, để bánh ngon và đạt chuẩn, các nguyên liệu trên phải chọn lọc thật kỹ. Đầu tiên, nếp để làm bánh chè lam phải là loại nếp cái hoa vàng có hạt to, chắc và đều; mật mía phải là thứ mật mía sánh, đặc (nếu thay bằng đường kính thì phải chọn loại đường kính trắng tinh).<br><br>&nbsp; &nbsp; &nbsp;Khâu chế biến chè lam là một quá trình rất công phu, tỉ mỉ và người nấu chè phải kiên nhẫn. Nếp sau khi chọn lọc kỹ lưỡng, sẽ được cho vào chảo rang, quá trình này đòi hỏi bạn phải có kinh nghiệm trong việc “canh lửa”, lửa phải đều, không được to quá cũng không được nhỏ quá, tay luôn đảo đều để nếp chín đều, không bị sượng. Sau khi rang vàng xong, để nguội và dùng cối xay để tạo thành thứ bột mịn. Song song với việc đó, các nguyên liệu cũng phải chuẩn bị sẵn sàng: đậu phộng rang vàng, bẻ đôi, gừng thái sợi.<br><br>&nbsp; &nbsp; &nbsp;Tiếp theo là khâu thắng mật, khâu này đòi hỏi người làm chè lam phải có kinh nghiệm nhiều. Mật phải chọn mật sánh và đặc, sau đó cho vào chảo thắng cho đều tay. Điều quan trọng của công đoạn này là mật phải đạt đủ độ chín, dùng đũa nhúng vào mật, nếu thấy mật dính thành sợi mảnh thì đã được. Không nên đun quá già lửa, như vậy mật sẽ bị khét và làm chè lam bị rắn, còn nếu đun lửa non thì bánh chè lam sẽ bị nhão. Khi mật đã nấu xong, nhanh tay và khéo léo cho bột nếp, gừng và đậu phộng vào đảo đều.<br><br>&nbsp; &nbsp; &nbsp;Sau khi bột đã chín, để ra bàn để nhào. Để chống dính cho bánh chè lam, người ta thường rắc bột nếp đã rang vàng lên bàn làm lớp áo cho bánh, sau đó cán hỗn hợp đã nấu trên lớp “áo” này nhiều lần cho đến khi bánh dẻo, có độ dai. Lúc đó, chiếc bánh chè lam đã hoàn thành.</p><p style=\"margin-bottom: 1.3em; font-family: Arial; color: rgb(63, 63, 63); font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\"><br>&nbsp; &nbsp; &nbsp; Bánh chè lam ngon là sự kết hợp hài hòa của các nguyên liệu: độ dính của mật, độ mịn của bột… Điều đó đòi hỏi sự kỹ lưỡng, tay nghề của người làm bánh cao. Bánh chè lam có đầy đủ các hương vị nên rất hấp dẫn: đó là vị dẻo dai của bột nếp, vị ngọt ngào của mật, một chút cay của gừng, một chút bùi của đậu phộng. Tất cả đem đến cho chiếc bánh một hương vị nồng nàn đến ngất ngây.<br><br>&nbsp; &nbsp; &nbsp;Những ngày trời mát, được thưởng thức món bánh này thật là thú vị. Thái bánh thành từng khoanh nhỏ, rồi ăn chậm rãi cùng với trà. Cắn một miếng bánh chè lam dẻo dẻo, uống một ngụm trà, vị ngọt lành biết bao!</p>', '<p><span style=\"color: rgb(63, 63, 63); font-family: Arial; font-weight: 700; text-transform: uppercase; background-color: rgba(222, 222, 169, 0.64);\">Những ngày trời mát</span></p>', '/storage/photos/1/Blog/che-lam.jpg', ',banhcom,banhchelam', 7, NULL, 1, 'active', '2025-06-02 23:52:20', '2025-06-02 23:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(4, 'enjoy', 'enjoy', 'active', '2020-08-14 03:16:10', '2020-08-14 03:16:10'),
(6, 'Vận chuyển', 'van-chuyen', 'active', '2025-06-02 23:38:48', '2025-06-02 23:38:48'),
(7, 'Sản phẩm', 'san-pham', 'active', '2025-06-02 23:39:09', '2025-06-02 23:39:09');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `replied_comment` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(8, 2, 9, 'bài viết rất hay', 'active', NULL, NULL, '2025-06-03 00:04:25', '2025-06-03 00:04:25'),
(9, 2, 10, 'chè ngon đã thử', 'active', NULL, NULL, '2025-06-03 00:05:05', '2025-06-03 00:05:05'),
(10, 2, 8, 'kẹo ngon nhắm', 'active', NULL, NULL, '2025-06-03 00:05:35', '2025-06-03 00:05:35');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Enjoy', 'enjoy', 'active', '2020-08-14 01:53:52', '2020-08-14 01:53:52'),
(4, 'Tag', 'tag', 'active', '2020-08-15 06:59:31', '2020-08-15 06:59:31'),
(5, 'trathainguyen', 'tra', 'active', '2025-06-02 23:40:30', '2025-06-02 23:41:09'),
(6, 'banhcom', 'banhcom', 'active', '2025-06-02 23:40:38', '2025-06-02 23:40:38'),
(7, 'banhchelam', 'banhchelam', 'active', '2025-06-02 23:40:48', '2025-06-02 23:40:48'),
(8, 'tra', 'tra-2506034102-894', 'active', '2025-06-02 23:41:02', '2025-06-02 23:41:02');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `photo` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(2) DEFAULT 'M',
  `condition` enum('default','new','hot') NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(11, 'Cốm khô làng vòng', 'com-kho-lang-vong', '<p>Đặc sản Hà Nội</p>', NULL, '/storage/photos/1/Products/com-kho-copy.jpg', 5, NULL, 'new', 'active', 160000.00, 10.00, 1, 13, 16, 9, '2025-06-02 21:06:34', '2025-06-02 21:06:34'),
(17, 'Kẹo cu đơ', 'keo-cu-do', '<p>Đặc sản Hà Tĩnh</p>', '<p>..</p>', '/storage/photos/1/Products/cu-do3-510x509.jpg', 10, 'M', 'hot', 'active', 65000.00, 10.00, 1, 14, 19, 7, '2025-06-02 23:16:25', '2025-06-02 23:16:25'),
(18, 'Kẹo dừa lá dứa', 'keo-dua-la-dua', '<p>Đặc sản Bến Tre</p>', NULL, '/storage/photos/1/Products/Keo-dua-thanh-long--510x510.jpg', 50, 'M', 'hot', 'active', 38000.00, 10.00, 1, 15, 21, 11, '2025-06-02 23:18:22', '2025-06-02 23:18:22'),
(19, 'Kẹo dừa sầu riêng', 'keo-dua-sau-rieng', '<p>Đặc sản Bến Tre</p>', '<p>..</p>', '/storage/photos/1/Products/Keo-dua-sau-rieng-.jpg', 20, 'M', 'default', 'active', 45000.00, 10.00, 0, 15, 21, 11, '2025-06-02 23:21:49', '2025-06-02 23:24:40'),
(20, 'Lạc rang Húng Lìu', 'lac-rang-hung-liu', '<p>Đặc sản Hà Nội</p>', '<p>..</p>', '/storage/photos/1/Products/lac--510x510.jpg', 50, 'M', 'new', 'active', 30000.00, 10.00, 0, 13, 16, 8, '2025-06-02 23:23:34', '2025-06-02 23:24:29'),
(21, 'Bánh đậu xanh', 'banh-dau-xanh', '<p>Đặc sản Hải Dương</p>', '<p>..</p>', '/storage/photos/1/Products/Banh-Ky-Anh-3-510x510.jpg', 20, 'M', 'hot', 'active', 50000.00, 10.00, 0, 13, 17, 7, '2025-06-02 23:26:22', '2025-06-02 23:26:22'),
(22, 'Bột sắn hoa bưởi', 'bot-san-hoa-buoi', '<p>Đặc sản Hải Dương</p>', '<p>..</p>', '/storage/photos/1/Products/bot-san-1-510x510.jpg', 10, 'M', 'new', 'active', 200000.00, 10.00, 0, 13, 17, 8, '2025-06-02 23:27:43', '2025-06-02 23:27:43'),
(23, 'Bánh đa vừng đen', 'banh-da-vung-den', '<p>Đặc sản Nghệ An</p>', '<p>...</p>', '/storage/photos/1/Products/banh-da-nghe-an-2.jpg', 15, 'M', 'new', 'active', 25000.00, 10.00, 0, 14, 18, 10, '2025-06-02 23:29:04', '2025-06-02 23:29:04'),
(24, 'Kẹo dâu', 'keo-dau', '<p>Đặc sản Đà Lạt</p>', NULL, '/storage/photos/1/Products/keo-dau-copy-510x510.jpg', 69, 'M', 'hot', 'active', 35000.00, 10.00, 0, 15, 20, 11, '2025-06-02 23:30:27', '2025-06-03 00:28:52'),
(25, 'Mứt vỏ bưởi', 'mut-vo-buoi', '<p>Đặc sản Đà Lạt</p>', '<p>...</p>', '/storage/photos/1/Products/mut-vo-buoi-510x510.jpg', 18, 'M', 'new', 'active', 45000.00, 10.00, 0, 15, 20, 10, '2025-06-02 23:31:44', '2025-06-02 23:31:44');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(3, 2, 23, 5, 'ngon', 'active', '2025-06-03 00:12:06', '2025-06-03 00:12:06'),
(4, 2, 11, 5, 'ngon nhắm', 'active', '2025-06-03 00:12:52', '2025-06-03 00:12:52'),
(5, 1, 24, 5, 'ngonn', 'active', '2025-06-03 00:16:20', '2025-06-03 00:16:20');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `short_des` text NOT NULL,
  `logo` varchar(191) NOT NULL,
  `photo` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Chào mừng đến với cửa hàng đặc sản quê hương – nơi hội tụ tinh hoa ẩm thực từ mọi miền đất nước. Chúng tôi chuyên cung cấp các loại đặc sản nổi tiếng như mắm Châu Đốc, kẹo dừa Bến Tre, chè Thái Nguyên, và nhiều món ngon khác. Tất cả sản phẩm đều được chọn lọc kỹ càng, đảm bảo nguồn gốc rõ ràng và an toàn vệ sinh thực phẩm. Shop cam kết mang đến hương vị truyền thống đúng chuẩn, gợi nhớ những ký ức quê nhà thân thương. Dịch vụ giao hàng nhanh chóng, hỗ trợ tư vấn nhiệt tình, mang đến trải nghiệm mua sắm hài lòng nhất.', 'Shop chuyên cung cấp đặc sản vùng miền chất lượng, chuẩn vị quê hương. Cam kết sản phẩm tươi ngon, an toàn và giao hàng tận nơi toàn quốc.', '/storage/photos/1/logo.png', '/storage/photos/1/hat-lua-muc-nat-www-ngonluanho-net.jpg', 'Học viện Công nghệ Bưu chính Viễn thông', '0372431777', 'eshop@gmail.com', NULL, '2025-06-03 00:38:58');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Nhanh', 50000.00, 'active', '2025-06-02 23:33:35', '2025-06-02 23:33:35'),
(6, 'Hỏa tốc', 100000.00, 'active', '2025-06-02 23:33:46', '2025-06-02 23:33:46'),
(7, 'Bình thường', 20000.00, 'active', '2025-06-02 23:35:09', '2025-06-02 23:35:09'),
(8, 'Ngoại thành', 60000.00, 'active', '2025-06-02 23:36:20', '2025-06-02 23:36:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dai', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', NULL, 'admin', NULL, NULL, 'active', 'tmRzScTqvGLAZSk6sqsAgwWHUHHBuPzn98waGtbWug3zGyI83r1PrxZj6kyw', NULL, '2025-06-02 08:13:57'),
(2, 'Huy', 'user@gmail.com', NULL, '$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq', NULL, 'user', NULL, NULL, 'active', NULL, NULL, '2025-06-02 23:43:12'),
(31, 'Hoang', 'user1@gmail.com', NULL, '$2y$10$NPKaa3ierTC9OjuVNsfE1uuQ2CDbiygG9fKI.ktC2jjHnHuP1Llom', NULL, 'user', NULL, NULL, 'active', NULL, '2025-06-02 23:43:50', '2025-06-02 23:43:50');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
