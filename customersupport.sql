-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2024 at 03:02 PM
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
-- Database: `customersupport`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `article_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `author` varchar(20) NOT NULL,
  `publish_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`article_id`, `title`, `text`, `category_id`, `author`, `publish_date`) VALUES
(1, 'Directing a domain to Blogger', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eu metus nulla. Mauris quis rutrum ipsum, ut cursus nisi. Sed vitae tortor est. Aenean ultrices velit in tortor dignissim molestie. Suspendisse sit amet augue sed libero sollicitudin cursus ut ac libero. Aliquam iaculis sapien pretium, imperdiet quam vel, faucibus nibh. Quisque a nulla cursus, sollicitudin libero et, venenatis felis. In maximus bibendum neque vel pharetra. Pellentesque ut nisi mollis, ultricies lectus vitae, cursus arcu. Sed ut risus velit. Vivamus sit amet dictum metus, ac fermentum nisl. Nam fringilla nec ligula non mollis. Nam tincidunt rutrum suscipit. Sed placerat congue dignissim.</p>\r\n\r\n<p>Nulla ultrices eget ex vel aliquam. Proin tempus ligula odio, quis efficitur dolor laoreet ut. Sed molestie eros in magna molestie dignissim. Vestibulum lobortis suscipit rutrum. Aenean dignissim, risus sit amet consectetur mattis, magna lorem elementum leo, feugiat ultrices mauris augue sed sapien. Maecenas vitae maximus nunc. Nulla convallis risus magna, quis condimentum tellus maximus nec. Cras dictum pretium malesuada. Pellentesque consectetur ornare velit, vel dapibus tellus dictum eget. Proin urna tellus, suscipit eget pulvinar eu, molestie sed velit. Nunc sodales, arcu eu condimentum accumsan, magna risus pretium eros, vitae elementum felis lectus non augue. In at ligula vitae quam gravida maximus ac et nunc. In ultricies velit vitae velit suscipit bibendum non vel eros. Maecenas bibendum magna ut lectus porttitor commodo. Suspendisse congue sem eget ornare pretium. Donec pulvinar, magna ac lobortis consectetur, tortor felis sodales neque, nec condimentum dolor metus eget orci.</p>', 1, 'damienkuosmanen', '2021-05-02'),
(2, 'What are SMTP, IMAP and POP3?', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eu metus nulla. Mauris quis rutrum ipsum, ut cursus nisi. Sed vitae tortor est. Aenean ultrices velit in tortor dignissim molestie. Suspendisse sit amet augue sed libero sollicitudin cursus ut ac libero. Aliquam iaculis sapien pretium, imperdiet quam vel, faucibus nibh. Quisque a nulla cursus, sollicitudin libero et, venenatis felis. In maximus bibendum neque vel pharetra. Pellentesque ut nisi mollis, ultricies lectus vitae, cursus arcu. Sed ut risus velit. Vivamus sit amet dictum metus, ac fermentum nisl. Nam fringilla nec ligula non mollis. Nam tincidunt rutrum suscipit. Sed placerat congue dignissim.</p>\r\n\r\n<p>Nulla ultrices eget ex vel aliquam. Proin tempus ligula odio, quis efficitur dolor laoreet ut. Sed molestie eros in magna molestie dignissim. Vestibulum lobortis suscipit rutrum. Aenean dignissim, risus sit amet consectetur mattis, magna lorem elementum leo, feugiat ultrices mauris augue sed sapien. Maecenas vitae maximus nunc. Nulla convallis risus magna, quis condimentum tellus maximus nec. Cras dictum pretium malesuada. Pellentesque consectetur ornare velit, vel dapibus tellus dictum eget. Proin urna tellus, suscipit eget pulvinar eu, molestie sed velit. Nunc sodales, arcu eu condimentum accumsan, magna risus pretium eros, vitae elementum felis lectus non augue. In at ligula vitae quam gravida maximus ac et nunc. In ultricies velit vitae velit suscipit bibendum non vel eros. Maecenas bibendum magna ut lectus porttitor commodo. Suspendisse congue sem eget ornare pretium. Donec pulvinar, magna ac lobortis consectetur, tortor felis sodales neque, nec condimentum dolor metus eget orci.</p>', 5, 'damienkuosmanen', '2021-05-17'),
(3, 'How do you host', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam eveniet saepe magnam doloribus, est facilis velit alias architecto voluptas aliquam officia quas ipsam soluta ut nesciunt, magni dolor amet. Quaerat est eum at porro soluta debitis dicta incidunt perferendis quod? Debitis culpa rerum maxime consequuntur corporis exercitationem corrupti earum. Asperiores ab, nihil nobis rem quas laborum officiis possimus eius voluptas optio at. Minus, culpa pariatur. Praesentium amet similique qui, dolore culpa delectus, aut cupiditate quia numquam consequuntur est suscipit sequi.', 2, 'damienkuosmanen', '2024-11-23'),
(5, 'Making web pages are sophisticated!', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam eveniet saepe magnam doloribus, est facilis velit alias architecto voluptas aliquam officia quas ipsam soluta ut nesciunt, magni dolor amet. Quaerat est eum at porro soluta debitis dicta incidunt perferendis quod? Debitis culpa rerum maxime consequuntur corporis exercitationem corrupti earum. Asperiores ab, nihil nobis rem quas laborum officiis possimus eius voluptas optio at. Minus, culpa pariatur. Praesentium amet similique qui, dolore culpa delectus, aut cupiditate quia numquam consequuntur est suscipit sequi. Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam eveniet saepe magnam doloribus, est facilis velit alias architecto voluptas aliquam officia quas ipsam soluta ut nesciunt, magni dolor amet. Quaerat est eum at porro soluta debitis dicta incidunt perferendis quod? Debitis culpa rerum maxime consequuntur corporis exercitationem corrupti earum. Asperiores ab, nihil nobis rem quas laborum officiis possimus eius voluptas optio at. Minus, culpa pariatur. Praesentium amet similique qui, dolore culpa delectus, aut cupiditate quia numquam consequuntur est suscipit sequi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam eveniet saepe magnam doloribus, est facilis velit alias architecto voluptas aliquam officia quas ipsam soluta ut nesciunt, magni dolor amet. Quaerat est eum at porro soluta debitis dicta incidunt perferendis quod? Debitis culpa rerum maxime consequuntur corporis exercitationem corrupti earum. Asperiores ab, nihil nobis rem quas laborum officiis possimus eius voluptas optio at. Minus, culpa pariatur. Praesentium amet similique qui, dolore culpa delectus, aut cupiditate quia numquam consequuntur est suscipit sequi.', 3, 'tareqfaiz', '2024-11-23'),
(6, 'Most popular ways to run virtual servers', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam eveniet saepe magnam doloribus, est facilis velit alias architecto voluptas aliquam officia quas ipsam soluta ut nesciunt, magni dolor amet. Quaerat est eum at porro soluta debitis dicta incidunt perferendis quod? Debitis culpa rerum maxime consequuntur corporis exercitationem corrupti earum. Asperiores ab, nihil nobis rem quas laborum officiis possimus eius voluptas optio at. Minus, culpa pariatur. Praesentium amet similique qui, dolore culpa delectus, aut cupiditate quia numquam consequuntur est suscipit sequi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam eveniet saepe magnam doloribus, est facilis velit alias architecto voluptas aliquam officia quas ipsam soluta ut nesciunt, magni dolor amet. Quaerat est eum at porro soluta debitis dicta incidunt perferendis quod? Debitis culpa rerum maxime consequuntur corporis exercitationem corrupti earum. Asperiores ab, nihil nobis rem quas laborum officiis possimus eius voluptas optio at. Minus, culpa pariatur. Praesentium amet similique qui, dolore culpa delectus, aut cupiditate quia numquam consequuntur est suscipit sequi.', 4, 'tareqfaiz', '2024-11-23'),
(7, 'You should use your account carefully', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam eveniet saepe magnam doloribus, est facilis velit alias architecto voluptas aliquam officia quas ipsam soluta ut nesciunt, magni dolor amet. Quaerat est eum at porro soluta debitis dicta incidunt perferendis quod? Debitis culpa rerum maxime consequuntur corporis exercitationem corrupti earum. Asperiores ab, nihil nobis rem quas laborum officiis possimus eius voluptas optio at. Minus, culpa pariatur. Praesentium amet similique qui, dolore culpa delectus, aut cupiditate quia numquam consequuntur est suscipit sequi. Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam eveniet saepe magnam doloribus, est facilis velit alias architecto voluptas aliquam officia quas ipsam soluta ut nesciunt, magni dolor amet. Quaerat est eum at porro soluta debitis dicta incidunt perferendis quod? Debitis culpa rerum maxime consequuntur corporis exercitationem corrupti earum. Asperiores ab, nihil nobis rem quas laborum officiis possimus eius voluptas optio at. Minus, culpa pariatur. Praesentium amet similique qui, dolore culpa delectus, aut cupiditate quia numquam consequuntur est suscipit sequi.', 6, 'abdiomnia', '2024-11-23');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `order_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `order_number`) VALUES
(1, 'Domains', 2),
(2, 'Hosting services', 1),
(3, 'Web page maker', 4),
(4, 'Virtual servers', 3),
(5, 'E-mail', 5),
(6, 'Your account', 6);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_name` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_name`, `password`, `first_name`, `last_name`, `role`) VALUES
('abdiomnia', '$2y$10$Hi77RfJqvFkjI4oLvlfqfeSweTxmfrch5RhIHSE5vDzQeTsR9b/Om', 'Abdi', 'Omnia', 'Editor'),
('damienkuosmanen', '163decde52ad282d20e26b89784da5754c799a7e', 'Damien', 'Kuosmanen', 'Community manager'),
('tareqfaiz', '$2y$10$BCOcSMas.H/o01jCgj6TlOXwA3vwPrWBcHu50tgr0kpOmhQdfMcIe', 'Tareq', 'Faiz', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `kategoria_id` (`category_id`),
  ADD KEY `kirjoittaja` (`author`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`author`) REFERENCES `users` (`user_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
