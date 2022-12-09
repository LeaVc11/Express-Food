-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 17 juin 2022 à 14:47
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `express food`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `idCategorie` int(11) NOT NULL,
  `nameCategorie` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `nameCategorie`) VALUES
(1, 'plats'),
(2, 'desserts');

-- --------------------------------------------------------

--
-- Structure de la table `delivery_address`
--

CREATE TABLE `delivery_address` (
  `idAddress_delivery` int(11) NOT NULL,
  `number` tinyint(4) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postaleCode` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `delivery_address`
--

INSERT INTO `delivery_address` (`idAddress_delivery`, `number`, `address`, `city`, `postaleCode`) VALUES
(1, 16, 'rue Beauvallon', 'Annecy', 74000),
(2, 4, 'allée rue du 11 novembre', 'Annecy', 74000);

-- --------------------------------------------------------

--
-- Structure de la table `delivery_person`
--

CREATE TABLE `delivery_person` (
  `idDelivery_Personn` int(11) NOT NULL,
  `nameDelivery` varchar(50) NOT NULL,
  `firstNameDelivery` varchar(50) NOT NULL,
  `telPortable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `delivery_person`
--

INSERT INTO `delivery_person` (`idDelivery_Personn`, `nameDelivery`, `firstNameDelivery`, `telPortable`) VALUES
(1, 'sandra', 'doe', 600000102),
(2, 'pierre', 'moulin', 612121512);

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `idOrder` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `idDeliveryPerson` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customerNumber` varchar(20) NOT NULL,
  `totalPrice` float NOT NULL,
  `idPayement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`idOrder`, `idProduct`, `idDeliveryPerson`, `date`, `customerNumber`, `totalPrice`, `idPayement`) VALUES
(8, 9, 2, '2022-06-09 13:50:07', '152C12', 5.2, 3),
(9, 3, 1, '2022-06-09 13:51:57', '162C12', 15.2, 3),
(10, 5, 1, '2022-06-13 14:19:52', '142C12', 5.5, 3);

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

CREATE TABLE `payment` (
  `idPayment` int(11) NOT NULL,
  `creditCard` int(11) NOT NULL,
  `cash` int(11) NOT NULL,
  `mealTicket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `payment`
--

INSERT INTO `payment` (`idPayment`, `creditCard`, `cash`, `mealTicket`) VALUES
(1, 1, 2, 3),
(3, 1, 2, 3),
(4, 1, 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `idProduct` int(11) NOT NULL,
  `idCategories` int(11) NOT NULL,
  `nameProduct` varchar(50) NOT NULL,
  `stockProduct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`idProduct`, `idCategories`, `nameProduct`, `stockProduct`) VALUES
(3, 1, 'steack /frites', 2),
(4, 2, 'mousse au chocolat', 5),
(5, 1, 'salade piemontaise', 4),
(9, 2, 'salade de fruit', 5),
(12, 1, 'sandwich', 4);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `idRole` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`idRole`, `name`) VALUES
(1, 'headChef'),
(2, 'customer');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `idAddress_delivery` int(11) NOT NULL,
  `idOrder` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `telephonePortable` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avis` text NOT NULL,
  `idRole` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`idUser`, `idAddress_delivery`, `idOrder`, `name`, `firstName`, `telephonePortable`, `email`, `password`, `avis`, `idRole`) VALUES
(7, 1, 8, 'pierre', 'perrin', 600000000, 'pierre.perrin@gmail.com', '123', '\r\n\r\nLorem ipsum dolor sit amet. At sequi dignissimos cum voluptas soluta eum culpa consequatur est consequatur ipsa est tempora optio. Est fugiat omnis et vero sapiente et quia quaerat rem nemo beatae. Est illum iure in voluptatem quasi eum dolorem sequi est repellendus iure et cupiditate repellendus.\r\n\r\nUt quas cupiditate sed dolor sequi est unde iste rem aspernatur dolor est sunt eaque. Est dolor repellat sed facilis soluta eos accusamus soluta. Ut nihil quasi et galisum magni et accusamus voluptatem sit odio atque At autem autem non voluptas facere. Nam debitis porro ex accusamus rerum ab voluptas autem.\r\n\r\nId ratione voluptatum sit odit veniam eum voluptate optio est rerum neque aut quae omnis aut sunt incidunt. Est commodi ratione sed eligendi numquam rem vero vitae ut nobis dolores ut sunt molestiae et omnis omnis aut cumque voluptatum!\r\n', 2),
(8, 1, 9, 'paul', 'moulin', 611111111, 'paul.moulin@gmail.com', '12345', '', 1),
(9, 1, 8, 'pierre', 'perrin', 600000000, 'pierre.perrin@gmail.com', '123', '\r\n\r\nLorem ipsum dolor sit amet. At sequi dignissimos cum voluptas soluta eum culpa consequatur est consequatur ipsa est tempora optio. Est fugiat omnis et vero sapiente et quia quaerat rem nemo beatae. Est illum iure in voluptatem quasi eum dolorem sequi est repellendus iure et cupiditate repellendus.\r\n\r\nUt quas cupiditate sed dolor sequi est unde iste rem aspernatur dolor est sunt eaque. Est dolor repellat sed facilis soluta eos accusamus soluta. Ut nihil quasi et galisum magni et accusamus voluptatem sit odio atque At autem autem non voluptas facere. Nam debitis porro ex accusamus rerum ab voluptas autem.\r\n\r\nId ratione voluptatum sit odit veniam eum voluptate optio est rerum neque aut quae omnis aut sunt incidunt. Est commodi ratione sed eligendi numquam rem vero vitae ut nobis dolores ut sunt molestiae et omnis omnis aut cumque voluptatum!\r\n', 2),
(10, 1, 9, 'paul', 'moulin', 611111111, 'paul.moulin@gmail.com', '12345', '', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Index pour la table `delivery_address`
--
ALTER TABLE `delivery_address`
  ADD PRIMARY KEY (`idAddress_delivery`);

--
-- Index pour la table `delivery_person`
--
ALTER TABLE `delivery_person`
  ADD PRIMARY KEY (`idDelivery_Personn`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`idOrder`),
  ADD KEY `idProduct` (`idProduct`),
  ADD KEY `idDelivery_Personn` (`idDeliveryPerson`),
  ADD KEY `idPayement` (`idPayement`);

--
-- Index pour la table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`idPayment`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idProduct`),
  ADD KEY `idCategories` (`idCategories`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`idRole`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `idAddress_delivery` (`idAddress_delivery`),
  ADD KEY `idOrder` (`idOrder`),
  ADD KEY `idRole` (`idRole`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idCategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `delivery_address`
--
ALTER TABLE `delivery_address`
  MODIFY `idAddress_delivery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `delivery_person`
--
ALTER TABLE `delivery_person`
  MODIFY `idDelivery_Personn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `idOrder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `payment`
--
ALTER TABLE `payment`
  MODIFY `idPayment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `idRole` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`idDeliveryPerson`) REFERENCES `delivery_person` (`idDelivery_Personn`),
  ADD CONSTRAINT `order_ibfk_4` FOREIGN KEY (`idPayement`) REFERENCES `payment` (`idPayment`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idCategories`) REFERENCES `categorie` (`idCategorie`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`idAddress_delivery`) REFERENCES `delivery_address` (`idAddress_delivery`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`idOrder`) REFERENCES `order` (`idOrder`),
  ADD CONSTRAINT `user_ibfk_3` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
