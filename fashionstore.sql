-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2024 at 11:32 AM
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
-- Database: `fashionstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add contact', 1, 'add_contact'),
(2, 'Can change contact', 1, 'change_contact'),
(3, 'Can delete contact', 1, 'delete_contact'),
(4, 'Can view contact', 1, 'view_contact'),
(5, 'Can add orders', 2, 'add_orders'),
(6, 'Can change orders', 2, 'change_orders'),
(7, 'Can delete orders', 2, 'delete_orders'),
(8, 'Can view orders', 2, 'view_orders'),
(9, 'Can add user', 3, 'add_users'),
(10, 'Can change user', 3, 'change_users'),
(11, 'Can delete user', 3, 'delete_users'),
(12, 'Can view user', 3, 'view_users'),
(13, 'Can add product', 4, 'add_product'),
(14, 'Can change product', 4, 'change_product'),
(15, 'Can delete product', 4, 'delete_product'),
(16, 'Can view product', 4, 'view_product'),
(17, 'Can add cart item', 5, 'add_cartitem'),
(18, 'Can change cart item', 5, 'change_cartitem'),
(19, 'Can delete cart item', 5, 'delete_cartitem'),
(20, 'Can view cart item', 5, 'view_cartitem'),
(21, 'Can add log entry', 6, 'add_logentry'),
(22, 'Can change log entry', 6, 'change_logentry'),
(23, 'Can delete log entry', 6, 'delete_logentry'),
(24, 'Can view log entry', 6, 'view_logentry'),
(25, 'Can add permission', 7, 'add_permission'),
(26, 'Can change permission', 7, 'change_permission'),
(27, 'Can delete permission', 7, 'delete_permission'),
(28, 'Can view permission', 7, 'view_permission'),
(29, 'Can add group', 8, 'add_group'),
(30, 'Can change group', 8, 'change_group'),
(31, 'Can delete group', 8, 'delete_group'),
(32, 'Can view group', 8, 'view_group'),
(33, 'Can add content type', 9, 'add_contenttype'),
(34, 'Can change content type', 9, 'change_contenttype'),
(35, 'Can delete content type', 9, 'delete_contenttype'),
(36, 'Can view content type', 9, 'view_contenttype'),
(37, 'Can add session', 10, 'add_session'),
(38, 'Can change session', 10, 'change_session'),
(39, 'Can delete session', 10, 'delete_session'),
(40, 'Can view session', 10, 'view_session'),
(41, 'Can add lastclick', 11, 'add_lastclick'),
(42, 'Can change lastclick', 11, 'change_lastclick'),
(43, 'Can delete lastclick', 11, 'delete_lastclick'),
(44, 'Can view lastclick', 11, 'view_lastclick'),
(45, 'Can add notification', 12, 'add_notification'),
(46, 'Can change notification', 12, 'change_notification'),
(47, 'Can delete notification', 12, 'delete_notification'),
(48, 'Can view notification', 12, 'view_notification');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'admin', 'logentry'),
(8, 'auth', 'group'),
(7, 'auth', 'permission'),
(9, 'contenttypes', 'contenttype'),
(10, 'sessions', 'session'),
(5, 'store', 'cartitem'),
(1, 'store', 'contact'),
(11, 'store', 'lastclick'),
(12, 'store', 'notification'),
(2, 'store', 'orders'),
(4, 'store', 'product'),
(3, 'store', 'users');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-04-15 02:02:20.857568'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-04-15 02:02:20.934502'),
(3, 'auth', '0001_initial', '2024-04-15 02:02:21.136641'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-04-15 02:02:21.176523'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-04-15 02:02:21.186262'),
(6, 'auth', '0004_alter_user_username_opts', '2024-04-15 02:02:21.191046'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-04-15 02:02:21.191046'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-04-15 02:02:21.191046'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-04-15 02:02:21.199049'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-04-15 02:02:21.207764'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-04-15 02:02:21.215359'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-04-15 02:02:21.220087'),
(13, 'auth', '0011_update_proxy_permissions', '2024-04-15 02:02:21.231365'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-04-15 02:02:21.237658'),
(15, 'auth', '0013_user_age_user_gender_user_image_user_interests_and_more', '2024-04-15 02:02:21.252430'),
(16, 'auth', '0014_remove_user_groups_remove_user_is_superuser_and_more', '2024-04-15 02:02:21.262725'),
(17, 'auth', '0015_user_groups_user_is_superuser_user_user_permissions', '2024-04-15 02:02:21.275177'),
(18, 'store', '0001_initial', '2024-04-15 02:02:21.689033'),
(19, 'admin', '0001_initial', '2024-04-15 02:02:21.781027'),
(20, 'admin', '0002_logentry_remove_auto_add', '2024-04-15 02:02:21.792078'),
(21, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-15 02:02:21.800124'),
(22, 'sessions', '0001_initial', '2024-04-15 02:02:21.831885'),
(23, 'store', '0002_alter_users_age_alter_users_city_and_more', '2024-04-15 02:04:50.982738'),
(24, 'store', '0003_alter_orders_billing_address', '2024-04-15 16:46:09.936276'),
(25, 'store', '0004_alter_product_id', '2024-04-15 17:36:46.820276'),
(26, 'store', '0005_lastclick', '2024-04-29 13:08:02.790507'),
(27, 'store', '0006_alter_users_gender', '2024-04-29 15:54:50.714117'),
(28, 'store', '0007_orders_label', '2024-05-16 18:52:02.141809'),
(29, 'store', '0002_orders_status', '2024-05-17 12:35:30.827432'),
(30, 'store', '0003_notification', '2024-05-19 14:43:44.501002'),
(31, 'store', '0004_orders_logistic', '2024-05-20 02:04:34.915223');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0n7otz7i07nuat63pyb9oyv83id1z6vs', '.eJxVjEEOwiAQRe_C2jQwYFu6dO8JjCHDMNiqKabQlfHu0qQL3f7333sLh2sZ3Zp5cVMQg9Di8Lt5pAfPGwh3nG-poTSXZfLNdml2mptzCvw87d-_wIh5rHYnoVeSrUHVQU8terYUI0irEY46BtMpMi17j5ZkCASKQGuoAoKPWKOZn0yFg3stKaxUshguAiow4vr5AhRYQd4:1rwQjw:IlWP5DPuZSqUoZ5T_T0gZKuNlPYkt9H5cGuYPvNddaQ', '2024-04-29 18:07:36.174275'),
('12omg3znwbzwrczy24zo3y9q77y162be', '.eJxVjEEOwiAURO_C2hCgUPq7dN8TGEM-fLTVpphCV8a7S5MudDGLmTczb-ZwK6PbclzdRKxnmp1-M4_hGZcd0AOXe-IhLWWdPN8r_KCZD4nifD66fwcj5rGuBQavrYdoBFKjOm1bkErKW4tatt6j9qYTZExQJEEAWTDKkJBNtQChnuY4x1AiudeaaAsls_7CugqgyrLr5wvm9EFW:1s8jg4:VWpzGV3xbUvGJpxc0H13COcHi9l5xAPfthtKx-T3Ycs', '2024-06-02 16:46:28.387951'),
('2ss5yw4fb98vc219kgvkrvd93ynmkdrj', '.eJxVjDsOwyAQBe9CHSE-C5iU6X0GtLAQnERYMnYV5e6xJRdJOzPvvVnAba1h63kJE7Erk4JdfmHE9MztMPTAdp95mtu6TJEfCT9t5-NM-XU727-Dir3ua6EdEIC12kmDKikUHq3PWLQTdmfCF0Ag1MVhNGSNAgU52cEgDEayzxfbZTcM:1s8X0O:vlYHLA7JkXq3VtK71F80z0ERPUleY48IFnD98uzLlEQ', '2024-06-02 03:14:36.717501'),
('69rp8xviquqqqp5pbjdna17xtrt666qd', '.eJxVjEEOwiAQRe_C2pAy0DJ16d4zkGEGpGpoUtqV8e7apAvd_vfef6lA21rC1tISJlFnZdTpd4vEj1R3IHeqt1nzXNdlinpX9EGbvs6SnpfD_Tso1Mq3jhGzMQMIOOHoRxLuwHaA4jIySu-sQ8IBAZIHGck4TtGzt8aZ3mb1_gDl5Dee:1s8t45:LsfIgJ-HbJmsfxLXo1HvngJ9BFD2pOX2eojWK09NRtI', '2024-06-03 02:47:53.551714'),
('cqi4jvf84yz9c0er6ajixkcmgr2le2gp', '.eJxVjMsOwiAQRf-FtSEjb1y67zeQYQCpGkhKuzL-uzbpQrf3nHNfLOC21rCNvIQ5sQsT7PS7RaRHbjtId2y3zqm3dZkj3xV-0MGnnvLzerh_BxVH_dY-EWlr0QoUXioHkJT22ulSClhhZZaZwJOSBs8ExogE0RcdlXHKCs_eH8s0NvY:1rwPlu:cxdTvWrZKoU4HIzkLOAkLBUydAlKfORWWs1D1pCw1Uo', '2024-04-29 17:05:34.687278'),
('pprsbqk9t8xcq7ezvlb5zwj4xy13yxzi', '.eJxVjMEOwiAQRP9lz4YAZWnp0btfYAxZWLRVU0yhJ-O_2yY96HFm3rw3eFrq4JeSZj8y9GDg8NsFio80bQPfabplEfNU5zGIDRH7WsQpc3oed_ZPMFAZ1rekGEwbXEJJ3OjOtNYprdTVklE2BDIBO8mIUbNy0nHrUCNL1azRubhKS3qmWBP715x5ibVAfwa0cPl8ASTEQDk:1s7g8v:mQzjm1icvlKkTl5sTo2ZDKY2dynl4ZlJsngwgVgOuYM', '2024-05-30 18:47:53.970217'),
('ve086m4svcwpw5ayky845ijfy3t1s3to', '.eJxVjM0OwiAQhN-FsyFA-el69O4zkF0WpWogKe3J-O62SQ96nPm-mbeIuC4lrj3PcWJxFlacfjvC9Mx1B_zAem8ytbrME8ldkQft8to4vy6H-3dQsJdtrTCRDQTZKeTBjDZ40Ebrm0erPRFacqNi55JhDQo4gDOOlR62CJDE5wvSOjcM:1s7SOb:-zNypdFhYUoDm7B9TYv2hJlKWspADJcHQ1bUoG8adJM', '2024-05-30 04:07:09.565731'),
('xavztcpdy02b473zqt45lisyfq0lp58t', '.eJxVjMsOwiAQRf-FtSEjb1y67zeQYQCpGkhKuzL-uzbpQrf3nHNfLOC21rCNvIQ5sQsT7PS7RaRHbjtId2y3zqm3dZkj3xV-0MGnnvLzerh_BxVH_dY-EWlr0QoUXioHkJT22ulSClhhZZaZwJOSBs8ExogE0RcdlXHKCs_eH8s0NvY:1s77y2:titatYj4PwAjGDaUk3lVjNvjKyUMkXx9DR7n3zWlRlE', '2024-05-29 06:18:22.407874');

-- --------------------------------------------------------

--
-- Table structure for table `store_cartitem`
--

CREATE TABLE `store_cartitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `user_id` bigint(20) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_contact`
--

CREATE TABLE `store_contact` (
  `id` bigint(20) NOT NULL,
  `name` varchar(122) NOT NULL,
  `email` varchar(254) NOT NULL,
  `subject` varchar(254) NOT NULL,
  `message` longtext NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_lastclick`
--

CREATE TABLE `store_lastclick` (
  `id` bigint(20) NOT NULL,
  `product_clicked_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_lastclick`
--

INSERT INTO `store_lastclick` (`id`, `product_clicked_id`, `user_id`) VALUES
(3, 29, 4),
(5, 27, 8);

-- --------------------------------------------------------

--
-- Table structure for table `store_notification`
--

CREATE TABLE `store_notification` (
  `id` bigint(20) NOT NULL,
  `message` longtext NOT NULL,
  `date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_notification`
--

INSERT INTO `store_notification` (`id`, `message`, `date`, `status`, `user_id`) VALUES
(4, 'Your order (172) has been placed.', '2024-05-19', 'delivered', 4),
(5, 'Your order (169) has been shipped.', '2024-05-19', 'delivered', 4),
(6, 'Your order (173) has been placed.', '2024-05-20', 'delivered', 4),
(7, 'Your order (173) has been shipped.', '2024-05-20', 'delivered', 4),
(8, 'Your order (173) has been delivered.', '2024-05-20', 'delivered', 4),
(9, 'Your order (172) has been shipped.', '2024-05-20', 'delivered', 4),
(10, 'Your order (172) has been delivered.', '2024-05-20', 'delivered', 4),
(11, 'Your order (171) has been placed.', '2024-05-20', 'delivered', 4);

-- --------------------------------------------------------

--
-- Table structure for table `store_orders`
--

CREATE TABLE `store_orders` (
  `id` bigint(20) NOT NULL,
  `user` varchar(100) NOT NULL,
  `product` varchar(200) NOT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL CHECK (`quantity` >= 0),
  `payment_method` varchar(20) NOT NULL,
  `card_number` varchar(16) DEFAULT NULL,
  `expiry_date` varchar(5) DEFAULT NULL,
  `cvv` varchar(4) DEFAULT NULL,
  `card_holder_name` varchar(100) DEFAULT NULL,
  `billing_address` longtext DEFAULT NULL,
  `label` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `logistic_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_orders`
--

INSERT INTO `store_orders` (`id`, `user`, `product`, `quantity`, `payment_method`, `card_number`, `expiry_date`, `cvv`, `card_holder_name`, `billing_address`, `label`, `status`, `logistic_id`) VALUES
(116, 'user3', 'Hanes mens Ecosmart Fleece Full-zip Hoodie, Zip-up', 1, 'Credit Card', '3456789012345678', '02/26', '345', 'User Three', '9101 Main St, City, Country', 'Hoodie', '2', NULL),
(118, 'user5', 'Men\'s Storm Liner', 1, 'Credit Card', '4567890123456789', '03/27', '456', 'User Four', '5678 Elm St, City, Country', 'Gloves', '2', NULL),
(119, 'user6', 'Terramar Womens Ultra Merino GlovesAdult Jaquard G', 2, 'Credit Card', '5678901234567890', '04/28', '567', 'User Five', '9101 Elm St, City, Country', 'Gloves', '2', NULL),
(120, 'user7', 'Nicole Miller womens Fashion Scarf and Shawl Wrap', 1, 'Credit Card', '6789012345678901', '05/29', '678', 'User Six', '1234 Oak St, City, Country', 'Scarf', '2', NULL),
(121, 'user8', 'Alpine Swiss Mens Plaid Scarf Softer Than Cashmere', 1, 'Credit Card', '7890123456789012', '06/30', '789', 'User Seven', '5678 Oak St, City, Country', 'Scarf', '2', NULL),
(125, 'user12', 'Men\'s Long-Sleeve Flannel Shirt (Available in Big', 1, 'Credit Card', '0123456789012345', '09/33', '012', 'User Ten', '9101 Pine St, City, Country', 'Shirt', '2', NULL),
(126, 'user13', 'Gildan Men\'s V-Neck T-Shirts, Multipack, Style G11', 2, 'PayPal', NULL, NULL, NULL, NULL, '1234 Maple St, City, Country', 'T-shirt', '2', NULL),
(127, 'user14', 'Gildan Women\'s Softstyle Cotton T-Shirt, Style G64', 1, 'Credit Card', '1234567890123456', '10/34', '123', 'User Eleven', '5678 Maple St, City, Country', 'T-shirt', '2', NULL),
(128, 'user15', 'GRACE KARIN Women\'s 2024 Peplum Tops Dressy Wrap V', 1, 'Credit Card', '2345678901234567', '11/35', '234', 'User Twelve', '9101 Maple St, City, Country', 'Blouse', '2', NULL),
(129, 'user16', 'Women\'s Heavyweight Long-Sleeve Hooded Puffer Coat', 1, 'Credit Card', '3456789012345678', '12/36', '345', 'User Thirteen', '1234 Birch St, City, Country', 'Coat', '2', NULL),
(130, 'user17', 'Dockers Men\'s Henry Wool Blend Top Coat', 2, 'PayPal', NULL, NULL, NULL, NULL, '5678 Birch St, City, Country', 'Coat', '2', NULL),
(131, 'user18', 'Allegra K Women\'s Winter Overcoat Mid-Long Stand C', 1, 'Credit Card', '4567890123456789', '01/37', '456', 'User Fourteen', '9101 Birch St, City, Country', 'Coat', '2', NULL),
(132, 'user19', 'Nine West Women\'s Boxed Necklace/Pierced Earrings', 1, 'Credit Card', '5678901234567890', '02/38', '567', 'User Fifteen', '1234 Cedar St, City, Country', 'Jewelry', '2', NULL),
(133, 'user20', 'Jewelry Set for Women Water Drop Cubic Zirconia Ar', 3, 'Credit Card', '6789012345678901', '03/39', '678', 'User Sixteen', '5678 Cedar St, City, Country', 'Jewelry', '2', NULL),
(134, 'user21', 'Uloveido Natural Stone 8MM Beads Bracelet with Fai', 2, 'PayPal', NULL, NULL, NULL, NULL, '9101 Cedar St, City, Country', 'Jewelry', '2', NULL),
(135, 'user22', 'COCIFER Purses and Handbags for Women Shoulder Tot', 1, 'Credit Card', '7890123456789012', '04/40', '789', 'User Seventeen', '1234 Spruce St, City, Country', 'Handbag', '3', NULL),
(136, 'user23', 'Mens Wallet Long Purse Leather Clutch Large Busine', 1, 'Credit Card', '8901234567890123', '05/41', '890', 'User Eighteen', '5678 Spruce St, City, Country', 'Handbag', '2', NULL),
(137, 'user24', 'Elina fashion Indian Pakistani Women\'s Readymade D', 1, 'Credit Card', '9012345678901234', '06/42', '901', 'User Nineteen', '9101 Spruce St, City, Country', 'Dress', '2', NULL),
(138, 'user25', 'Elina fashion Men\'s Tunic Cotton Kurta Pajama Set', 2, 'PayPal', NULL, NULL, NULL, NULL, '1234 Willow St, City, Country', 'Dress', '2', NULL),
(139, 'user26', 'Signature by Levi Strauss & Co. Gold Women\'s Moder', 1, 'Credit Card', '1122334455667788', '05/25', '101', 'User TwentySix', '2233 Elm St, City, Country', 'Jeans', '2', NULL),
(140, 'user27', 'Lee Men\'s Extreme Motion Straight Taper Jean', 1, 'Credit Card', '2233445566778899', '06/26', '202', 'User TwentySeven', '3344 Oak St, City, Country', 'Jeans', '2', NULL),
(141, 'user28', 'vineyard vines Women\'s Herringbone 5 Inch Every Da', 2, 'Credit Card', '3344556677889900', '07/27', '303', 'User TwentyEight', '4455 Pine St, City, Country', 'Shorts', '2', NULL),
(142, 'user29', 'Volcom Men\'s Frickin Modern Stretch Chino', 1, 'Credit Card', '4455667788990011', '08/28', '404', 'User TwentyNine', '5566 Maple St, City, Country', 'Shorts', '4', NULL),
(143, 'user30', 'Timberland Men\'s White Ledge Mid Waterproof Hiking', 1, 'Credit Card', '5566778899001122', '09/29', '505', 'User Thirty', '6677 Birch St, City, Country', 'Boots', '2', NULL),
(144, 'user31', 'Women\'s Lace-Up Combat Boot', 2, 'PayPal', NULL, NULL, NULL, NULL, '7788 Cedar St, City, Country', 'Boots', '2', NULL),
(145, 'user32', 'Teva Women\'s Original Universal Sandal', 1, 'Credit Card', '6677889900112233', '10/30', '606', 'User ThirtyOne', '8899 Spruce St, City, Country', 'Sandals', '2', NULL),
(146, 'user33', 'Dockers Men’s Newpage Sporty Outdoor Sandal Shoe', 1, 'Credit Card', '7788990011223344', '11/31', '707', 'User ThirtyTwo', '9900 Willow St, City, Country', 'Sandals', '2', NULL),
(147, 'user34', 'DUSHINE Polarized Sunglasses for Women Classic Ret', 2, 'Credit Card', '8899001122334455', '12/32', '808', 'User ThirtyThree', '1111 Palm St, City, Country', 'Sunglasses', '2', NULL),
(148, 'user35', 'Ray-Ban Rb3025 Classic Polarized Aviator Sunglasse', 1, 'Credit Card', '9900112233445566', '01/33', '909', 'User ThirtyFour', '2222 Walnut St, City, Country', 'Sunglasses', '2', NULL),
(149, 'user36', 'Calvin Klein Men\'s Embroidered Baseball Hat', 3, 'PayPal', NULL, NULL, NULL, NULL, '3333 Chestnut St, City, Country', 'Hat', '2', NULL),
(150, 'user37', 'Carve Designs Women\'s Dundee Crushable', 1, 'Credit Card', '0011223344556677', '02/34', '010', 'User ThirtyFive', '4444 Sycamore St, City, Country', 'Hat', '2', NULL),
(151, 'user38', 'Women\'s Fisherman Cable Turtleneck Sweater', 2, 'Credit Card', '1122334455667788', '03/35', '111', 'User ThirtySix', '5555 Poplar St, City, Country', 'Sweater', '3', 1),
(152, 'user39', 'Men\'s Crewneck Sweater-Discontinued Colors', 1, 'Credit Card', '2233445566778899', '04/36', '212', 'User ThirtySeven', '6666 Fir St, City, Country', 'Sweater', '1', NULL),
(153, 'user40', 'GUESS Women\'s Loven Sneaker', 1, 'Credit Card', '3344556677889900', '05/37', '313', 'User ThirtyEight', '7777 Beech St, City, Country', 'Sneakers', '1', NULL),
(154, 'user41', 'Cole Haan Men\'s Grandpro Rally Canvas Court Sneake', 2, 'PayPal', NULL, NULL, NULL, NULL, '8888 Dogwood St, City, Country', 'Sneakers', '1', NULL),
(155, 'user42', 'PUMA Men\'s 8 Pack Low Cut Socks', 1, 'Credit Card', '4455667788990011', '06/38', '414', 'User ThirtyNine', '9999 Hickory St, City, Country', 'Socks', '1', NULL),
(156, 'user43', 'Womens Classic Turn Cuff Socks 6 Pack', 1, 'Credit Card', '5566778899001122', '07/39', '515', 'User Forty', '1010 Birch St, City, Country', 'Socks', '2', NULL),
(157, 'user44', 'Levi\'s Women\'s Cotton Hooded Field Jacket', 3, 'PayPal', NULL, NULL, NULL, NULL, '2020 Elm St, City, Country', 'Jacket', '1', NULL),
(158, 'user45', 'PUMA Men\'s Transeasonal Jacket', 1, 'Credit Card', '6677889900112233', '08/40', '616', 'User FortyOne', '3030 Oak St, City, Country', 'Jacket', '1', NULL),
(159, 'user46', 'Under Armour Men\'s Surge 3 Running Shoe', 2, 'Credit Card', '7788990011223344', '09/41', '717', 'User FortyTwo', '4040 Pine St, City, Country', 'Shoes', '2', NULL),
(160, 'user47', 'ASICS Women\'s Gel-Contend 8 Running Shoes', 1, 'Credit Card', '8899001122334455', '10/42', '818', 'User FortyThree', '5050 Maple St, City, Country', 'Shoes', '2', NULL),
(161, 'user48', 'LOVEVOOK Laptop Backpack for Women, 15.6 Inch Work', 1, 'Credit Card', '9900112233445566', '11/43', '919', 'User FortyFour', '6060 Birch St, City, Country', 'Backpack', '2', NULL),
(162, 'user49', 'Carhartt 21L Backpack, Durable Water-Resistant Pac', 2, 'PayPal', NULL, NULL, NULL, NULL, '7070 Cedar St, City, Country', 'Backpack', '1', NULL),
(163, 'user50', 'Eddie Bauer Men\'s Casual Leather Belt with Metal B', 1, 'Credit Card', '0011223344556677', '12/44', '020', 'User FortyFive', '8080 Spruce St, City, Country', 'Belt', '2', NULL),
(164, 'user51', 'Eddie Bauer Women\'s Casual Leather Belts, One Size', 1, 'Credit Card', '1122334455667788', '01/45', '121', 'User FortySix', '9090 Willow St, City, Country', 'Belt', '1', NULL),
(165, 'ali@ali.com', 'DUSHINE Polarized Sunglasses for Women Classic Retro Style 100% UV Protection', 2, 'Cash on Delivery', NULL, NULL, NULL, NULL, NULL, 'Sunglasses', '2', NULL),
(166, 'ali@ali.com', 'Men\'s Storm Liner', 1, 'Cash on Delivery', NULL, NULL, NULL, NULL, NULL, 'Gloves', '2', NULL),
(167, 'ali@ali.com', 'MEROKEETY Women\'s Boho Leopard Print Skirt Pleated A-Line Swing Midi Skirts', 1, 'Cash on Delivery', NULL, NULL, NULL, NULL, NULL, 'Skirt', '2', NULL),
(168, 'ali@ali.com', 'PUKAVT Women\'s Basic Casual Skirts A-Line Mini Flared Stretchy Skater Party Skirt', 1, 'Cash on Delivery', NULL, NULL, NULL, NULL, NULL, 'Skirt', '2', NULL),
(169, 'ali@ali.com', 'Hanes mens Ecosmart Fleece Full-zip Hoodie, Zip-up Hooded Sweatshirt', 1, 'Cash on Delivery', NULL, NULL, NULL, NULL, NULL, 'Hoodie', '3', NULL),
(170, 'ali@ali.com', 'Hanes mens Ecosmart Fleece Full-zip Hoodie, Zip-up Hooded Sweatshirt', 1, 'Cash on Delivery', NULL, NULL, NULL, NULL, NULL, 'Hoodie', '1', NULL),
(171, 'ali@ali.com', 'Women\'s Rival Fleece Pull-Over Hoodie', 1, 'Cash on Delivery', NULL, NULL, NULL, NULL, NULL, 'Hoodie', '2', 1),
(172, 'ali@ali.com', 'PUKAVT Women\'s Basic Casual Skirts A-Line Mini Flared Stretchy Skater Party Skirt', 1, 'Cash on Delivery', NULL, NULL, NULL, NULL, NULL, 'Skirt', '4', 10),
(173, 'ali@ali.com', 'Mens Wallet Long Purse Leather Clutch Large Business Handbag Phone Card Holder Case Gift for Men Fat', 1, 'Cash on Delivery', NULL, NULL, NULL, NULL, NULL, 'Handbag', '4', 10);

-- --------------------------------------------------------

--
-- Table structure for table `store_product`
--

CREATE TABLE `store_product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `label` varchar(20) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `seller_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_product`
--

INSERT INTO `store_product` (`id`, `name`, `gender`, `label`, `category`, `description`, `price`, `discount_price`, `image`, `seller_id`) VALUES
(6, 'MEROKEETY Women\'s Boho Leopard Print Skirt Pleated A-Line Swing Midi Skirts', '0', 'Skirt', 'Clothes', 'Material: Polyester. Trendy animal print pattern paired with soft and lightweight fabric, comfortable to wear. The leopard print skirts in color red and white with lining layer, will not see through\r\nUnique Design: This women long flowy skirt is feture with stretchy high waist, cheetah print, pleated, A-line, maxi skrit, midi skrit. This elegant spotted animal print skrit is the hot trend, it\'s sure to stand out from the crowd\r\nOccasion: This casual fashion maxi midi long skirt can be wore on casual, daily, date, travel, holiday, wedding, party, cocktail, beach occasions and so on. Pair with tank, blouse or t-shirts, with flats or heels to create a vintage look. Perfect for spring, summer and autumn\r\nWashing Instruction: Machine washable and hand-wash, do not bleach, wash together with similar colours. Any question? Please feel free to contact us. We will reply within 12 hours\r\n', 7000.00, 6500.00, 'products/women_skirt.jpg', 2),
(7, 'PUKAVT Women\'s Basic Casual Skirts A-Line Mini Flared Stretchy Skater Party Skirt', '0', 'Skirt', 'Clothes', 'Garment Care: Machine Wash and Hand Wash available.\r\nSuitable Occasion : casual parties skirt, school dance skirt, office skirt, dates skirt, cosplay skirt, performances skirt, Rehearsal skirt, costume dress-up party skirt, marathons skrit, Halloween skirt, raves skirt, club dance skirt, night out skirt, festivals skirt, and more.\r\nTips: Please note that due to limitations in photography and the inevitable differences in monitor settings, the colors shown in the photography may slightly differ from the real items.', 9000.00, 5678.00, 'products/women_skirt_2.jpg', 2),
(8, 'Hanes mens Ecosmart Fleece Full-zip Hoodie, Zip-up Hooded Sweatshirt', '1', 'Hoodie', 'Clothes', 'LEECE TO FEEL GOOD ABOUT – EcoSmart mid-weight cotton/poly fleece with up to 5% of the poly fibers.\r\nCLASSIC ZIP-FRONT SILHOUETTE – Full-zip front with a drawstring hood and front pockets.\r\nMADE TO STAY SOFT – Pill-resistant durable fleece stays warm and cozy.\r\nHOLDS ITS SHAPE - Thanks to ribbed cuffs and hem.\r\nMADE TO LAST – Double-needle stitching at the neck and armhole seams for quality and durability, plus a dyed-to-match drawstring at the hood.', 6789.00, 3456.00, 'products/mens_hoodie.jpg', 2),
(9, 'Women\'s Rival Fleece Pull-Over Hoodie', '0', 'Hoodie', 'Clothes', 'Ultra-soft, mid-weight cotton-blend fleece with brushed interior for extra warmth\r\nCrossover hood with drawcord adjust\r\nFront kangaroo pocket\r\nRibbed cuffs & bottom hem\r\nRaglan sleeves', 9876.00, 4567.00, 'products/women_hoodie.jpg', 2),
(10, 'Men\'s Storm Liner', '1', 'Gloves', 'Accessories', 'A Storm technology repels water without sacrificing breathability\r\nThin, fitted liner gloves can be worn on their own or as a first layer\r\nUltra-soft knit fabric with a smooth exterior & a plush interior for just the right amount of warmth\r\nTech Touch on thumbs & index fingers so you can use touch screen devices without taking your gloves off\r\nExtra soft Speedwipe fleece placed on back of index finger & thumb', 5672.00, 2222.00, 'products/mens_gloves.jpg', 2),
(11, 'Terramar Womens Ultra Merino GlovesAdult Jaquard Gloves', '0', 'Gloves', 'Accessories', 'Comfortable: Made with 50% polyester, 35% merino wool and 15% nylon, these Ultra Merino women\'s gloves are the best Mother Nature has to offer for optimal performance and extra comfort.\r\nFunctional: Touch Tip Technology allows you to utilize your favorite devices, keeping your hands dry and warm while on the go.\r\nModern Style: These women\'s gloves feature a silicone palm grip, making them stylish and practical\r\nVariety: These Ultra Merino gloves come in a trio of colors; Charcoal Heather, Black Back Country and Rose Snow Dusting and a multitude of sizes; Small, Medium and Large. View the size chart for a more accurate fit!', 8889.00, 5678.00, 'products/womens_gloves.jpg', 2),
(12, 'Nicole Miller womens Fashion Scarf and Shawl Wrap for Spring/Summer WinterScarves', '0', 'Scarf', 'Accessories', 'Versized Shawl Elegance: Embrace style and comfort with our oversized shawl scarves, options measuring up to a generous 35\" x 72\" with delicate 1/2\" fringes. The perfect accessory for any outfit, providing a versatile and chic addition to your wardrobe.\r\nIdeal Gift for Any Occasion: These lightweight fashion scarves make for an ideal gift, combining practicality with fashion-forward design. Whether it\'s a birthday, anniversary, or just a thoughtful gesture, these scarves are sure to be cherished by any woman who loves to accessorize with flair.\r\nPremium Quality: Crafted from high-quality 100% polyester, these fashion scarves for women offer a luxurious feel against the skin while maintaining durability. The lightweight gauze fabric ensures breathability, making them perfect for year-round wear.', 3432.00, 2342.00, 'products/woemen_scarf.jpg', 2),
(13, 'Alpine Swiss Mens Plaid Scarf Softer Than Cashmere Scarves Winter Shawl', '1', 'Scarf', 'Accessories', 'STYLISH – Our selection features various solid, plaid, and striped designs to fit your personal style. The versatile prints and fringe ends elevate any casual, dressy, or professional outfit.\r\nFUNCTIONAL - Measures 12” W x 80” L and is long enough to wrap in multiple ways and can be worn by both men and women.\r\nEASY CARE – The material of this scarf is super soft, lightweight, and conveniently machine washable.', 5434.00, 3000.00, 'products/mens_scarf.jpg', 2),
(14, 'Lee Men\'s Extreme Motion Flat Front Slim Straight Pant', '1', 'Pants', 'Clothes', 'SLIM FIT. With a slim fit through the hip and thigh, these men\'s pants sit at the natural waist with a flex waistband for comfort. These slim fit pants provide a modern look that keeps you comfortable all day long.\r\nEXTRA STORAGE. These straight fit pants are designed with four pockets with a timeless look, perfect for most occasions.\r\nLIVE IN COMFORT. The Extreme Comfort Pant offers work-to-play versatility. Athletic details like mesh pockets, a flex waistband and Active Comfort Fabric make these pants insanely comfortable and offer a modern look.\r\nA LIFETIME OF QUALITY. For over 100 years, Lee has produced quality apparel with durability and long-lasting construction in mind. Lee is committed to designing clothing that conforms to your body, allowing you to move through life freely.\r\nSPECIFICATIONS. Zipper fly with button closure, leg opening: 15\".\r\n', 5000.00, 4500.00, 'products/mens_pants.jpg', 2),
(15, 'Women\'s Fleece Straight Leg Sweatpant', '0', 'Pants', 'Clothes', 'REGULAR FIT: Close but comfortable fit through hip and thigh. Mid rise, sits below the natural waist.\r\nCOZY BRUSHED BACK FLEECE: Buttery soft and comfy midweight cotton blend fleece with brushed interior.\r\nSTRAIGHT LEG SWEATPANT: Designed with a straight silhouette, this style offers ultimate ease and comfort whether you are on the go, at the gym, or lounging at home. Fits slim through the leg then eases up below the knee.', 6789.00, 4567.00, 'products/women_pants.jpg', 2),
(16, 'Women\'s Classic-Fit Long-Sleeve Button-Down Poplin Shirt', '0', 'Shirt', 'Clothes', 'CLASSIC FIT: Close but comfortable fit with easy movement.\r\nLIGHTWEIGHT COTTON POPLIN: Lightweight, airy cotton poplin fabric that is washed for a soft, lived-in feel.\r\nEVERYDAY SHIRTING: This classic poplin shirt is the perfect wardrobe essential', 5678.00, 4567.00, 'products/women_shirt.jpg', 2),
(17, 'Men\'s Long-Sleeve Flannel Shirt (Available in Big & Tall)', '1', 'Shirt', 'Clothes', 'REGULAR FIT: Comfortable, easy fit through the shoulders, chest, and waist.\r\nBRUSHED COTTON FLANNEL: Cut from a 100% cotton twill flannel brushed for softness. This durable and versatile fabric is lightweight yet warm.\r\nEVERYDAY SHIRTING: Wear with jeans or khakis, layered or on its own, this collared button-up flannel is a versatile workhorse for your wardrobe.', 3330.00, 2390.00, 'products/mens_shirt.jpg', 2),
(18, 'Gildan Men\'s V-Neck T-Shirts, Multipack, Style G1103', '1', 'T-shirt', 'Clothes', 'Soft, breathable cotton\r\nMoisture wicking technology keeps you cool and dry\r\nTag-free to prevent irritation', 4990.00, 2230.00, 'products/mens_t_shirt.jpg', 2),
(20, 'Gildan Women\'s Softstyle Cotton T-Shirt, Style G64000L, Multipack', '0', 'T-shirt', 'Clothes', 'Semi-fitted, side seamed body\r\nSoft ring spun fabric feels great against your skin\r\nTaped neck and shoulders for comfort and durability\r\nTear away label for customizable comfort\r\nSreen printing, DTG, embroidery, iron-on transfers, bleaching or discharge\r\n', 7600.00, 3400.00, 'products/women_t_shirt.jpg', 2),
(21, 'GRACE KARIN Women\'s 2024 Peplum Tops Dressy Wrap V Neck 3/4 Sleeve Work Blouse Solid Tie Waist Busin', '0', 'Blouse', 'Clothes', '【Unique Features 】This modern shirt features a wrap v neck, 3/4 sleeve, tie waist and irregular hem. The wrap style enhances your neckline and creates a flattering silhouette. Elevate your work wardrobe with this stylish blouse!\r\n【Perfect for the Office】This blouse is designed as a chic work office top, making it an ideal choice for professional settings. It exudes elegance and professionalism, helping you make a lasting impression in the workplace.', 7000.00, 6780.00, 'products/women_blouse.jpg', 2),
(22, 'Women\'s Heavyweight Long-Sleeve Hooded Puffer Coat (Available in Plus Size)', '0', 'Coat', 'Clothes', 'REGULAR FIT: Close but comfortable fit through chest, waist, and hips.\r\nWATER-RESISTANT POLYESTER TAFFETA: 100% Polyester plain weave shell fabric. Fully lined, quilted and insulated. Designed to keep you extra protected for the coldest winter days.', 7766.00, 2333.00, 'products/women_coat.jpg', 2),
(23, 'Dockers Men\'s Henry Wool Blend Top Coat', '1', 'Coat', 'Clothes', 'FUNCTIONALITY: Dual front closure with zip front bib and three exterior buttons; Two lower welt pockets and an interior welt zipper pocket for added storage and security\r\nSTYLISH FEATURES: Non-Functional button cuffs for added detailing; Diamond quilted interior lining for added insulation; Back vent for added detailing\r\nVERSATILITY: Nylon quilted bib gives the illusion of wearing two jackets in one; Bib provides extra warmth in the colder weather\r\n', 7876.00, 4567.00, 'products/mens_coat.jpg', 2),
(24, 'Allegra K Women\'s Winter Overcoat Mid-Long Stand Collar Single Breasted Coat Outerwear', '0', 'Coat', 'Clothes', 'Mid-thigh Length, Stand Collar, Single Breasted, Slant Pockets, Fully Lined, Long Sleeve pea coat\r\nShell:100%Polyester Lining:100%Polyester, Occasion: Work, Office, Casual, Coffee Shop, Daily, Date, Weenkend, etc\r\nStyle this peacoat with blouse and pants for a warm and elegant look\r\nMachine wash cold in bag or Dry Cleaning, Do not bleach, Low iron', 7679.00, 4567.00, 'products/women_coat_2.jpg', 2),
(25, 'Nine West Women\'s Boxed Necklace/Pierced Earrings Set, Silver/Blue, One Size', '0', 'Jewelry', 'Accessories', 'Necklace: L-16 in x W-0.4 in x H-0.8 in, Earrings: L-0.8 in x W-0.4 in x H-0.4 in\r\nBoxed Jewelry Set - Necklace and Earrings - Classics', 6765.00, 4567.00, 'products/women_jewelry.jpg', 2),
(26, 'Jewelry Set for Women Water Drop Cubic Zirconia Artificial Crystal Earrings Pendant Necklace Open Ri', '0', 'Jewelry', 'Accessories', '♥IDEAL GIFT FOR WOMEN♥: The gold tone jewelry set has an elegant curved construction, and the unique shape and classic teardrop created-emerald make it an ideal gift for a woman on Valentine\'s Day/Mother\'s Day/Birthday/Anniversary. And they will be the perfect accessory for weddings, parties, proms.\r\n\r\n♥ITEMS YOU WILL GET♥: A ring, a pair of earrings, a pendant and necklace set, a bracelet, and a gift box.', 7656.00, 7654.00, 'products/women_jewelry_2.jpg', 2),
(27, 'Uloveido Natural Stone 8MM Beads Bracelet with Faith Mustard Seed Charms Inspirational Courage Brace', '1', 'Jewelry', 'Accessories', '♥ Beautifully crafted natural stone beaded stretch bracelet, nice inspirational friendship gift for men and women.\r\n♥ Material: Spacer Beads-Hematite Stone; Inspirational faith mustard seed charms-Stainless Steel and Mustard Seed.\r\n♥ Bracelet Length approx 17.5cm (6.9 inches). Bead Size: 8mm (0.3 inch). If you need other length, please email us and we can make for you.', 3456.00, 6545.00, 'products/men_jewelry.jpg', 2),
(28, 'COCIFER Purses and Handbags for Women Shoulder Tote Bags Top Handle Satchel', '0', 'Handbag', 'Accessories', 'Diffrent Ways to Carry: Purses for Women ,Purses and Handbags, Shoulder Bags, Tote, Crossbody bag\r\nMATERIAL: High Quality PU Leather\r\nDIMENSIONS: 12.2L * 9H * 5.2W inches (31cm*23cm*13cm), Height of Handle: 5.9 inch (15cm)', 7778.00, 6678.00, 'products/women_hangbag.jpg', 2),
(29, 'Mens Wallet Long Purse Leather Clutch Large Business Handbag Phone Card Holder Case Gift for Men Fat', '1', 'Handbag', 'Accessories', 'Imported\r\nLeather lining\r\nZipper closure\r\nDry Cloth Clean', 5567.00, 4567.00, 'products/men_handbag.jpg', 2),
(30, 'Elina fashion Indian Pakistani Women\'s Readymade Dress| Banarasi Art Silk Woven | Salwar Kameez Silk', '0', 'Dress', 'Clothes', 'op Colour :- Black || Bottom Colour :- Red || Dupatta Colour :- Red\r\nStyle : Readymade Sticthed salwar Suit || Work : Woven\r\nTop Fabric :- Banarasi Art Silk || Bottom Fabric :- Banarasi Art Silk || Dupatta Fabric :- Banarasi Art Silk\r\nCare Instructions: Dry clean only', 9999.00, 8999.00, 'products/women_dress.jpg', 2),
(31, 'Elina fashion Men\'s Tunic Cotton Kurta Pajama Set Indian Traditional Wear', '1', 'Dress', 'Clothes', 'Material :- Comfortable Cotton material which is specially designed for your skin with trendy look.\r\nStyle-Kurta Pyjama/ Fit-Regular/ Length-Mid Thigh\r\nProduct Size: Kurta\'s actual chest measurement is 6 inches more i.e. for 4 Sizes we give: S (36), M (38), L (40), XL(42), XXL (44) actual product chest will be M - 44,L - 46 XL - 48 XXL - 50 inches respectively', 7899.00, 6777.00, 'products/men_dress.jpg', 2),
(33, 'Lee Men\'s Extreme Motion Straight Taper Jean', '1', 'Jeans', 'Clothes', 'STRAIGHT FIT. With a straight fit through the hip and thigh, these jeans sit just below the waist with an Extreme Flex waistband for natural comfort.\r\nCLASSIC 5-POCKET STYLING. A classic fit jean designed with an authentic five-pocket style. Our bestselling straight fit jean is designed with a timeless five-pocket style, perfect for most occasions.', 7866.00, 5678.00, 'products/mens_jeans.jpg', 2),
(34, 'Signature by Levi Strauss & Co. Gold Women\'s Modern Bootcut Jeans', '0', 'Jeans', 'Clothes', 'Inseam: 29.5\"= Short, 31.5\"= Medium, 33.5\"= Long\r\nSuper stretch lasts from day to night; Snug fit doesn\'t lose shape\r\nVintage, worn-in look\r\nMid-rise comfort waistband', 6789.00, 2345.00, 'products/women_jeans.jpg', 2),
(35, 'vineyard vines Women\'s Herringbone 5 Inch Every Day Short', '0', 'Shorts', 'Clothes', 'New upgraded fabric with a subtle herringbone texture\r\nSemi fitted shorts\r\n“Every day should feel this good” stamp at interior waistband', 7890.00, 5678.00, 'products/women_shorts.jpg', 2),
(36, 'Volcom Men\'s Frickin Modern Stretch Chino', '1', 'Shorts', 'Clothes', 'Modern-fit chino short featuring asymmetric back yoke seaming and welted seat pockets\r\nOutseam: 21\"\r\nSlant front pockets', 3356.00, 2338.00, 'products/mens_shorts.jpg', 2),
(37, 'Timberland Men\'s White Ledge Mid Waterproof Hiking Boot', '1', 'Boots', 'Shoes', 'Our White Ledge Men\'s Hiking Boots have premium full-grain waterproof leather uppers, seam-sealed waterproof construction, and rustproof speed lace hardware with hooks at top for secure lacing.', 7777.00, 6666.00, 'products/mens_boots.jpg', 2),
(38, 'Women\'s Lace-Up Combat Boot', '0', 'Boots', 'Shoes', 'COMFORT AND FIT: These lug-sole combat boots have a padded insole with high-quality memory foam for added comfort, lace-up closure for adjustability, and an inside zipper for easy entry.\r\nMATERIAL: Amazon Essentials shoes are made from high-quality alternative leather materials. This style has a faux buffalo grain leather upper and is lined in faux leather.', 6876.00, 4568.00, 'products/women_boots.jpg', 2),
(39, 'Teva Women\'s Original Universal Sandal', '0', 'Sandals', 'Shoes', 'NOTE: \'W\' mentioned on the product box and product denotes \'Women\'s, not width\r\nClassic athletic sandal featuring hook-and-loop webbing straps with padded heel strap\r\nContoured EVA footbed and midsole', 6667.00, 5680.00, 'products/women_sandals.jpg', 2),
(40, 'Dockers Men’s Newpage Sporty Outdoor Sandal Shoe', '1', 'Sandals', 'Shoes', 'Manmade upper with contrast stitching details\r\nThree adjustable hook and loop closure straps for a secure fit\r\nFabric strap linings\r\nFusion footbed with memory foam for added comfort\r\n1 inch heel', 5563.00, 2334.00, 'products/mens_sandals.jpg', 2),
(41, 'DUSHINE Polarized Sunglasses for Women Classic Retro Style 100% UV Protection', '0', 'Sunglasses', 'Accessories', 'HD Polarized Lens – Offering 100% UV Protection.Restore true color,eliminate reflected light and scattered light,cut all glare and protect eyes perfectly.\r\nFashion Unique Design – These sunglasses use the latest design,highest quality materials,comfortable fit, this will give you both a sophisticated look and reflect your unique high end taste as a fashion forward women.', 7833.00, 2345.00, 'products/women_sunglasses.jpg', 5),
(42, 'Ray-Ban Rb3025 Classic Polarized Aviator Sunglasses', '1', 'Sunglasses', 'Accessories', 'Classic aviator sunglasses: Protect your eyes with style made famous by aviators since 1937. Ray-Ban RB3025 Large Metal Aviator Sunglasses are superior unisex glasses with multiple frame and lens options.\r\nPolarized sunglasses: RB3025 Aviator sunglasses feature legendary Ray-Ban polarized lenses originally designed for military use, which improve clarity while reducing glare and eyestrain. Made of high-quality, scratch-resistant glass.', 2400.00, 2000.00, 'products/men_sunglasses.jpg', 5),
(43, 'Calvin Klein Men\'s Embroidered Baseball Hat', '1', 'Hat', 'Accessories', 'CLASSIC BASEBALL HAT: This Classic Baseball Hat by Calvin Klein is versatile and easy to pack, these hats are beach-ready, travel-ready, camping-ready, and city-ready: just choose where you\'re headed.\r\nCALVIN KLEIN - Authentic Calvin Klein product with logo embroidered on the front.\r\nPERFECT FIT -Features include an adjustable slider on the back with a unstructured soft crown. One size fits for most people.\r\n100% Cotton - Made of lightweight, soft, and durable 100% cotton.\r\nTHE PERFECT GIFT: The Calvin Klein Mens Embroidered Baseball Hat make the perfect gift for birthday, Father\'s Day, Valentine\'s day, Thanksgiving day, Christmas.\r\n', 4500.00, 4000.00, 'products/men_hat.jpg', 5),
(44, 'Carve Designs Women\'s Dundee Crushable', '0', 'Hat', 'Accessories', 'Product Type: Hat\r\nCountry Of Origin: China\r\nItem Package Dimensions: 17.018 L X 24.13 W X 42.164 H (Cm)\r\nItem Package Weight: 0.181 Kilograms', 5000.00, 4000.00, 'products/women_hat.jpg', 5),
(45, 'Women\'s Fisherman Cable Turtleneck Sweater', '0', 'Sweater', 'Clothes', 'REGULAR FIT: Close but comfortable fit through chest, waist, and hips.\r\nSOFT COTTON SWEATER: Super soft, midweight, textured cable-knit sweater brings ultimate warmth and comfort.\r\nCABLE TURTLENECK SWEATER: A modern, classic cozy sweater perfect for both a refined and casual look.', 6000.00, 5999.00, 'products/women_sweater.jpg', 5),
(46, 'Men\'s Crewneck Sweater-Discontinued Colors', '1', 'Sweater', 'Clothes', 'REGULAR FIT: Easy through chest and tapered through waist.\r\nCOTTON YARN: Knit from a 100% cotton yarn with a soft hand and natural stretch.\r\nEVERYDAY SWEATER: A go-to layering piece, this crewneck pullover sweater is lightweight enough to layer and soft enough to wear on its own. Featuring a classic cable pattern.\r\nDETAILS: Ribbed at the neckline, sleeve cuffs and bottom hem.', 7000.00, 6000.00, 'products/mens_sweater.jpg', 5),
(47, 'GUESS Women\'s Loven Sneaker', '0', 'Sneakers', 'Shoes', 'This lace up look features GUESS logo hardware on the side with the hottest fashion colors of the season mixed and matched. This shoe is comfy, cool and ready to knock your socks off.\r\nLace up closure\r\nRound Toe', 4000.00, 3800.00, 'products/women_sneaker.jpg', 5),
(48, 'Cole Haan Men\'s Grandpro Rally Canvas Court Sneaker', '1', 'Sneakers', 'Shoes', 'Modern Craft: Clean court sneaker styling in canvas uppers\r\nResponsive Cushioning: Memory foam footbed for ultimate comfort and breathability\r\nLightweight Construction: Lightweight injection molded EVA cupsole with textured outsole for added traction', 4500.00, 4000.00, 'products/mens_sneaker.jpg', 5),
(49, 'PUMA Men\'s 8 Pack Low Cut Socks', '1', 'Socks', 'Accessories', 'Cushioned footbed\r\nArch support\r\nComfort toe', 1000.00, 900.00, 'products/mens_socks.jpg', 5),
(50, 'Womens Classic Turn Cuff Socks 6 Pack', '0', 'Socks', 'Accessories', 'Shoe size: 6-9\r\nConvertible silhouette goes from crew to cuff with ease\r\nSignature reinforced toe provides extra strength in the area most prone to wear, giving you a sock capable of standing the test of time\r\nEnhanced with a touch of spandex for a custom-feeling PerfectFit', 1000.00, 900.00, 'products/women_socks.jpg', 5),
(51, 'Levi\'s Women\'s Cotton Hooded Field Jacket ', '0', 'Jacket', 'Clothes', 'FUNCTIONALITY: Center front zipper paired with buttons to conceal; Four pockets with button closures for ample storage and adjustable drawstring hood for added protection.\r\nSTYLISH FEATURES: Adjustable cords at waist for flattering fit; Adjustable button cuffs for comfortable fit\r\nTEXTILE TECHNOLOGY: The 100% cotton fabric allows the jacket to be lightweight and the perfect staple piece in every woman’s closet; This is the go-to jacket to transition through the seasons', 5000.00, 4000.00, 'products/women_jacket.jpg', 5),
(52, 'PUMA Men\'s Transeasonal Jacket', '1', 'Jacket', 'Clothes', 'Regular Fit\r\nTwo chest pockets\r\nAdjustable sleeve hem with snap button', 7000.00, 6500.00, 'products/mens_jacket.jpg', 5),
(53, 'Under Armour Men\'s Surge 3 Running Shoe', '1', 'Shoes', 'Shoes', 'Lightweight, breathable mesh upper\r\nEnhanced cushioning around ankle collar for superior comfort\r\nCushioned EVA midsole delivers a lightweight & responsive ride\r\nStrategically placed rubber pods on outsole for durability with less weight\r\nOffset: 8mm\r\nWeight: 9 oz.\r\n', 8000.00, 7500.00, 'products/mens_shoes.jpg', 5),
(54, 'ASICS Women\'s Gel-Contend 8 Running Shoes', '0', 'Shoes', 'Shoes', 'Rearfoot GEL technology cushioning: Improves impact absorption and creates a softer feeling at footstrike\r\nJacquard mesh upper: Improves airflow\r\nOrthoLite sockliner: Offers excellent step-in comfort\r\nFlex grooves in the outsole: Improve flexibility\r\nSynthetic stitching on the overlays: Improves support', 8000.00, 7900.00, 'products/women_shoes.jpg', 5),
(55, 'LOVEVOOK Laptop Backpack for Women, 15.6 Inch Work Business Backpacks Purse with USB Port, Large Cap', '0', 'Backpack', 'Accessories', '', 1900.00, 1500.00, 'products/women_backpack.jpg', 5),
(56, 'Carhartt 21L Backpack, Durable Water-Resistant Pack with Laptop Sleeve, Classic Daypack (Black), One', '1', 'Backpack', 'Accessories', 'Carhartt Classic 21L Laptop Backpack. Big enough to carry your day’s essentials, strong enough to take on anything\r\n600-denier polyester with Rain Defender durable water repellent\r\nPack features large main compartment with dedicated 15-inch laptop sleeve. One exterior side pocket\r\nFront zippered organization compartment and comfort shoulder straps', 7000.00, 6000.00, 'products/mens_backpack.jpg', 5),
(57, 'Eddie Bauer Men\'s Casual Leather Belt with Metal Buckle', '1', 'Belt', 'Accessories', '100% Leather\r\nImported\r\nSTYLISH BUCKLE: The Eddie Bauer Bridle Leather Belt with Antique Nickel Buckle features a stylish and eye-catching buckle that adds a touch of sophistication to any outfit. The buckle is designed to be durable and reliable, ensuring that it will last for years to come.\r\nTIMELESS DESIGN: Whether you\'re dressing up for a formal occasion or going for a more casual look the classic design of this belt makes it a versatile accessory that can be worn with a wide range of outfits.', 1000.00, 800.00, 'products/mens_belt.jpg', 5),
(58, 'Eddie Bauer Women\'s Casual Leather Belts, One Size Fits Most', '0', 'Belt', 'Accessories', '100% Leather\r\nImported\r\nHIGH-QUALITY LEATHER: The Eddie Bauer Center Bar Woven Leather Belt is made from genuine leather, which makes it a durable accessory that can withstand daily wear and tear.\r\nDURABLE BUCKLE: The center bar buckle is not only stylish but also built to last. Made with high-quality materials, this buckle is strong and sturdy, ensuring that it will keep your belt securely fastened for years to come.', 1000.00, 800.00, 'products/women_belt.jpg', 5);

-- --------------------------------------------------------

--
-- Table structure for table `store_users`
--

CREATE TABLE `store_users` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `role` int(11) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `interests` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_users`
--

INSERT INTO `store_users` (`id`, `password`, `last_login`, `is_superuser`, `is_staff`, `is_active`, `date_joined`, `image`, `first_name`, `last_name`, `role`, `gender`, `age`, `interests`, `location`, `city`, `phone_number`, `email`) VALUES
(1, 'pbkdf2_sha256$720000$XRVfMjdrAIat3oMaCyNkB4$KEe5/QJObq7l1izrE2T0vZbBleGUyUT/xEpJ2PUcxFY=', '2024-05-20 08:53:05.195877', 1, 1, 1, '2024-04-15 02:05:11.296062', 'profile_images/WhatsApp_Image_2024-03-27_at_15.14.00_c29d91d7_hbCuF6O.jpg', '', '', 0, '', NULL, NULL, NULL, NULL, NULL, 'admin@admin.com'),
(2, 'pbkdf2_sha256$720000$kwOhgchLmLYOfogvMQyOyY$5jGNeaSyf6JSETW+ZjcOQL0h1a8HIJk4rk/n0NoHZ9c=', '2024-05-20 08:49:28.284421', 0, 0, 1, '2024-04-15 02:06:58.807440', 'profile_images/WhatsApp_Image_2024-03-27_at_15.14.00_c29d91d7_hbCuF6O.jpg', 'Danyal', 'Yousaf', 2, '1', 23, NULL, 'America', 'Arkansas', '03353959273', 'danyal@danyal.com'),
(3, 'pbkdf2_sha256$720000$zAwtHpneJagu5JBzys2Mw5$i9TJOLcj446LS4oh7D/65vR3rhVaVXJIr6AS80LbhW0=', '2024-05-16 18:39:15.622944', 0, 0, 1, '2024-04-15 02:09:51.270286', 'profile_images/mediamodifier-ogmenj2NGho-unsplash_1_FuegUFd.jpg', 'Adil', 'Baig', 1, '1', 23, NULL, 'Pakistan', 'Lahore', '03347595674', 'adil@adil.com'),
(4, 'pbkdf2_sha256$720000$wxRNJNGIObx1CuEiO84Zzj$OIYNbqR5KI0y5e7l5DTX2JkjjIbEYxDQy3SGw3KquPM=', '2024-05-20 08:51:45.917079', 0, 0, 1, '2024-04-27 08:23:07.518811', 'profile_images/IMG_5793_we3QZD6.png', 'Ali', 'Iftikhar', 1, '1', 40, NULL, 'America', 'Louisiana', '03353959273', 'ali@ali.com'),
(5, 'pbkdf2_sha256$720000$CLSin4JchKkwSt6AS4c7OO$xPMzmOeFLn/8XG3vUyMO+FoYF8kRA+TSFhUWWr7iKI4=', '2024-04-30 17:19:22.025797', 0, 0, 1, '2024-04-28 11:20:10.829625', 'profile_images/profile.jpg', 'Abdul', 'Rafy', 2, '1', 25, NULL, 'America', 'Delaware', '0347585853', 'rafy@rafy.com'),
(6, 'pbkdf2_sha256$720000$7mYcuDcdM0DnwZlOTMTTfY$Ll5Q1hmxNEx6/GbTX/nvVlZ/CrdcggJD5VS+zKJJXIo=', '2024-05-02 02:19:34.430938', 0, 0, 1, '2024-05-02 02:19:23.608243', 'profile_images/hassan.jpg', 'Hassan', 'Ahmad', 1, '1', 60, NULL, 'America', 'North Carolina', '09876567', 'hassan@hassan.com'),
(7, 'pbkdf2_sha256$720000$Q2CWl4MPMVuDXKFfLYNIsg$xzXTusy6ZP19SQWp855WpKS6FDTwBVJvkZRmhNqElx0=', '2024-05-02 15:22:23.411683', 0, 0, 1, '2024-05-02 02:23:22.536751', 'profile_images/elena.jpeg', 'Elena', 'Gilbert', 1, '0', 30, NULL, 'America', 'Virginia', '0987654', 'elena@elena.com'),
(8, 'pbkdf2_sha256$720000$RhluXZA0P9qx6u4o9vpDGU$wYlZu0uNJ+AI7pTUYg+qtsphMoID03Osd9b4Md0+zZg=', '2024-05-18 10:59:23.153647', 0, 0, 1, '2024-05-18 03:10:13.472171', 'profile_images/ACTOR_FEROZ_KHAN.jpeg', 'Feroz', 'Khan', 1, '1', 40, NULL, 'America', 'Washington', '03347595674', 'feroz@feroz.com'),
(9, 'pbkdf2_sha256$720000$7lbWkwpjtVnS9QZYozt9Pt$f6vkfoVz9C0KfbBjj+k/W/5wxhvqxoodRXF+wXTuBdw=', '2024-05-18 10:59:39.812779', 0, 0, 1, '2024-05-18 03:14:55.157001', 'profile_images/.jpeg', 'Wahaj', 'Ali', 2, '1', 45, NULL, 'America', 'Texas', '03347595674', 'wahaj@wahaj.com'),
(10, 'pbkdf2_sha256$720000$gBlOCAQ1R2AAD3asjvcaGd$jWVWtjZYq34kW+y0T9YlUJqyF6hFdr5uwLs9rep3RoI=', '2024-05-20 09:00:55.154567', 0, 0, 1, '2024-05-18 03:16:57.578334', 'profile_images/download_3.jpeg', 'Bilal', 'Abbas', 3, '1', 35, NULL, 'America', 'Delaware', '03469382767', 'bilal@bilal.com');

-- --------------------------------------------------------

--
-- Table structure for table `store_users_groups`
--

CREATE TABLE `store_users_groups` (
  `id` bigint(20) NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_users_user_permissions`
--

CREATE TABLE `store_users_user_permissions` (
  `id` bigint(20) NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_store_users_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `store_cartitem`
--
ALTER TABLE `store_cartitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_cartitem_user_id_3ff2f2b5_fk_store_users_id` (`user_id`),
  ADD KEY `store_cartitem_product_id_4238d443_fk` (`product_id`);

--
-- Indexes for table `store_contact`
--
ALTER TABLE `store_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_lastclick`
--
ALTER TABLE `store_lastclick`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_lastclick_product_clicked_id_00ed7eaf_fk_store_product_id` (`product_clicked_id`),
  ADD KEY `store_lastclick_user_id_a212a71a_fk_store_users_id` (`user_id`);

--
-- Indexes for table `store_notification`
--
ALTER TABLE `store_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_notification_user_id_19e577b8_fk_store_users_id` (`user_id`);

--
-- Indexes for table `store_orders`
--
ALTER TABLE `store_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_orders_logistic_id_fb3ec7b6_fk_store_users_id` (`logistic_id`);

--
-- Indexes for table `store_product`
--
ALTER TABLE `store_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_product_seller_id_9cddda9d_fk_store_users_id` (`seller_id`);

--
-- Indexes for table `store_users`
--
ALTER TABLE `store_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `store_users_groups`
--
ALTER TABLE `store_users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `store_users_groups_users_id_group_id_9b322656_uniq` (`users_id`,`group_id`),
  ADD KEY `store_users_groups_group_id_7f5efa15_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `store_users_user_permissions`
--
ALTER TABLE `store_users_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `store_users_user_permiss_users_id_permission_id_41456fe5_uniq` (`users_id`,`permission_id`),
  ADD KEY `store_users_user_per_permission_id_a12cd95b_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `store_cartitem`
--
ALTER TABLE `store_cartitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `store_contact`
--
ALTER TABLE `store_contact`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_lastclick`
--
ALTER TABLE `store_lastclick`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `store_notification`
--
ALTER TABLE `store_notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `store_orders`
--
ALTER TABLE `store_orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `store_product`
--
ALTER TABLE `store_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `store_users`
--
ALTER TABLE `store_users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `store_users_groups`
--
ALTER TABLE `store_users_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_users_user_permissions`
--
ALTER TABLE `store_users_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_store_users_id` FOREIGN KEY (`user_id`) REFERENCES `store_users` (`id`);

--
-- Constraints for table `store_cartitem`
--
ALTER TABLE `store_cartitem`
  ADD CONSTRAINT `store_cartitem_product_id_4238d443_fk` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`),
  ADD CONSTRAINT `store_cartitem_user_id_3ff2f2b5_fk_store_users_id` FOREIGN KEY (`user_id`) REFERENCES `store_users` (`id`);

--
-- Constraints for table `store_lastclick`
--
ALTER TABLE `store_lastclick`
  ADD CONSTRAINT `store_lastclick_product_clicked_id_00ed7eaf_fk_store_product_id` FOREIGN KEY (`product_clicked_id`) REFERENCES `store_product` (`id`),
  ADD CONSTRAINT `store_lastclick_user_id_a212a71a_fk_store_users_id` FOREIGN KEY (`user_id`) REFERENCES `store_users` (`id`);

--
-- Constraints for table `store_notification`
--
ALTER TABLE `store_notification`
  ADD CONSTRAINT `store_notification_user_id_19e577b8_fk_store_users_id` FOREIGN KEY (`user_id`) REFERENCES `store_users` (`id`);

--
-- Constraints for table `store_orders`
--
ALTER TABLE `store_orders`
  ADD CONSTRAINT `store_orders_logistic_id_fb3ec7b6_fk_store_users_id` FOREIGN KEY (`logistic_id`) REFERENCES `store_users` (`id`);

--
-- Constraints for table `store_product`
--
ALTER TABLE `store_product`
  ADD CONSTRAINT `store_product_seller_id_9cddda9d_fk_store_users_id` FOREIGN KEY (`seller_id`) REFERENCES `store_users` (`id`);

--
-- Constraints for table `store_users_groups`
--
ALTER TABLE `store_users_groups`
  ADD CONSTRAINT `store_users_groups_group_id_7f5efa15_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `store_users_groups_users_id_052a9b65_fk_store_users_id` FOREIGN KEY (`users_id`) REFERENCES `store_users` (`id`);

--
-- Constraints for table `store_users_user_permissions`
--
ALTER TABLE `store_users_user_permissions`
  ADD CONSTRAINT `store_users_user_per_permission_id_a12cd95b_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `store_users_user_permissions_users_id_d45d8b6d_fk_store_users_id` FOREIGN KEY (`users_id`) REFERENCES `store_users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
