-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 23 juil. 2018 à 17:20
-- Version du serveur :  10.1.31-MariaDB
-- Version de PHP :  7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `agf`
--

-- --------------------------------------------------------

--
-- Structure de la table `t_capital`
--

CREATE TABLE `t_capital` (
  `c_id` bigint(20) NOT NULL,
  `c_capitalName` varchar(255) NOT NULL,
  `c_continentName` varchar(255) NOT NULL,
  `c_countryCode` varchar(255) DEFAULT NULL,
  `c_countryName` varchar(255) NOT NULL,
  `c_latitude` float NOT NULL,
  `c_longitude` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `t_capital`
--

INSERT INTO `t_capital` (`c_id`, `c_capitalName`, `c_continentName`, `c_countryCode`, `c_countryName`, `c_latitude`, `c_longitude`) VALUES
(1, 'South Georgia and South Sandwich Islands', 'King Edward Point', 'GS', 'Antarctica', -54.2833, -36.5),
(2, 'French Southern and Antarctic Lands', 'Port-aux-Français', 'TF', 'Antarctica', -49.35, 70.2167),
(3, 'Palestine', 'Jerusalem', 'PS', 'Asia', 31.7667, 35.2333),
(4, 'Aland Islands', 'Mariehamn', 'AX', 'Europe', 60.1167, 19.9),
(5, 'Nauru', 'Yaren', 'NR', 'Australia', -0.5477, 166.921),
(6, 'Saint Martin', 'Marigot', 'MF', 'North America', 18.0731, -63.0822),
(7, 'Tokelau', 'Atafu', 'TK', 'Australia', -9.16667, -171.833),
(8, 'Western Sahara', 'El-Aaiún', 'EH', 'Africa', 27.1536, -13.2033),
(9, 'Afghanistan', 'Kabul', 'AF', 'Asia', 34.5167, 69.1833),
(10, 'Albania', 'Tirana', 'AL', 'Europe', 41.3167, 19.8167),
(11, 'Algeria', 'Algiers', 'DZ', 'Africa', 36.75, 3.05),
(12, 'American Samoa', 'Pago Pago', 'AS', 'Australia', -14.2667, -170.7),
(13, 'Andorra', 'Andorra la Vella', 'AD', 'Europe', 42.5, 1.51667),
(14, 'Angola', 'Luanda', 'AO', 'Africa', -8.83333, 13.2167),
(15, 'Anguilla', 'The Valley', 'AI', 'North America', 18.2167, -63.05),
(16, 'Antigua and Barbuda', 'Saint John\'s', 'AG', 'North America', 17.1167, -61.85),
(17, 'Argentina', 'Buenos Aires', 'AR', 'South America', -34.5833, -58.6667),
(18, 'Armenia', 'Yerevan', 'AM', 'Europe', 40.1667, 44.5),
(19, 'Aruba', 'Oranjestad', 'AW', 'North America', 12.5167, -70.0333),
(20, 'Australia', 'Canberra', 'AU', 'Australia', -35.2667, 149.133),
(21, 'Austria', 'Vienna', 'AT', 'Europe', 48.2, 16.3667),
(22, 'Azerbaijan', 'Baku', 'AZ', 'Europe', 40.3833, 49.8667),
(23, 'Bahamas', 'Nassau', 'BS', 'North America', 25.0833, -77.35),
(24, 'Bahrain', 'Manama', 'BH', 'Asia', 26.2333, 50.5667),
(25, 'Bangladesh', 'Dhaka', 'BD', 'Asia', 23.7167, 90.4),
(26, 'Barbados', 'Bridgetown', 'BB', 'North America', 13.1, -59.6167),
(27, 'Belarus', 'Minsk', 'BY', 'Europe', 53.9, 27.5667),
(28, 'Belgium', 'Brussels', 'BE', 'Europe', 50.8333, 4.33333),
(29, 'Belize', 'Belmopan', 'BZ', 'Central America', 17.25, -88.7667),
(30, 'Benin', 'Porto-Novo', 'BJ', 'Africa', 6.48333, 2.61667),
(31, 'Bermuda', 'Hamilton', 'BM', 'North America', 32.2833, -64.7833),
(32, 'Bhutan', 'Thimphu', 'BT', 'Asia', 27.4667, 89.6333),
(33, 'Bolivia', 'La Paz', 'BO', 'South America', -16.5, -68.15),
(34, 'Bosnia and Herzegovina', 'Sarajevo', 'BA', 'Europe', 43.8667, 18.4167),
(35, 'Botswana', 'Gaborone', 'BW', 'Africa', -24.6333, 25.9),
(36, 'Brazil', 'Brasilia', 'BR', 'South America', -15.7833, -47.9167),
(37, 'British Virgin Islands', 'Road Town', 'VG', 'North America', 18.4167, -64.6167),
(38, 'Brunei Darussalam', 'Bandar Seri Begawan', 'BN', 'Asia', 4.88333, 114.933),
(39, 'Bulgaria', 'Sofia', 'BG', 'Europe', 42.6833, 23.3167),
(40, 'Burkina Faso', 'Ouagadougou', 'BF', 'Africa', 12.3667, -1.51667),
(41, 'Myanmar', 'Rangoon', 'MM', 'Asia', 16.8, 96.15),
(42, 'Burundi', 'Bujumbura', 'BI', 'Africa', -3.36667, 29.35),
(43, 'Cambodia', 'Phnom Penh', 'KH', 'Asia', 11.55, 104.917),
(44, 'Cameroon', 'Yaounde', 'CM', 'Africa', 3.86667, 11.5167),
(45, 'Canada', 'Ottawa', 'CA', 'Central America', 45.4167, -75.7),
(46, 'Cape Verde', 'Praia', 'CV', 'Africa', 14.9167, -23.5167),
(47, 'Cayman Islands', 'George Town', 'KY', 'North America', 19.3, -81.3833),
(48, 'Central African Republic', 'Bangui', 'CF', 'Africa', 4.36667, 18.5833),
(49, 'Chad', 'N\'Djamena', 'TD', 'Africa', 12.1, 15.0333),
(50, 'Chile', 'Santiago', 'CL', 'South America', -33.45, -70.6667),
(51, 'Somaliland', 'Hargeisa', 'NULL', 'Africa', 9.55, 44.05),
(52, 'South Georgia and South Sandwich Islands', 'King Edward Point', 'GS', 'Antarctica', -54.2833, -36.5),
(53, 'French Southern and Antarctic Lands', 'Port-aux-Français', 'TF', 'Antarctica', -49.35, 70.2167),
(54, 'Palestine', 'Jerusalem', 'PS', 'Asia', 31.7667, 35.2333),
(55, 'Aland Islands', 'Mariehamn', 'AX', 'Europe', 60.1167, 19.9),
(56, 'Nauru', 'Yaren', 'NR', 'Australia', -0.5477, 166.921),
(57, 'Saint Martin', 'Marigot', 'MF', 'North America', 18.0731, -63.0822),
(58, 'Tokelau', 'Atafu', 'TK', 'Australia', -9.16667, -171.833),
(59, 'Western Sahara', 'El-Aaiún', 'EH', 'Africa', 27.1536, -13.2033),
(60, 'Afghanistan', 'Kabul', 'AF', 'Asia', 34.5167, 69.1833),
(61, 'Albania', 'Tirana', 'AL', 'Europe', 41.3167, 19.8167),
(62, 'Algeria', 'Algiers', 'DZ', 'Africa', 36.75, 3.05),
(63, 'American Samoa', 'Pago Pago', 'AS', 'Australia', -14.2667, -170.7),
(64, 'Andorra', 'Andorra la Vella', 'AD', 'Europe', 42.5, 1.51667),
(65, 'Angola', 'Luanda', 'AO', 'Africa', -8.83333, 13.2167),
(66, 'Anguilla', 'The Valley', 'AI', 'North America', 18.2167, -63.05),
(67, 'Antigua and Barbuda', 'Saint John\'s', 'AG', 'North America', 17.1167, -61.85),
(68, 'Argentina', 'Buenos Aires', 'AR', 'South America', -34.5833, -58.6667),
(69, 'Armenia', 'Yerevan', 'AM', 'Europe', 40.1667, 44.5),
(70, 'Aruba', 'Oranjestad', 'AW', 'North America', 12.5167, -70.0333),
(71, 'Australia', 'Canberra', 'AU', 'Australia', -35.2667, 149.133),
(72, 'Austria', 'Vienna', 'AT', 'Europe', 48.2, 16.3667),
(73, 'Azerbaijan', 'Baku', 'AZ', 'Europe', 40.3833, 49.8667),
(74, 'Bahamas', 'Nassau', 'BS', 'North America', 25.0833, -77.35),
(75, 'Bahrain', 'Manama', 'BH', 'Asia', 26.2333, 50.5667),
(76, 'Bangladesh', 'Dhaka', 'BD', 'Asia', 23.7167, 90.4),
(77, 'Barbados', 'Bridgetown', 'BB', 'North America', 13.1, -59.6167),
(78, 'Belarus', 'Minsk', 'BY', 'Europe', 53.9, 27.5667),
(79, 'Belgium', 'Brussels', 'BE', 'Europe', 50.8333, 4.33333),
(80, 'Belize', 'Belmopan', 'BZ', 'Central America', 17.25, -88.7667),
(81, 'Benin', 'Porto-Novo', 'BJ', 'Africa', 6.48333, 2.61667),
(82, 'Bermuda', 'Hamilton', 'BM', 'North America', 32.2833, -64.7833),
(83, 'Bhutan', 'Thimphu', 'BT', 'Asia', 27.4667, 89.6333),
(84, 'Bolivia', 'La Paz', 'BO', 'South America', -16.5, -68.15),
(85, 'Bosnia and Herzegovina', 'Sarajevo', 'BA', 'Europe', 43.8667, 18.4167),
(86, 'Botswana', 'Gaborone', 'BW', 'Africa', -24.6333, 25.9),
(87, 'Brazil', 'Brasilia', 'BR', 'South America', -15.7833, -47.9167),
(88, 'British Virgin Islands', 'Road Town', 'VG', 'North America', 18.4167, -64.6167),
(89, 'Brunei Darussalam', 'Bandar Seri Begawan', 'BN', 'Asia', 4.88333, 114.933),
(90, 'Bulgaria', 'Sofia', 'BG', 'Europe', 42.6833, 23.3167),
(91, 'Burkina Faso', 'Ouagadougou', 'BF', 'Africa', 12.3667, -1.51667),
(92, 'Myanmar', 'Rangoon', 'MM', 'Asia', 16.8, 96.15),
(93, 'Burundi', 'Bujumbura', 'BI', 'Africa', -3.36667, 29.35),
(94, 'Cambodia', 'Phnom Penh', 'KH', 'Asia', 11.55, 104.917),
(95, 'Cameroon', 'Yaounde', 'CM', 'Africa', 3.86667, 11.5167),
(96, 'Canada', 'Ottawa', 'CA', 'Central America', 45.4167, -75.7),
(97, 'Cape Verde', 'Praia', 'CV', 'Africa', 14.9167, -23.5167),
(98, 'Cayman Islands', 'George Town', 'KY', 'North America', 19.3, -81.3833),
(99, 'Central African Republic', 'Bangui', 'CF', 'Africa', 4.36667, 18.5833),
(100, 'Chad', 'N\'Djamena', 'TD', 'Africa', 12.1, 15.0333),
(101, 'Chile', 'Santiago', 'CL', 'South America', -33.45, -70.6667),
(102, 'China', 'Beijing', 'CN', 'Asia', 39.9167, 116.383),
(103, 'Christmas Island', 'The Settlement', 'CX', 'Australia', -10.4167, 105.717),
(104, 'Cocos Islands', 'West Island', 'CC', 'Australia', -12.1667, 96.8333),
(105, 'Colombia', 'Bogota', 'CO', 'South America', 4.6, -74.0833),
(106, 'Comoros', 'Moroni', 'KM', 'Africa', -11.7, 43.2333),
(107, 'Democratic Republic of the Congo', 'Kinshasa', 'CD', 'Africa', -4.31667, 15.3),
(108, 'Republic of Congo', 'Brazzaville', 'CG', 'Africa', -4.25, 15.2833),
(109, 'Cook Islands', 'Avarua', 'CK', 'Australia', -21.2, -159.767),
(110, 'Costa Rica', 'San Jose', 'CR', 'Central America', 9.93333, -84.0833),
(111, 'Cote d\'Ivoire', 'Yamoussoukro', 'CI', 'Africa', 6.81667, -5.26667),
(112, 'Croatia', 'Zagreb', 'HR', 'Europe', 45.8, 16),
(113, 'Cuba', 'Havana', 'CU', 'North America', 23.1167, -82.35),
(114, 'Curaçao', 'Willemstad', 'CW', 'North America', 12.1, -68.9167),
(115, 'Cyprus', 'Nicosia', 'CY', 'Europe', 35.1667, 33.3667),
(116, 'Czech Republic', 'Prague', 'CZ', 'Europe', 50.0833, 14.4667),
(117, 'Denmark', 'Copenhagen', 'DK', 'Europe', 55.6667, 12.5833),
(118, 'Djibouti', 'Djibouti', 'DJ', 'Africa', 11.5833, 43.15),
(119, 'Dominica', 'Roseau', 'DM', 'North America', 15.3, -61.4),
(120, 'Dominican Republic', 'Santo Domingo', 'DO', 'North America', 18.4667, -69.9),
(121, 'Ecuador', 'Quito', 'EC', 'South America', -0.216667, -78.5),
(122, 'Egypt', 'Cairo', 'EG', 'Africa', 30.05, 31.25),
(123, 'El Salvador', 'San Salvador', 'SV', 'Central America', 13.7, -89.2),
(124, 'Equatorial Guinea', 'Malabo', 'GQ', 'Africa', 3.75, 8.78333),
(125, 'Eritrea', 'Asmara', 'ER', 'Africa', 15.3333, 38.9333),
(126, 'Estonia', 'Tallinn', 'EE', 'Europe', 59.4333, 24.7167),
(127, 'Ethiopia', 'Addis Ababa', 'ET', 'Africa', 9.03333, 38.7),
(128, 'Falkland Islands', 'Stanley', 'FK', 'South America', -51.7, -57.85),
(129, 'Faroe Islands', 'Torshavn', 'FO', 'Europe', 62, -6.76667),
(130, 'Fiji', 'Suva', 'FJ', 'Australia', -18.1333, 178.417),
(131, 'Finland', 'Helsinki', 'FI', 'Europe', 60.1667, 24.9333),
(132, 'France', 'Paris', 'FR', 'Europe', 48.8667, 2.33333),
(133, 'French Polynesia', 'Papeete', 'PF', 'Australia', -17.5333, -149.567),
(134, 'Gabon', 'Libreville', 'GA', 'Africa', 0.383333, 9.45),
(135, 'The Gambia', 'Banjul', 'GM', 'Africa', 13.45, -16.5667),
(136, 'Georgia', 'Tbilisi', 'GE', 'Europe', 41.6833, 44.8333),
(137, 'Germany', 'Berlin', 'DE', 'Europe', 52.5167, 13.4),
(138, 'Ghana', 'Accra', 'GH', 'Africa', 5.55, -0.216667),
(139, 'Gibraltar', 'Gibraltar', 'GI', 'Europe', 36.1333, -5.35),
(140, 'Greece', 'Athens', 'GR', 'Europe', 37.9833, 23.7333),
(141, 'Greenland', 'Nuuk', 'GL', 'Central America', 64.1833, -51.75),
(142, 'Grenada', 'Saint George\'s', 'GD', 'North America', 12.05, -61.75),
(143, 'Guam', 'Hagatna', 'GU', 'Australia', 13.4667, 144.733),
(144, 'Guatemala', 'Guatemala City', 'GT', 'Central America', 14.6167, -90.5167),
(145, 'Guernsey', 'Saint Peter Port', 'GG', 'Europe', 49.45, -2.53333),
(146, 'Guinea', 'Conakry', 'GN', 'Africa', 9.5, -13.7),
(147, 'Guinea-Bissau', 'Bissau', 'GW', 'Africa', 11.85, -15.5833),
(148, 'Guyana', 'Georgetown', 'GY', 'South America', 6.8, -58.15),
(149, 'Haiti', 'Port-au-Prince', 'HT', 'North America', 18.5333, -72.3333),
(150, 'Vatican City', 'Vatican City', 'VA', 'Europe', 41.9, 12.45),
(151, 'Honduras', 'Tegucigalpa', 'HN', 'Central America', 14.1, -87.2167),
(152, 'Hungary', 'Budapest', 'HU', 'Europe', 47.5, 19.0833),
(153, 'Iceland', 'Reykjavik', 'IS', 'Europe', 64.15, -21.95),
(154, 'India', 'New Delhi', 'IN', 'Asia', 28.6, 77.2),
(155, 'Indonesia', 'Jakarta', 'ID', 'Asia', -6.16667, 106.817),
(156, 'Iran', 'Tehran', 'IR', 'Asia', 35.7, 51.4167),
(157, 'Iraq', 'Baghdad', 'IQ', 'Asia', 33.3333, 44.4),
(158, 'Ireland', 'Dublin', 'IE', 'Europe', 53.3167, -6.23333),
(159, 'Isle of Man', 'Douglas', 'IM', 'Europe', 54.15, -4.48333),
(160, 'Israel', 'Jerusalem', 'IL', 'Asia', 31.7667, 35.2333),
(161, 'Italy', 'Rome', 'IT', 'Europe', 41.9, 12.4833),
(162, 'Jamaica', 'Kingston', 'JM', 'North America', 18, -76.8),
(163, 'Japan', 'Tokyo', 'JP', 'Asia', 35.6833, 139.75),
(164, 'Jersey', 'Saint Helier', 'JE', 'Europe', 49.1833, -2.1),
(165, 'Jordan', 'Amman', 'JO', 'Asia', 31.95, 35.9333),
(166, 'Kazakhstan', 'Astana', 'KZ', 'Asia', 51.1667, 71.4167),
(167, 'Kenya', 'Nairobi', 'KE', 'Africa', -1.28333, 36.8167),
(168, 'Kiribati', 'Tarawa', 'KI', 'Australia', -0.883333, 169.533),
(169, 'North Korea', 'Pyongyang', 'KP', 'Asia', 39.0167, 125.75),
(170, 'South Korea', 'Seoul', 'KR', 'Asia', 37.55, 126.983),
(171, 'Kosovo', 'Pristina', 'KO', 'Europe', 42.6667, 21.1667),
(172, 'Kuwait', 'Kuwait City', 'KW', 'Asia', 29.3667, 47.9667),
(173, 'Kyrgyzstan', 'Bishkek', 'KG', 'Asia', 42.8667, 74.6),
(174, 'Laos', 'Vientiane', 'LA', 'Asia', 17.9667, 102.6),
(175, 'Latvia', 'Riga', 'LV', 'Europe', 56.95, 24.1),
(176, 'Lebanon', 'Beirut', 'LB', 'Asia', 33.8667, 35.5),
(177, 'Lesotho', 'Maseru', 'LS', 'Africa', -29.3167, 27.4833),
(178, 'Liberia', 'Monrovia', 'LR', 'Africa', 6.3, -10.8),
(179, 'Libya', 'Tripoli', 'LY', 'Africa', 32.8833, 13.1667),
(180, 'Liechtenstein', 'Vaduz', 'LI', 'Europe', 47.1333, 9.51667),
(181, 'Lithuania', 'Vilnius', 'LT', 'Europe', 54.6833, 25.3167),
(182, 'Luxembourg', 'Luxembourg', 'LU', 'Europe', 49.6, 6.11667),
(183, 'Macedonia', 'Skopje', 'MK', 'Europe', 42, 21.4333),
(184, 'Madagascar', 'Antananarivo', 'MG', 'Africa', -18.9167, 47.5167),
(185, 'Malawi', 'Lilongwe', 'MW', 'Africa', -13.9667, 33.7833),
(186, 'Malaysia', 'Kuala Lumpur', 'MY', 'Asia', 3.16667, 101.7),
(187, 'Maldives', 'Male', 'MV', 'Asia', 4.16667, 73.5),
(188, 'Mali', 'Bamako', 'ML', 'Africa', 12.65, -8),
(189, 'Malta', 'Valletta', 'MT', 'Europe', 35.8833, 14.5),
(190, 'Marshall Islands', 'Majuro', 'MH', 'Australia', 7.1, 171.383),
(191, 'Mauritania', 'Nouakchott', 'MR', 'Africa', 18.0667, -15.9667),
(192, 'Mauritius', 'Port Louis', 'MU', 'Africa', -20.15, 57.4833),
(193, 'Mexico', 'Mexico City', 'MX', 'Central America', 19.4333, -99.1333),
(194, 'Federated States of Micronesia', 'Palikir', 'FM', 'Australia', 6.91667, 158.15),
(195, 'Moldova', 'Chisinau', 'MD', 'Europe', 47, 28.85),
(196, 'Monaco', 'Monaco', 'MC', 'Europe', 43.7333, 7.41667),
(197, 'Mongolia', 'Ulaanbaatar', 'MN', 'Asia', 47.9167, 106.917),
(198, 'Montenegro', 'Podgorica', 'ME', 'Europe', 42.4333, 19.2667),
(199, 'Montserrat', 'Plymouth', 'MS', 'North America', 16.7, -62.2167),
(200, 'Morocco', 'Rabat', 'MA', 'Africa', 34.0167, -6.81667),
(201, 'Mozambique', 'Maputo', 'MZ', 'Africa', -25.95, 32.5833),
(202, 'Namibia', 'Windhoek', 'NA', 'Africa', -22.5667, 17.0833),
(203, 'Nepal', 'Kathmandu', 'NP', 'Asia', 27.7167, 85.3167),
(204, 'Netherlands', 'Amsterdam', 'NL', 'Europe', 52.35, 4.91667),
(205, 'New Caledonia', 'Noumea', 'NC', 'Australia', -22.2667, 166.45),
(206, 'New Zealand', 'Wellington', 'NZ', 'Australia', -41.3, 174.783),
(207, 'Nicaragua', 'Managua', 'NI', 'Central America', 12.1333, -86.25),
(208, 'Niger', 'Niamey', 'NE', 'Africa', 13.5167, 2.11667),
(209, 'Nigeria', 'Abuja', 'NG', 'Africa', 9.08333, 7.53333),
(210, 'Niue', 'Alofi', 'NU', 'Australia', -19.0167, -169.917),
(211, 'Norfolk Island', 'Kingston', 'NF', 'Australia', -29.05, 167.967),
(212, 'Northern Mariana Islands', 'Saipan', 'MP', 'Australia', 15.2, 145.75),
(213, 'Norway', 'Oslo', 'NO', 'Europe', 59.9167, 10.75),
(214, 'Oman', 'Muscat', 'OM', 'Asia', 23.6167, 58.5833),
(215, 'Pakistan', 'Islamabad', 'PK', 'Asia', 33.6833, 73.05),
(216, 'Palau', 'Melekeok', 'PW', 'Australia', 7.48333, 134.633),
(217, 'Panama', 'Panama City', 'PA', 'Central America', 8.96667, -79.5333),
(218, 'Papua New Guinea', 'Port Moresby', 'PG', 'Australia', -9.45, 147.183),
(219, 'Paraguay', 'Asuncion', 'PY', 'South America', -25.2667, -57.6667),
(220, 'Peru', 'Lima', 'PE', 'South America', -12.05, -77.05),
(221, 'Philippines', 'Manila', 'PH', 'Asia', 14.6, 120.967),
(222, 'Pitcairn Islands', 'Adamstown', 'PN', 'Australia', -25.0667, -130.083),
(223, 'Poland', 'Warsaw', 'PL', 'Europe', 52.25, 21),
(224, 'Portugal', 'Lisbon', 'PT', 'Europe', 38.7167, -9.13333),
(225, 'Puerto Rico', 'San Juan', 'PR', 'North America', 18.4667, -66.1167),
(226, 'Qatar', 'Doha', 'QA', 'Asia', 25.2833, 51.5333),
(227, 'Romania', 'Bucharest', 'RO', 'Europe', 44.4333, 26.1),
(228, 'Russia', 'Moscow', 'RU', 'Europe', 55.75, 37.6),
(229, 'Rwanda', 'Kigali', 'RW', 'Africa', -1.95, 30.05),
(230, 'Saint Barthelemy', 'Gustavia', 'BL', 'North America', 17.8833, -62.85),
(231, 'Saint Helena', 'Jamestown', 'SH', 'Africa', -15.9333, -5.71667),
(232, 'Saint Kitts and Nevis', 'Basseterre', 'KN', 'North America', 17.3, -62.7167),
(233, 'Saint Lucia', 'Castries', 'LC', 'North America', 14, -61),
(234, 'Saint Pierre and Miquelon', 'Saint-Pierre', 'PM', 'Central America', 46.7667, -56.1833),
(235, 'Saint Vincent and the Grenadines', 'Kingstown', 'VC', 'Central America', 13.1333, -61.2167),
(236, 'Samoa', 'Apia', 'WS', 'Australia', -13.8167, -171.767),
(237, 'San Marino', 'San Marino', 'SM', 'Europe', 43.9333, 12.4167),
(238, 'Sao Tome and Principe', 'Sao Tome', 'ST', 'Africa', 0.333333, 6.73333),
(239, 'Saudi Arabia', 'Riyadh', 'SA', 'Asia', 24.65, 46.7),
(240, 'Senegal', 'Dakar', 'SN', 'Africa', 14.7333, -17.6333),
(241, 'Serbia', 'Belgrade', 'RS', 'Europe', 44.8333, 20.5),
(242, 'Seychelles', 'Victoria', 'SC', 'Africa', -4.61667, 55.45),
(243, 'Sierra Leone', 'Freetown', 'SL', 'Africa', 8.48333, -13.2333),
(244, 'Singapore', 'Singapore', 'SG', 'Asia', 1.28333, 103.85),
(245, 'Sint Maarten', 'Philipsburg', 'SX', 'North America', 18.0167, -63.0333),
(246, 'Slovakia', 'Bratislava', 'SK', 'Europe', 48.15, 17.1167),
(247, 'Slovenia', 'Ljubljana', 'SI', 'Europe', 46.05, 14.5167),
(248, 'Solomon Islands', 'Honiara', 'SB', 'Australia', -9.43333, 159.95),
(249, 'Somalia', 'Mogadishu', 'SO', 'Africa', 2.06667, 45.3333),
(250, 'South Africa', 'Pretoria', 'ZA', 'Africa', -25.7, 28.2167),
(251, 'South Sudan', 'Juba', 'SS', 'Africa', 4.85, 31.6167),
(252, 'Spain', 'Madrid', 'ES', 'Europe', 40.4, -3.68333),
(253, 'Sri Lanka', 'Colombo', 'LK', 'Asia', 6.91667, 79.8333),
(254, 'Sudan', 'Khartoum', 'SD', 'Africa', 15.6, 32.5333),
(255, 'Suriname', 'Paramaribo', 'SR', 'South America', 5.83333, -55.1667),
(256, 'Svalbard', 'Longyearbyen', 'SJ', 'Europe', 78.2167, 15.6333),
(257, 'Swaziland', 'Mbabane', 'SZ', 'Africa', -26.3167, 31.1333),
(258, 'Sweden', 'Stockholm', 'SE', 'Europe', 59.3333, 18.05),
(259, 'Switzerland', 'Bern', 'CH', 'Europe', 46.9167, 7.46667),
(260, 'Syria', 'Damascus', 'SY', 'Asia', 33.5, 36.3),
(261, 'Taiwan', 'Taipei', 'TW', 'Asia', 25.0333, 121.517),
(262, 'Tajikistan', 'Dushanbe', 'TJ', 'Asia', 38.55, 68.7667),
(263, 'Tanzania', 'Dar es Salaam', 'TZ', 'Africa', -6.8, 39.2833),
(264, 'Thailand', 'Bangkok', 'TH', 'Asia', 13.75, 100.517),
(265, 'Timor-Leste', 'Dili', 'TL', 'Asia', -8.58333, 125.6),
(266, 'Togo', 'Lome', 'TG', 'Africa', 6.11667, 1.21667),
(267, 'Tonga', 'Nuku\'alofa', 'TO', 'Australia', -21.1333, -175.2),
(268, 'Trinidad and Tobago', 'Port of Spain', 'TT', 'North America', 10.65, -61.5167),
(269, 'Tunisia', 'Tunis', 'TN', 'Africa', 36.8, 10.1833),
(270, 'Turkey', 'Ankara', 'TR', 'Europe', 39.9333, 32.8667),
(271, 'Turkmenistan', 'Ashgabat', 'TM', 'Asia', 37.95, 58.3833),
(272, 'Turks and Caicos Islands', 'Grand Turk', 'TC', 'North America', 21.4667, -71.1333),
(273, 'Tuvalu', 'Funafuti', 'TV', 'Australia', -8.51667, 179.217),
(274, 'Uganda', 'Kampala', 'UG', 'Africa', 0.316667, 32.55),
(275, 'Ukraine', 'Kyiv', 'UA', 'Europe', 50.4333, 30.5167),
(276, 'United Arab Emirates', 'Abu Dhabi', 'AE', 'Asia', 24.4667, 54.3667),
(277, 'United Kingdom', 'London', 'GB', 'Europe', 51.5, -0.083333),
(278, 'United States', 'Washington D.C.', 'US', 'Central America', 38.8833, -77),
(279, 'Uruguay', 'Montevideo', 'UY', 'South America', -34.85, -56.1667),
(280, 'Uzbekistan', 'Tashkent', 'UZ', 'Asia', 41.3167, 69.25),
(281, 'Vanuatu', 'Port-Vila', 'VU', 'Australia', -17.7333, 168.317),
(282, 'Venezuela', 'Caracas', 'VE', 'South America', 10.4833, -66.8667),
(283, 'Vietnam', 'Hanoi', 'VN', 'Asia', 21.0333, 105.85),
(284, 'US Virgin Islands', 'Charlotte Amalie', 'VI', 'North America', 18.35, -64.9333),
(285, 'Wallis and Futuna', 'Mata-Utu', 'WF', 'Australia', -13.95, -171.933),
(286, 'Yemen', 'Sanaa', 'YE', 'Asia', 15.35, 44.2),
(287, 'Zambia', 'Lusaka', 'ZM', 'Africa', -15.4167, 28.2833),
(288, 'Zimbabwe', 'Harare', 'ZW', 'Africa', -17.8167, 31.0333),
(289, 'US Minor Outlying Islands', 'Washington D.C.', 'UM', 'Australia', 38.8833, -77),
(290, 'Antarctica', 'N/A', 'AQ', 'Antarctica', 0, 0),
(291, 'Northern Cyprus', 'North Nicosia', 'NULL', 'Europe', 35.1833, 33.3667),
(292, 'Hong Kong', 'N/A', 'HK', 'Asia', 0, 0),
(293, 'Heard Island and McDonald Islands', 'N/A', 'HM', 'Antarctica', 0, 0),
(294, 'British Indian Ocean Territory', 'Diego Garcia', 'IO', 'Africa', -7.3, 72.4),
(295, 'Macau', 'N/A', 'MO', 'Asia', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `t_game`
--

CREATE TABLE `t_game` (
  `c_id` bigint(20) NOT NULL,
  `c_date` datetime NOT NULL,
  `c_userId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_turn`
--

CREATE TABLE `t_turn` (
  `c_id` bigint(20) NOT NULL,
  `c_help` bit(1) NOT NULL,
  `c_score` int(11) NOT NULL,
  `c_capitalId` bigint(20) NOT NULL,
  `c_gameId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_user`
--

CREATE TABLE `t_user` (
  `c_id` bigint(20) NOT NULL,
  `c_login` varchar(255) NOT NULL,
  `c_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `t_capital`
--
ALTER TABLE `t_capital`
  ADD PRIMARY KEY (`c_id`);

--
-- Index pour la table `t_game`
--
ALTER TABLE `t_game`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `FKf3fnt2qs7lyhhh2fl891cyn6n` (`c_userId`);

--
-- Index pour la table `t_turn`
--
ALTER TABLE `t_turn`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `FK7p4pdrqx75ktpv1ptr3r28q8c` (`c_capitalId`),
  ADD KEY `FKrgg5kdis2o6cml2a5jqh4pxan` (`c_gameId`);

--
-- Index pour la table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `UK_j8kfc4gk40roqj45bf7grd68v` (`c_login`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `t_capital`
--
ALTER TABLE `t_capital`
  MODIFY `c_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

--
-- AUTO_INCREMENT pour la table `t_game`
--
ALTER TABLE `t_game`
  MODIFY `c_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `t_turn`
--
ALTER TABLE `t_turn`
  MODIFY `c_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `c_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `t_game`
--
ALTER TABLE `t_game`
  ADD CONSTRAINT `FKf3fnt2qs7lyhhh2fl891cyn6n` FOREIGN KEY (`c_userId`) REFERENCES `t_user` (`c_id`);

--
-- Contraintes pour la table `t_turn`
--
ALTER TABLE `t_turn`
  ADD CONSTRAINT `FK7p4pdrqx75ktpv1ptr3r28q8c` FOREIGN KEY (`c_capitalId`) REFERENCES `t_capital` (`c_id`),
  ADD CONSTRAINT `FKrgg5kdis2o6cml2a5jqh4pxan` FOREIGN KEY (`c_gameId`) REFERENCES `t_game` (`c_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
