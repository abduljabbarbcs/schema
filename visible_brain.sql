-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.15 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for visible_brain
CREATE DATABASE IF NOT EXISTS `visible_brain` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `visible_brain`;


-- Dumping structure for table visible_brain.overlay_information
CREATE TABLE IF NOT EXISTS `overlay_information` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `slides` bigint(20) NOT NULL,
  `users` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_94vnnqsir2vfdbieabriv19g` (`parent`),
  KEY `FK_57pm63mob0t2coe0vju6bb9tv` (`slides`),
  KEY `FK_lumx2skv3jwu9pg65gw1l6iku` (`users`),
  CONSTRAINT `FK_57pm63mob0t2coe0vju6bb9tv` FOREIGN KEY (`slides`) REFERENCES `slides` (`id`),
  CONSTRAINT `FK_94vnnqsir2vfdbieabriv19g` FOREIGN KEY (`parent`) REFERENCES `overlay_information` (`id`),
  CONSTRAINT `FK_lumx2skv3jwu9pg65gw1l6iku` FOREIGN KEY (`users`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table visible_brain.overlay_information: ~0 rows (approximately)
/*!40000 ALTER TABLE `overlay_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `overlay_information` ENABLE KEYS */;


-- Dumping structure for table visible_brain.overlay_points
CREATE TABLE IF NOT EXISTS `overlay_points` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `overlay_information_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_41h71e7ikqebg2bm36phmr4wr` (`overlay_information_id`),
  CONSTRAINT `FK_41h71e7ikqebg2bm36phmr4wr` FOREIGN KEY (`overlay_information_id`) REFERENCES `overlay_information` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table visible_brain.overlay_points: ~0 rows (approximately)
/*!40000 ALTER TABLE `overlay_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `overlay_points` ENABLE KEYS */;


-- Dumping structure for table visible_brain.slides
CREATE TABLE IF NOT EXISTS `slides` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `users` bigint(20) NOT NULL,
  `slide_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dmfwhf6px2wlb0ug494m7xv0b` (`users`),
  CONSTRAINT `FK_dmfwhf6px2wlb0ug494m7xv0b` FOREIGN KEY (`users`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table visible_brain.slides: ~5 rows (approximately)
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
INSERT INTO `slides` (`id`, `active`, `name`, `description`, `type`, `users`, `slide_path`) VALUES
	(1, b'1', 'brain', 'The brain is an organ that serves as the center of the nervous system in all vertebrate and most invertebrate animals. Only a few invertebrates such as sponges,ad.', 'male', 1, 'brain'),
	(2, b'1', 'brain1', 'The brain is an organ that serves as the center of the nervous system in all vertebrate and most invertebrate animals. Only a few invertebrates such as sponges,ad.', 'male', 1, 'brain1'),
	(3, b'1', 'brain2', 'The brain is an organ that serves as the center of the nervous system in all vertebrate and most invertebrate animals. Only a few invertebrates such as sponges,ad.', 'female', 1, 'brain'),
	(4, b'1', 'brain3', 'The brain is an organ that serves as the center of the nervous system in all vertebrate and most invertebrate animals. Only a few invertebrates such as sponges,ad.', 'male', 1, 'brain1'),
	(5, b'1', 'brain4', 'The brain is an organ that serves as the center of the nervous system in all vertebrate and most invertebrate animals. Only a few invertebrates such as sponges,ad.', 'male', 1, 'brain');
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;


-- Dumping structure for table visible_brain.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_login` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_name` varchar(100) NOT NULL,
  `active` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table visible_brain.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `address`, `company_name`, `email`, `first_name`, `last_login`, `last_name`, `password`, `profile_picture`, `role`, `token`, `user_name`, `active`) VALUES
	(1, NULL, NULL, 'abc@example.com', NULL, '2016-03-09 12:11:58', NULL, '$2a$10$W11ub3rlcoPRhcereMAU/ODhoHrPyF4yvMViAYDUdDB33M92ZRnze', NULL, 'ROLE_ADMIN', '1', 'abc@example.com', b'1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
