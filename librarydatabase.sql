-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2024 at 02:11 AM
-- Server version: 5.7.17
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `librarydatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `acceder`
--

CREATE TABLE `acceder` (
  `id_utilisateur` bigint(20) NOT NULL,
  `id_ecran` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acceder`
--

INSERT INTO `acceder` (`id_utilisateur`, `id_ecran`) VALUES
(1, 1),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `administrateur`
--

CREATE TABLE `administrateur` (
  `id_admin` bigint(20) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `mot_de_passe` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrateur`
--

INSERT INTO `administrateur` (`id_admin`, `nom`, `prenom`, `mail`, `mot_de_passe`) VALUES
(1, 'Diouf', 'Mamadou', 'mamadou.diouf@admin.com', 'admin123'),
(2, 'Fall', 'Aïssatou', 'aissatou.fall@admin.com', 'securepwd');

-- --------------------------------------------------------

--
-- Table structure for table `auteur`
--

CREATE TABLE `auteur` (
  `id_auteur` bigint(20) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `pays_origine` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auteur`
--

INSERT INTO `auteur` (`id_auteur`, `nom`, `prenom`, `date_naissance`, `pays_origine`) VALUES
(1, 'Sow', 'Ousmane', '1975-05-20', 'Sénégal'),
(2, 'Diagne', 'Mariama', '1980-09-15', 'Sénégal'),
(3, 'Gueye', 'Moussa', '1988-03-10', 'Sénégal');

-- --------------------------------------------------------

--
-- Table structure for table `avoir_des_droits`
--

CREATE TABLE `avoir_des_droits` (
  `id_ecran` bigint(20) NOT NULL,
  `id_admin` bigint(20) NOT NULL,
  `modification` char(1) DEFAULT NULL,
  `suppression` char(1) DEFAULT NULL,
  `insertion` char(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `avoir_des_droits`
--

INSERT INTO `avoir_des_droits` (`id_ecran`, `id_admin`, `modification`, `suppression`, `insertion`) VALUES
(1, 1, 'O', 'N', 'N'),
(2, 1, 'O', 'N', 'N'),
(3, 1, 'N', 'N', 'O');

-- --------------------------------------------------------

--
-- Table structure for table `ecran`
--

CREATE TABLE `ecran` (
  `id_ecran` bigint(20) NOT NULL,
  `nom` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecran`
--

INSERT INTO `ecran` (`id_ecran`, `nom`) VALUES
(1, 'Gestion des Utilisateurs'),
(2, 'Gestion des Livres'),
(3, 'Tableau de Bord'),
(4, 'Catalogue'),
(5, 'Prfil'),
(6, 'Connexion'),
(7, 'Inscription');

-- --------------------------------------------------------

--
-- Table structure for table `emprunt`
--

CREATE TABLE `emprunt` (
  `id_emprunt` bigint(20) NOT NULL,
  `date_emprunt` date DEFAULT NULL,
  `date_retour` date DEFAULT NULL,
  `id_utilisateur` bigint(20) DEFAULT NULL,
  `id_livre` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emprunt`
--

INSERT INTO `emprunt` (`id_emprunt`, `date_emprunt`, `date_retour`, `id_utilisateur`, `id_livre`) VALUES
(1, '2023-12-01', '2023-12-20', 1, 2),
(2, '2024-02-20', '2024-03-15', 2, 3),
(3, '2022-08-25', '2022-09-10', 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `livre`
--

CREATE TABLE `livre` (
  `id_livre` bigint(20) NOT NULL,
  `titre` varchar(100) DEFAULT NULL,
  `edition` varchar(50) DEFAULT NULL,
  `date_publication` date DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `categorie` varchar(50) DEFAULT NULL,
  `extrait` text,
  `exemplaire` int(11) DEFAULT NULL,
  `id_auteur` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `livre`
--

INSERT INTO `livre` (`id_livre`, `titre`, `edition`, `date_publication`, `genre`, `categorie`, `extrait`, `exemplaire`, `id_auteur`) VALUES
(1, 'Les Chemins de l\'ombre', '1ère édition', '2023-01-15', 'Roman', 'Fiction', 'Extrait du livre...', 5, 1),
(2, 'Le Cœur de Mariama', '2ème édition', '2022-07-20', 'Poésie', 'Littérature', 'Extrait du livre...', 2, 2),
(3, 'La Vie à Dakar', '1ère édition', '2023-03-05', 'Documentaire', 'Histoire', 'Extrait du livre...', 7, 3),
(4, 'Le Ventre de l\'Afrique', '3ème édition', '2024-02-10', 'Roman', 'Fiction', 'Extrait du livre...', 4, 1),
(5, 'Au-delà des Collines', '1ère édition', '2023-11-18', 'Roman', 'Fiction', 'Extrait du livre...', 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `peut_etre_vu`
--

CREATE TABLE `peut_etre_vu` (
  `id_utilisateur` bigint(20) NOT NULL,
  `id_livre` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peut_etre_vu`
--

INSERT INTO `peut_etre_vu` (`id_utilisateur`, `id_livre`) VALUES
(1, 1),
(1, 4),
(2, 2),
(2, 5),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id_reservation` bigint(20) NOT NULL,
  `date_reservation` date DEFAULT NULL,
  `heure_reservation` time DEFAULT NULL,
  `id_utilisateur` bigint(20) DEFAULT NULL,
  `id_livre` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `date_reservation`, `heure_reservation`, `id_utilisateur`, `id_livre`) VALUES
(1, '2024-12-31', '19:35:44', 2, 1),
(2, '2024-11-01', '12:43:00', 1, 3),
(3, '2023-02-15', '08:20:21', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` bigint(20) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `mot_de_passe` varchar(50) DEFAULT NULL,
  `numero_telephone` varchar(20) DEFAULT NULL,
  `statut` varchar(20) DEFAULT NULL,
  `nom_utilsateur` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `nom`, `prenom`, `mail`, `mot_de_passe`, `numero_telephone`, `statut`, `nom_utilsateur`) VALUES
(1, 'Diop', 'Ousmane', 'ousmane.diop@example.com', 'motdepasse123', '+22177889900', 'Inactif', 'Big Ouzz'),
(2, 'Ndiaye', 'Aminata', 'aminata.ndiaye@example.com', 'abcd1234', '+22177665544', 'Inactif', 'Mina'),
(3, 'Sow', 'Fatou', 'fatou.sow@example.com', 'password456', '+22178332211', 'Actif', 'sowfatou');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acceder`
--
ALTER TABLE `acceder`
  ADD PRIMARY KEY (`id_utilisateur`,`id_ecran`),
  ADD KEY `id_ecran` (`id_ecran`);

--
-- Indexes for table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`id_auteur`);

--
-- Indexes for table `avoir_des_droits`
--
ALTER TABLE `avoir_des_droits`
  ADD PRIMARY KEY (`id_ecran`,`id_admin`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `ecran`
--
ALTER TABLE `ecran`
  ADD PRIMARY KEY (`id_ecran`);

--
-- Indexes for table `emprunt`
--
ALTER TABLE `emprunt`
  ADD PRIMARY KEY (`id_emprunt`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_livre` (`id_livre`);

--
-- Indexes for table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id_livre`),
  ADD KEY `id_auteur` (`id_auteur`);

--
-- Indexes for table `peut_etre_vu`
--
ALTER TABLE `peut_etre_vu`
  ADD PRIMARY KEY (`id_utilisateur`,`id_livre`),
  ADD KEY `id_livre` (`id_livre`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_reservation`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_livre` (`id_livre`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `id_admin` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `id_auteur` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ecran`
--
ALTER TABLE `ecran`
  MODIFY `id_ecran` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `emprunt`
--
ALTER TABLE `emprunt`
  MODIFY `id_emprunt` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `livre`
--
ALTER TABLE `livre`
  MODIFY `id_livre` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_reservation` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
