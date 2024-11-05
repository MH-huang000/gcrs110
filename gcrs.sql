-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-10-28 07:31:18
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `gcrs`
--

-- --------------------------------------------------------

--
-- 資料表結構 `account`
--

CREATE TABLE `account` (
  `account` varchar(9) NOT NULL,
  `pwd` varchar(60) NOT NULL,
  `identity` varchar(20) NOT NULL,
  `staff_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `account`
--

INSERT INTO `account` (`account`, `pwd`, `identity`, `staff_id`) VALUES
('ACS110605', '$2a$12$dyMo7Mnbndwcu3uOgvoONugqkGFMEedqGDw2rETAQKxMYOEHfGOZS', 'student', NULL),
('ACS110648', '$2a$12$KBeoH4iuEHmeYp9cmm4thOkS3DG8hvxDvcS.jIiJG8z5sIdalrl2m', 'student', NULL),
('worker1', '$2a$12$MBgD6xQdc6GADWyrgNi51.FqdoCa7t0dPK/HgWErcfjj86geHzvJm', 'staff', 2);

-- --------------------------------------------------------

--
-- 資料表結構 `administrator`
--

CREATE TABLE `administrator` (
  `staff_id` int(11) NOT NULL,
  `staff_name` varchar(60) NOT NULL,
  `unit_id` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `administrator`
--

INSERT INTO `administrator` (`staff_id`, `staff_name`, `unit_id`) VALUES
(1, '教務處人員', 'A'),
(2, '資工系人員', 'ACS'),
(3, '數位系人員', 'ADT'),
(4, '師培處人員', 'AED'),
(5, '通識中心人員', 'AGE'),
(6, '數教系人員', 'AMA'),
(7, '科教系人員', 'ASC');

-- --------------------------------------------------------

--
-- 資料表結構 `class_module`
--

CREATE TABLE `class_module` (
  `class_module_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `class_module_name` varchar(60) NOT NULL,
  `threshold` int(11) NOT NULL,
  `founding_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `class_module`
--

INSERT INTO `class_module` (`class_module_id`, `type`, `class_module_name`, `threshold`, `founding_year`) VALUES
(1, 1, '校共同必修課程', 1, 110),
(2, 1, '校共同選修課程', 0, 110),
(3, 2, '語文通識課程', 2, 110),
(4, 2, '通識選修課程', 6, 110),
(5, 1, '資工系院共同課程', 1, 110),
(6, 3, '資工系系基礎課程', 1, 110),
(7, 3, '資工系系核心課程', 1, 110),
(8, 3, '資工系專業課程', 4, 110),
(9, 4, '資工系自由選修課程', 1, 110),
(10, 3, '資工系輔系課程', 1, 110),
(11, 1, '數位系院共同課程', 1, 110),
(12, 3, '數位系系基礎課程', 1, 110),
(13, 3, '數位系系核心課程', 1, 110),
(14, 3, '數位系專業課程', 2, 110),
(15, 4, '數位系自由選修課程', 1, 110),
(16, 6, '教育專業課程', 3, 110),
(17, 6, '專門課程', 1, 110),
(18, 6, '普通課程', 2, 110),
(19, 1, '科教系院共同課程', 1, 110),
(20, 3, '科教系系基礎課程', 1, 110),
(21, 3, '科教系專業模組課程', 2, 110),
(22, 3, '科教系選修課程', 1, 110),
(23, 4, '科教系自由選修課程', 1, 110),
(24, 6, '科教系選修課程', 1, 110),
(25, 1, '數教系院共同課程', 1, 110),
(26, 3, '數教系系基礎課程', 1, 110),
(27, 3, '數教系系核心課程', 1, 110),
(28, 3, '數教系專業模組課程', 2, 110),
(29, 4, '數教系自由選修課 ', 1, 110),
(30, 6, '數教系專業模組課程', 1, 110),
(31, 3, '科教系輔系課程', 2, 110);

-- --------------------------------------------------------

--
-- 資料表結構 `coursemodule_subject`
--

CREATE TABLE `coursemodule_subject` (
  `id` int(11) NOT NULL,
  `course_package_id` int(11) NOT NULL,
  `course_module_id` varchar(1) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `coursemodule_subject`
--

INSERT INTO `coursemodule_subject` (`id`, `course_package_id`, `course_module_id`, `subject_id`) VALUES
(1, 1, 'A', 102),
(2, 1, 'A', 103),
(3, 1, 'A', 104),
(4, 1, 'A', 105),
(5, 2, 'A', 100),
(6, 2, 'A', 101),
(7, 3, 'A', 96),
(8, 3, 'A', 97),
(9, 3, 'A', 98),
(10, 3, 'A', 99),
(11, 4, 'A', 146),
(12, 4, 'A', 147),
(13, 4, 'A', 148),
(14, 4, 'A', 149),
(15, 5, 'A', 146),
(16, 5, 'A', 147),
(17, 5, 'A', 149),
(18, 5, 'A', 148),
(19, 5, 'A', 150),
(20, 5, 'A', 151),
(21, 5, 'A', 152),
(22, 5, 'A', 153),
(23, 5, 'A', 154),
(24, 5, 'A', 155),
(25, 5, 'A', 156),
(26, 5, 'A', 157),
(27, 5, 'A', 158),
(28, 5, 'A', 159),
(29, 5, 'A', 161),
(30, 5, 'A', 162),
(31, 5, 'A', 163),
(32, 5, 'A', 164),
(33, 5, 'A', 167),
(34, 5, 'A', 168),
(35, 5, 'A', 169),
(36, 5, 'A', 170),
(37, 5, 'A', 171),
(38, 5, 'A', 172),
(39, 5, 'A', 173),
(40, 5, 'A', 174),
(41, 5, 'A', 175),
(42, 5, 'A', 176),
(43, 5, 'A', 177),
(44, 5, 'A', 178),
(45, 5, 'A', 179),
(46, 5, 'A', 165),
(47, 5, 'A', 166),
(48, 5, 'A', 160),
(49, 6, 'A', 180),
(50, 6, 'A', 181),
(51, 6, 'A', 182),
(52, 7, 'A', 189),
(53, 7, 'A', 190),
(54, 7, 'A', 192),
(55, 7, 'A', 193),
(56, 7, 'A', 194),
(57, 7, 'A', 195),
(58, 7, 'A', 196),
(59, 7, 'A', 198),
(60, 7, 'A', 199),
(61, 7, 'A', 200),
(62, 7, 'A', 197),
(63, 7, 'A', 188),
(64, 7, 'A', 187),
(65, 7, 'A', 186),
(66, 7, 'A', 185),
(67, 7, 'A', 184),
(68, 7, 'A', 183),
(69, 7, 'A', 180),
(70, 7, 'A', 181),
(71, 7, 'A', 182),
(72, 7, 'A', 191),
(73, 8, 'A', 106),
(74, 8, 'A', 107),
(75, 8, 'A', 108),
(76, 8, 'A', 109),
(77, 9, 'A', 118),
(78, 9, 'A', 117),
(79, 9, 'A', 114),
(80, 9, 'A', 113),
(81, 9, 'A', 112),
(82, 9, 'A', 111),
(83, 9, 'A', 110),
(84, 9, 'A', 109),
(85, 9, 'A', 108),
(86, 9, 'A', 107),
(87, 9, 'A', 116),
(88, 9, 'A', 115),
(89, 9, 'A', 120),
(90, 9, 'A', 106),
(91, 9, 'A', 130),
(92, 9, 'A', 135),
(93, 9, 'A', 124),
(94, 9, 'A', 121),
(95, 9, 'A', 131),
(96, 9, 'A', 119),
(97, 9, 'A', 133),
(98, 9, 'A', 144),
(99, 9, 'A', 139),
(100, 9, 'A', 138),
(101, 9, 'A', 127),
(102, 9, 'A', 129),
(103, 9, 'A', 134),
(104, 9, 'A', 137),
(105, 9, 'A', 145),
(106, 9, 'A', 128),
(107, 9, 'A', 143),
(108, 9, 'A', 142),
(109, 9, 'A', 141),
(110, 9, 'A', 140),
(111, 9, 'A', 136),
(112, 9, 'A', 122),
(113, 9, 'A', 123),
(114, 9, 'A', 125),
(115, 9, 'A', 126),
(116, 9, 'A', 132),
(117, 10, 'A', 403),
(118, 10, 'A', 406),
(119, 10, 'A', 407),
(120, 10, 'A', 409),
(121, 10, 'A', 411),
(122, 10, 'A', 412),
(123, 11, 'A', 1),
(124, 11, 'A', 2),
(125, 11, 'A', 4),
(126, 11, 'A', 5),
(127, 11, 'A', 6),
(128, 11, 'A', 15),
(129, 12, 'A', 3),
(130, 12, 'A', 7),
(131, 12, 'A', 8),
(132, 12, 'A', 9),
(133, 12, 'A', 10),
(134, 12, 'A', 11),
(135, 12, 'A', 12),
(136, 12, 'A', 13),
(137, 12, 'A', 14),
(138, 12, 'A', 16),
(139, 13, 'A', 17),
(140, 13, 'A', 19),
(141, 13, 'A', 23),
(142, 13, 'A', 32),
(143, 13, 'A', 38),
(144, 13, 'A', 43),
(145, 13, 'A', 46),
(146, 14, 'A', 45),
(147, 14, 'A', 20),
(148, 14, 'A', 39),
(149, 14, 'A', 33),
(150, 14, 'A', 29),
(151, 14, 'A', 21),
(152, 14, 'A', 26),
(153, 14, 'A', 44),
(154, 14, 'A', 27),
(155, 15, 'A', 31),
(156, 15, 'A', 41),
(157, 15, 'A', 35),
(158, 15, 'A', 18),
(159, 15, 'A', 49),
(160, 15, 'A', 50),
(161, 15, 'A', 24),
(162, 15, 'A', 42),
(163, 16, 'A', 36),
(164, 16, 'A', 40),
(165, 16, 'A', 48),
(166, 16, 'A', 22),
(167, 16, 'A', 37),
(168, 16, 'A', 414),
(169, 16, 'A', 25),
(170, 16, 'A', 34),
(171, 16, 'A', 28),
(172, 16, 'A', 47),
(173, 16, 'A', 30),
(174, 16, 'A', 51),
(175, 16, 'A', 415),
(176, 17, 'A', 410),
(177, 17, 'A', 246),
(178, 17, 'A', 260),
(179, 17, 'A', 261),
(180, 17, 'A', 399),
(181, 17, 'A', 247),
(182, 17, 'A', 252),
(183, 17, 'A', 256),
(184, 17, 'A', 248),
(185, 18, 'A', 1),
(186, 18, 'A', 2),
(187, 18, 'A', 4),
(188, 18, 'A', 5),
(189, 18, 'A', 6),
(190, 18, 'A', 15),
(191, 18, 'A', 3),
(192, 18, 'A', 7),
(193, 18, 'A', 8),
(194, 18, 'A', 9),
(195, 18, 'A', 10),
(196, 18, 'A', 11),
(197, 18, 'A', 12),
(198, 18, 'A', 13),
(199, 18, 'A', 14),
(200, 18, 'A', 16),
(201, 19, 'A', 402),
(202, 19, 'A', 406),
(203, 19, 'A', 407),
(204, 19, 'A', 410),
(205, 19, 'A', 414),
(206, 19, 'A', 411),
(207, 20, 'A', 59),
(208, 20, 'A', 52),
(209, 20, 'A', 60),
(210, 20, 'A', 57),
(211, 20, 'A', 53),
(212, 20, 'A', 61),
(213, 20, 'A', 54),
(214, 20, 'A', 55),
(215, 20, 'A', 62),
(216, 20, 'A', 58),
(217, 20, 'A', 63),
(218, 21, 'A', 56),
(219, 21, 'A', 64),
(220, 21, 'A', 65),
(221, 21, 'A', 66),
(222, 22, 'A', 79),
(223, 22, 'A', 72),
(224, 22, 'A', 81),
(225, 22, 'A', 74),
(226, 22, 'A', 84),
(227, 22, 'A', 73),
(228, 22, 'A', 86),
(229, 22, 'A', 87),
(230, 22, 'A', 95),
(231, 23, 'A', 75),
(232, 23, 'A', 68),
(233, 23, 'A', 69),
(234, 23, 'A', 70),
(235, 23, 'A', 76),
(236, 23, 'A', 67),
(237, 23, 'A', 92),
(238, 23, 'A', 88),
(239, 23, 'A', 89),
(240, 24, 'A', 77),
(241, 24, 'A', 78),
(242, 24, 'A', 80),
(243, 24, 'A', 90),
(244, 24, 'A', 82),
(245, 24, 'A', 83),
(246, 24, 'A', 91),
(247, 24, 'A', 85),
(248, 24, 'A', 71),
(249, 25, 'A', 93),
(250, 25, 'A', 94),
(251, 32, 'A', 400),
(252, 32, 'A', 401),
(253, 32, 'A', 405),
(254, 32, 'A', 409),
(255, 32, 'A', 408),
(256, 32, 'A', 414),
(257, 32, 'A', 411),
(258, 33, 'A', 315),
(259, 33, 'A', 302),
(260, 33, 'A', 303),
(261, 33, 'A', 304),
(262, 33, 'A', 305),
(263, 33, 'A', 306),
(264, 33, 'A', 307),
(265, 33, 'A', 308),
(266, 33, 'A', 309),
(267, 33, 'A', 310),
(268, 33, 'A', 311),
(269, 33, 'A', 301),
(270, 33, 'A', 312),
(271, 33, 'A', 313),
(272, 33, 'A', 314),
(273, 34, 'A', 367),
(274, 34, 'A', 389),
(275, 34, 'A', 358),
(276, 34, 'A', 360),
(277, 34, 'A', 364),
(278, 34, 'A', 365),
(279, 34, 'A', 384),
(280, 34, 'A', 385),
(281, 34, 'A', 386),
(282, 34, 'A', 387),
(283, 34, 'A', 390),
(284, 34, 'A', 391),
(285, 35, 'A', 366),
(286, 35, 'A', 368),
(287, 35, 'A', 369),
(288, 35, 'A', 361),
(289, 35, 'A', 359),
(290, 35, 'A', 370),
(291, 35, 'A', 371),
(292, 35, 'A', 392),
(293, 35, 'A', 393),
(294, 35, 'A', 394),
(295, 35, 'A', 395),
(296, 35, 'A', 328),
(297, 35, 'A', 329),
(298, 35, 'A', 372),
(299, 35, 'A', 373),
(300, 35, 'A', 374),
(301, 35, 'A', 375),
(302, 35, 'A', 376),
(303, 35, 'A', 362),
(304, 35, 'A', 377),
(305, 35, 'A', 378),
(306, 35, 'A', 379),
(307, 35, 'A', 380),
(308, 35, 'A', 381),
(309, 35, 'A', 363),
(310, 35, 'A', 382),
(311, 35, 'A', 383),
(312, 35, 'A', 388),
(313, 35, 'A', 397),
(314, 34, 'B', 319),
(315, 34, 'B', 320),
(316, 34, 'B', 321),
(317, 34, 'B', 322),
(318, 34, 'B', 323),
(319, 34, 'B', 324),
(320, 34, 'B', 325),
(321, 34, 'B', 326),
(322, 34, 'B', 316),
(323, 34, 'B', 317),
(324, 34, 'B', 384),
(325, 34, 'B', 385),
(326, 34, 'B', 386),
(327, 34, 'B', 387),
(328, 35, 'B', 354),
(329, 35, 'B', 355),
(330, 35, 'B', 350),
(331, 35, 'B', 351),
(332, 35, 'B', 352),
(333, 35, 'B', 353),
(334, 35, 'B', 356),
(335, 35, 'B', 347),
(336, 35, 'B', 348),
(337, 35, 'B', 349),
(338, 35, 'B', 357),
(339, 35, 'B', 338),
(340, 35, 'B', 339),
(341, 35, 'B', 342),
(342, 35, 'B', 343),
(343, 35, 'B', 340),
(344, 35, 'B', 335),
(345, 35, 'B', 341),
(346, 35, 'B', 318),
(347, 35, 'B', 337),
(348, 35, 'B', 336),
(349, 35, 'B', 396),
(350, 35, 'B', 333),
(351, 35, 'B', 334),
(352, 35, 'B', 332),
(353, 35, 'B', 331),
(354, 35, 'B', 327),
(355, 35, 'B', 344),
(356, 35, 'B', 345),
(357, 35, 'B', 346),
(358, 35, 'B', 330),
(359, 36, 'A', 367),
(360, 36, 'A', 389),
(361, 36, 'A', 358),
(362, 36, 'A', 360),
(363, 36, 'A', 364),
(364, 36, 'A', 365),
(365, 36, 'A', 384),
(366, 36, 'A', 385),
(367, 36, 'A', 386),
(368, 36, 'A', 387),
(369, 36, 'A', 390),
(370, 36, 'A', 391),
(371, 36, 'A', 366),
(372, 36, 'A', 368),
(373, 36, 'A', 369),
(374, 36, 'A', 361),
(375, 36, 'A', 359),
(376, 36, 'A', 370),
(377, 36, 'A', 371),
(378, 36, 'A', 392),
(379, 36, 'A', 393),
(380, 36, 'A', 394),
(381, 36, 'A', 395),
(382, 36, 'A', 328),
(383, 36, 'A', 329),
(384, 36, 'A', 372),
(385, 36, 'A', 373),
(386, 36, 'A', 374),
(387, 36, 'A', 375),
(388, 36, 'A', 376),
(389, 36, 'A', 362),
(390, 36, 'A', 377),
(391, 36, 'A', 378),
(392, 36, 'A', 379),
(393, 36, 'A', 380),
(394, 36, 'A', 381),
(395, 36, 'A', 363),
(396, 36, 'A', 382),
(397, 36, 'A', 383),
(398, 36, 'A', 388),
(399, 36, 'A', 397),
(400, 36, 'A', 319),
(401, 36, 'A', 320),
(402, 36, 'A', 321),
(403, 36, 'A', 322),
(404, 36, 'A', 323),
(405, 36, 'A', 324),
(406, 36, 'A', 325),
(407, 36, 'A', 326),
(408, 36, 'A', 316),
(409, 36, 'A', 317),
(410, 36, 'A', 384),
(411, 36, 'A', 385),
(412, 36, 'A', 386),
(413, 36, 'A', 387),
(414, 36, 'A', 354),
(415, 36, 'A', 355),
(416, 36, 'A', 350),
(417, 36, 'A', 351),
(418, 36, 'A', 352),
(419, 36, 'A', 353),
(420, 36, 'A', 356),
(421, 36, 'A', 347),
(422, 36, 'A', 348),
(423, 36, 'A', 349),
(424, 36, 'A', 357),
(425, 36, 'A', 338),
(426, 36, 'A', 339),
(427, 36, 'A', 342),
(428, 36, 'A', 343),
(429, 36, 'A', 340),
(430, 36, 'A', 335),
(431, 36, 'A', 341),
(432, 36, 'A', 318),
(433, 36, 'A', 337),
(434, 36, 'A', 336),
(435, 36, 'A', 396),
(436, 36, 'A', 333),
(437, 36, 'A', 334),
(438, 36, 'A', 332),
(439, 36, 'A', 331),
(440, 36, 'A', 327),
(441, 36, 'A', 344),
(442, 36, 'A', 345),
(443, 36, 'A', 346),
(444, 36, 'A', 330),
(445, 38, 'A', 367),
(446, 38, 'A', 389),
(447, 38, 'A', 358),
(448, 38, 'A', 360),
(449, 38, 'A', 364),
(450, 38, 'A', 365),
(451, 38, 'A', 384),
(452, 38, 'A', 385),
(453, 38, 'A', 386),
(454, 38, 'A', 387),
(455, 38, 'A', 390),
(456, 38, 'A', 391),
(457, 38, 'A', 366),
(458, 38, 'A', 368),
(459, 38, 'A', 369),
(460, 38, 'A', 361),
(461, 38, 'A', 359),
(462, 38, 'A', 370),
(463, 38, 'A', 371),
(464, 38, 'A', 392),
(465, 38, 'A', 393),
(466, 38, 'A', 394),
(467, 38, 'A', 395),
(468, 38, 'A', 328),
(469, 38, 'A', 329),
(470, 38, 'A', 372),
(471, 38, 'A', 373),
(472, 38, 'A', 374),
(473, 38, 'A', 375),
(474, 38, 'A', 376),
(475, 38, 'A', 362),
(476, 38, 'A', 377),
(477, 38, 'A', 378),
(478, 38, 'A', 379),
(479, 38, 'A', 380),
(480, 38, 'A', 381),
(481, 38, 'A', 363),
(482, 38, 'A', 382),
(483, 38, 'A', 383),
(484, 38, 'A', 388),
(485, 38, 'A', 397),
(486, 38, 'A', 319),
(487, 38, 'A', 320),
(488, 38, 'A', 321),
(489, 38, 'A', 322),
(490, 38, 'A', 323),
(491, 38, 'A', 324),
(492, 38, 'A', 325),
(493, 38, 'A', 326),
(494, 38, 'A', 316),
(495, 38, 'A', 317),
(496, 38, 'A', 384),
(497, 38, 'A', 385),
(498, 38, 'A', 386),
(499, 38, 'A', 387),
(500, 38, 'A', 354),
(501, 38, 'A', 355),
(502, 38, 'A', 350),
(503, 38, 'A', 351),
(504, 38, 'A', 352),
(505, 38, 'A', 353),
(506, 38, 'A', 356),
(507, 38, 'A', 347),
(508, 38, 'A', 348),
(509, 38, 'A', 349),
(510, 38, 'A', 357),
(511, 38, 'A', 338),
(512, 38, 'A', 339),
(513, 38, 'A', 342),
(514, 38, 'A', 343),
(515, 38, 'A', 340),
(516, 38, 'A', 335),
(517, 38, 'A', 341),
(518, 38, 'A', 318),
(519, 38, 'A', 337),
(520, 38, 'A', 336),
(521, 38, 'A', 396),
(522, 38, 'A', 333),
(523, 38, 'A', 334),
(524, 38, 'A', 332),
(525, 38, 'A', 331),
(526, 38, 'A', 327),
(527, 38, 'A', 344),
(528, 38, 'A', 345),
(529, 38, 'A', 346),
(530, 38, 'A', 330),
(531, 39, 'A', 413),
(532, 39, 'A', 398),
(533, 39, 'A', 399),
(534, 39, 'A', 404),
(535, 39, 'A', 409),
(536, 39, 'A', 414),
(537, 39, 'A', 411),
(538, 40, 'A', 245),
(539, 40, 'A', 264),
(540, 40, 'A', 288),
(541, 40, 'A', 249),
(542, 40, 'A', 240),
(543, 40, 'A', 242),
(544, 40, 'A', 250),
(545, 41, 'A', 270),
(546, 41, 'A', 241),
(547, 41, 'A', 246),
(548, 41, 'A', 247),
(549, 41, 'A', 269),
(550, 41, 'A', 251),
(551, 42, 'A', 291),
(552, 42, 'A', 292),
(553, 42, 'A', 293),
(554, 42, 'A', 290),
(555, 42, 'A', 294),
(556, 42, 'A', 295),
(557, 42, 'A', 296),
(558, 42, 'A', 297),
(559, 42, 'B', 255),
(560, 42, 'B', 260),
(561, 42, 'B', 261),
(562, 42, 'B', 256),
(563, 42, 'B', 248),
(564, 42, 'B', 243),
(565, 42, 'B', 254),
(566, 42, 'B', 257),
(567, 42, 'C', 262),
(568, 42, 'C', 275),
(569, 42, 'C', 265),
(570, 42, 'C', 289),
(571, 42, 'C', 271),
(572, 42, 'C', 272),
(573, 42, 'C', 274),
(574, 42, 'C', 273),
(575, 42, 'D', 252),
(576, 42, 'D', 280),
(577, 42, 'D', 283),
(578, 42, 'D', 282),
(579, 42, 'D', 284),
(580, 42, 'D', 285),
(581, 42, 'D', 286),
(582, 42, 'D', 287),
(583, 43, 'A', 253),
(584, 43, 'A', 298),
(585, 43, 'A', 268),
(586, 43, 'A', 300),
(587, 43, 'A', 299),
(588, 43, 'A', 263),
(589, 43, 'A', 281),
(590, 43, 'A', 258),
(591, 43, 'A', 266),
(592, 43, 'A', 244),
(593, 43, 'A', 267),
(594, 43, 'A', 259),
(595, 43, 'A', 276),
(596, 43, 'A', 277),
(597, 43, 'A', 278),
(598, 43, 'A', 279),
(599, 45, 'A', 291),
(600, 45, 'A', 292),
(601, 45, 'A', 293),
(602, 45, 'A', 290),
(603, 45, 'A', 294),
(604, 45, 'A', 295),
(605, 45, 'A', 296),
(606, 45, 'A', 297),
(607, 45, 'B', 255),
(608, 45, 'B', 260),
(609, 45, 'B', 261),
(610, 45, 'B', 256),
(611, 45, 'B', 248),
(612, 45, 'B', 243),
(613, 45, 'B', 254),
(614, 45, 'B', 257),
(615, 45, 'C', 262),
(616, 45, 'C', 275),
(617, 45, 'C', 265),
(618, 45, 'C', 289),
(619, 45, 'C', 271),
(620, 45, 'C', 272),
(621, 45, 'C', 274),
(622, 45, 'C', 273),
(623, 45, 'D', 252),
(624, 45, 'D', 280),
(625, 45, 'D', 283),
(626, 45, 'D', 282),
(627, 45, 'D', 284),
(628, 45, 'D', 285),
(629, 45, 'D', 286),
(630, 45, 'D', 287),
(631, 46, 'A', 400),
(632, 46, 'A', 401),
(633, 46, 'A', 315),
(634, 46, 'A', 405),
(635, 46, 'A', 303),
(636, 46, 'A', 304),
(637, 46, 'A', 306),
(638, 46, 'A', 307),
(639, 46, 'A', 309),
(640, 46, 'A', 310),
(641, 47, 'A', 301),
(642, 47, 'A', 312),
(643, 47, 'A', 313),
(644, 47, 'A', 314);

-- --------------------------------------------------------

--
-- 資料表結構 `course_data`
--

CREATE TABLE `course_data` (
  `course_data_id` int(11) NOT NULL,
  `student_id` varchar(9) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `grade` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `course_data`
--

INSERT INTO `course_data` (`course_data_id`, `student_id`, `subject_id`, `grade`, `status`, `semester`) VALUES
(3, 'ACS110605', 1, 90, 1, 110),
(4, 'ACS110605', 36, 90, 1, 110),
(5, 'ACS110605', 96, 90, 1, 110),
(6, 'ACS110605', 102, 90, 1, 110),
(7, 'ACS110605', 130, 90, 1, 110),
(8, 'ACS110605', 100, 90, 1, 110),
(9, 'ACS110605', 195, 90, 1, 110),
(10, 'ACS110605', 403, 90, 1, 110),
(11, 'ACS110605', 406, 90, 1, 110),
(12, 'ACS110605', 407, 90, 1, 110),
(13, 'ACS110605', 4, 90, 1, 110),
(14, 'ACS110605', 5, 90, 1, 110),
(15, 'ACS110605', 6, 90, 1, 110),
(16, 'ACS110605', 9, 90, 1, 110),
(17, 'ACS110605', 15, 90, 1, 110),
(18, 'ACS110605', 97, 90, 1, 110),
(19, 'ACS110605', 101, 90, 1, 110),
(20, 'ACS110605', 103, 90, 1, 110),
(21, 'ACS110605', 108, 90, 1, 110),
(22, 'ACS110605', 159, 90, 1, 110),
(23, 'ACS110648', 1, 74, 1, 110),
(24, 'ACS110648', 36, 72, 1, 110),
(25, 'ACS110648', 96, 96, 1, 110),
(26, 'ACS110648', 100, 86, 1, 110),
(27, 'ACS110648', 102, 79, 1, 110),
(28, 'ACS110648', 146, 71, 1, 110),
(29, 'ACS110648', 403, 63, 1, 110),
(30, 'ACS110648', 406, 78, 1, 110),
(31, 'ACS110648', 407, 68, 1, 110),
(32, 'ACS110648', 4, 51, 2, 110),
(33, 'ACS110648', 5, 52, 2, 110),
(34, 'ACS110648', 6, 44, 2, 110),
(35, 'ACS110648', 9, 40, 2, 110),
(36, 'ACS110648', 15, 16, 2, 110),
(37, 'ACS110648', 78, 60, 1, 110),
(38, 'ACS110648', 97, 95, 1, 110),
(39, 'ACS110648', 101, 87, 1, 110),
(40, 'ACS110648', 103, 85, 1, 110),
(41, 'ACS110648', 147, 68, 1, 110),
(42, 'ACS110605', 2, 90, 1, 111),
(43, 'ACS110605', 3, 90, 1, 111),
(44, 'ACS110605', 17, 90, 1, 111),
(45, 'ACS110605', 31, 90, 1, 111),
(46, 'ACS110605', 41, 90, 1, 111),
(47, 'ACS110605', 45, 90, 1, 111),
(48, 'ACS110605', 104, 90, 1, 111),
(49, 'ACS110605', 147, 90, 1, 111),
(50, 'ACS110605', 181, 90, 1, 111),
(51, 'ACS110605', 7, 90, 1, 111),
(52, 'ACS110605', 8, 90, 1, 111),
(53, 'ACS110605', 11, 90, 1, 111),
(54, 'ACS110605', 20, 90, 1, 111),
(55, 'ACS110605', 25, 90, 1, 110),
(56, 'ACS110605', 32, 90, 1, 110),
(57, 'ACS110605', 105, 90, 1, 111),
(58, 'ACS110605', 107, 90, 1, 111),
(59, 'ACS110605', 179, 90, 1, 111),
(60, 'ACS110605', 10, 90, 1, 112),
(61, 'ACS110605', 12, 90, 1, 112),
(62, 'ACS110605', 18, 90, 1, 112),
(63, 'ACS110605', 21, 90, 1, 112),
(64, 'ACS110605', 33, 90, 1, 112),
(65, 'ACS110605', 35, 90, 1, 112),
(66, 'ACS110605', 129, 90, 1, 112),
(67, 'ACS110605', 13, 90, 1, 112),
(68, 'ACS110605', 16, 999, 1, 112),
(69, 'ACS110605', 26, 90, 1, 112),
(70, 'ACS110605', 27, 90, 1, 112),
(71, 'ACS110605', 44, 90, 1, 112),
(72, 'ACS110605', 48, 90, 1, 112),
(73, 'ACS110605', 132, 90, 1, 112),
(74, 'ACS110605', 14, NULL, 3, 113),
(75, 'ACS110605', 43, NULL, 3, 113),
(76, 'ACS110605', 415, NULL, 3, 113),
(77, 'ACS110605', 84, NULL, 3, 113);

-- --------------------------------------------------------

--
-- 資料表結構 `course_module`
--

CREATE TABLE `course_module` (
  `course_package_id` int(11) NOT NULL,
  `module_name` varchar(60) NOT NULL,
  `course_module_id` varchar(1) NOT NULL,
  `required_credits` float NOT NULL,
  `elective_credits` float NOT NULL,
  `class_module_id` int(11) NOT NULL,
  `department_id` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `course_module`
--

INSERT INTO `course_module` (`course_package_id`, `module_name`, `course_module_id`, `required_credits`, `elective_credits`, `class_module_id`, `department_id`) VALUES
(1, '體育', 'A', 2, 0, 1, 'AGE'),
(2, '國文', 'A', 4, 0, 3, 'AGE'),
(3, '英文', 'A', 4, 0, 3, 'AGE'),
(4, '數理核心', 'A', 0, 2, 4, 'AGE'),
(5, '數理非核心', 'A', 0, 4, 4, 'AGE'),
(6, '藝術核心', 'A', 0, 2, 4, 'AGE'),
(7, '藝術非核心', 'A', 0, 2, 4, 'AGE'),
(8, '社會核心', 'A', 0, 4, 4, 'AGE'),
(9, '社會非核心', 'A', 0, 4, 4, 'AGE'),
(10, '資工系院共同', 'A', 9, 0, 5, 'ACS'),
(11, '資工系系基礎', 'A', 16, 0, 6, 'ACS'),
(12, '資工系系核心', 'A', 25, 0, 7, 'ACS'),
(13, '基礎程式設計', 'A', 0, 6, 8, 'ACS'),
(14, '通訊網路理論', 'A', 0, 9, 8, 'ACS'),
(15, '軟體與系統理論', 'A', 0, 9, 8, 'ACS'),
(16, '整合性實作', 'A', 0, 6, 8, 'ACS'),
(17, '自由', 'A', 0, 20, 9, 'ACS'),
(18, '資工系輔系', 'A', 20, 0, 10, 'ACS'),
(19, '數位系院共同', 'A', 12, 0, 11, 'ADT'),
(20, '數位系系基礎', 'A', 33, 0, 12, 'ADT'),
(21, '數位系系核心', 'A', 7, 0, 13, 'ADT'),
(22, '數位學習專業模組', 'A', 0, 15, 14, 'ADT'),
(23, '數位技術應用專業模組', 'A', 0, 15, 14, 'ADT'),
(24, '數位設計專業模組', 'A', 0, 15, 14, 'ADT'),
(25, '自由', 'A', 0, 20, 15, 'ADT'),
(26, '教育基礎', 'A', 5, 7, 16, 'AED'),
(27, '教育方法', 'A', 8, 4, 16, 'AED'),
(28, '教育實踐', 'A', 8, 4, 16, 'AED'),
(29, '教育專門', 'A', 4, 6, 17, 'AED'),
(30, '國語領域', 'A', 0, 2, 18, 'AED'),
(31, '數學領域', 'A', 0, 2, 18, 'AED'),
(32, '科教系院共同', 'A', 9, 0, 19, 'ASC'),
(33, '科教系系基礎', 'A', 32, 0, 20, 'ASC'),
(34, '科學教育核心', 'A', 0, 12, 21, 'ASC'),
(34, '科學應用核心', 'B', 0, 12, 21, 'ASC'),
(35, '科學教育選修', 'A', 0, 12, 21, 'ASC'),
(35, '科學應用選修', 'B', 0, 12, 21, 'ASC'),
(36, '本系選修', 'A', 0, 15, 22, 'ASC'),
(37, '自由', 'A', 0, 20, 23, 'ASC'),
(38, '本系選修', 'A', 0, 5, 24, 'ASC'),
(39, '數教系院共同', 'A', 9, 0, 25, 'AMA'),
(40, '數教系系基礎', 'A', 21, 0, 26, 'AMA'),
(41, '數教系系核心', 'A', 18, 0, 27, 'AMA'),
(42, '數學教育專業', 'A', 0, 14, 28, 'AMA'),
(42, '數學專業', 'B', 0, 14, 28, 'AMA'),
(42, '資訊科技專業', 'C', 0, 14, 28, 'AMA'),
(42, '數學評量與統計專業', 'D', 0, 14, 28, 'AMA'),
(43, '跨領域', 'A', 0, 15, 28, 'AMA'),
(44, '自由', 'C', 0, 20, 29, 'AMA'),
(45, '數學教育專業', 'A', 0, 14, 30, 'AMA'),
(45, '數學專業', 'B', 0, 14, 30, 'AMA'),
(45, '資訊科技專業', 'C', 0, 14, 30, 'AMA'),
(45, '數學評量與統計專業', 'D', 0, 14, 30, 'AMA'),
(46, '科學', 'A', 10, 0, 31, 'ASC'),
(47, '科學教育', 'A', 9, 0, 31, 'ASC');

-- --------------------------------------------------------

--
-- 資料表結構 `course_structure`
--

CREATE TABLE `course_structure` (
  `course_structure_id` int(11) NOT NULL,
  `course_structure_name` varchar(60) NOT NULL,
  `academic_year` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `department_id` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `course_structure`
--

INSERT INTO `course_structure` (`course_structure_id`, `course_structure_name`, `academic_year`, `type`, `department_id`) VALUES
(2, '通識110課架', 110, 0, 'AGE'),
(3, '資工系主修110課架', 110, 1, 'ACS'),
(4, '資工系輔修110課架', 110, 2, 'ACS'),
(5, '資工系雙主修110課架', 110, 3, 'ACS'),
(6, '數位系主修110課架', 110, 1, 'ADT'),
(7, '數教系主修110課架', 110, 1, 'AMA'),
(8, '科教系主修110課架', 110, 1, 'ASC'),
(9, '教育課程110課架', 110, 4, 'AED'),
(10, '科教系主修110課架', 110, 5, 'ASC'),
(11, '數教系主修110課架', 110, 5, 'AMA'),
(12, '科教系輔修110課架', 110, 2, 'ASC'),
(13, '科教系雙主修110課架', 110, 3, 'ASC');

-- --------------------------------------------------------

--
-- 資料表結構 `cscm_table`
--

CREATE TABLE `cscm_table` (
  `ID` int(11) NOT NULL,
  `course_structure_id` int(11) NOT NULL,
  `class_module_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `cscm_table`
--

INSERT INTO `cscm_table` (`ID`, `course_structure_id`, `class_module_id`) VALUES
(1, 3, 5),
(2, 3, 6),
(3, 3, 7),
(4, 3, 8),
(5, 3, 9),
(6, 2, 3),
(7, 2, 4),
(8, 4, 10),
(10, 5, 5),
(11, 5, 6),
(12, 5, 7),
(13, 2, 1),
(14, 2, 2),
(15, 9, 16),
(16, 9, 17),
(17, 9, 18),
(18, 6, 11),
(19, 6, 12),
(20, 6, 13),
(21, 6, 14),
(22, 6, 15),
(23, 8, 19),
(24, 8, 20),
(25, 8, 21),
(26, 8, 22),
(27, 8, 23),
(28, 10, 19),
(29, 10, 20),
(30, 10, 21),
(31, 10, 24),
(32, 7, 25),
(33, 7, 26),
(34, 7, 27),
(35, 7, 28),
(36, 7, 29),
(37, 11, 25),
(38, 11, 26),
(39, 11, 27),
(40, 11, 30),
(42, 12, 31),
(43, 13, 19),
(44, 13, 20);

-- --------------------------------------------------------

--
-- 資料表結構 `department`
--

CREATE TABLE `department` (
  `department_id` varchar(3) NOT NULL,
  `department_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `department`
--

INSERT INTO `department` (`department_id`, `department_name`) VALUES
('A', '教務處'),
('ACS', '資訊工程系'),
('ADT', '數位系'),
('AED', '師培處'),
('AGE', '通識中心'),
('AMA', '數教系'),
('ASC', '科教系');

-- --------------------------------------------------------

--
-- 資料表結構 `department_list`
--

CREATE TABLE `department_list` (
  `id` int(11) NOT NULL,
  `department_id` varchar(3) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `equivalent_subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `department_list`
--

INSERT INTO `department_list` (`id`, `department_id`, `subject_id`, `equivalent_subject_id`) VALUES
(1, 'ACS', 403, 402),
(2, 'ACS', 403, 398),
(3, 'ACS', 406, 315),
(4, 'ACS', 406, 302),
(5, 'ACS', 4, 243),
(6, 'ACS', 9, 55),
(7, 'ACS', 2, 245),
(12, 'ACS', 412, 399),
(13, 'ACS', 38, 262),
(14, 'ACS', 38, 72),
(15, 'ACS', 32, 58),
(17, 'ACS', 20, 288);

-- --------------------------------------------------------

--
-- 資料表結構 `mentor_assignment`
--

CREATE TABLE `mentor_assignment` (
  `mentor_id` int(11) NOT NULL,
  `student_id` varchar(9) NOT NULL,
  `type` int(11) NOT NULL,
  `annotation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `recognition_table`
--

CREATE TABLE `recognition_table` (
  `id` int(11) NOT NULL,
  `student_id` varchar(9) NOT NULL,
  `course_data_id` int(11) NOT NULL,
  `equivalent_subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `sgdc`
--

CREATE TABLE `sgdc` (
  `sgdc_id` int(11) NOT NULL,
  `course_data_id` int(11) NOT NULL,
  `version_id` int(11) NOT NULL,
  `course_structure_id` int(11) NOT NULL,
  `class_module_id` int(11) NOT NULL,
  `course_package_id` int(11) NOT NULL,
  `course_module_id` varchar(1) NOT NULL,
  `type` int(11) NOT NULL,
  `remark` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `student`
--

CREATE TABLE `student` (
  `student_id` varchar(9) NOT NULL,
  `student_name` varchar(60) NOT NULL,
  `major_department_id` int(11) NOT NULL,
  `auxiliary_department_id` int(11) DEFAULT NULL,
  `double_major_department_id` int(11) DEFAULT NULL,
  `teach_class_id` int(11) DEFAULT NULL,
  `official_review_version_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `student`
--

INSERT INTO `student` (`student_id`, `student_name`, `major_department_id`, `auxiliary_department_id`, `double_major_department_id`, `teach_class_id`, `official_review_version_id`) VALUES
('ACS110605', '測試人員', 3, NULL, NULL, NULL, NULL),
('ACS110648', '測試人員2', 3, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `subject_code` varchar(8) NOT NULL,
  `academic_year` int(11) NOT NULL,
  `cname` varchar(60) NOT NULL,
  `ename` varchar(60) NOT NULL,
  `credit` float NOT NULL,
  `sel` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `subject`
--

INSERT INTO `subject` (`subject_id`, `subject_code`, `academic_year`, `cname`, `ename`, `credit`, `sel`) VALUES
(1, 'ACS00050', 110, '程式設計', 'Programming', 3, 1),
(2, 'ACS00060', 110, '線性代數', 'Linear Algebra', 3, 1),
(3, 'ACS00110', 110, '資料結構', 'Data Structure', 3, 1),
(4, 'ACS00120', 110, '離散數學', 'Discrete Mathematic', 3, 1),
(5, 'ACS00130', 110, '數位邏輯設計', 'Digital Logic Design', 3, 1),
(6, 'ACS00140', 110, '數位邏輯設計實驗', 'Digital Logic Design Experiment', 1, 1),
(7, 'ACS00150', 110, '系統程式', 'System Programming', 3, 1),
(8, 'ACS00170', 110, '演算法', 'Algorithm', 3, 1),
(9, 'ACS00180', 110, '計算機網路', 'Computer Networks', 3, 1),
(10, 'ACS00190', 110, '作業系統', 'Operating System', 3, 1),
(11, 'ACS00200', 110, '軟體工程', 'Software Engineering', 3, 1),
(12, 'ACS00210', 110, '計算機組織', 'Computer Organization', 3, 1),
(13, 'ACS00240', 110, '資訊專題(I)', 'Information Project（I）', 2, 1),
(14, 'ACS00250', 110, '資訊專題(II)', 'Information Project（II）', 2, 1),
(15, 'ACS00270', 110, '進階程式設計', 'Advanced Computer Programming', 3, 1),
(16, 'ACS00350', 110, '程式能力檢定', 'Programming Certification', 0, 1),
(17, 'ACS20030', 110, '物件導向程式設計', 'Object-Oriented Programming', 3, 0),
(18, 'ACS20150', 110, '人工智慧', 'Artificial Intelligence', 3, 0),
(19, 'ACS20270', 110, '編譯程式', 'Compiler', 3, 0),
(20, 'ACS20310', 110, '機率', 'Probability', 3, 0),
(21, 'ACS20340', 110, '網路管理與分析', 'Network Management and Analysis', 3, 0),
(22, 'ACS20400', 110, '專題研究(I)', 'Special Topic of Information Technology（I）', 3, 0),
(23, 'ACS20410', 110, '網路程式設計', 'Network Programming', 3, 0),
(24, 'ACS20440', 110, '計算機結構', 'Computer Architecture', 3, 0),
(25, 'ACS20450', 110, '專題研究(II)', 'Special Topic of Information Technology（II）', 3, 0),
(26, 'ACS20470', 110, '網路安全', 'Network Security', 3, 0),
(27, 'ACS20480', 110, '無線網路', 'Introduction to Wireless Network', 3, 0),
(28, 'ACS20500', 110, '專題研究(III)', 'Special Topic of Information Technology（III', 3, 0),
(29, 'ACS20520', 110, '行動通訊', 'Mobile Communication', 3, 0),
(30, 'ACS20530', 110, '專題研究(IV)', 'Special Topic of Information Technology（IV）', 3, 0),
(31, 'ACS20570', 110, '資料庫系統', 'Database System', 3, 0),
(32, 'ACS20600', 110, '資料庫程式設計', 'Database Programming', 3, 0),
(33, 'ACS20630', 110, '密碼學導論', 'Introduction to Cryptography', 3, 0),
(34, 'ACS20640', 110, '軟體工程實務', 'Software Engineering Practice', 3, 0),
(35, 'ACS20660', 110, '高效能計算', 'High-Performance Computing', 3, 0),
(36, 'ACS20670', 110, 'UNIX應用實務', 'UNIX Practices and Applications', 3, 0),
(37, 'ACS20680', 110, '資訊專業實習', 'Professional Practicumin Computer Science', 3, 0),
(38, 'ACS20690', 110, '網頁程式設計', 'Web Programming', 3, 0),
(39, 'ACS20710', 110, '多媒體網路', 'Multimedia Networking', 3, 0),
(40, 'ACS20720', 110, '電子電路學', 'Electronics and Electric Circuits', 3, 0),
(41, 'ACS20730', 110, '系統分析與設計', 'System Analysis and Design', 3, 0),
(42, 'ACS20760', 110, '雲端運算概論', 'Introduction to Cloud Computing', 3, 0),
(43, 'ACS20770', 110, '雲端程式設計', 'Programming for Cloud Computing', 3, 0),
(44, 'ACS20780', 110, '物聯網概論', 'Introduction to Internet of Things', 3, 0),
(45, 'ACS20790', 110, '網際網路原理概論', 'Introduction to the Principles of Internet', 3, 0),
(46, 'ACS20800', 110, '視窗程式設計', 'Windows Programming', 3, 0),
(47, 'ACS20810', 110, '物聯網實務', 'Internet of Things Practice', 3, 0),
(48, 'ACS20820', 110, '巨量資料分析', 'Big Data Analyze', 3, 0),
(49, 'ACS20830', 110, '嵌入式微處理機概論', 'Introduction to Embedded Microprocessor Systems', 3, 0),
(50, 'ACS20840', 110, '機器學習', 'Machine Learning', 3, 0),
(51, 'ACS20850', 110, '產業資訊實習', 'Industry Information Practice', 6, 0),
(52, 'ADT00070', 110, '程式設計', 'Programming', 3, 1),
(53, 'ADT00120', 110, '資料結構', 'Data Structure', 3, 1),
(54, 'ADT00340', 110, '腳本設計', 'Script Writing', 3, 1),
(55, 'ADT00350', 110, '計算機網路', 'Computer network', 3, 1),
(56, 'ADT00400', 110, '專案企劃', 'Project Planning', 3, 1),
(57, 'ADT00460', 110, '認知心理學', 'Cognitive Psychology ', 3, 1),
(58, 'ADT00490', 110, '資料庫管理', 'Database Management', 3, 1),
(59, 'ADT00500', 110, '基本設計', 'Basic Design', 3, 1),
(60, 'ADT00510', 110, '設計方法', 'Design Method', 3, 1),
(61, 'ADT00520', 110, '創意產業行銷', 'Creative Industry Marketing', 3, 1),
(62, 'ADT00530', 110, '創意產業設計', 'Creative Industry Design', 3, 1),
(63, 'ADT00540', 110, '設計整合', 'Design Practice', 3, 1),
(64, 'ADT00550', 110, '專題製作與應用', 'Project Production and Application', 2, 1),
(65, 'ADT00560', 110, '專題製作成果展出(I)', 'Individual Project Exhibition (I)', 1, 1),
(66, 'ADT00570', 110, '專題製作成果展出(II)', 'Individual Project Exhibition (II)', 1, 1),
(67, 'ADT10220', 110, '作業系統', 'Operating System', 3, 0),
(68, 'ADT10360', 110, '多媒體概論', 'Introduction to Multimedia', 3, 0),
(69, 'ADT10390', 110, '離散數學', 'Discrete Mathematic', 3, 0),
(70, 'ADT10440', 110, '網頁程式設計', 'Web Programming Design', 3, 0),
(71, 'ADT10850', 110, '作品集與展示規劃', 'Design Portfolio and Display', 3, 0),
(72, 'ADT10890', 110, '網頁設計', 'Web Design', 3, 0),
(73, 'ADT10900', 110, '互動媒體設計', 'Interactive Media Design', 3, 0),
(74, 'ADT10950', 110, '遊戲設計概論', 'Introduction to Game Design', 3, 0),
(75, 'ADT10990', 110, '網際網路與應用', 'Internet and Application', 3, 0),
(76, 'ADT11010', 110, '人工智慧應用', 'Artificial Intelligence Application', 3, 0),
(77, 'ADT11020', 110, '電腦繪圖I', 'Computer GraphicsI', 3, 0),
(78, 'ADT11030', 110, '電腦繪圖II', 'Computer Graphics Ⅱ', 3, 0),
(79, 'ADT11040', 110, '數位整合傳播', 'Digital Integrated Communication', 3, 0),
(80, 'ADT11050', 110, '角色設定', 'Character Design', 3, 0),
(81, 'ADT11060', 110, '數位課程設計', 'Digital Curriculum Design', 3, 0),
(82, 'ADT11070', 110, '數位影片製作', 'Digital Cinematic', 3, 0),
(83, 'ADT11080', 110, '電腦動畫', 'Animation', 3, 0),
(84, 'ADT11130', 110, '行動APP設計', 'Mobile App Design', 3, 0),
(85, 'ADT11140', 110, '數位文化商品設計', 'Digital Cultural Product Design', 3, 0),
(86, 'ADT11150', 110, '互動媒體專題', 'Interactive Media Project', 3, 0),
(87, 'ADT11160', 110, '互動玩具與教具設計', 'Interactive Toy and Teaching Aid Design', 3, 0),
(88, 'ADT11170', 110, '社群網路應用', 'Social Network Application', 3, 0),
(89, 'ADT11180', 110, '電子商務與數位互動行銷', 'Information System Project Study', 3, 0),
(90, 'ADT11190', 110, '角色設定', 'Photography Theory', 3, 0),
(91, 'ADT11200', 110, '科技藝術', 'Technology Art', 3, 0),
(92, 'ADT11210', 110, '電子商務與數位互動行銷', 'Electronic Commerce and Internet Marketing', 3, 0),
(93, 'ADT11220', 110, '研究與學習', 'Research and learning', 3, 0),
(94, 'ADT11230', 110, '職場探索與增能', 'Workplace exploration and employee empowerment', 3, 0),
(95, 'ADT11240', 110, '物聯網系統設計應用', 'The design and application of IoT system', 3, 0),
(96, 'AGE01031', 110, '英文(一)', 'English', 2, 1),
(97, 'AGE01032', 110, '英文(二)', 'English', 2, 1),
(98, 'AGE01050', 110, '進階英文(一)', 'Advanced English (Ⅰ)', 2, 0),
(99, 'AGE01060', 110, '進階英文(二)', 'Advanced English (Ⅱ)', 2, 0),
(100, 'AGE01071', 110, '中文閱讀與表達(一)', 'Chinese Reading and Expression', 2, 1),
(101, 'AGE01072', 110, '中文閱讀與表達(二)', 'Chinese Reading and Expression', 2, 1),
(102, 'AGE06070', 110, '大一體育(一)', 'Physical Education (Freshman Ⅰ)', 0.5, 1),
(103, 'AGE06080', 110, '大一體育(二)', 'Physical Education (Freshman Ⅱ)', 0.5, 1),
(104, 'AGE06090', 110, '大二體育(一)', 'Physical Education (Sophomore Ⅰ)', 0.5, 1),
(105, 'AGE06100', 110, '大二體育(二)', 'Physical Education (Sophomore Ⅱ)', 0.5, 1),
(106, 'AGE20020', 110, '認識臺灣', 'Getting to Know Taiwan：Trends and Insights', 2, 0),
(107, 'AGE20030', 110, '人文關懷體驗', 'The Practice and Experience of Humanity Care', 2, 0),
(108, 'AGE20050', 110, '當代社會議題', 'Social Issues in Contemporary Taiwan', 2, 0),
(109, 'AGE20060', 110, '經典的智慧', 'Wisdom of Classics', 2, 0),
(110, 'AGE21160', 110, '古蹟與臺灣文化', 'A Historic Spot and Taiwan Culture', 2, 0),
(111, 'AGE21370', 110, '臺灣原住民族文化概論', 'Introduction to Taiwan`s Aboriginal Culture', 2, 0),
(112, 'AGE21380', 110, '老子哲學與人生智慧', 'The Philosophy of Lao Tzu and Wisdom of Life', 2, 0),
(113, 'AGE21420', 110, '繪本中的人文', 'Literature and Human civilization in Picture Books', 2, 0),
(114, 'AGE21430', 110, '國際禮儀', 'International Etiquette', 2, 0),
(115, 'AGE21440', 110, '文學與音樂賞析', 'Appreciation to Literature and Music', 2, 0),
(116, 'AGE21460', 110, '俄羅斯寫實主義與台灣文學', 'Russian Realism and Taiwanese Literature', 2, 0),
(117, 'AGE21470', 110, '與經典對話—儒家經典', 'Dialogue with the Confucius Classics', 2, 0),
(118, 'AGE21480', 110, '跟著圖畫書去旅行', 'Travel with Picture Books', 2, 0),
(119, 'AGE21490', 110, '敘事文學與媒體', 'Narrative Literature and Media', 2, 0),
(120, 'AGE21860', 110, '台灣民間故事', 'Taiwanese Folktales', 2, 0),
(121, 'AGE22490', 110, '全球化與台灣社會', 'Globalization and Taiwan Society', 2, 0),
(122, 'AGE22530', 110, '性別關係與社會', 'Relations of Gender and Society', 2, 0),
(123, 'AGE22540', 110, '國際關係與全球議題', 'International Relations and Global Issues', 2, 0),
(124, 'AGE22550', 110, '教育法律與實例', 'Educational Laws and Practices', 2, 0),
(125, 'AGE22560', 110, '性別與生活', 'Gender and Life', 2, 0),
(126, 'AGE22570', 110, '民法概要', 'Introduction to Civil Law', 2, 0),
(127, 'AGE22590', 110, '智慧財產權法', 'Intellectual Property Laws', 2, 0),
(128, 'AGE22600', 110, '自我轉化與人際溝通', 'Self-transformation and Interpersonal communication', 2, 0),
(129, 'AGE23090', 110, '投資與理財規劃', 'Investment and Personal Finance', 2, 0),
(130, 'AGE23100', 110, '古今將領的領導藝術', 'Generals Ancient Art of Leadership', 2, 0),
(131, 'AGE23110', 110, '餐飲管理概論', 'Foundation in Food and Beverage Operations', 2, 0),
(132, 'AGE23120', 110, '消費行為與品牌策略', 'Consuming Behavior and Branding Strategy', 2, 0),
(133, 'AGE23130', 110, '展演行銷與實務', 'Exhibition and Performing Arts Marketing Practice', 2, 0),
(134, 'AGE23140', 110, '音樂專輯企劃製作歷程與模擬', 'The Planning and Simulation of Music Album Production', 2, 0),
(135, 'AGE23150', 110, '橘子蘋果經濟學', 'Economist Explores the Hidden Side of Everything', 2, 0),
(136, 'AGE23160', 110, '藝術與商業個案教學', 'Art and Business Case Study', 2, 0),
(137, 'AGE23170', 110, '都市文化創意產業', 'Urban Culture and Creativity', 2, 0),
(138, 'AGE24080', 110, '觀光遊憩概論', 'Introduction to Tourism and Recreation', 2, 0),
(139, 'AGE24110', 110, '公共爭議與民主論辯', 'Public Issues and Democratic Debate', 2, 0),
(140, 'AGE24120', 110, '人文與醫學', 'Humanity and Medicine', 2, 0),
(141, 'AGE24130', 110, '大眾文化與流行音樂', 'Mass Culture and Popular Music', 2, 0),
(142, 'AGE25050', 110, '好客之家-認識臺灣客家', 'Hospitality House-Know Taiwanese Hakka', 2, 0),
(143, 'AGE26010', 110, '台灣諺語', 'Taiwan Proverbs', 2, 0),
(144, 'AGE26020', 110, '語文表達藝術', 'Language Expression Arts', 2, 0),
(145, 'AGE28010', 110, '生涯發展與職涯規劃', 'Career Development and Vocational Planning', 2, 0),
(146, 'AGE30010', 110, '邏輯思考與應用', 'Logical Thinking and Application', 2, 0),
(147, 'AGE30020', 110, '自然、科技與社會', 'Science, Technology and Society', 2, 0),
(148, 'AGE30030', 110, '資訊與生活', 'Information and Life', 2, 0),
(149, 'AGE30040', 110, '運算思維與程式設計', 'Computational Thinking and Programming', 2, 0),
(150, 'AGE31010', 110, '生活中的數學', 'Mathematics in Life', 2, 0),
(151, 'AGE31140', 110, '數學與文明', 'Mathematics and Civilization', 2, 0),
(152, 'AGE31150', 110, '數學與認知科學', 'Mathematics and Cognitive Science', 2, 0),
(153, 'AGE31160', 110, '統計與生活', 'Statistics and Living', 2, 0),
(154, 'AGE32120', 110, '動漫實務與應用', 'Anime Practice and Application', 2, 0),
(155, 'AGE32130', 110, '網際網路與資訊社會', 'Internet and Information Society', 2, 0),
(156, 'AGE32150', 110, '科技與學習', 'Technology and Learning', 2, 0),
(157, 'AGE32160', 110, '智慧行動生活', 'Smartphone Life', 2, 0),
(158, 'AGE32170', 110, '電腦科學與程式設計概論', 'Introduction to Computer Science and Programming', 2, 0),
(159, 'AGE32180', 110, '行動科技攝影', 'Mobile Technology Photography', 2, 0),
(160, 'AGE32190', 110, '手機程式設計入門', 'Programming Mobile Apps with App Inventor', 2, 0),
(161, 'AGE33010', 110, '趣味科學實驗', 'Fun Science Experiments', 2, 0),
(162, 'AGE33060', 110, '安全與衛生', 'Safety and Health', 2, 0),
(163, 'AGE33070', 110, '地球的奧秘', 'Investigating The Earth', 2, 0),
(164, 'AGE33090', 110, '海洋科學導論', 'Introduction to Ocean Sciences', 2, 0),
(165, 'AGE33100', 110, '生活中的化學', 'Chemistry in Life', 2, 0),
(166, 'AGE33110', 110, '生活科學', 'Life Science', 2, 0),
(167, 'AGE34230', 110, '數學在空間藝術上之應用', 'Mathematics in Spatial Arts', 2, 0),
(168, 'AGE34260', 110, '全球環境變遷導論', 'Global Change: An Introduction', 2, 0),
(169, 'AGE34290', 110, '環境倫理', 'Environmental Ethics', 2, 0),
(170, 'AGE34310', 110, '綠色飲食與環境健康', 'Green Eating and Environmental Healthy', 2, 0),
(171, 'AGE34320', 110, '手作食農教育', 'Learning by Doing：Food and Agricutural Education', 2, 0),
(172, 'AGE34860', 110, '綠色能源與生活', 'Green Energy and Life', 2, 0),
(173, 'AGE35040', 110, '家庭營養師', 'Dietitian in Your Family', 2, 0),
(174, 'AGE35070', 110, '環境與永續發展', 'Environment and Sustainable Development', 2, 0),
(175, 'AGE36010', 110, '生命科學概論', 'Introduction to Life Science', 2, 0),
(176, 'AGE37010', 110, '生物技術與健康', 'Biotechnology and Health', 2, 0),
(177, 'AGE37020', 110, '奈米科學概論', 'Introduction to Nanotechnology', 2, 0),
(178, 'AGE37030', 110, '健康生活－體重管理', 'Healthy Life－Weight Management', 2, 0),
(179, 'AGE38010', 110, '聲音工程與音樂現場', 'Sound Engineering and Public Address', 2, 0),
(180, 'AGE40010', 110, '視覺藝術與社會', 'Visual Art in Social Contexts', 2, 0),
(181, 'AGE40020', 110, '音樂話中西', 'Discourse of Chinese and Western Music', 2, 0),
(182, 'AGE40030', 110, '舞蹈藝術賞析', 'Arts and Appreciation for Dance', 2, 0),
(183, 'AGE41020', 110, '設計、生活與美學', 'Aesthetic Inquiry of Design and Life', 2, 0),
(184, 'AGE41120', 110, '繪本中的童心童畫', 'Contents and Implications of Illustrated Books', 2, 0),
(185, 'AGE41160', 110, '電影配樂賞析', 'Appreciation to Film Music', 2, 0),
(186, 'AGE41220', 110, '攝影藝術賞析', 'Appreciation of Photography Art', 2, 0),
(187, 'AGE41250', 110, '色彩與人生', 'The Color with Life', 2, 0),
(188, 'AGE41260', 110, '博物館就是劇場', 'Museums as Theatre', 2, 0),
(189, 'AGE41270', 110, '經典電影閱讀', 'Classic Film Appreciation', 2, 0),
(190, 'AGE41280', 110, '數位藝術與媒體', 'Digital Art and Media', 2, 0),
(191, 'AGE41290', 110, '書法藝術欣賞與習作', 'The Art of Chinese Calligraphy Apperciation and Creation', 2, 0),
(192, 'AGE42580', 110, '聲音與節奏', 'Tone Color and Rhythm', 2, 0),
(193, 'AGE42590', 110, '台語歌謠', 'Taiwanese Songs', 2, 0),
(194, 'AGE42620', 110, '爵士樂', 'Jazz', 2, 0),
(195, 'AGE42630', 110, '日本音樂與文化', 'Japanese Music and Culture', 2, 0),
(196, 'AGE42640', 110, '古典音樂新樣貌', 'The New Appearances of Classical Music', 2, 0),
(197, 'AGE42650', 110, '華語及臺灣流行音樂史', 'The History of Chinese and Taiwan Popular Music', 2, 0),
(198, 'AGE43030', 110, '戲劇與音樂的對話', 'The Conversation of Drama and Music', 2, 0),
(199, 'AGE43040', 110, '肢體表演藝術', 'Performing Arts of Body Movement', 2, 0),
(200, 'AGE44150', 110, '表演藝術欣賞', 'Appreciation to Performing Arts', 2, 0),
(201, 'AGE61080', 110, '全民國防教育軍事訓練－國際情勢', 'All-out Defense Education Military Training－International Si', 0, 0),
(202, 'AGE61090', 110, '全民國防教育軍事訓練－國防政策', 'All-out Defense Education Military Training－National Defense', 0, 0),
(203, 'AGE61100', 110, '全民國防教育軍事訓練－防衛動員', 'All-out Defense Education Military Training－Defense Mobiliza', 0, 0),
(204, 'AGE61110', 110, '全民國防教育軍事訓練－全民國防', 'All-out Defense Education Military Training－Civil Defense', 2, 0),
(205, 'AGE61120', 110, '全民國防教育軍事訓練－國防科技', 'All-out Defense Education Military Training－Defense Technolo', 0, 0),
(206, 'AGE71010', 110, '博雅講堂(一)', 'Lectures of Liberal Arts (I)', 1, 0),
(207, 'AGE71020', 110, '博雅講堂(二)', 'Lectures of Liberal Arts (II)', 2, 0),
(208, 'AGE71030', 110, '博雅講堂(三)', 'Lectures of Liberal Arts (III)', 3, 0),
(209, 'AGE71040', 110, '博雅講堂(四)', 'Lectures of Liberal Arts (IV)', 2, 0),
(210, 'AGE71050', 110, '博雅講堂(五)', 'Lectures of Liberal Arts (V)', 2, 0),
(211, 'AGE71060', 110, '博雅講堂(六)', 'Lectures of Liberal Arts (VI)', 2, 0),
(212, 'AGE71070', 110, '博雅講堂(七)', 'Lectures of Liberal Arts (VII)', 2, 0),
(213, 'AGE71080', 110, '博雅講堂(八)', 'Lectures of Liberal Arts (VIII)', 2, 0),
(214, 'AGE71090', 110, '博雅講堂(九)', 'Lectures of Liberal Arts (IX)', 2, 0),
(215, 'AGE71100', 110, '博雅講堂(十)', 'Lectures of Liberal Arts (X)', 2, 0),
(216, 'AGE71110', 110, '博雅講堂(十一)', 'Lectures of Liberal Arts (XI)', 2, 0),
(217, 'AGE71120', 110, '博雅講堂(十二)', 'Lectures of Liberal Arts (XII)', 2, 0),
(218, 'AGE71130', 110, '博雅講堂(十三)', 'Lectures of Liberal Arts (XIII)', 2, 0),
(219, 'AGE71140', 110, '博雅講堂(十四)', 'Lectures of Liberal Arts (IXV)', 2, 0),
(220, 'AGE71150', 110, '博雅講堂(十五)', 'Lectures of Liberal Arts (XV)', 2, 0),
(221, 'AGE71160', 110, '博雅講堂(十六)', 'Lectures of Liberal Arts (XVI)', 2, 0),
(222, 'AGE71170', 110, '博雅講堂(十七)', 'Lectures of Liberal Arts (XVII)', 2, 0),
(223, 'AGE71180', 110, '博雅講堂(十八)', 'Lectures of Liberal Arts (XVIII)', 2, 0),
(224, 'AGE72010', 110, '自主學習課程(一)', 'Self-Learning (Ⅰ)', 1, 0),
(225, 'AGE72020', 110, '自主學習課程(二)', 'Self-Learning (ⅠI)', 1, 0),
(226, 'AGE72030', 110, '自主學習課程(三)', 'Self-Learning (ⅠII)', 1, 0),
(227, 'AGE72040', 110, '自主學習課程(四)', 'Self-Learning (IV)', 1, 0),
(228, 'AGE72050', 110, '自主學習課程(五)', 'Self-Learning (V)', 1, 0),
(229, 'AGE72060', 110, '自主學習課程(六)', 'Self-Learning (VI)', 1, 0),
(230, 'AGE72070', 110, '自主學習課程(七)', 'Self-Learning (VII)', 1, 0),
(231, 'AGE72080', 110, '自主學習課程(八)', 'Self-Learning (VIII)', 1, 0),
(232, 'AGE72090', 110, '自主學習課程(九)', 'Self-Learning (IX)', 1, 0),
(233, 'AGE72100', 110, '自主學習課程(十)', 'Self-Learning (X)', 1, 0),
(234, 'AGE72110', 110, '自主學習課程(十一)', 'Self-Learning (XⅠ)', 1, 0),
(235, 'AGE72120', 110, '自主學習課程(十二)', 'Self-Learning (XIⅠ)', 1, 0),
(236, 'AGE72130', 110, '自主學習課程(十三)', 'Self-Learning (XIIⅠ)', 1, 0),
(237, 'AGE72140', 110, '自主學習課程十四)', 'Self-Learning (IXV)', 1, 0),
(238, 'AGE72150', 110, '自主學習課程(十五)', 'Self-Learning (XV)', 1, 0),
(239, 'AGE72160', 110, '自主學習課程(十六)', 'Self-Learning (XVI)', 1, 0),
(240, 'AMA00030', 110, '幾何學', 'Geometry', 3, 1),
(241, 'AMA00060', 110, '數學史', 'History of Mathematics', 3, 1),
(242, 'AMA00230', 110, '數學課程通論', 'Theory of Elementary Mathematics Curriculum', 3, 1),
(243, 'AMA00280', 110, '離散數學', 'Discrete Mathematics', 3, 0),
(244, 'AMA00290', 110, '數學學習心理學', 'Psychology of Mathematics Learning', 3, 0),
(245, 'AMA00330', 110, '線性代數(一)', 'Linear Algebra(Ⅰ)', 3, 1),
(246, 'AMA00340', 110, '線性代數(二) ', 'Linear Algebra(Ⅱ)', 3, 1),
(247, 'AMA00350', 110, '統計學(一)', 'Statistics(Ⅰ)', 3, 1),
(248, 'AMA00370', 110, '代數學', 'Algebra', 3, 0),
(249, 'AMA00390', 110, '數學素養探究與教學', 'Mathematical Literacy Exploration and Teaching', 3, 1),
(250, 'AMA00400', 110, '數學教學與評量', 'Mathematics Instruction and Assessment', 3, 1),
(251, 'AMA00410', 110, '專題製作', 'Special Project', 3, 1),
(252, 'AMA00420', 110, '統計學(二)', 'Statistics(Ⅱ)', 3, 0),
(253, 'AMA20010', 110, '邏輯', 'Logic', 3, 0),
(254, 'AMA20240', 110, '拓樸學', 'Topology ', 3, 0),
(255, 'AMA20260', 110, '數學導論', 'Introduction to Mathematics', 3, 0),
(256, 'AMA20270', 110, '微分方程', 'Differential Equations', 3, 0),
(257, 'AMA20280', 110, '科學計算', 'Scientific Computing', 3, 0),
(258, 'AMA20290', 110, '數學建模', 'Mathematical Modeling', 3, 0),
(259, 'AMA20300', 110, '數學專題研究', 'Study on Mathematical Topic', 3, 0),
(260, 'AMA21010', 110, '高等微積分(一)', 'Advanced Calculus (Ⅰ)', 3, 0),
(261, 'AMA21020', 110, '高等微積分(二)', 'Advanced Calculus(Ⅱ)', 3, 0),
(262, 'AMA22040', 110, '網頁程式設計', 'Webpage Design', 3, 0),
(263, 'AMA22060', 110, '數位評量系統', 'Computerized Assessment System', 3, 0),
(264, 'AMA22070', 110, '物件導向程式設計', 'Object Oriented Programming', 3, 1),
(265, 'AMA22080', 110, '多媒體學習', 'Multimedia Learning', 3, 0),
(266, 'AMA22090', 110, '計算機網路', 'Computer Networks', 3, 0),
(267, 'AMA22100', 110, '多媒體影音處理', 'Multimedia Processing', 3, 0),
(268, 'AMA30040', 110, '兒童數學概念發展', 'Development of Children Mathematics Concept', 3, 0),
(269, 'AMA30090', 110, '數學教育研究法 ', 'Research Methods in Mathematics Education', 3, 1),
(270, 'AMA30160', 110, '數學解題與思維', 'Mathematics Problem Solving and Thinking', 3, 1),
(271, 'AMA40020', 110, '資料結構', 'Data Structure', 3, 0),
(272, 'AMA20030', 110, '資料庫', 'Database', 3, 0),
(273, 'AMA20050', 110, '數位課程設計', 'E-Learning Course Design', 3, 0),
(274, 'AMA40070', 110, '演算法', 'Algorithm', 3, 0),
(275, 'AMA40250', 110, '電腦多媒體系統', 'Multimedia System', 3, 0),
(276, 'AMA40300', 110, 'Python程式語言', 'Python programming language', 3, 0),
(277, 'AMA40310', 110, '機器學習', 'Machine Learning', 3, 0),
(278, 'AMA40320', 110, '類神經網路', 'Neural Networks', 3, 0),
(279, 'AMA40330', 110, '深度學習', 'Deep Learning', 3, 0),
(280, 'AMA50020', 110, '數理統計', 'Mathematical Statistics', 3, 0),
(281, 'AMA50130', 110, '科技與測驗統計', 'Technology for Measurement and Statistics', 3, 0),
(282, 'AMA50170', 110, '統計套裝軟體', 'Package software of Statistics ', 3, 0),
(283, 'AMA50230', 110, '迴歸分析', 'Regression Analysis', 3, 0),
(284, 'AMA50240', 110, '變異數分析', 'Analysis of Variance', 3, 0),
(285, 'AMA50250', 110, '無母數統計', 'Nonparametric Statistics', 3, 0),
(286, 'AMA50260', 110, '大型數學評量資料庫分析', 'Large Mathematics Assessment Database Analysis', 3, 0),
(287, 'AMA50270', 110, '多變量分析', 'Multivariate Analysis', 3, 0),
(288, 'AMA50280', 110, '機率論', 'Probability Theory', 3, 1),
(289, 'AMA60010', 110, '科技在數學教學上之應用', 'Application of Technology in Mathematics Teaching', 3, 0),
(290, 'AMA60020', 110, '數學教育文獻批判', 'Critique in Mathematics Education Literatures', 3, 0),
(291, 'AMA60030', 110, '數學課程設計', 'Design of Mathematics Curriculum and Instruction', 3, 0),
(292, 'AMA60200', 110, '數學教育推廣實地學習', 'Practicum of Mathematics Education', 3, 0),
(293, 'AMA60210', 110, '數學試題編製與分析', 'Mathematics Testing Design and Analysis', 3, 0),
(294, 'AMA60220', 110, '多元文化數學教育', 'Multicultural Mathematics Education', 3, 0),
(295, 'AMA60230', 110, '數學補救教學', 'Mathematics Remedial Instruction', 3, 0),
(296, 'AMA60240', 110, '數學遊戲', 'Mathematics Games', 3, 0),
(297, 'AMA60250', 110, '數學資優教育模式', 'Models of the Mathematics-gifted Education', 3, 0),
(298, 'AMA60260', 110, '數學擬題解題', 'Mathematics Problem Posing and Solving', 3, 0),
(299, 'AMA60270', 110, '數學閱讀理解', 'Mathematics Reading Comprehension', 3, 0),
(300, 'AMA60280', 110, '數學教育軟體應用', 'Application of Softwares in Mathematics Education', 3, 0),
(301, 'ASC00150', 110, '科學教育概論', 'Introduction to Science Education', 3, 1),
(302, 'ASC00260', 110, '普通物理實驗', 'General Physics Laboratory', 1, 1),
(303, 'ASC00270', 110, '普通化學(一)', 'General Chemistry (Ⅰ)', 2, 1),
(304, 'ASC00280', 110, '普通化學(二)', 'General Chemistry (Ⅱ)', 3, 1),
(305, 'ASC00290', 110, '普通化學實驗', 'General Chemistry Laboratory', 1, 1),
(306, 'ASC00300', 110, '普通生物(一)', 'General Biology (Ⅰ)', 3, 1),
(307, 'ASC00310', 110, '普通生物(二)', 'General Biology (Ⅱ)', 2, 1),
(308, 'ASC00320', 110, '普通生物實驗', 'General Biology Laboratory', 1, 1),
(309, 'ASC00331', 110, '地球科學', 'Earth Science', 4, 1),
(310, 'ASC00332', 110, '地球科學', 'Earth Science', 4, 1),
(311, 'ASC00340', 110, '地球科學實驗', 'Earth Science Laboratory', 1, 1),
(312, 'ASC00350', 110, '科學閱讀與寫作', 'Reading and Writing for Science', 3, 1),
(313, 'ASC00360', 110, '科學歷史與哲學', 'History and Philosophy of Science', 3, 1),
(314, 'ASC00370', 110, '科技發展與現代社會', 'Technology Development and Modern Society', 3, 1),
(315, 'ASC00380', 110, '普通物理學(一)', 'General Physics (Ⅰ)', 2, 1),
(316, 'ASC10181', 110, '生物化學', 'Biochemistry', 6, 0),
(317, 'ASC10182', 110, '生物化學', 'Biochemistry', 6, 0),
(318, 'ASC10200', 110, '遺傳學', 'Genetics', 3, 0),
(319, 'ASC10211', 110, '有機化學', 'Organic Chemistry', 6, 0),
(320, 'ASC10212', 110, '有機化學', 'Organic Chemistry', 6, 0),
(321, 'ASC10221', 110, '分析化學(含實驗)', 'Analytical Chemistry(and Laboratory)', 6, 0),
(322, 'ASC10222', 110, '分析化學(含實驗)', 'Analytical Chemistry(and Laboratory)', 6, 0),
(323, 'ASC10231', 110, '細胞生物學（含實驗）', 'Cell Biology(and Laboratory)', 6, 0),
(324, 'ASC10232', 110, '細胞生物學（含實驗）', 'Cell Biology(and Laboratory)', 6, 0),
(325, 'ASC10241', 110, '生理學', 'Physiology', 4, 0),
(326, 'ASC10242', 110, '生理學', 'Physiology', 4, 0),
(327, 'ASC20420', 110, '全球環境變遷', 'Global Environmental Change', 3, 0),
(328, 'ASC20460', 110, '國小自然科學雙語教學概論', 'Introduction of Bilingual Teaching in Elementary Science', 3, 0),
(329, 'ASC20470', 110, '國小自然科跨領域教學實踐', 'Interdisciplinary Teaching in Elementary Science', 3, 0),
(330, 'ASC30160', 110, '電磁學', 'Electro-Magnetism', 3, 0),
(331, 'ASC40180', 110, '氣象學', 'Meteorology', 3, 0),
(332, 'ASC40190', 110, '地質學', 'Geology', 3, 0),
(333, 'ASC40200', 110, '天文學', 'Astronomy', 3, 0),
(334, 'ASC40210', 110, '海洋學', 'Oceanography', 3, 0),
(335, 'ASC71060', 110, '發育生物學', 'Developmental Biology', 2, 0),
(336, 'ASC71070', 110, '微生物學', 'Microbiology', 3, 0),
(337, 'ASC71110', 110, '生態學', 'Ecology', 2, 0),
(338, 'ASC71180', 110, '動物學', 'Zoology', 3, 0),
(339, 'ASC71190', 110, '植物學', 'Botany', 3, 0),
(340, 'ASC71210', 110, '分子生物學（含實驗）', 'Molecular Biology(and Laboratory)', 3, 0),
(341, 'ASC71220', 110, '生物化學實驗', 'Biochemistry Laboratory', 2, 0),
(342, 'ASC71230', 110, '生理學實驗(一)', 'Physiology Laboratory(Ⅰ)', 1, 0),
(343, 'ASC71240', 110, '生理學實驗(二)', 'Physiology Laboratory(Ⅱ)', 1, 0),
(344, 'ASC72210', 110, '海洋化學', 'Chemical Oceanography', 3, 0),
(345, 'ASC74350', 110, '量子物理', 'Quantum Mechanics', 3, 0),
(346, 'ASC74360', 110, '理論力學', 'Theoretical Mechanics', 3, 0),
(347, 'ASC75020', 110, '物理化學(一)', 'Physical Chemistry (Ⅰ)', 3, 0),
(348, 'ASC75030', 110, '物理化學(二)', 'Physical Chemistry (Ⅱ)', 3, 0),
(349, 'ASC75040', 110, '物理化學(三)', 'Physical Chemistry (Ⅲ)', 2, 0),
(350, 'ASC75061', 110, '無機化學', 'Inorganic Chemistry', 6, 0),
(351, 'ASC75062', 110, '無機化學', 'Inorganic Chemistry', 6, 0),
(352, 'ASC75071', 110, '儀器分析', 'Instrumental Analysis', 6, 0),
(353, 'ASC75072', 110, '儀器分析', 'Instrumental Analysis', 6, 0),
(354, 'ASC75090', 110, '化學數學', 'Mathematics for Chemistry', 3, 0),
(355, 'ASC75100', 110, '有機化學實驗', 'Organic Chemistry Laboratory', 1, 0),
(356, 'ASC75110', 110, '儀器分析實習', 'Instrumental Analysis Laboratory', 1, 0),
(357, 'ASC75120', 110, '有機化學特論', 'Special Topics on Organic Chemistry', 3, 0),
(358, 'ASC80020', 110, '科學學習心理學', 'Psychology of Science Learning ', 3, 0),
(359, 'ASC80030', 110, '科學創造力培育', 'Cultivation of Scientific Creativity', 3, 0),
(360, 'ASC80050', 110, '資訊科學發展與應用', 'Development and Application of Information Science', 3, 0),
(361, 'ASC80110', 110, '自然科學實驗研究', 'Study on Natural Science Experiment', 3, 0),
(362, 'ASC80130', 110, '科普文章寫作與編輯', 'Popular Science Article Writing and Editing', 3, 0),
(363, 'ASC80190', 110, '攝影與媒體製作', 'Photograph and Media Design', 3, 0),
(364, 'ASC80220', 110, '教育統計學', 'Educational Statistics', 3, 0),
(365, 'ASC80230', 110, '科學教育研究方法', 'Methodology of Science Education', 3, 0),
(366, 'ASC80290', 110, '科學課程與教材發展', 'Development of Science Curriculum and Instructional Material', 3, 0),
(367, 'ASC80300', 110, '科學教學與學習', 'Science Teaching and Learning', 3, 0),
(368, 'ASC80310', 110, '科學教育測驗與評量', 'Measurement and Assessment of Science Education', 3, 0),
(369, 'ASC80320', 110, '科學教室規劃與經營', 'Planning and Management in Science Classroom', 3, 0),
(370, 'ASC80330', 110, '環境教育', 'Environmental Education', 3, 0),
(371, 'ASC80340', 110, '幼兒科學教育', 'Science Education for Young Children', 3, 0),
(372, 'ASC80360', 110, '大眾科學推廣', 'Dissemination for Public Science', 3, 0),
(373, 'ASC80370', 110, '科學博物館活動設計', 'Activity Design for Science Museum', 3, 0),
(374, 'ASC80380', 110, '科學教育活動規劃與指導', 'Planning and Instruction of Science Activity', 3, 0),
(375, 'ASC80390', 110, '大眾傳播理論與實務', 'Theory and Practice for Public Communication', 3, 0),
(376, 'ASC80400', 110, '科學展覽製作與指導', 'Implement and Guidance for Science Exhibition', 3, 0),
(377, 'ASC80410', 110, '科學遊戲設計與指導', 'Design and Guidance for Scientific Game', 3, 0),
(378, 'ASC80420', 110, '傳播科技與媒體', 'Communicational Technology and Media', 3, 0),
(379, 'ASC80430', 110, '環境解說', 'Environmental Interpretation', 3, 0),
(380, 'ASC80440', 110, '兒童科學讀物寫作與編輯', 'Children’s Science Reading Materials Writing and Editing', 3, 0),
(381, 'ASC80450', 110, '科學玩具製作與設計', 'Science Toys Design', 3, 0),
(382, 'ASC80510', 110, '科普文本翻譯', 'Translations in Science Popularization Texts', 3, 0),
(383, 'ASC80520', 110, '節能減碳教育及管理', 'Education & Management for Energy Saving & Carbon Conversati', 3, 0),
(384, 'ASC80531', 110, '書報討論與專題研究（一）', 'Seminar and Research （Ⅰ）', 2, 0),
(385, 'ASC80532', 110, '書報討論與專題研究（一）', 'Seminar and Research （Ⅰ）', 2, 0),
(386, 'ASC80541', 110, '書報討論與專題研究（二）', 'Seminar and Research （Ⅱ）', 2, 0),
(387, 'ASC80542', 110, '書報討論與專題研究（二）', 'Seminar and Research （Ⅱ）', 2, 0),
(388, 'ASC80550', 110, '環境科學', 'Environmental Science', 3, 0),
(389, 'ASC80570', 110, '科學傳播概論', 'Introduction to Science Communication', 3, 0),
(390, 'ASC80580', 110, '科學教育推廣實習（一）', 'Practicum of Science Education（Ⅰ）', 1, 0),
(391, 'ASC80590', 110, '科學教育推廣實習（二）', 'Practicum of Science Education（Ⅱ）', 1, 0),
(392, 'ASC80610', 110, '國小自然科學課程研究', 'Natural Science Curriculum study in Elementary Grades', 3, 0),
(393, 'ASC80620', 110, '資優兒童科學教育', 'Science Education for Gifted Children', 3, 0),
(394, 'ASC80630', 110, '科學素養特論', 'Special topics in Scientific Literacy', 3, 0),
(395, 'ASC80640', 110, '科學探究與實作', 'Scientific inquiry and Practice', 3, 0),
(396, 'ASC91170', 110, '健康科學', 'Health Science', 3, 0),
(397, 'ASC91180', 110, '科學魔術', 'Science Magic', 3, 0),
(398, 'ZCS00010', 110, '微積分(一)', 'Calculus(Ⅰ)', 3, 1),
(399, 'ZCS00020', 110, '微積分(二) ', 'Calculus(Ⅱ)', 3, 1),
(400, 'ZCS00031', 110, '微積分', 'Calculus', 3, 1),
(401, 'ZCS00032', 110, '微積分', 'Calculus', 3, 1),
(402, 'ZCS00040', 110, '微積分', 'Calculus', 3, 1),
(403, 'ZCS00050', 110, '微積分(I)', 'Calculus(I)', 3, 1),
(404, 'ZCS00060', 110, '普通物理學', 'General Physics', 3, 0),
(405, 'ZCS00070', 110, '普通物理學(二) ', 'General Physics(Ⅱ)', 3, 1),
(406, 'ZCS00080', 110, '普通物理學', 'General Physics', 3, 1),
(407, 'ZCS00090', 110, '計算機概論', 'Introduction to Computer Science', 3, 1),
(408, 'ZCS00100', 110, '計算機概論', 'Introduction to Computer Science', 3, 0),
(409, 'ZCS00110', 110, '數位學習概論', 'Introduction to Digital Learning', 3, 0),
(410, 'ZCS00120', 110, '數位學習概論', 'Introduction to Digital Learning', 3, 1),
(411, 'ZCS00140', 110, '專業服務學習', 'Professional Service Learning', 3, 0),
(412, 'ZCS00150', 110, '微積分(II)', 'Calculus(II)', 3, 0),
(413, 'ZCS00170', 110, '計算機概論', 'Introduction to Computer Science', 3, 1),
(414, 'ZCS00200', 110, '跨領域專題製作', 'Interdisciplinary Project', 3, 0),
(415, 'ACS20860', 111, '深度學習', 'Deep Learning', 3, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `version`
--

CREATE TABLE `version` (
  `version_id` int(11) NOT NULL,
  `version_name` varchar(60) DEFAULT NULL,
  `student_id` varchar(9) NOT NULL,
  `major_department_id` int(11) NOT NULL,
  `auxiliary_department_id` int(11) DEFAULT NULL,
  `double_major_department_id` int(11) DEFAULT NULL,
  `general_id` int(11) NOT NULL,
  `teach_class_id` int(11) DEFAULT NULL,
  `classes_taken_credit` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `classes_passed` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `total_credit` int(11) NOT NULL DEFAULT 0,
  `department_passed` tinyint(1) NOT NULL DEFAULT 0,
  `department_chair_passed` tinyint(1) NOT NULL DEFAULT 0,
  `general_studies_passed` tinyint(1) NOT NULL DEFAULT 0,
  `academic_affairs_office_passed` tinyint(1) NOT NULL DEFAULT 0,
  `remark` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `version`
--

INSERT INTO `version` (`version_id`, `version_name`, `student_id`, `major_department_id`, `auxiliary_department_id`, `double_major_department_id`, `general_id`, `teach_class_id`, `classes_taken_credit`, `classes_passed`, `total_credit`, `department_passed`, `department_chair_passed`, `general_studies_passed`, `academic_affairs_office_passed`, `remark`) VALUES
(1, 'test1', 'ACS110605', 3, NULL, NULL, 2, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL),
(2, 'test2', 'ACS110605', 3, NULL, 5, 2, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account`),
  ADD KEY `staff_id` (`staff_id`);

--
-- 資料表索引 `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- 資料表索引 `class_module`
--
ALTER TABLE `class_module`
  ADD PRIMARY KEY (`class_module_id`);

--
-- 資料表索引 `coursemodule_subject`
--
ALTER TABLE `coursemodule_subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coursemodule_subject_ibfk_1` (`course_package_id`,`course_module_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- 資料表索引 `course_data`
--
ALTER TABLE `course_data`
  ADD PRIMARY KEY (`course_data_id`),
  ADD KEY `studentId` (`student_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- 資料表索引 `course_module`
--
ALTER TABLE `course_module`
  ADD PRIMARY KEY (`course_package_id`,`course_module_id`),
  ADD KEY `classModuleId` (`class_module_id`),
  ADD KEY `department_id` (`department_id`);

--
-- 資料表索引 `course_structure`
--
ALTER TABLE `course_structure`
  ADD PRIMARY KEY (`course_structure_id`),
  ADD KEY `departmentId` (`department_id`);

--
-- 資料表索引 `cscm_table`
--
ALTER TABLE `cscm_table`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `cscm_table_ibfk_1` (`course_structure_id`),
  ADD KEY `cscm_table_ibfk_2` (`class_module_id`);

--
-- 資料表索引 `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- 資料表索引 `department_list`
--
ALTER TABLE `department_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `equivalent_subject_id` (`equivalent_subject_id`),
  ADD KEY `department_list_ibfk_3` (`department_id`);

--
-- 資料表索引 `mentor_assignment`
--
ALTER TABLE `mentor_assignment`
  ADD KEY `mentorId` (`mentor_id`,`student_id`),
  ADD KEY `studentId` (`student_id`);

--
-- 資料表索引 `recognition_table`
--
ALTER TABLE `recognition_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equivalent_subject_id` (`equivalent_subject_id`),
  ADD KEY `course_data_id` (`course_data_id`),
  ADD KEY `student_id` (`student_id`);

--
-- 資料表索引 `sgdc`
--
ALTER TABLE `sgdc`
  ADD PRIMARY KEY (`sgdc_id`),
  ADD KEY `sgdc_ibfk_3` (`course_package_id`,`course_module_id`),
  ADD KEY `versionId` (`version_id`),
  ADD KEY `courseDataId` (`course_data_id`);

--
-- 資料表索引 `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `officialReviewVersionId` (`official_review_version_id`),
  ADD KEY `major_department_id` (`major_department_id`),
  ADD KEY `auxiliary_department_id` (`auxiliary_department_id`),
  ADD KEY `double_major_department_id` (`double_major_department_id`),
  ADD KEY `student_ibfk_6` (`teach_class_id`);

--
-- 資料表索引 `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- 資料表索引 `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `majorDepartmentId` (`major_department_id`),
  ADD KEY `auxiliaryDepartmentId` (`auxiliary_department_id`),
  ADD KEY `doubleMajorDepartmentId` (`double_major_department_id`),
  ADD KEY `studentId` (`student_id`),
  ADD KEY `general` (`general_id`),
  ADD KEY `version_ibfk_4` (`teach_class_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `administrator`
--
ALTER TABLE `administrator`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `class_module`
--
ALTER TABLE `class_module`
  MODIFY `class_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `coursemodule_subject`
--
ALTER TABLE `coursemodule_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=645;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `course_data`
--
ALTER TABLE `course_data`
  MODIFY `course_data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `course_structure`
--
ALTER TABLE `course_structure`
  MODIFY `course_structure_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cscm_table`
--
ALTER TABLE `cscm_table`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `department_list`
--
ALTER TABLE `department_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `sgdc`
--
ALTER TABLE `sgdc`
  MODIFY `sgdc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=418;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `version`
--
ALTER TABLE `version`
  MODIFY `version_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `administrator` (`staff_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- 資料表的限制式 `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `department` (`department_id`);

--
-- 資料表的限制式 `coursemodule_subject`
--
ALTER TABLE `coursemodule_subject`
  ADD CONSTRAINT `coursemodule_subject_ibfk_1` FOREIGN KEY (`course_package_id`,`course_module_id`) REFERENCES `course_module` (`course_package_id`, `course_module_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `coursemodule_subject_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `course_data`
--
ALTER TABLE `course_data`
  ADD CONSTRAINT `course_data_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `course_data_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `course_module`
--
ALTER TABLE `course_module`
  ADD CONSTRAINT `course_module_ibfk_2` FOREIGN KEY (`class_module_id`) REFERENCES `class_module` (`class_module_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `course_module_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- 資料表的限制式 `course_structure`
--
ALTER TABLE `course_structure`
  ADD CONSTRAINT `course_structure_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `cscm_table`
--
ALTER TABLE `cscm_table`
  ADD CONSTRAINT `cscm_table_ibfk_1` FOREIGN KEY (`course_structure_id`) REFERENCES `course_structure` (`course_structure_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cscm_table_ibfk_2` FOREIGN KEY (`class_module_id`) REFERENCES `class_module` (`class_module_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `department_list`
--
ALTER TABLE `department_list`
  ADD CONSTRAINT `department_list_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `department_list_ibfk_2` FOREIGN KEY (`equivalent_subject_id`) REFERENCES `subject` (`subject_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `department_list_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `mentor_assignment`
--
ALTER TABLE `mentor_assignment`
  ADD CONSTRAINT `mentor_assignment_ibfk_1` FOREIGN KEY (`mentor_id`) REFERENCES `administrator` (`staff_id`),
  ADD CONSTRAINT `mentor_assignment_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `recognition_table`
--
ALTER TABLE `recognition_table`
  ADD CONSTRAINT `recognition_table_ibfk_1` FOREIGN KEY (`equivalent_subject_id`) REFERENCES `subject` (`subject_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `recognition_table_ibfk_2` FOREIGN KEY (`course_data_id`) REFERENCES `course_data` (`course_data_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `recognition_table_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `sgdc`
--
ALTER TABLE `sgdc`
  ADD CONSTRAINT `sgdc_ibfk_1` FOREIGN KEY (`version_id`) REFERENCES `version` (`version_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sgdc_ibfk_2` FOREIGN KEY (`course_data_id`) REFERENCES `course_data` (`course_data_id`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`official_review_version_id`) REFERENCES `version` (`version_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`major_department_id`) REFERENCES `course_structure` (`course_structure_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_4` FOREIGN KEY (`auxiliary_department_id`) REFERENCES `course_structure` (`course_structure_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_5` FOREIGN KEY (`double_major_department_id`) REFERENCES `course_structure` (`course_structure_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_6` FOREIGN KEY (`teach_class_id`) REFERENCES `course_structure` (`course_structure_id`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `version`
--
ALTER TABLE `version`
  ADD CONSTRAINT `version_ibfk_1` FOREIGN KEY (`major_department_id`) REFERENCES `course_structure` (`course_structure_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `version_ibfk_2` FOREIGN KEY (`auxiliary_department_id`) REFERENCES `course_structure` (`course_structure_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `version_ibfk_3` FOREIGN KEY (`double_major_department_id`) REFERENCES `course_structure` (`course_structure_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `version_ibfk_4` FOREIGN KEY (`teach_class_id`) REFERENCES `course_structure` (`course_structure_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `version_ibfk_5` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `version_ibfk_6` FOREIGN KEY (`general_id`) REFERENCES `course_structure` (`course_structure_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
