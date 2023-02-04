-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 04 fév. 2023 à 19:32
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `employee_base`
--

-- --------------------------------------------------------

--
-- Structure de la table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `registration_number` varchar(10) NOT NULL,
  `model` varchar(30) NOT NULL,
  `img_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cars`
--

INSERT INTO `cars` (`car_id`, `registration_number`, `model`, `img_url`) VALUES
(1, 'FTW-666-BE', 'Alpha Romeo 159 2.2 JTS', 'https://www.carscoops.com/wp-content/uploads/2008/06/Alfa_Romeo_159_Autodelta_0.jpg'),
(2, '86-CSD-03Q', 'BMW 320i E90', 'https://www.largus.fr/images/photos/rsi/_G_JPG/Voitures/BMW/Serie_3/V_E90/Ph2_NG/Berline_4_portes/troisquartavant1.jpg'),
(3, 'XVX-303-07', 'Alpine A110 R', 'https://images.caradisiac.com/images/0/4/0/8/200408/S1-essai-video-alpine-a110-r-un-surcout-justifie-743696.jpg'),
(4, 'XYZ-Z57-Uv', 'Toyota Supra V3', 'https://images.caradisiac.com/images/9/2/9/4/199294/S1-toyota-supra-bvm-une-bonne-idee-736145.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `cars_emp`
--

CREATE TABLE `cars_emp` (
  `emp_no` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `from_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cars_emp`
--

INSERT INTO `cars_emp` (`emp_no`, `car_id`, `from_date`) VALUES
(10005, 4, '2023-02-04'),
(10001, 1, '2023-02-03'),
(10004, 2, '2023-02-04'),
(10006, 3, '2023-02-04');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `current_dept_emp`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `current_dept_emp` (
`emp_no` int(11)
,`dept_no` char(4)
,`from_date` date
,`to_date` date
);

-- --------------------------------------------------------

--
-- Structure de la table `demands`
--

CREATE TABLE `demands` (
  `id` int(11) NOT NULL,
  `emp_no` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `about` varchar(60) NOT NULL,
  `status` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `departments`
--

CREATE TABLE `departments` (
  `dept_no` char(4) NOT NULL,
  `dept_name` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `roi_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `departments`
--

INSERT INTO `departments` (`dept_no`, `dept_name`, `description`, `address`, `roi_url`) VALUES
('d001', 'Marketing', '', '', NULL),
('d002', 'Finance', '', '', NULL),
('d003', 'Human Resources', '', '', NULL),
('d004', 'Production', '', '', NULL),
('d005', 'Development', '', '', NULL),
('d006', 'Quality Management', '', '', NULL),
('d007', 'Sales', '', '', NULL),
('d008', 'Research', '', '', NULL),
('d009', 'Customer Service', '', '', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `dept_emp`
--

CREATE TABLE `dept_emp` (
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `dept_emp`
--

INSERT INTO `dept_emp` (`emp_no`, `dept_no`, `from_date`, `to_date`) VALUES
(10001, 'd005', '1986-06-26', '9999-01-01'),
(10002, 'd007', '1996-08-03', '9999-01-01'),
(10003, 'd004', '1995-12-03', '9999-01-01'),
(10004, 'd004', '1986-12-01', '9999-01-01'),
(10005, 'd003', '1989-09-12', '9999-01-01'),
(10006, 'd005', '1990-08-05', '9999-01-01'),
(10007, 'd008', '1989-02-10', '9999-01-01'),
(10008, 'd005', '1998-03-11', '2000-07-31'),
(10009, 'd006', '1985-02-18', '9999-01-01'),
(10010, 'd004', '1996-11-24', '2000-06-26'),
(10010, 'd006', '2000-06-26', '9999-01-01');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `dept_emp_latest_date`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `dept_emp_latest_date` (
`emp_no` int(11)
,`from_date` date
,`to_date` date
);

-- --------------------------------------------------------

--
-- Structure de la table `dept_manager`
--

CREATE TABLE `dept_manager` (
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `dept_title`
--

CREATE TABLE `dept_title` (
  `dept_no` char(4) NOT NULL,
  `title_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `dept_title`
--

INSERT INTO `dept_title` (`dept_no`, `title_no`) VALUES
('d001', 3),
('d001', 2),
('d004', 5),
('d003', 5);

-- --------------------------------------------------------

--
-- Structure de la table `employees`
--

CREATE TABLE `employees` (
  `emp_no` int(11) NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `hire_date` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '["ROLE_USER"]' CHECK (json_valid(`roles`)),
  `is_verified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `employees`
--

INSERT INTO `employees` (`emp_no`, `birth_date`, `first_name`, `last_name`, `gender`, `photo`, `email`, `hire_date`, `password`, `roles`, `is_verified`) VALUES
(10001, '1953-09-02', 'Georgi', 'Facello', 'M', NULL, 'georgi@sull.com', '1986-06-26', '$2y$13$y2AN3hwLRUe28ODxFZZtWepG6.8o8cqhiayYBBL6Mm/h4ssxmIGKy', '[\"ROLE_ADMIN\", \"ROLE_USER\"]', 1),
(10002, '1964-06-02', 'Bezalel', 'Simmel', 'F', NULL, '', '1985-11-21', '', '[\"ROLE_USER\"]', 0),
(10003, '1959-12-03', 'Parto', 'Bamford', 'M', NULL, '', '1986-08-28', '', '[\"ROLE_USER\"]', 0),
(10004, '1954-05-01', 'Chirstian', 'Koblick', 'M', NULL, '', '1986-12-01', '', '[\"ROLE_USER\"]', 0),
(10005, '1955-01-21', 'Kyoichi', 'Maliniak', 'M', NULL, '', '1989-09-12', '', '[\"ROLE_USER\"]', 0),
(10006, '1953-04-20', 'Anneke', 'Preusig', 'F', NULL, '', '1989-06-02', '', '[\"ROLE_USER\"]', 0),
(10007, '1957-05-23', 'Tzvetan', 'Zielinski', 'F', NULL, '', '1989-02-10', '', '[\"ROLE_USER\"]', 0),
(10008, '1958-02-19', 'Saniya', 'Kalloufi', 'M', NULL, '', '1994-09-15', '', '[\"ROLE_USER\"]', 0),
(10009, '1952-04-19', 'Sumant', 'Peac', 'F', NULL, '', '1985-02-18', '', '[\"ROLE_USER\"]', 0),
(10010, '1963-06-01', 'Duangkaew', 'Piveteau', 'F', NULL, '', '1989-08-24', '', '[\"ROLE_USER\"]', 0);

-- --------------------------------------------------------

--
-- Structure de la table `emp_projects`
--

CREATE TABLE `emp_projects` (
  `project_id` int(11) NOT NULL,
  `emp_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `emp_projects`
--

INSERT INTO `emp_projects` (`project_id`, `emp_no`) VALUES
(1, 10001),
(2, 10002),
(3, 10005),
(1, 10009),
(2, 10005),
(4, 10002);

-- --------------------------------------------------------

--
-- Structure de la table `emp_title`
--

CREATE TABLE `emp_title` (
  `emp_no` int(11) NOT NULL,
  `title_no` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `emp_title`
--

INSERT INTO `emp_title` (`emp_no`, `title_no`, `from_date`, `to_date`) VALUES
(10001, 1, '1986-06-26', '9999-01-01'),
(10002, 2, '1996-08-03', '9999-01-01'),
(10003, 1, '1995-12-03', '9999-01-01'),
(10004, 1, '1995-12-01', '9999-01-01'),
(10004, 3, '1986-12-01', '1995-12-01'),
(10005, 2, '1989-09-12', '1996-09-12'),
(10005, 4, '1996-09-12', '9999-01-01'),
(10006, 1, '1990-08-05', '9999-01-01'),
(10007, 2, '1989-02-10', '1996-02-11'),
(10007, 4, '1996-02-11', '9999-01-01'),
(10008, 5, '1998-03-11', '2000-07-31'),
(10009, 1, '1995-02-18', '9999-01-01'),
(10009, 3, '1990-02-18', '1995-02-18'),
(10009, 5, '1985-02-18', '1990-02-18'),
(10010, 3, '1996-11-24', '9999-01-01');

-- --------------------------------------------------------

--
-- Structure de la table `interns`
--

CREATE TABLE `interns` (
  `id` int(11) NOT NULL,
  `emp` int(11) DEFAULT NULL,
  `fullname` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `dept` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `interns`
--

INSERT INTO `interns` (`id`, `emp`, `fullname`, `start_date`, `end_date`, `dept`) VALUES
(1, 10001, 'Raymond Barre', '2023-01-20', '2023-02-28', 'd006'),
(2, NULL, 'Luc Goossu', '2023-01-10', '2023-02-28', 'd007'),
(3, 10001, 'herve Mailleux', '2023-01-10', '2023-02-28', 'd006'),
(4, 10002, 'Marc Wilmots', '2023-01-01', '2023-01-03', 'd007'),
(5, NULL, 'Mermed Mamoud', '2023-01-10', '2023-02-28', 'd006'),
(6, 10005, 'Chris Blade', '2023-01-05', '2023-02-17', 'd008'),
(8, 10004, 'Dana White', '2023-01-13', '2023-03-31', 'd002'),
(10, 10001, 'Po Atan', '2023-01-13', '2023-03-31', 'd008'),
(11, 10001, 'Israel Adesanya', '2023-01-13', '2023-03-31', 'd001');

-- --------------------------------------------------------

--
-- Structure de la table `leaves`
--

CREATE TABLE `leaves` (
  `leave_id` int(11) NOT NULL,
  `emp_no` int(6) NOT NULL,
  `type` varchar(15) NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `leaves`
--

INSERT INTO `leaves` (`leave_id`, `emp_no`, `type`, `from_date`, `to_date`) VALUES
(1, 10001, 'paternity', '2022-01-30 16:09:52', '2023-02-02 19:54:43'),
(2, 10002, 'sick', '2023-01-22 01:06:05', '2023-02-24 00:43:40'),
(3, 10003, 'sick', '2023-01-21 19:51:07', '2023-01-31 19:51:42'),
(4, 10001, 'training', '2023-01-04 20:23:22', '2023-01-24 00:44:03'),
(5, 10001, 'training', '2023-01-07 20:23:22', '2023-01-20 20:23:22'),
(6, 10006, 'training', '2023-01-07 20:23:22', '2023-01-23 21:33:25'),
(7, 10008, 'training', '2023-01-07 20:23:22', '2023-01-23 23:59:46');

-- --------------------------------------------------------

--
-- Structure de la table `links`
--

CREATE TABLE `links` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `missions`
--

CREATE TABLE `missions` (
  `mission_id` int(11) NOT NULL,
  `emp_no` int(11) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `due_date` datetime NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `missions`
--

INSERT INTO `missions` (`mission_id`, `emp_no`, `description`, `due_date`, `status`) VALUES
(2, 10001, 'succeed at POO exam (second sess)', '2023-12-01 00:00:00', 'ongoing'),
(6, 10001, 'become calm', '2023-01-26 22:05:39', 'ongoing'),
(7, 10001, 'stay calm', '2023-01-27 22:06:52', 'done'),
(8, 10001, 'Make the charts appear', '2023-01-28 22:28:55', 'ongoing'),
(9, 10001, 'Get total by genre', '2023-01-28 22:29:43', 'done'),
(10, 10001, 'Make a valid and secure POST submit', '2023-01-23 17:15:56', 'not taken');

-- --------------------------------------------------------

--
-- Structure de la table `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `projects`
--

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `emp_no` int(11) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `projects`
--

INSERT INTO `projects` (`project_id`, `emp_no`, `description`, `created_at`, `updated_at`) VALUES
(1, 10001, 'project 1', '2023-01-24 14:56:48', '2023-01-24 14:56:48'),
(2, 10009, 'project 2', '2023-01-24 14:56:48', '2023-01-24 14:56:48'),
(3, 10005, 'Project 3', '2023-01-24 14:59:09', '2023-01-24 14:59:09'),
(4, 10002, 'Project 4', '2023-01-24 15:00:02', '2023-01-24 15:00:02');

-- --------------------------------------------------------

--
-- Structure de la table `salaries`
--

CREATE TABLE `salaries` (
  `id` int(11) NOT NULL,
  `emp_no` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `salaries`
--

INSERT INTO `salaries` (`id`, `emp_no`, `salary`, `from_date`, `to_date`) VALUES
(1, 10001, 60117, '1986-06-26', '1987-06-26'),
(2, 10001, 62102, '1987-06-26', '1988-06-25'),
(3, 10001, 66074, '1988-06-25', '1989-06-25'),
(4, 10001, 66596, '1989-06-25', '1990-06-25'),
(5, 10001, 66961, '1990-06-25', '1991-06-25'),
(6, 10001, 71046, '1991-06-25', '1992-06-24'),
(7, 10001, 74333, '1992-06-24', '1993-06-24'),
(8, 10001, 75286, '1993-06-24', '1994-06-24'),
(9, 10001, 75994, '1994-06-24', '1995-06-24'),
(10, 10001, 76884, '1995-06-24', '1996-06-23'),
(11, 10001, 80013, '1996-06-23', '1997-06-23'),
(12, 10001, 81025, '1997-06-23', '1998-06-23'),
(13, 10001, 81097, '1998-06-23', '1999-06-23'),
(14, 10001, 84917, '1999-06-23', '2000-06-22'),
(15, 10001, 85112, '2000-06-22', '2001-06-22'),
(16, 10001, 85097, '2001-06-22', '2002-06-22'),
(17, 10001, 88958, '2002-06-22', '9999-01-01'),
(18, 10002, 65828, '1996-08-03', '1997-08-03'),
(19, 10002, 65909, '1997-08-03', '1998-08-03'),
(20, 10002, 67534, '1998-08-03', '1999-08-03'),
(21, 10002, 69366, '1999-08-03', '2000-08-02'),
(22, 10002, 71963, '2000-08-02', '2001-08-02'),
(23, 10002, 72527, '2001-08-02', '9999-01-01'),
(24, 10003, 40006, '1995-12-03', '1996-12-02'),
(25, 10003, 43616, '1996-12-02', '1997-12-02'),
(26, 10003, 43466, '1997-12-02', '1998-12-02'),
(27, 10003, 43636, '1998-12-02', '1999-12-02'),
(28, 10003, 43478, '1999-12-02', '2000-12-01'),
(29, 10003, 43699, '2000-12-01', '2001-12-01'),
(30, 10003, 43311, '2001-12-01', '9999-01-01'),
(31, 10004, 40054, '1986-12-01', '1987-12-01'),
(32, 10004, 42283, '1987-12-01', '1988-11-30'),
(33, 10004, 42542, '1988-11-30', '1989-11-30'),
(34, 10004, 46065, '1989-11-30', '1990-11-30'),
(35, 10004, 48271, '1990-11-30', '1991-11-30'),
(36, 10004, 50594, '1991-11-30', '1992-11-29'),
(37, 10004, 52119, '1992-11-29', '1993-11-29'),
(38, 10004, 54693, '1993-11-29', '1994-11-29'),
(39, 10004, 58326, '1994-11-29', '1995-11-29'),
(40, 10004, 60770, '1995-11-29', '1996-11-28'),
(41, 10004, 62566, '1996-11-28', '1997-11-28'),
(42, 10004, 64340, '1997-11-28', '1998-11-28'),
(43, 10004, 67096, '1998-11-28', '1999-11-28'),
(44, 10004, 69722, '1999-11-28', '2000-11-27'),
(45, 10004, 70698, '2000-11-27', '2001-11-27'),
(46, 10004, 74057, '2001-11-27', '9999-01-01'),
(47, 10005, 78228, '1989-09-12', '1990-09-12'),
(48, 10005, 82621, '1990-09-12', '1991-09-12'),
(49, 10005, 83735, '1991-09-12', '1992-09-11'),
(50, 10005, 85572, '1992-09-11', '1993-09-11'),
(51, 10005, 85076, '1993-09-11', '1994-09-11'),
(52, 10005, 86050, '1994-09-11', '1995-09-11'),
(53, 10005, 88448, '1995-09-11', '1996-09-10'),
(54, 10005, 88063, '1996-09-10', '1997-09-10'),
(55, 10005, 89724, '1997-09-10', '1998-09-10'),
(56, 10005, 90392, '1998-09-10', '1999-09-10'),
(57, 10005, 90531, '1999-09-10', '2000-09-09'),
(58, 10005, 91453, '2000-09-09', '2001-09-09'),
(59, 10005, 94692, '2001-09-09', '9999-01-01'),
(60, 10006, 40000, '1990-08-05', '1991-08-05'),
(61, 10006, 42085, '1991-08-05', '1992-08-04'),
(62, 10006, 42629, '1992-08-04', '1993-08-04'),
(63, 10006, 45844, '1993-08-04', '1994-08-04'),
(64, 10006, 47518, '1994-08-04', '1995-08-04'),
(65, 10006, 47917, '1995-08-04', '1996-08-03'),
(66, 10006, 52255, '1996-08-03', '1997-08-03'),
(67, 10006, 53747, '1997-08-03', '1998-08-03'),
(68, 10006, 56032, '1998-08-03', '1999-08-03'),
(69, 10006, 58299, '1999-08-03', '2000-08-02'),
(70, 10006, 60098, '2000-08-02', '2001-08-02'),
(71, 10006, 59755, '2001-08-02', '9999-01-01'),
(72, 10007, 56724, '1989-02-10', '1990-02-10'),
(73, 10007, 60740, '1990-02-10', '1991-02-10'),
(74, 10007, 62745, '1991-02-10', '1992-02-10'),
(75, 10007, 63475, '1992-02-10', '1993-02-09'),
(76, 10007, 63208, '1993-02-09', '1994-02-09'),
(77, 10007, 64563, '1994-02-09', '1995-02-09'),
(78, 10007, 68833, '1995-02-09', '1996-02-09'),
(79, 10007, 70220, '1996-02-09', '1997-02-08'),
(80, 10007, 73362, '1997-02-08', '1998-02-08'),
(81, 10007, 75582, '1998-02-08', '1999-02-08'),
(82, 10007, 79513, '1999-02-08', '2000-02-08'),
(83, 10007, 80083, '2000-02-08', '2001-02-07'),
(84, 10007, 84456, '2001-02-07', '2002-02-07'),
(85, 10007, 88070, '2002-02-07', '9999-01-01'),
(86, 10008, 46671, '1998-03-11', '1999-03-11'),
(87, 10008, 48584, '1999-03-11', '2000-03-10'),
(88, 10008, 52668, '2000-03-10', '2000-07-31'),
(89, 10009, 60929, '1985-02-18', '1986-02-18'),
(90, 10009, 64604, '1986-02-18', '1987-02-18'),
(91, 10009, 64780, '1987-02-18', '1988-02-18'),
(92, 10009, 66302, '1988-02-18', '1989-02-17'),
(93, 10009, 69042, '1989-02-17', '1990-02-17'),
(94, 10009, 70889, '1990-02-17', '1991-02-17'),
(95, 10009, 71434, '1991-02-17', '1992-02-17'),
(96, 10009, 74612, '1992-02-17', '1993-02-16'),
(97, 10009, 76518, '1993-02-16', '1994-02-16'),
(98, 10009, 78335, '1994-02-16', '1995-02-16'),
(99, 10009, 80944, '1995-02-16', '1996-02-16'),
(100, 10009, 82507, '1996-02-16', '1997-02-15'),
(101, 10009, 85875, '1997-02-15', '1998-02-15'),
(102, 10009, 89324, '1998-02-15', '1999-02-15'),
(103, 10009, 90668, '1999-02-15', '2000-02-15'),
(104, 10009, 93507, '2000-02-15', '2001-02-14'),
(105, 10009, 94443, '2001-02-14', '2002-02-14'),
(106, 10009, 94409, '2002-02-14', '9999-01-01'),
(107, 10010, 72488, '1996-11-24', '1997-11-24'),
(108, 10010, 74347, '1997-11-24', '1998-11-24'),
(109, 10010, 75405, '1998-11-24', '1999-11-24'),
(110, 10010, 78194, '1999-11-24', '2000-11-23'),
(111, 10010, 79580, '2000-11-23', '2001-11-23'),
(112, 10010, 80324, '2001-11-23', '9999-01-01');

-- --------------------------------------------------------

--
-- Structure de la table `titles`
--

CREATE TABLE `titles` (
  `title_no` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `titles`
--

INSERT INTO `titles` (`title_no`, `title`, `description`) VALUES
(1, 'Senior Engineer', 'description'),
(2, 'Staff', 'description'),
(3, 'Engineer', 'description'),
(4, 'Senior Staff', 'description'),
(5, 'Assistant Engineer', 'description'),
(6, 'Technique Leader', 'description'),
(7, 'Manager', 'description');

-- --------------------------------------------------------

--
-- Structure de la vue `current_dept_emp`
--
DROP TABLE IF EXISTS `current_dept_emp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `current_dept_emp`  AS SELECT `l`.`emp_no` AS `emp_no`, `d`.`dept_no` AS `dept_no`, `l`.`from_date` AS `from_date`, `l`.`to_date` AS `to_date` FROM (`dept_emp` `d` join `dept_emp_latest_date` `l` on(`d`.`emp_no` = `l`.`emp_no` and `d`.`from_date` = `l`.`from_date` and `l`.`to_date` = `d`.`to_date`))  ;

-- --------------------------------------------------------

--
-- Structure de la vue `dept_emp_latest_date`
--
DROP TABLE IF EXISTS `dept_emp_latest_date`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dept_emp_latest_date`  AS SELECT `dept_emp`.`emp_no` AS `emp_no`, max(`dept_emp`.`from_date`) AS `from_date`, max(`dept_emp`.`to_date`) AS `to_date` FROM `dept_emp` GROUP BY `dept_emp`.`emp_no``emp_no`  ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD UNIQUE KEY `registration_number` (`registration_number`) USING BTREE;

--
-- Index pour la table `cars_emp`
--
ALTER TABLE `cars_emp`
  ADD KEY `emp_no` (`emp_no`),
  ADD KEY `car_id` (`car_id`);

--
-- Index pour la table `demands`
--
ALTER TABLE `demands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_no` (`emp_no`);

--
-- Index pour la table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dept_no`),
  ADD UNIQUE KEY `dept_name` (`dept_name`);

--
-- Index pour la table `dept_emp`
--
ALTER TABLE `dept_emp`
  ADD PRIMARY KEY (`emp_no`,`dept_no`),
  ADD KEY `dept_no` (`dept_no`),
  ADD KEY `emp_no` (`emp_no`);

--
-- Index pour la table `dept_manager`
--
ALTER TABLE `dept_manager`
  ADD PRIMARY KEY (`emp_no`,`dept_no`),
  ADD KEY `dept_no` (`dept_no`);

--
-- Index pour la table `dept_title`
--
ALTER TABLE `dept_title`
  ADD KEY `dept_no` (`dept_no`),
  ADD KEY `title_no` (`title_no`);

--
-- Index pour la table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_no`);

--
-- Index pour la table `emp_projects`
--
ALTER TABLE `emp_projects`
  ADD KEY `project_id` (`project_id`),
  ADD KEY `emp_no` (`emp_no`);

--
-- Index pour la table `emp_title`
--
ALTER TABLE `emp_title`
  ADD PRIMARY KEY (`emp_no`,`title_no`,`from_date`),
  ADD KEY `title_no` (`title_no`);

--
-- Index pour la table `interns`
--
ALTER TABLE `interns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dept` (`dept`),
  ADD KEY `emp` (`emp`);

--
-- Index pour la table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`leave_id`),
  ADD KEY `emp_no` (`emp_no`),
  ADD KEY `emp_no_2` (`emp_no`);

--
-- Index pour la table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`mission_id`),
  ADD KEY `emp_no` (`emp_no`);

--
-- Index pour la table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `emp_no` (`emp_no`);

--
-- Index pour la table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emp_no` (`emp_no`,`from_date`);

--
-- Index pour la table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`title_no`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `demands`
--
ALTER TABLE `demands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10011;

--
-- AUTO_INCREMENT pour la table `interns`
--
ALTER TABLE `interns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `leave_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `missions`
--
ALTER TABLE `missions`
  MODIFY `mission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT pour la table `titles`
--
ALTER TABLE `titles`
  MODIFY `title_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cars_emp`
--
ALTER TABLE `cars_emp`
  ADD CONSTRAINT `cars_emp_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `demands`
--
ALTER TABLE `demands`
  ADD CONSTRAINT `demands_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `dept_emp`
--
ALTER TABLE `dept_emp`
  ADD CONSTRAINT `dept_emp_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dept_emp_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `dept_manager`
--
ALTER TABLE `dept_manager`
  ADD CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `dept_title`
--
ALTER TABLE `dept_title`
  ADD CONSTRAINT `dept_title_ibfk_1` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dept_title_ibfk_2` FOREIGN KEY (`title_no`) REFERENCES `titles` (`title_no`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dept_title_ibfk_3` FOREIGN KEY (`title_no`) REFERENCES `titles` (`title_no`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `emp_projects`
--
ALTER TABLE `emp_projects`
  ADD CONSTRAINT `emp_projects_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `emp_projects_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `emp_title`
--
ALTER TABLE `emp_title`
  ADD CONSTRAINT `emp_title_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON UPDATE CASCADE,
  ADD CONSTRAINT `emp_title_ibfk_2` FOREIGN KEY (`title_no`) REFERENCES `titles` (`title_no`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `interns`
--
ALTER TABLE `interns`
  ADD CONSTRAINT `interns_ibfk_1` FOREIGN KEY (`emp`) REFERENCES `employees` (`emp_no`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `interns_ibfk_2` FOREIGN KEY (`dept`) REFERENCES `departments` (`dept_no`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `missions`
--
ALTER TABLE `missions`
  ADD CONSTRAINT `missions_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `salaries`
--
ALTER TABLE `salaries`
  ADD CONSTRAINT `salaries_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
