-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2023 at 03:34 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_batch9`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Samsung', 'Samsung', 'upload/brand-images/1700488541.jpg', 1, '2023-11-20 07:11:32', '2023-11-20 07:55:54'),
(2, 'Yellow', 'Yellow', 'upload/brand-images/1700486711.jpg', 1, '2023-11-20 07:25:11', '2023-11-20 07:25:11'),
(4, 'LAIKOU', 'LAIKOU', 'upload/brand-images/1702909403.jpg', 1, '2023-12-18 08:23:23', '2023-12-18 08:23:23');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Man Fashion', 'Good', 'upload/category-images/1700198141.jpg', 1, '2023-11-16 23:15:41', '2023-11-16 23:15:41'),
(4, 'Electronics', 'Electronics', 'upload/category-images/1700659195.jpg', 1, '2023-11-22 07:19:55', '2023-11-22 07:19:55'),
(5, 'Sports Item', 'Sports Item', 'upload/category-images/1700659205.jpg', 1, '2023-11-22 07:20:05', '2023-11-22 07:20:05'),
(6, 'Woman Fashion', 'Woman Fashion', 'upload/category-images/1700659219.jpg', 1, '2023-11-22 07:20:19', '2023-11-22 07:20:19'),
(7, 'Health & Beauty', 'Health & Beauty', 'upload/category-images/1702909362.jpg', 1, '2023-12-18 08:22:42', '2023-12-18 08:22:42');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_11_13_130215_create_sessions_table', 1),
(7, '2023_11_17_034759_create_categories_table', 2),
(8, '2023_11_20_125056_create_brands_table', 3),
(9, '2023_11_22_133018_create_sub_categories_table', 4),
(10, '2023_11_24_055859_create_units_table', 5),
(11, '2023_11_27_134138_create_products_table', 6),
(12, '2023_11_27_143550_create_product_images_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `long_description` longtext NOT NULL,
  `regular_price` double(11,2) NOT NULL,
  `selling_price` double(11,2) NOT NULL,
  `stock_amount` int(11) NOT NULL,
  `image` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `brand_id`, `unit_id`, `name`, `code`, `short_description`, `long_description`, `regular_price`, `selling_price`, `stock_amount`, `image`, `status`, `created_at`, `updated_at`) VALUES
(2, 7, 5, 4, 2, 'Laikou Sakura & Vitamin C Serum Combo ( 17 ml +17ml )', 'LSVC123', 'Product well packed chilo nd upore intake poly kora chilo. Packet er code scratch kore scan korle website a niye jay nd code verify korle original product dekhai. Ageo ami vitamin c serum use korchi onno brand er.', '<h2 class=\"pdp-mod-section-title outer-title\" data-spm-anchor-id=\"a2a0e.pdp.0.i4.26734f33XEORd6\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 24px; font-family: Roboto-Medium; font-size: 14px; line-height: 52px; color: rgb(33, 33, 33); overflow: hidden; text-overflow: ellipsis; text-wrap: nowrap; height: 52px; background: rgb(250, 250, 250);\">Product details of Laikou Sakura &amp; Vitamin C Serum Combo ( 17 ml +17ml )</h2><div class=\"pdp-product-detail\" data-spm=\"product_detail\" style=\"margin: 0px; padding: 0px; position: relative; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px;\"><div class=\"pdp-product-desc \" style=\"margin: 0px; padding: 5px 14px 5px 24px; height: auto; overflow-y: hidden;\"><div class=\"html-content pdp-product-highlights\" style=\"margin: 0px; padding: 11px 0px 16px; word-break: break-word; border-bottom: 1px solid rgb(239, 240, 245); overflow: hidden;\"><ul class=\"\" style=\"margin-block-start: 1em; font-size: 14px; list-style-position: initial; list-style-image: initial; overflow: hidden; columns: 2; column-gap: 32px;\"><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Package includes: 1 x Vitamin C Serum+1 x Sakura Serum</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Vitamin C Serum</li><li class=\"\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.26734f33XEORd6\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">The product is rich in VC essence with high penetration and antioxidant stability, it can stay on the skin for more than 6 hours, enhance the brightening effect of 6 times skin color.</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">It can promote the synthesis of skin collagen and decrease melanin deposition. The vitamin C in the essence can be absorbed by the skin quickly.</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Soothes the skin, helps the skin to restore whiteness, prevents the skin from aging, and leaves the skin white and supple.</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Vitamin C essence has excellent natural protective power to help resist external environmental pollution, light pollution, and effectively improve dull skin, fade fine lines, shrink pores and other skin problems. * Improve skin resistance and enhance skin self-repair ability.</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Hyaluronic acid has a good moisturizing effect, effectively moisturizes the skin, leaving the skin smooth and tender</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Sakura Serum</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Sakura serum contains sakura extract, which is known for its moisturizing, anti-aging, brightening and anti-inflammatory functions.</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Intensely rehydrate, restore skin’s glow and smoothen skin</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">For Dull Skin, it can brighten the skin tone</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Suitable for all skin types and sensitive skin</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Sakura extract is with excellent moisturizing and whitening effect and more than 80% of the ingredients are natural, which is safe for skin</li></ul></div><div class=\"html-content detail-content\" style=\"margin: 16px 0px 0px; padding: 0px 0px 16px; word-break: break-word; position: relative; height: auto; line-height: 19px; overflow-y: hidden; border-bottom: 1px solid rgb(239, 240, 245);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; margin-block: 1em; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\"><br style=\"margin: 0px; padding: 0px;\">Laikou Sakura &amp; Vitamin C Serum Combo ( 17 ml +17ml )</span></p><p data-spm-anchor-id=\"0.0.0.i3.59ab7463boWIN3\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; margin-block: 1em; font-size: 14px;\">Welcome to our store! LAIKOU, focusing on research of the unique characteristics of lady\'s skin , and developing suitable lady skin care products made of natural plant ingredients with high qualities.LAIKOU Vitamin C Face Serum Anti Aging Remove Wrinkles Spots Acne+ Sakura Extract Serum Moisturizing Hydrating Whitening EssenceSpecificationsPlace of Origin:Guangdong, ChinaBrand: LAIKOUSkin Type:All skin typesShelf Life:3 yearsVolume:Vitamin C 17mlSakura Serum 17mlType:Vitamin C Whitening SerumSkin Type:All skin typesTarget Area:Face How to useApply proper amount of the serum evenly on the face, message your skin gently till it is fully absorbed. FunctionsVitamin C Serum* The product is rich in VC essence with high penetration and antioxidant stability, it can stay on the skin for more than 6 hours, enhance the brightening effect of 6 times skin color. * It can promote the synthesis of skin collagen and decrease melanin deposition. The vitamin C in the essence can be absorbed by the skin quickly. * Soothes the skin, helps the skin to restore whiteness, prevents the skin from aging, and leaves the skin white and supple. * Vitamin C essence has excellent natural protective power to help resist external environmental pollution, light pollution, and effectively improve dull skin, fade fine lines, shrink pores and other skin problems. * Improve skin resistance and enhance skin self-repair ability. * Hyaluronic acid has a good moisturizing effect, effectively moisturizes the skin, leaving the skin smooth and tenderSakura Serum*Sakura serum contains sakura extract, which is known for its moisturizing, anti-aging, brightening and anti-inflammatory functions.*Intensely rehydrate, restore skin’s glow and smoothen skin* For Dull Skin, it can brighten the skin tone*Suitable for all skin types and sensitive skin*Sakura extract is with excellent moisturizing and whitening effect and more than 80% of the ingredients are natural, which is safe for skinPackage includes:1 x Vitamin C Serum+1 x Sakura Serum</p><p data-we-empty-p=\"\" data-spm-anchor-id=\"0.0.0.i5.59ab7463boWIN3\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; margin-block: 1em; font-size: 14px;\"><img src=\"https://static-01.daraz.com.bd/p/3b2520f76c5a907a7f75a8216059615e.jpg\" data-spm-anchor-id=\"0.0.0.i6.59ab7463boWIN3\" style=\"margin: 0px; padding: 0px; display: block; height: auto !important;\"><br style=\"margin: 0px; padding: 0px;\"></p><span style=\"margin: 0px; padding: 0px;\"></span></div><div class=\"pdp-mod-specification\" style=\"margin: 16px 0px 0px; padding: 0px 0px 10px; border-bottom: 1px solid rgb(239, 240, 245); font-size: 14px;\"><h2 class=\"pdp-mod-section-title \" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: Roboto-Medium; font-size: 14px; line-height: 19px; color: rgb(33, 33, 33); letter-spacing: 0px; overflow: hidden; text-overflow: ellipsis; text-wrap: nowrap;\">Specifications of Laikou Sakura &amp; Vitamin C Serum Combo ( 17 ml +17ml )</h2><div class=\"pdp-general-features\" style=\"margin: 0px; padding: 0px;\"><ul class=\"specification-keys\" style=\"margin-top: 16px; margin-right: -15px; margin-left: -15px; height: auto;\"><li class=\"key-li\" style=\"margin: 0px 0px 8px; padding: 0px 15px; display: inline-block; width: 490px; vertical-align: top; line-height: 18px;\"><span class=\"key-title\" style=\"margin: 0px 18px 0px 0px; padding: 0px; display: inline-block; width: 140px; vertical-align: top; color: rgb(117, 117, 117); word-break: break-word;\">Brand</span><div class=\"html-content key-value\" style=\"margin: 0px; padding: 0px; word-break: break-word; display: inline-block; width: 306px;\">LAIKOU</div></li><li class=\"key-li\" style=\"margin: 0px 0px 8px; padding: 0px 15px; display: inline-block; width: 490px; vertical-align: top; line-height: 18px;\"><span class=\"key-title\" style=\"margin: 0px 18px 0px 0px; padding: 0px; display: inline-block; width: 140px; vertical-align: top; color: rgb(117, 117, 117); word-break: break-word;\">SKU</span><div class=\"html-content key-value\" style=\"margin: 0px; padding: 0px; word-break: break-word; display: inline-block; width: 306px;\">199771141_BD-1146912667</div></li></ul></div><div class=\"box-content\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i2.26734f33XEORd6\" style=\"margin: 28px 0px 0px; padding: 0px;\"><span class=\"key-title\" style=\"margin: 0px; padding: 0px; display: table-cell; width: 140px; color: rgb(117, 117, 117); word-break: break-word;\">What’s in the box</span><div class=\"html-content box-content-html\" style=\"margin: 0px; padding: 0px 0px 0px 18px; word-break: break-word; display: table-cell;\">serum combo</div></div></div></div></div>', 750.00, 295.00, 100, 'upload/product-images/1702909638.webp', 1, '2023-12-18 08:27:18', '2023-12-18 08:27:18');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(8, 2, 'upload/product-other-images/31049.webp', '2023-12-18 08:27:18', '2023-12-18 08:27:18'),
(9, 2, 'upload/product-other-images/31272.webp', '2023-12-18 08:27:18', '2023-12-18 08:27:18');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('aypulgg8r4FdNWavptX7RzXauDeVmvnfTLf8k57R', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQW9OWXpvU2xEZUIyU0RnWHJuSXVFVmpJQjhpQ0lacWJvb1RBc3ZoNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3QvZWNvbS1iYXRjaDkvcHVibGljL3Byb2R1Y3QvbWFuYWdlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMiR0TzRGN0VvSm5BNFo0WGNxN01hNU9ldkcwd1BxWTRuSmVKWVcxb0pHVGlDVWM2VmI4Z0p0ZSI7fQ==', 1702910055),
('iEv93Bp4ABelewmsMtQdPUU1BAhVPtftFGALX4dM', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNHVDeFRLblU4d05rREcycVdtOURSUFVVd0llakVEUW5uV0ZhYWtOdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3QvZWNvbS1iYXRjaDkvcHVibGljL3Byb2R1Y3QvZGV0YWlsLzEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJHRPNEY3RW9KbkE0WjRYY3E3TWE1T2V2RzB3UHFZNG5KZUpZVzFvSkdUaUNVYzZWYjhnSnRlIjt9', 1701410286),
('TEUtoj3oZrHYXiJYdB1tbFYSdGTLtAjZxr0ihPkv', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMUVtem5XaUJLYkxOZDk3Z0dJUElhbEZRbjUxY2R1aFd5Y3A0YmFFRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3QvZWNvbS1iYXRjaDkvcHVibGljL3Byb2R1Y3QvYWRkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMiR0TzRGN0VvSm5BNFo0WGNxN01hNU9ldkcwd1BxWTRuSmVKWVcxb0pHVGlDVWM2VmI4Z0p0ZSI7fQ==', 1701268407),
('yrw90uTeTl63t9abR1NJm7b2ypRnNPDSTauk2wGX', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibGIyd0FnOFNHU2ZvQzBlbFBUdnFZbWlEWDI3TnltZFIxaXlJeXZtOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3QvZWNvbS1iYXRjaDkvcHVibGljL3Byb2R1Y3QvYWRkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMiR0TzRGN0VvSm5BNFo0WGNxN01hNU9ldkcwd1BxWTRuSmVKWVcxb0pHVGlDVWM2VmI4Z0p0ZSI7fQ==', 1701096915);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 'Football', 'Football', 'uploads/sub-category-images/1700661433.jpg', 1, '2023-11-22 07:57:13', '2023-11-22 07:57:13'),
(2, 2, 'T Shirt', 'T Shirt', 'uploads/sub-category-images/1700663236.jpg', 1, '2023-11-22 08:27:16', '2023-11-22 08:27:16'),
(3, 2, 'Jens Pant', 'Jens Pant', 'uploads/sub-category-images/1700799268.jpg', 1, '2023-11-23 22:14:28', '2023-11-23 22:14:28'),
(4, 6, 'Cosmetics', 'good', 'uploads/sub-category-images/1700805444.jpg', 0, '2023-11-23 23:26:47', '2023-11-23 23:57:24'),
(5, 7, 'Skin Care', 'Skin Care', 'uploads/sub-category-images/1702909383.jpg', 1, '2023-12-18 08:23:03', '2023-12-18 08:23:03');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `code`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Kilogram', 'kg', 'sdasd', 1, '2023-11-27 06:37:23', '2023-11-27 06:37:23'),
(2, 'Piece', 'Piece', 'Piece', 1, '2023-11-27 06:38:34', '2023-11-27 06:38:34'),
(3, 'Litter', 'LT', 'sasd', 1, '2023-11-27 06:38:42', '2023-11-27 06:38:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@admin.com', NULL, '$2y$12$tO4F7EoJnA4Z4Xcq7Ma5OevG0wPqY4nJeJYW1oJGTiCUc6Vb8gJte', NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-13 07:23:18', '2023-11-13 07:23:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
