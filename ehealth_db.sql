-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 29 jan. 2025 à 16:10
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ehealth_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

CREATE TABLE `medecin` (
  `id` bigint(20) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `specialite` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`id`, `adresse`, `email`, `nom`, `telephone`, `role`, `password`, `specialite`) VALUES
(1, '123 Rue de Paris', 'dupont@example.com', 'Dr. Dupont', '0123456789', NULL, NULL, NULL),
(3, 'Rue jules lahayes 278 boite 50', 'youssef.1090@live.be', 'dede', '0484063972', NULL, NULL, NULL),
(4, 'berchkem', 'soufian@ulb.be', 'Soufiane', '101', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `medecin_horaires_disponibles`
--

CREATE TABLE `medecin_horaires_disponibles` (
  `medecin_id` bigint(20) NOT NULL,
  `horaires_disponibles` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `medecin_horaires_disponibles`
--

INSERT INTO `medecin_horaires_disponibles` (`medecin_id`, `horaires_disponibles`) VALUES
(1, '09:00-12:00'),
(1, '14:00-18:00');

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `id` bigint(20) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`id`, `adresse`, `email`, `nom`, `telephone`, `role`, `password`) VALUES
(1, '123 Rue de bruxelles', 'Dumont@example.com', 'Patient Dumont dumont', '0123456789', NULL, NULL),
(2, 'Rue jules lahayes 278 boite 50', 'youssef.1090@live.be', 'dede', '0484063972', NULL, NULL),
(3, 'jette', 'de@live.be', 'youssef', '4587', NULL, NULL),
(4, 'ixelles', 'mathias@live.be', 'mathias', '457', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `rendez_vous`
--

CREATE TABLE `rendez_vous` (
  `date` date DEFAULT NULL,
  `heure` time(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `medecin_id` bigint(20) DEFAULT NULL,
  `patient_id` bigint(20) DEFAULT NULL,
  `statut` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `rendez_vous`
--

INSERT INTO `rendez_vous` (`date`, `heure`, `id`, `medecin_id`, `patient_id`, `statut`) VALUES
('2023-10-25', '14:00:00.000000', 1, 1, 1, 'Confirmé'),
('2025-01-09', '15:12:00.000000', 3, 3, 1, 'ok'),
('2025-01-25', '14:00:00.000000', 4, 3, 2, 'Confirmé'),
('2025-01-25', '14:00:00.000000', 5, 3, 3, 'Confirmé'),
('2025-01-25', '14:00:00.000000', 6, 3, 3, 'Confirmé'),
('2025-01-25', '14:00:00.000000', 7, 3, 3, 'youssef ok'),
('2025-01-25', '14:00:00.000000', 8, 3, 3, 'youssef ok');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `medecin_horaires_disponibles`
--
ALTER TABLE `medecin_horaires_disponibles`
  ADD KEY `FK99k3grhc9knb0ok42g8r8n637` (`medecin_id`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3cfgw39eujld73uwqc3efmom2` (`medecin_id`),
  ADD KEY `FK35ayulwe26jii3vq14v6sokp3` (`patient_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `medecin`
--
ALTER TABLE `medecin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `medecin_horaires_disponibles`
--
ALTER TABLE `medecin_horaires_disponibles`
  ADD CONSTRAINT `FK99k3grhc9knb0ok42g8r8n637` FOREIGN KEY (`medecin_id`) REFERENCES `medecin` (`id`);

--
-- Contraintes pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  ADD CONSTRAINT `FK35ayulwe26jii3vq14v6sokp3` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  ADD CONSTRAINT `FK3cfgw39eujld73uwqc3efmom2` FOREIGN KEY (`medecin_id`) REFERENCES `medecin` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
