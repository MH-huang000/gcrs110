-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-09-30 15:39:55
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
  `user_id` varchar(9) NOT NULL,
  `pwd` varchar(60) NOT NULL,
  `identity` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `account`
--

INSERT INTO `account` (`user_id`, `pwd`, `identity`) VALUES
('A111', '$2a$12$MBgD6xQdc6GADWyrgNi51.FqdoCa7t0dPK/HgWErcfjj86geHzvJm', 'admin'),
('ACS110000', '$2a$12$zJ9CwylU0cbcFDgk8hloqO7UUgZqPzSi/D03YMIPhFkr1aBLtH6qm', 'student'),
('ACS110148', '$2a$12$KBeoH4iuEHmeYp9cmm4thOkS3DG8hvxDvcS.jIiJG8z5sIdalrl2m', 'student'),
('ACS110605', '$2a$12$dyMo7Mnbndwcu3uOgvoONugqkGFMEedqGDw2rETAQKxMYOEHfGOZS', 'student');

-- --------------------------------------------------------

--
-- 資料表結構 `administrator`
--

CREATE TABLE `administrator` (
  `staff_id` int(11) NOT NULL,
  `staff_name` varchar(60) NOT NULL,
  `unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `class_module`
--

CREATE TABLE `class_module` (
  `class_module_id` int(11) NOT NULL,
  `course_class_id` int(11) NOT NULL,
  `class_module_name` varchar(60) NOT NULL,
  `threshold` int(11) NOT NULL,
  `founding_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `class_module`
--

INSERT INTO `class_module` (`class_module_id`, `course_class_id`, `class_module_name`, `threshold`, `founding_year`) VALUES
(1, 1, '共同必修', 1, 110),
(2, 1, '共同選修', 0, 110),
(3, 2, '語文通識', 2, 110),
(4, 2, '通識選修', 3, 110),
(5, 1, '資工系院共同模組', 1, 110),
(6, 3, '資工系系基礎模組', 1, 110),
(7, 3, '資工系系核心模組', 1, 110),
(8, 3, '資工系專業模組', 4, 110),
(9, 3, '資工系自由選修模組', 1, 110);

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
(1, 7, 'A', 403),
(2, 7, 'A', 406),
(3, 7, 'A', 407),
(4, 7, 'A', 409),
(5, 7, 'A', 411),
(6, 7, 'A', 412),
(7, 8, 'A', 1),
(8, 8, 'A', 2),
(9, 8, 'A', 4),
(10, 8, 'A', 5),
(11, 8, 'A', 6),
(12, 8, 'A', 15),
(13, 9, 'A', 3),
(14, 9, 'A', 7),
(15, 9, 'A', 8),
(16, 9, 'A', 9),
(17, 9, 'A', 10),
(18, 9, 'A', 11),
(19, 9, 'A', 12),
(20, 9, 'A', 13),
(21, 9, 'A', 14),
(22, 9, 'A', 16),
(23, 10, 'A', 17),
(24, 10, 'A', 19),
(25, 10, 'A', 23),
(26, 10, 'A', 32),
(27, 10, 'A', 38),
(28, 10, 'A', 43),
(29, 10, 'A', 46),
(30, 11, 'B', 45),
(31, 11, 'B', 20),
(32, 11, 'B', 39),
(33, 11, 'B', 33),
(34, 11, 'B', 29),
(35, 11, 'B', 21),
(36, 11, 'B', 26),
(37, 11, 'B', 44),
(38, 11, 'B', 27),
(39, 12, 'C', 31),
(40, 12, 'C', 41),
(41, 12, 'C', 35),
(42, 12, 'C', 18),
(43, 12, 'C', 49),
(44, 12, 'C', 50),
(45, 12, 'C', 24),
(46, 12, 'C', 42),
(47, 13, 'D', 36),
(48, 13, 'D', 40),
(49, 13, 'D', 48),
(50, 13, 'D', 22),
(51, 13, 'D', 37),
(52, 13, 'D', 414),
(53, 13, 'D', 25),
(54, 13, 'D', 34),
(55, 13, 'D', 28),
(56, 13, 'D', 47),
(57, 13, 'D', 30),
(58, 13, 'D', 51),
(59, 1, 'A', 102),
(60, 1, 'A', 103),
(61, 1, 'A', 104),
(62, 1, 'A', 105),
(63, 2, 'A', 100),
(64, 2, 'A', 101),
(65, 2, 'B', 96),
(66, 2, 'B', 97),
(67, 2, 'B', 98),
(68, 2, 'B', 99),
(69, 3, 'B', 146),
(70, 3, 'B', 147),
(71, 3, 'B', 149),
(72, 3, 'B', 148),
(73, 3, 'B', 150),
(74, 3, 'B', 151),
(75, 3, 'B', 152),
(76, 3, 'B', 153),
(77, 3, 'B', 154),
(78, 3, 'B', 155),
(79, 3, 'B', 156),
(80, 3, 'B', 157),
(81, 3, 'B', 158),
(82, 3, 'B', 159),
(83, 3, 'B', 161),
(84, 3, 'B', 162),
(85, 3, 'B', 163),
(86, 3, 'B', 164),
(87, 3, 'B', 167),
(88, 3, 'B', 168),
(89, 3, 'B', 169),
(90, 3, 'B', 170),
(91, 3, 'B', 171),
(92, 3, 'B', 172),
(93, 3, 'B', 173),
(94, 3, 'B', 174),
(95, 3, 'B', 175),
(96, 3, 'B', 176),
(97, 3, 'B', 177),
(98, 3, 'B', 178),
(99, 3, 'B', 179),
(100, 3, 'B', 165),
(101, 3, 'B', 166),
(102, 3, 'B', 160),
(103, 5, 'B', 118),
(104, 5, 'B', 117),
(105, 5, 'B', 114),
(106, 5, 'B', 113),
(107, 5, 'B', 112),
(108, 5, 'B', 111),
(109, 5, 'B', 110),
(110, 5, 'B', 109),
(111, 5, 'B', 108),
(112, 5, 'B', 107),
(113, 5, 'B', 116),
(114, 5, 'B', 115),
(115, 5, 'B', 120),
(116, 5, 'B', 106),
(117, 5, 'B', 130),
(118, 5, 'B', 135),
(119, 5, 'B', 124),
(120, 5, 'B', 121),
(121, 5, 'B', 131),
(122, 5, 'B', 119),
(123, 5, 'B', 133),
(124, 5, 'B', 144),
(125, 5, 'B', 139),
(126, 5, 'B', 138),
(127, 5, 'B', 127),
(128, 5, 'B', 129),
(129, 5, 'B', 134),
(130, 5, 'B', 135),
(131, 5, 'B', 137),
(132, 5, 'B', 145),
(133, 5, 'B', 128),
(134, 5, 'B', 143),
(135, 5, 'B', 142),
(136, 5, 'B', 141),
(137, 5, 'B', 140),
(138, 5, 'B', 136),
(139, 5, 'B', 122),
(140, 5, 'B', 123),
(141, 5, 'B', 125),
(142, 5, 'B', 126),
(143, 4, 'B', 189),
(144, 4, 'B', 190),
(145, 4, 'B', 192),
(146, 4, 'B', 193),
(147, 4, 'B', 194),
(148, 4, 'B', 195),
(149, 4, 'B', 196),
(150, 4, 'B', 197),
(151, 4, 'B', 198),
(152, 4, 'B', 199),
(153, 4, 'B', 200),
(154, 4, 'B', 197),
(155, 4, 'B', 188),
(156, 4, 'B', 187),
(157, 4, 'B', 186),
(158, 4, 'B', 185),
(159, 4, 'B', 184),
(160, 4, 'B', 183),
(161, 4, 'B', 180),
(162, 4, 'B', 181),
(163, 4, 'B', 182),
(164, 4, 'B', 191),
(165, 3, 'A', 146),
(166, 3, 'A', 147),
(167, 3, 'A', 148),
(168, 3, 'A', 149),
(169, 4, 'A', 180),
(170, 4, 'A', 181),
(171, 4, 'A', 182),
(172, 5, 'A', 106),
(173, 5, 'A', 107),
(174, 5, 'A', 108),
(175, 5, 'A', 109);

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
(3, 'ACS110605', 1, 60, 1, 110),
(4, 'ACS110605', 36, 93, 1, 110),
(5, 'ACS110605', 96, 94, 1, 110),
(6, 'ACS110605', 120, 82, 1, 110),
(7, 'ACS110605', 130, 84, 1, 110),
(8, 'ACS110605', 100, 90, 1, 110),
(9, 'ACS110605', 195, 88, 1, 110),
(10, 'ACS110605', 403, 91, 1, 110),
(11, 'ACS110605', 406, 97, 1, 110),
(12, 'ACS110605', 407, 63, 1, 110),
(13, 'ACS110605', 4, 92, 1, 110),
(14, 'ACS110605', 5, 89, 1, 110),
(15, 'ACS110605', 6, 83, 1, 110),
(16, 'ACS110605', 9, 83, 1, 110),
(17, 'ACS110605', 15, 91, 1, 110),
(18, 'ACS110605', 97, 93, 1, 110),
(19, 'ACS110605', 101, 86, 1, 110),
(20, 'ACS110605', 103, 86, 1, 110),
(21, 'ACS110605', 108, 86, 1, 110),
(22, 'ACS110605', 159, 90, 1, 110),
(23, 'ACS110148', 1, 74, 1, 110),
(24, 'ACS110148', 36, 72, 1, 110),
(25, 'ACS110148', 96, 96, 1, 110),
(26, 'ACS110148', 100, 86, 1, 110),
(27, 'ACS110148', 102, 79, 1, 110),
(28, 'ACS110148', 146, 71, 1, 110),
(29, 'ACS110148', 403, 63, 1, 110),
(30, 'ACS110148', 406, 78, 1, 110),
(31, 'ACS110148', 407, 68, 1, 110),
(32, 'ACS110148', 4, 51, 2, 110),
(33, 'ACS110148', 5, 52, 2, 110),
(34, 'ACS110148', 6, 44, 2, 110),
(35, 'ACS110148', 9, 40, 2, 110),
(36, 'ACS110148', 15, 16, 2, 110),
(37, 'ACS110148', 78, 60, 1, 110),
(38, 'ACS110148', 97, 95, 1, 110),
(39, 'ACS110148', 101, 87, 1, 110),
(40, 'ACS110148', 103, 85, 1, 110),
(41, 'ACS110148', 147, 68, 1, 110);

-- --------------------------------------------------------

--
-- 資料表結構 `course_module`
--

CREATE TABLE `course_module` (
  `course_package_id` int(11) NOT NULL,
  `course_module_id` varchar(1) NOT NULL,
  `module_name` varchar(60) NOT NULL,
  `teach_required_credits` float NOT NULL,
  `non_tech_required_credits` float NOT NULL,
  `tech_elective_credits` float NOT NULL,
  `non_tech_elective_credits` float NOT NULL,
  `class_module_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `course_module`
--

INSERT INTO `course_module` (`course_package_id`, `course_module_id`, `module_name`, `teach_required_credits`, `non_tech_required_credits`, `tech_elective_credits`, `non_tech_elective_credits`, `class_module_id`, `unit_id`) VALUES
(1, 'A', '體育', 0, 2, 0, 0, 1, 0),
(2, 'A', '國文', 0, 4, 0, 0, 3, 0),
(2, 'B', '英文', 0, 4, 0, 0, 3, 0),
(3, 'A', '數理核心', 0, 0, 0, 2, 4, 0),
(3, 'B', '數理非核心', 0, 0, 0, 4, 4, 0),
(4, 'A', '藝術核心', 0, 0, 0, 2, 4, 0),
(4, 'B', '藝術非核心', 0, 0, 0, 2, 4, 0),
(5, 'A', '社會核心', 0, 0, 0, 4, 4, 0),
(5, 'B', '社會非核心', 0, 0, 0, 4, 4, 0),
(7, 'A', '資工系院共同', 0, 9, 0, 0, 5, 1),
(8, 'A', '資工系系基礎', 0, 16, 0, 0, 6, 1),
(9, 'A', '資工系系核心', 0, 25, 0, 0, 7, 1),
(10, 'A', '基礎程式設計', 0, 0, 0, 6, 8, 1),
(11, 'B', '通訊網路理論', 0, 0, 0, 9, 8, 1),
(12, 'C', '軟體與系統理論', 0, 0, 0, 9, 8, 1),
(13, 'D', '整合性實作', 0, 0, 0, 6, 8, 1),
(14, 'A', '自由', 0, 0, 0, 20, 9, 1);

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
(9, '數位系主修110課架', 110, 1, 'ADT'),
(10, '數教系主修110課架', 110, 1, 'AMA'),
(11, '科教系主修110課架', 110, 1, 'ACS');

-- --------------------------------------------------------

--
-- 資料表結構 `cscm_table`
--

CREATE TABLE `cscm_table` (
  `course_structure_id` int(11) NOT NULL,
  `class_module_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `cscm_table`
--

INSERT INTO `cscm_table` (`course_structure_id`, `class_module_id`) VALUES
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(2, 3),
(2, 4),
(4, 6),
(4, 7),
(5, 5),
(5, 6),
(5, 7),
(2, 1),
(2, 2);

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
('AGE', '通識中心'),
('AMA', '數教系'),
('ASC', '科教系');

-- --------------------------------------------------------

--
-- 資料表結構 `department_list`
--

CREATE TABLE `department_list` (
  `id` int(11) NOT NULL,
  `course_structure_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `equivalent_subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `mentor_assignment`
--

CREATE TABLE `mentor_assignment` (
  `mentor_id` int(11) NOT NULL,
  `student_id` varchar(9) NOT NULL,
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
-- 資料表結構 `school_unit`
--

CREATE TABLE `school_unit` (
  `unit_id` int(11) NOT NULL,
  `unit_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `school_unit`
--

INSERT INTO `school_unit` (`unit_id`, `unit_name`) VALUES
(0, '通識中心'),
(1, '資工系'),
(2, '數位系'),
(3, '數教系'),
(4, '科教系');

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
('ACS110000', '測試人員A', 3, NULL, NULL, NULL, NULL),
('ACS110148', '何廷羱', 3, NULL, NULL, NULL, NULL),
('ACS110605', '余政憲', 3, NULL, NULL, NULL, NULL);

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
(106, 'AGE20020', 110, '認識臺灣', 'Getting to Know Taiwan：Trends and Insights', 2, 1),
(107, 'AGE20030', 110, '人文關懷體驗', 'The Practice and Experience of Humanity Care', 2, 1),
(108, 'AGE20050', 110, '當代社會議題', 'Social Issues in Contemporary Taiwan', 2, 1),
(109, 'AGE20060', 110, '經典的智慧', 'Wisdom of Classics', 2, 1),
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
(146, 'AGE30010', 110, '邏輯思考與應用', 'Logical Thinking and Application', 2, 1),
(147, 'AGE30020', 110, '自然、科技與社會', 'Science, Technology and Society', 2, 1),
(148, 'AGE30030', 110, '資訊與生活', 'Information and Life', 2, 0),
(149, 'AGE30040', 110, '運算思維與程式設計', 'Computational Thinking and Programming', 2, 1),
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
(180, 'AGE40010', 110, '視覺藝術與社會', 'Visual Art in Social Contexts', 2, 1),
(181, 'AGE40020', 110, '音樂話中西', 'Discourse of Chinese and Western Music', 2, 1),
(182, 'AGE40030', 110, '舞蹈藝術賞析', 'Arts and Appreciation for Dance', 2, 1),
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
(204, 'AGE61110', 110, '全民國防教育軍事訓練－全民國防', 'All-out Defense Education Military Training－Civil Defense', 2, 1),
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
(272, 'AMA40030', 110, '資料庫', 'Database', 3, 0),
(273, 'AMA40050', 110, '數位課程設計', 'E-Learning Course Design', 3, 0),
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
(400, 'ZCS00031', 110, '微積分', 'Calculus', 6, 1),
(401, 'ZCS00032', 110, '微積分', 'Calculus', 6, 1),
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
(414, 'ZCS00200', 110, '跨領域專題製作', 'Interdisciplinary Project', 3, 0);

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
  ADD PRIMARY KEY (`user_id`);

--
-- 資料表索引 `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `unitId` (`unit_id`);

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
  ADD KEY `unitId` (`unit_id`),
  ADD KEY `classModuleId` (`class_module_id`);

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
  ADD KEY `CourseStructure_ID` (`course_structure_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `equivalent_subject_id` (`equivalent_subject_id`);

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
-- 資料表索引 `school_unit`
--
ALTER TABLE `school_unit`
  ADD PRIMARY KEY (`unit_id`);

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
-- 使用資料表自動遞增(AUTO_INCREMENT) `class_module`
--
ALTER TABLE `class_module`
  MODIFY `class_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `coursemodule_subject`
--
ALTER TABLE `coursemodule_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `course_data`
--
ALTER TABLE `course_data`
  MODIFY `course_data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `course_structure`
--
ALTER TABLE `course_structure`
  MODIFY `course_structure_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `sgdc`
--
ALTER TABLE `sgdc`
  MODIFY `sgdc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=415;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `version`
--
ALTER TABLE `version`
  MODIFY `version_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `school_unit` (`unit_id`) ON UPDATE CASCADE;

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
  ADD CONSTRAINT `course_module_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `school_unit` (`unit_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `course_module_ibfk_2` FOREIGN KEY (`class_module_id`) REFERENCES `class_module` (`class_module_id`) ON UPDATE CASCADE;

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
  ADD CONSTRAINT `department_list_ibfk_2` FOREIGN KEY (`equivalent_subject_id`) REFERENCES `subject` (`subject_id`) ON UPDATE CASCADE;

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
