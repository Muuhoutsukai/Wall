-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server versie:                5.6.17 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Versie:              8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Databasestructuur van wall wordt geschreven
CREATE DATABASE IF NOT EXISTS `wall` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `wall`;


-- Structuur van  tabel wall.comment wordt geschreven
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `datum` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `post_id` int(11) NOT NULL,
  `gebruiker_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumpen data van tabel wall.comment: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;


-- Structuur van  tabel wall.gebruiker wordt geschreven
CREATE TABLE IF NOT EXISTS `gebruiker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '0',
  `groep_id` int(11) NOT NULL DEFAULT '0',
  `persoon_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumpen data van tabel wall.gebruiker: ~3 rows (ongeveer)
/*!40000 ALTER TABLE `gebruiker` DISABLE KEYS */;
INSERT INTO `gebruiker` (`id`, `email`, `password`, `groep_id`, `persoon_id`) VALUES
	(4, 'muu@gmail.com', 'knak', 0, 6),
	(6, 'miko@gmail.com', 'orb1', 0, 11),
	(7, 'witch@gmail.com', 'SPARK', 0, 12);
/*!40000 ALTER TABLE `gebruiker` ENABLE KEYS */;


-- Structuur van  tabel wall.groep wordt geschreven
CREATE TABLE IF NOT EXISTS `groep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpen data van tabel wall.groep: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `groep` DISABLE KEYS */;
/*!40000 ALTER TABLE `groep` ENABLE KEYS */;


-- Structuur van  tabel wall.like wordt geschreven
CREATE TABLE IF NOT EXISTS `like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gebruiker_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `datum` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpen data van tabel wall.like: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
/*!40000 ALTER TABLE `like` ENABLE KEYS */;


-- Structuur van  tabel wall.persoon wordt geschreven
CREATE TABLE IF NOT EXISTS `persoon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voornaam` varchar(50) NOT NULL,
  `achternaam` varchar(50) NOT NULL,
  `geslacht` varchar(50) NOT NULL,
  `geboortedatum` int(11) NOT NULL,
  `adres` varchar(50) NOT NULL,
  `postcode` varchar(50) NOT NULL,
  `woonplaats` varchar(50) NOT NULL,
  `telefoon` int(11) NOT NULL,
  `mobiel` int(11) NOT NULL,
  `avatar` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumpen data van tabel wall.persoon: ~2 rows (ongeveer)
/*!40000 ALTER TABLE `persoon` DISABLE KEYS */;
INSERT INTO `persoon` (`id`, `voornaam`, `achternaam`, `geslacht`, `geboortedatum`, `adres`, `postcode`, `woonplaats`, `telefoon`, `mobiel`, `avatar`) VALUES
	(6, 'Charlie', 'Frijhoff', 'V', 404, 'Dor', 'dre', 'cht', 646507225, 627276414, ''),
	(11, 'Charles', 'Frijhuff', 'V', 1996, 'hu4', '5584hy', '42j6', 486, 4867, ''),
	(12, 'Charlius', 'Frijhoffius', 'V', 101, 'pannekoek', '6666', 'Amsterdam', 4444, 55555, '');
/*!40000 ALTER TABLE `persoon` ENABLE KEYS */;


-- Structuur van  tabel wall.post wordt geschreven
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `datum` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `gebruiker_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumpen data van tabel wall.post: ~10 rows (ongeveer)
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`id`, `content`, `datum`, `status`, `gebruiker_id`) VALUES
	(1, 'hallooo', 0, 1, 4),
	(9, 'ja', 0, 1, 7),
	(10, 'wey5e', 0, 1, 7),
	(11, 'seth', 0, 1, 7),
	(12, 'sdthsdh', 0, 1, 7),
	(13, 'sdthsh', 0, 1, 7),
	(14, 'sdhsdb', 0, 1, 7),
	(15, 'sdhsdht', 0, 0, 7),
	(16, 'eh', 0, 1, 7),
	(17, 'Post test', 0, 1, 7);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
