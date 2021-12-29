-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 16 nov. 2021 à 15:54
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bdddocs`
--

-- --------------------------------------------------------

--
-- Structure de la table `trainingcategories`
--

DROP TABLE IF EXISTS `trainingcategories`;
CREATE TABLE IF NOT EXISTS `trainingcategories` (
  `idtrainingcategories` int(6) NOT NULL AUTO_INCREMENT,
  `trainingcategoriesdenom` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idtrainingcategories`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `trainingcategories`
--

INSERT INTO `trainingcategories` (`idtrainingcategories`, `trainingcategoriesdenom`) VALUES
(1, 'informatique'),
(2, 'bureautique'),
(3, 'développement personnel'),
(4, 'langues européennes'),
(5, 'commercial et management'),
(6, 'métiers');

-- --------------------------------------------------------

--
-- Structure de la table `trainingcourses`
--

DROP TABLE IF EXISTS `trainingcourses`;
CREATE TABLE IF NOT EXISTS `trainingcourses` (
  `idtrainingcourses` int(6) NOT NULL AUTO_INCREMENT,
  `trainingcoursesdenom` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `userid` int(6) DEFAULT NULL,
  `trainingcoursesid` int(6) DEFAULT NULL,
  PRIMARY KEY (`idtrainingcourses`),
  UNIQUE KEY `userid` (`userid`),
  KEY `trainingcategoriesid` (`trainingcoursesid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `trainingcourses`
--

INSERT INTO `trainingcourses` (`idtrainingcourses`, `trainingcoursesdenom`, `userid`, `trainingcoursesid`) VALUES
(1, 'HTML5/CSS3 - INITIATION', NULL, 1),
(2, '	HTML5/CSS3 - PERFECTIONNEMENT', NULL, 1),
(3, '	FRAMEWORK HTML - CSS/JS : BOOTSTRAP', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `trainingdomaines`
--

DROP TABLE IF EXISTS `trainingdomaines`;
CREATE TABLE IF NOT EXISTS `trainingdomaines` (
  `idtrainingdomaines` int(6) NOT NULL AUTO_INCREMENT,
  `trainingdomainesdenom` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `trainingcategoriesid` int(6) NOT NULL,
  PRIMARY KEY (`idtrainingdomaines`),
  KEY `trainingcategoriesid` (`trainingcategoriesid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `trainingdomaines`
--

INSERT INTO `trainingdomaines` (`idtrainingdomaines`, `trainingdomainesdenom`, `trainingcategoriesid`) VALUES
(1, 'Développement', 1),
(2, 'Nouvelles Technologies / Internet', 1),
(3, 'Production', 1),
(4, 'Réseaux', 1),
(5, 'Systèmes', 1),
(6, 'Organisation', 1),
(7, 'Acess', 2),
(8, 'Excel', 2),
(9, 'Open Office', 2),
(10, 'Outlook', 2),
(11, 'Powerpoint', 2),
(12, 'Publisher', 2),
(13, 'Word', 2),
(14, 'Confiance en soi et gestion du stress', 3),
(15, 'Communication', 3),
(16, 'Efficacité professionnelle', 3),
(17, 'Equilibre et bien être au travail', 3),
(18, 'Allemand', 4),
(19, 'Anglais', 4),
(20, 'Espagnol', 4),
(21, 'Français - FLAM1', 4),
(22, 'Français - FLE²', 4),
(23, 'Italien', 4),
(24, 'Portugais', 4),
(25, 'Efficacité ralationnelle', 5),
(26, 'Technologie de vente et négociation', 5),
(27, 'Management', 5),
(28, 'Organisation', 5),
(29, 'Design Graphisme', 6),
(30, 'Gestion PME', 6),
(31, 'Médico-social', 6),
(32, 'Restauration', 6);

-- --------------------------------------------------------

--
-- Structure de la table `typeuser`
--

DROP TABLE IF EXISTS `typeuser`;
CREATE TABLE IF NOT EXISTS `typeuser` (
  `idtypeuser` int(6) NOT NULL AUTO_INCREMENT,
  `typeuserdenom` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idtypeuser`),
  UNIQUE KEY `idtypeuser` (`idtypeuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `userstable`
--

DROP TABLE IF EXISTS `userstable`;
CREATE TABLE IF NOT EXISTS `userstable` (
  `userid` int(6) NOT NULL AUTO_INCREMENT,
  `usernname` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `usersurname` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `usermail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `usertype` int(6) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `usertype` (`usertype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `trainingcourses`
--
ALTER TABLE `trainingcourses`
  ADD CONSTRAINT `trainingcourses_ibfk_1` FOREIGN KEY (`trainingcoursesid`) REFERENCES `trainingdomaines` (`idtrainingdomaines`);

--
-- Contraintes pour la table `trainingdomaines`
--
ALTER TABLE `trainingdomaines`
  ADD CONSTRAINT `trainingdomaines_ibfk_1` FOREIGN KEY (`trainingcategoriesid`) REFERENCES `trainingcategories` (`idtrainingcategories`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `userstable`
--
ALTER TABLE `userstable`
  ADD CONSTRAINT `userstable_ibfk_1` FOREIGN KEY (`usertype`) REFERENCES `typeuser` (`idtypeuser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userstable_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `trainingcourses` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
