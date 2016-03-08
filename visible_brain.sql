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
DROP DATABASE IF EXISTS `visible_brain`;
CREATE DATABASE IF NOT EXISTS `visible_brain` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `visible_brain`;


-- Dumping structure for table visible_brain.overlay_information
DROP TABLE IF EXISTS `overlay_information`;
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

-- Data exporting was unselected.


-- Dumping structure for table visible_brain.overlay_points
DROP TABLE IF EXISTS `overlay_points`;
CREATE TABLE IF NOT EXISTS `overlay_points` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `overlay_information_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_41h71e7ikqebg2bm36phmr4wr` (`overlay_information_id`),
  CONSTRAINT `FK_41h71e7ikqebg2bm36phmr4wr` FOREIGN KEY (`overlay_information_id`) REFERENCES `overlay_information` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table visible_brain.slides
DROP TABLE IF EXISTS `slides`;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table visible_brain.users
DROP TABLE IF EXISTS `users`;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
