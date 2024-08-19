-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-08-19 12:43:27
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
  `user_ID` varchar(9) NOT NULL,
  `pwd` varchar(60) NOT NULL,
  `identity` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `account`
--

INSERT INTO `account` (`user_ID`, `pwd`, `identity`) VALUES
('A111', '$2a$12$MBgD6xQdc6GADWyrgNi51.FqdoCa7t0dPK/HgWErcfjj86geHzvJm', 'admin'),
('ACS110105', '$2a$12$dyMo7Mnbndwcu3uOgvoONugqkGFMEedqGDw2rETAQKxMYOEHfGOZS', 'student');

-- --------------------------------------------------------

--
-- 資料表結構 `administrator`
--

CREATE TABLE `administrator` (
  `Staff_ID` int(11) NOT NULL,
  `Staff_Name` varchar(60) NOT NULL,
  `Unit_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `classmodule`
--

CREATE TABLE `classmodule` (
  `Class_Module_ID` int(11) NOT NULL,
  `Course_Class_ID` int(11) NOT NULL,
  `Class_Module_Name` varchar(60) NOT NULL,
  `Threshold` int(11) NOT NULL,
  `Founding_Year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `classmodule`
--

INSERT INTO `classmodule` (`Class_Module_ID`, `Course_Class_ID`, `Class_Module_Name`, `Threshold`, `Founding_Year`) VALUES
(1, 1, '校必修', 1, 110),
(2, 1, '校選修', 0, 110),
(3, 2, '語文通識', 2, 110),
(4, 2, '通識選修', 3, 110),
(5, 1, '資工系院共同模組', 1, 110),
(6, 3, '資工系系基礎模組', 1, 110),
(7, 3, '資工系系核心模組', 1, 110),
(8, 3, '資工系專業模組', 4, 110),
(9, 3, '資工系自由選修模組', 1, 110);

-- --------------------------------------------------------

--
-- 資料表結構 `coursemodule`
--

CREATE TABLE `coursemodule` (
  `Course_Package_ID` int(11) NOT NULL,
  `Course_Module_ID` varchar(1) NOT NULL,
  `Module_Name` varchar(60) NOT NULL,
  `Tech_Required_Credits` float NOT NULL,
  `Non_Tech_Required_Credits` float NOT NULL,
  `Tech_Elective_Credits` float NOT NULL,
  `Non_Tech_Elective_Credits` float NOT NULL,
  `Class_Module_ID` int(11) NOT NULL,
  `Unit_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `coursemodule`
--

INSERT INTO `coursemodule` (`Course_Package_ID`, `Course_Module_ID`, `Module_Name`, `Tech_Required_Credits`, `Non_Tech_Required_Credits`, `Tech_Elective_Credits`, `Non_Tech_Elective_Credits`, `Class_Module_ID`, `Unit_ID`) VALUES
(1, 'A', '體育', 0, 2, 0, 0, 1, 0),
(2, 'A', '國文', 0, 4, 0, 0, 3, 0),
(2, 'B', '英文', 0, 4, 0, 0, 3, 0),
(3, 'A', '數理核心', 0, 0, 0, 2, 4, 0),
(3, 'B', '數理非核心', 0, 0, 4, 0, 4, 0),
(4, 'A', '藝術核心', 0, 0, 0, 2, 4, 0),
(4, 'B', '藝術非核心', 0, 0, 2, 0, 4, 0),
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
-- 資料表結構 `coursemodule_subject`
--

CREATE TABLE `coursemodule_subject` (
  `ID` int(11) NOT NULL,
  `Course_Package_ID` int(11) NOT NULL,
  `Course_Module_ID` varchar(1) NOT NULL,
  `Subject_ID` varchar(8) NOT NULL,
  `Academic_Year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `coursemodule_subject`
--

INSERT INTO `coursemodule_subject` (`ID`, `Course_Package_ID`, `Course_Module_ID`, `Subject_ID`, `Academic_Year`) VALUES
(1, 7, 'A', 'ZCS00050', 110),
(2, 7, 'A', 'ZCS00080', 110),
(3, 7, 'A', 'ZCS00090', 110),
(4, 7, 'A', 'ZCS00110', 110),
(5, 7, 'A', 'ZCS00140', 110),
(6, 7, 'A', 'ZCS00150', 110),
(7, 8, 'A', 'ACS00050', 110),
(8, 8, 'A', 'ACS00060', 110),
(9, 8, 'A', 'ACS00120', 110),
(10, 8, 'A', 'ACS00130', 110),
(11, 8, 'A', 'ACS00140', 110),
(12, 8, 'A', 'ACS00270', 110),
(13, 9, 'A', 'ACS00110', 110),
(14, 9, 'A', 'ACS00150', 110),
(15, 9, 'A', 'ACS00170', 110),
(16, 9, 'A', 'ACS00180', 110),
(17, 9, 'A', 'ACS00190', 110),
(18, 9, 'A', 'ACS00200', 110),
(19, 9, 'A', 'ACS00210', 110),
(20, 9, 'A', 'ACS00240', 110),
(21, 9, 'A', 'ACS00250', 110),
(22, 9, 'A', 'ACS00350', 110),
(23, 10, 'A', 'ACS20030', 110),
(24, 10, 'A', 'ACS20270', 110),
(25, 10, 'A', 'ACS20410', 110),
(26, 10, 'A', 'ACS20600', 110),
(27, 10, 'A', 'ACS20690', 110),
(28, 10, 'A', 'ACS20770', 110),
(29, 10, 'A', 'ACS20800', 110),
(30, 11, 'B', 'ACS20790', 110),
(31, 11, 'B', 'ACS20310', 110),
(32, 11, 'B', 'ACS20710', 110),
(33, 11, 'B', 'ACS20630', 110),
(34, 11, 'B', 'ACS20520', 110),
(35, 11, 'B', 'ACS20340', 110),
(36, 11, 'B', 'ACS20470', 110),
(37, 11, 'B', 'ACS20780', 110),
(38, 11, 'B', 'ACS20480', 110),
(39, 12, 'C', 'ACS20570', 110),
(40, 12, 'C', 'ACS20730', 110),
(41, 12, 'C', 'ACS20660', 110),
(42, 12, 'C', 'ACS20150', 110),
(43, 12, 'C', 'ACS20830', 110),
(44, 12, 'C', 'ACS20840', 110),
(45, 12, 'C', 'ACS20440', 110),
(46, 12, 'C', 'ACS20760', 110),
(47, 13, 'D', 'ACS20670', 110),
(48, 13, 'D', 'ACS20720', 110),
(49, 13, 'D', 'ACS20820', 110),
(50, 13, 'D', 'ACS20400', 110),
(51, 13, 'D', 'ACS20680', 110),
(52, 13, 'D', 'ZCS00200', 110),
(53, 13, 'D', 'ACS20450', 110),
(54, 13, 'D', 'ACS20640', 110),
(55, 13, 'D', 'ACS20500', 110),
(56, 13, 'D', 'ACS20810', 110),
(57, 13, 'D', 'ACS20530', 110),
(58, 13, 'D', 'ACS20850', 110),
(59, 1, 'A', 'AGE06070', 110),
(60, 1, 'A', 'AGE06080', 110),
(61, 1, 'A', 'AGE06090', 110),
(62, 1, 'A', 'AGE06100', 110),
(63, 2, 'A', 'AGE01071', 110),
(64, 2, 'A', 'AGE01072', 110),
(65, 2, 'B', 'AGE01031', 110),
(66, 2, 'B', 'AGE01032', 110),
(67, 2, 'B', 'AGE01050', 110),
(68, 2, 'B', 'AGE01060', 110),
(69, 3, 'A', 'AGE30010', 110),
(70, 3, 'A', 'AGE30020', 110),
(71, 3, 'A', 'AGE30040', 110),
(72, 3, 'A', 'AGE30030', 110),
(73, 3, 'A', 'AGE31010', 110),
(74, 3, 'A', 'AGE31140', 110),
(75, 3, 'A', 'AGE31150', 110),
(76, 3, 'A', 'AGE31160', 110),
(77, 3, 'A', 'AGE32120', 110),
(78, 3, 'A', 'AGE32130', 110),
(79, 3, 'A', 'AGE32150', 110),
(80, 3, 'A', 'AGE32160', 110),
(81, 3, 'A', 'AGE32170', 110),
(82, 3, 'A', 'AGE32180', 110),
(83, 3, 'A', 'AGE33010', 110),
(84, 3, 'A', 'AGE33060', 110),
(85, 3, 'A', 'AGE33070', 110),
(86, 3, 'A', 'AGE33090', 110),
(87, 3, 'A', 'AGE34230', 110),
(88, 3, 'A', 'AGE34260', 110),
(89, 3, 'A', 'AGE34290', 110),
(90, 3, 'A', 'AGE34310', 110),
(91, 3, 'A', 'AGE34320', 110),
(92, 3, 'A', 'AGE34860', 110),
(93, 3, 'A', 'AGE35040', 110),
(94, 3, 'A', 'AGE35070', 110),
(95, 3, 'A', 'AGE36010', 110),
(96, 3, 'A', 'AGE37010', 110),
(97, 3, 'A', 'AGE37020', 110),
(98, 3, 'A', 'AGE37030', 110),
(99, 3, 'A', 'AGE38010', 110),
(100, 3, 'A', 'AGE33100', 110),
(101, 3, 'A', 'AGE33110', 110),
(102, 3, 'A', 'AGE32190', 110),
(103, 5, 'A', 'AGE21480', 110),
(104, 5, 'A', 'AGE21470', 110),
(105, 5, 'A', 'AGE21430', 110),
(106, 5, 'A', 'AGE21420', 110),
(107, 5, 'A', 'AGE21380', 110),
(108, 5, 'A', 'AGE21370', 110),
(109, 5, 'A', 'AGE21160', 110),
(110, 5, 'A', 'AGE20060', 110),
(111, 5, 'A', 'AGE20050', 110),
(112, 5, 'A', 'AGE20030', 110),
(113, 5, 'A', 'AGE22490', 110),
(114, 5, 'A', 'AGE21460', 110),
(115, 5, 'A', 'AGE21440', 110),
(116, 5, 'A', 'AGE20020', 110),
(117, 5, 'A', 'AGE21860', 110),
(118, 5, 'A', 'AGE20050', 110),
(119, 5, 'A', 'AGE20030', 110),
(120, 5, 'A', 'AGE20020', 110),
(121, 5, 'A', 'AGE23150', 110),
(122, 5, 'A', 'AGE21460', 110),
(123, 5, 'A', 'AGE21420', 110),
(124, 5, 'A', 'AGE22550', 110),
(125, 5, 'A', 'AGE22490', 110),
(126, 5, 'A', 'AGE21440', 110),
(127, 5, 'A', 'AGE21430', 110),
(128, 5, 'A', 'AGE21490', 110),
(129, 5, 'A', 'AGE26020', 110),
(130, 5, 'A', 'AGE24110', 110),
(131, 5, 'A', 'AGE24080', 110),
(132, 5, 'A', 'AGE22590', 110),
(133, 5, 'A', 'AGE23090', 110),
(134, 5, 'A', 'AGE23140', 110),
(135, 5, 'A', 'AGE23170', 110),
(136, 5, 'A', 'AGE28010', 110),
(137, 5, 'A', 'AGE22600', 110),
(138, 5, 'A', 'AGE26010', 110),
(139, 5, 'A', 'AGE25050', 110),
(140, 5, 'A', 'AGE24130', 110),
(141, 5, 'A', 'AGE24120', 110),
(142, 5, 'A', 'AGE23160', 110),
(143, 4, 'A', 'AGE41270', 110),
(144, 4, 'A', 'AGE41280', 110),
(145, 4, 'A', 'AGE42580', 110),
(146, 4, 'A', 'AGE42590', 110),
(147, 4, 'A', 'AGE42620', 110),
(148, 4, 'A', 'AGE42630', 110),
(149, 4, 'A', 'AGE42640', 110),
(150, 4, 'A', 'AGE41260', 110),
(151, 4, 'A', 'AGE41250', 110),
(152, 4, 'A', 'AGE41220', 110),
(153, 4, 'A', 'AGE41160', 110),
(154, 4, 'A', 'AGE41120', 110),
(155, 4, 'A', 'AGE41020', 110),
(156, 4, 'A', 'AGE40030', 110),
(157, 4, 'A', 'AGE40020', 110),
(158, 4, 'A', 'AGE41290', 110),
(159, 4, 'A', 'AGE41160', 110),
(160, 4, 'A', 'AGE41220', 110),
(161, 4, 'A', 'AGE41250', 110),
(162, 4, 'A', 'AGE41260', 110),
(163, 4, 'A', 'AGE41290', 110);

-- --------------------------------------------------------

--
-- 資料表結構 `coursestructure`
--

CREATE TABLE `coursestructure` (
  `Course_Structure_ID` int(11) NOT NULL,
  `Course_Structure_Name` varchar(60) NOT NULL,
  `Academic_Year` int(11) NOT NULL,
  `Department_ID` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `coursestructure`
--

INSERT INTO `coursestructure` (`Course_Structure_ID`, `Course_Structure_Name`, `Academic_Year`, `Department_ID`) VALUES
(1, '校110課架', 110, 'A'),
(2, '通識110課架', 110, 'AGE'),
(3, '資工系主修110課架', 110, 'ACS'),
(7, '資工系輔修110課架', 110, 'ACS'),
(8, '資工系雙主修110課架', 110, 'ACS');

-- --------------------------------------------------------

--
-- 資料表結構 `course_data`
--

CREATE TABLE `course_data` (
  `Course_Data_ID` int(11) NOT NULL,
  `Student_ID` varchar(9) NOT NULL,
  `Subject_ID` varchar(8) NOT NULL,
  `Academic_Year` int(11) NOT NULL,
  `Grade` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `cscm_table`
--

CREATE TABLE `cscm_table` (
  `Course_Structure_ID` int(11) NOT NULL,
  `Class_Module_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `cscm_table`
--

INSERT INTO `cscm_table` (`Course_Structure_ID`, `Class_Module_ID`) VALUES
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(2, 3),
(2, 4),
(1, 1),
(1, 2),
(7, 6),
(7, 7),
(8, 5),
(8, 6),
(8, 7);

-- --------------------------------------------------------

--
-- 資料表結構 `department`
--

CREATE TABLE `department` (
  `Department_ID` varchar(3) NOT NULL,
  `Department_Name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `department`
--

INSERT INTO `department` (`Department_ID`, `Department_Name`) VALUES
('A', '教務處'),
('ACS', '資訊工程系'),
('AGE', '通識中心');

-- --------------------------------------------------------

--
-- 資料表結構 `department_list`
--

CREATE TABLE `department_list` (
  `ID` int(11) NOT NULL,
  `CourseStructure_ID` int(11) NOT NULL,
  `Department_ID` int(11) NOT NULL,
  `Subject_ID` varchar(8) NOT NULL,
  `Equivalent_Subject_ID` varchar(8) NOT NULL,
  `Academic_Year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `mentor_assignment`
--

CREATE TABLE `mentor_assignment` (
  `Mentor_ID` int(11) NOT NULL,
  `Unit_ID` int(11) NOT NULL,
  `Version_ID` int(11) NOT NULL,
  `Annotation` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `recognition_table`
--

CREATE TABLE `recognition_table` (
  `ID` int(11) NOT NULL,
  `Student_ID` varchar(9) NOT NULL,
  `Subject_ID` varchar(11) NOT NULL,
  `Equivalent_Subject_ID` varchar(8) NOT NULL,
  `Academic_Year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `school_unit`
--

CREATE TABLE `school_unit` (
  `Unit_ID` int(11) NOT NULL,
  `Unit_Name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `school_unit`
--

INSERT INTO `school_unit` (`Unit_ID`, `Unit_Name`) VALUES
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
  `Course_Data_ID` int(11) NOT NULL,
  `Version_ID` int(11) NOT NULL,
  `Student_ID` varchar(9) NOT NULL,
  `Course_package_ID` int(11) NOT NULL,
  `Course_module_ID` varchar(1) NOT NULL,
  `Major_List_Available` int(11) NOT NULL,
  `Student_List_Available` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `Remark` text NOT NULL,
  `Manual_Review_Passed` int(11) NOT NULL,
  `transfer_subject_ID` varchar(8) NOT NULL,
  `transfer_Academic_Year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `student`
--

CREATE TABLE `student` (
  `Student_ID` varchar(9) NOT NULL,
  `Student_Name` varchar(60) NOT NULL,
  `Major_Department_ID` int(11) NOT NULL,
  `Auxiliary_Department_ID` int(11) DEFAULT NULL,
  `Double_Major_Department_ID` int(11) DEFAULT NULL,
  `Teach_Class_ID` int(11) DEFAULT NULL,
  `Official_Review_Version_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `student`
--

INSERT INTO `student` (`Student_ID`, `Student_Name`, `Major_Department_ID`, `Auxiliary_Department_ID`, `Double_Major_Department_ID`, `Teach_Class_ID`, `Official_Review_Version_ID`) VALUES
('ACS110105', '余政憲', 3, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `subject`
--

CREATE TABLE `subject` (
  `Subject_ID` varchar(8) NOT NULL,
  `Academic_Year` int(11) NOT NULL,
  `Cname` varchar(60) NOT NULL,
  `Ename` varchar(60) NOT NULL,
  `Credit` float NOT NULL,
  `Sel` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `subject`
--

INSERT INTO `subject` (`Subject_ID`, `Academic_Year`, `Cname`, `Ename`, `Credit`, `Sel`) VALUES
('ACS00050', 110, '程式設計', 'Programming', 3, 1),
('ACS00060', 110, '線性代數', 'Linear Algebra', 3, 1),
('ACS00110', 110, '資料結構', 'Data Structure', 3, 1),
('ACS00120', 110, '離散數學', 'Discrete Mathematic', 3, 1),
('ACS00130', 110, '數位邏輯設計', 'Digital Logic Design', 3, 1),
('ACS00140', 110, '數位邏輯設計實驗', 'Digital Logic Design Experiment', 1, 1),
('ACS00150', 110, '系統程式', 'System Programming', 3, 1),
('ACS00170', 110, '演算法', 'Algorithm', 3, 1),
('ACS00180', 110, '計算機網路', 'Computer Networks', 3, 1),
('ACS00190', 110, '作業系統', 'Operating System', 3, 1),
('ACS00200', 110, '軟體工程', 'Software Engineering', 3, 1),
('ACS00210', 110, '計算機組織', 'Computer Organization', 3, 1),
('ACS00240', 110, '資訊專題(I)', 'Information Project（I）', 2, 1),
('ACS00250', 110, '資訊專題(II)', 'Information Project（II）', 2, 1),
('ACS00270', 110, '進階程式設計', 'Advanced Computer Programming', 3, 1),
('ACS00350', 110, '程式能力檢定', 'Programming Certification', 0, 1),
('ACS20030', 110, '物件導向程式設計', 'Object-Oriented Programming', 3, 0),
('ACS20150', 110, '人工智慧', 'Artificial Intelligence', 3, 0),
('ACS20270', 110, '編譯程式', 'Compiler', 3, 0),
('ACS20310', 110, '機率', 'Probability', 3, 0),
('ACS20340', 110, '網路管理與分析', 'Network Management and Analysis', 3, 0),
('ACS20400', 110, '專題研究(I)', 'Special Topic of Information Technology（I）', 3, 0),
('ACS20410', 110, '網路程式設計', 'Network Programming', 3, 0),
('ACS20440', 110, '計算機結構', 'Computer Architecture', 3, 0),
('ACS20450', 110, '專題研究(II)', 'Special Topic of Information Technology（II）', 3, 0),
('ACS20470', 110, '網路安全', 'Network Security', 3, 0),
('ACS20480', 110, '無線網路', 'Introduction to Wireless Network', 3, 0),
('ACS20500', 110, '專題研究(III)', 'Special Topic of Information Technology（III', 3, 0),
('ACS20520', 110, '行動通訊', 'Mobile Communication', 3, 0),
('ACS20530', 110, '專題研究(IV)', 'Special Topic of Information Technology（IV）', 3, 0),
('ACS20570', 110, '資料庫系統', 'Database System', 3, 0),
('ACS20600', 110, '資料庫程式設計', 'Database Programming', 3, 0),
('ACS20630', 110, '密碼學導論', 'Introduction to Cryptography', 3, 0),
('ACS20640', 110, '軟體工程實務', 'Software Engineering Practice', 3, 0),
('ACS20660', 110, '高效能計算', 'High-Performance Computing', 3, 0),
('ACS20670', 110, 'UNIX應用實務', 'UNIX Practices and Applications', 3, 0),
('ACS20680', 110, '資訊專業實習', 'Professional Practicumin Computer Science', 3, 0),
('ACS20690', 110, '網頁程式設計', 'Web Programming', 3, 0),
('ACS20710', 110, '多媒體網路', 'Multimedia Networking', 3, 0),
('ACS20720', 110, '電子電路學', 'Electronics and Electric Circuits', 3, 0),
('ACS20730', 110, '系統分析與設計', 'System Analysis and Design', 3, 0),
('ACS20760', 110, '雲端運算概論', 'Introduction to Cloud Computing', 3, 0),
('ACS20770', 110, '雲端程式設計', 'Programming for Cloud Computing', 3, 0),
('ACS20780', 110, '物聯網概論', 'Introduction to Internet of Things', 3, 0),
('ACS20790', 110, '網際網路原理概論', 'Introduction to the Principles of Internet', 3, 0),
('ACS20800', 110, '視窗程式設計', 'Windows Programming', 3, 0),
('ACS20810', 110, '物聯網實務', 'Internet of Things Practice', 3, 0),
('ACS20820', 110, '巨量資料分析', 'Big Data Analyze', 3, 0),
('ACS20830', 110, '嵌入式微處理機概論', 'Introduction to Embedded Microprocessor Systems', 3, 0),
('ACS20840', 110, '機器學習', 'Machine Learning', 3, 0),
('ACS20850', 110, '產業資訊實習', 'Industry Information Practice', 6, 0),
('ADT00070', 110, '程式設計', 'Programming', 3, 1),
('ADT00120', 110, '資料結構', 'Data Structure', 3, 1),
('ADT00340', 110, '腳本設計', 'Script Writing', 3, 1),
('ADT00350', 110, '計算機網路', 'Computer network', 3, 1),
('ADT00400', 110, '專案企劃', 'Project Planning', 3, 1),
('ADT00460', 110, '認知心理學', 'Cognitive Psychology ', 3, 1),
('ADT00490', 110, '資料庫管理', 'Database Management', 3, 1),
('ADT00500', 110, '基本設計', 'Basic Design', 3, 1),
('ADT00510', 110, '設計方法', 'Design Method', 3, 1),
('ADT00520', 110, '創意產業行銷', 'Creative Industry Marketing', 3, 1),
('ADT00530', 110, '創意產業設計', 'Creative Industry Design', 3, 1),
('ADT00540', 110, '設計整合', 'Design Practice', 3, 1),
('ADT00550', 110, '專題製作與應用', 'Project Production and Application', 2, 1),
('ADT00560', 110, '專題製作成果展出(I)', 'Individual Project Exhibition (I)', 1, 1),
('ADT00570', 110, '專題製作成果展出(II)', 'Individual Project Exhibition (II)', 1, 1),
('ADT10220', 110, '作業系統', 'Operating System', 3, 0),
('ADT10360', 110, '多媒體概論', 'Introduction to Multimedia', 3, 0),
('ADT10390', 110, '離散數學', 'Discrete Mathematic', 3, 0),
('ADT10440', 110, '網頁程式設計', 'Web Programming Design', 3, 0),
('ADT10850', 110, '作品集與展示規劃', 'Design Portfolio and Display', 3, 0),
('ADT10890', 110, '網頁設計', 'Web Design', 3, 0),
('ADT10900', 110, '互動媒體設計', 'Interactive Media Design', 3, 0),
('ADT10950', 110, '遊戲設計概論', 'Introduction to Game Design', 3, 0),
('ADT10990', 110, '網際網路與應用', 'Internet and Application', 3, 0),
('ADT11010', 110, '人工智慧應用', 'Artificial Intelligence Application', 3, 0),
('ADT11020', 110, '電腦繪圖I', 'Computer GraphicsI', 3, 0),
('ADT11030', 110, '電腦繪圖II', 'Computer Graphics Ⅱ', 3, 0),
('ADT11040', 110, '數位整合傳播', 'Digital Integrated Communication', 3, 0),
('ADT11050', 110, '角色設定', 'Character Design', 3, 0),
('ADT11060', 110, '數位課程設計', 'Digital Curriculum Design', 3, 0),
('ADT11070', 110, '數位影片製作', 'Digital Cinematic', 3, 0),
('ADT11080', 110, '電腦動畫', 'Animation', 3, 0),
('ADT11130', 110, '行動APP設計', 'Mobile App Design', 3, 0),
('ADT11140', 110, '數位文化商品設計', 'Digital Cultural Product Design', 3, 0),
('ADT11150', 110, '互動媒體專題', 'Interactive Media Project', 3, 0),
('ADT11160', 110, '互動玩具與教具設計', 'Interactive Toy and Teaching Aid Design', 3, 0),
('ADT11170', 110, '社群網路應用', 'Social Network Application', 3, 0),
('ADT11180', 110, '電子商務與數位互動行銷', 'Information System Project Study', 3, 0),
('ADT11190', 110, '角色設定', 'Photography Theory', 3, 0),
('ADT11200', 110, '科技藝術', 'Technology Art', 3, 0),
('ADT11210', 110, '電子商務與數位互動行銷', 'Electronic Commerce and Internet Marketing', 3, 0),
('ADT11220', 110, '研究與學習', 'Research and learning', 3, 0),
('ADT11230', 110, '職場探索與增能', 'Workplace exploration and employee empowerment', 3, 0),
('ADT11240', 110, '物聯網系統設計應用', 'The design and application of IoT system', 3, 0),
('AGE01031', 110, '英文(一)', 'English', 2, 1),
('AGE01032', 110, '英文(二)', 'English', 2, 1),
('AGE01050', 110, '進階英文(一)', 'Advanced English (Ⅰ)', 2, 0),
('AGE01060', 110, '進階英文(二)', 'Advanced English (Ⅱ)', 2, 0),
('AGE01071', 110, '中文閱讀與表達(一)', 'Chinese Reading and Expression', 2, 1),
('AGE01072', 110, '中文閱讀與表達(二)', 'Chinese Reading and Expression', 2, 1),
('AGE06070', 110, '大一體育(一)', 'Physical Education (Freshman Ⅰ)', 0.5, 1),
('AGE06080', 110, '大一體育(二)', 'Physical Education (Freshman Ⅱ)', 0.5, 1),
('AGE06090', 110, '大二體育(一)', 'Physical Education (Sophomore Ⅰ)', 0.5, 1),
('AGE06100', 110, '大二體育(二)', 'Physical Education (Sophomore Ⅱ)', 0.5, 1),
('AGE20020', 110, '認識臺灣', 'Getting to Know Taiwan：Trends and Insights', 2, 1),
('AGE20030', 110, '人文關懷體驗', 'The Practice and Experience of Humanity Care', 2, 1),
('AGE20050', 110, '當代社會議題', 'Social Issues in Contemporary Taiwan', 2, 1),
('AGE20060', 110, '經典的智慧', 'Wisdom of Classics', 2, 1),
('AGE21160', 110, '古蹟與臺灣文化', 'A Historic Spot and Taiwan Culture', 2, 0),
('AGE21370', 110, '臺灣原住民族文化概論', 'Introduction to Taiwan`s Aboriginal Culture', 2, 0),
('AGE21380', 110, '老子哲學與人生智慧', 'The Philosophy of Lao Tzu and Wisdom of Life', 2, 0),
('AGE21420', 110, '繪本中的人文', 'Literature and Human civilization in Picture Books', 2, 0),
('AGE21430', 110, '國際禮儀', 'International Etiquette', 2, 0),
('AGE21440', 110, '文學與音樂賞析', 'Appreciation to Literature and Music', 2, 0),
('AGE21460', 110, '俄羅斯寫實主義與台灣文學', 'Russian Realism and Taiwanese Literature', 2, 0),
('AGE21470', 110, '與經典對話—儒家經典', 'Dialogue with the Confucius Classics', 2, 0),
('AGE21480', 110, '跟著圖畫書去旅行', 'Travel with Picture Books', 2, 0),
('AGE21490', 110, '敘事文學與媒體', 'Narrative Literature and Media', 2, 0),
('AGE21860', 110, '台灣民間故事', 'Taiwanese Folktales', 2, 0),
('AGE22490', 110, '全球化與台灣社會', 'Globalization and Taiwan Society', 2, 0),
('AGE22530', 110, '性別關係與社會', 'Relations of Gender and Society', 2, 0),
('AGE22540', 110, '國際關係與全球議題', 'International Relations and Global Issues', 2, 0),
('AGE22550', 110, '教育法律與實例', 'Educational Laws and Practices', 2, 0),
('AGE22560', 110, '性別與生活', 'Gender and Life', 2, 0),
('AGE22570', 110, '民法概要', 'Introduction to Civil Law', 2, 0),
('AGE22590', 110, '智慧財產權法', 'Intellectual Property Laws', 2, 0),
('AGE22600', 110, '自我轉化與人際溝通', 'Self-transformation and Interpersonal communication', 2, 0),
('AGE23090', 110, '投資與理財規劃', 'Investment and Personal Finance', 2, 0),
('AGE23100', 110, '古今將領的領導藝術', 'Generals Ancient Art of Leadership', 2, 0),
('AGE23110', 110, '餐飲管理概論', 'Foundation in Food and Beverage Operations', 2, 0),
('AGE23120', 110, '消費行為與品牌策略', 'Consuming Behavior and Branding Strategy', 2, 0),
('AGE23130', 110, '展演行銷與實務', 'Exhibition and Performing Arts Marketing Practice', 2, 0),
('AGE23140', 110, '音樂專輯企劃製作歷程與模擬', 'The Planning and Simulation of Music Album Production', 2, 0),
('AGE23150', 110, '橘子蘋果經濟學', 'Economist Explores the Hidden Side of Everything', 2, 0),
('AGE23160', 110, '藝術與商業個案教學', 'Art and Business Case Study', 2, 0),
('AGE23170', 110, '都市文化創意產業', 'Urban Culture and Creativity', 2, 0),
('AGE24080', 110, '觀光遊憩概論', 'Introduction to Tourism and Recreation', 2, 0),
('AGE24110', 110, '公共爭議與民主論辯', 'Public Issues and Democratic Debate', 2, 0),
('AGE24120', 110, '人文與醫學', 'Humanity and Medicine', 2, 0),
('AGE24130', 110, '大眾文化與流行音樂', 'Mass Culture and Popular Music', 2, 0),
('AGE25050', 110, '好客之家-認識臺灣客家', 'Hospitality House-Know Taiwanese Hakka', 2, 0),
('AGE26010', 110, '台灣諺語', 'Taiwan Proverbs', 2, 0),
('AGE26020', 110, '語文表達藝術', 'Language Expression Arts', 2, 0),
('AGE28010', 110, '生涯發展與職涯規劃', 'Career Development and Vocational Planning', 2, 0),
('AGE30010', 110, '邏輯思考與應用', 'Logical Thinking and Application', 2, 1),
('AGE30020', 110, '自然、科技與社會', 'Science, Technology and Society', 2, 1),
('AGE30030', 110, '資訊與生活', 'Information and Life', 2, 0),
('AGE30040', 110, '運算思維與程式設計', 'Computational Thinking and Programming', 2, 1),
('AGE31010', 110, '生活中的數學', 'Mathematics in Life', 2, 0),
('AGE31140', 110, '數學與文明', 'Mathematics and Civilization', 2, 0),
('AGE31150', 110, '數學與認知科學', 'Mathematics and Cognitive Science', 2, 0),
('AGE31160', 110, '統計與生活', 'Statistics and Living', 2, 0),
('AGE32120', 110, '動漫實務與應用', 'Anime Practice and Application', 2, 0),
('AGE32130', 110, '網際網路與資訊社會', 'Internet and Information Society', 2, 0),
('AGE32150', 110, '科技與學習', 'Technology and Learning', 2, 0),
('AGE32160', 110, '智慧行動生活', 'Smartphone Life', 2, 0),
('AGE32170', 110, '電腦科學與程式設計概論', 'Introduction to Computer Science and Programming', 2, 0),
('AGE32180', 110, '行動科技攝影', 'Mobile Technology Photography', 2, 0),
('AGE32190', 110, '手機程式設計入門', 'Programming Mobile Apps with App Inventor', 2, 0),
('AGE33010', 110, '趣味科學實驗', 'Fun Science Experiments', 2, 0),
('AGE33060', 110, '安全與衛生', 'Safety and Health', 2, 0),
('AGE33070', 110, '地球的奧秘', 'Investigating The Earth', 2, 0),
('AGE33090', 110, '海洋科學導論', 'Introduction to Ocean Sciences', 2, 0),
('AGE33100', 110, '生活中的化學', 'Chemistry in Life', 2, 0),
('AGE33110', 110, '生活科學', 'Life Science', 2, 0),
('AGE34230', 110, '數學在空間藝術上之應用', 'Mathematics in Spatial Arts', 2, 0),
('AGE34260', 110, '全球環境變遷導論', 'Global Change: An Introduction', 2, 0),
('AGE34290', 110, '環境倫理', 'Environmental Ethics', 2, 0),
('AGE34310', 110, '綠色飲食與環境健康', 'Green Eating and Environmental Healthy', 2, 0),
('AGE34320', 110, '手作食農教育', 'Learning by Doing：Food and Agricutural Education', 2, 0),
('AGE34860', 110, '綠色能源與生活', 'Green Energy and Life', 2, 0),
('AGE35040', 110, '家庭營養師', 'Dietitian in Your Family', 2, 0),
('AGE35070', 110, '環境與永續發展', 'Environment and Sustainable Development', 2, 0),
('AGE36010', 110, '生命科學概論', 'Introduction to Life Science', 2, 0),
('AGE37010', 110, '生物技術與健康', 'Biotechnology and Health', 2, 0),
('AGE37020', 110, '奈米科學概論', 'Introduction to Nanotechnology', 2, 0),
('AGE37030', 110, '健康生活－體重管理', 'Healthy Life－Weight Management', 2, 0),
('AGE38010', 110, '聲音工程與音樂現場', 'Sound Engineering and Public Address', 2, 0),
('AGE40010', 110, '視覺藝術與社會', 'Visual Art in Social Contexts', 2, 1),
('AGE40020', 110, '音樂話中西', 'Discourse of Chinese and Western Music', 2, 1),
('AGE40030', 110, '舞蹈藝術賞析', 'Arts and Appreciation for Dance', 2, 1),
('AGE41020', 110, '設計、生活與美學', 'Aesthetic Inquiry of Design and Life', 2, 0),
('AGE41120', 110, '繪本中的童心童畫', 'Contents and Implications of Illustrated Books', 2, 0),
('AGE41160', 110, '電影配樂賞析', 'Appreciation to Film Music', 2, 0),
('AGE41220', 110, '攝影藝術賞析', 'Appreciation of Photography Art', 2, 0),
('AGE41250', 110, '色彩與人生', 'The Color with Life', 2, 0),
('AGE41260', 110, '博物館就是劇場', 'Museums as Theatre', 2, 0),
('AGE41270', 110, '經典電影閱讀', 'Classic Film Appreciation', 2, 0),
('AGE41280', 110, '數位藝術與媒體', 'Digital Art and Media', 2, 0),
('AGE41290', 110, '書法藝術欣賞與習作', 'The Art of Chinese Calligraphy Apperciation and Creation', 2, 0),
('AGE42580', 110, '聲音與節奏', 'Tone Color and Rhythm', 2, 0),
('AGE42590', 110, '台語歌謠', 'Taiwanese Songs', 2, 0),
('AGE42620', 110, '爵士樂', 'Jazz', 2, 0),
('AGE42630', 110, '日本音樂與文化', 'Japanese Music and Culture', 2, 0),
('AGE42640', 110, '古典音樂新樣貌', 'The New Appearances of Classical Music', 2, 0),
('AGE42650', 110, '華語及臺灣流行音樂史', 'The History of Chinese and Taiwan Popular Music', 2, 0),
('AGE43030', 110, '戲劇與音樂的對話', 'The Conversation of Drama and Music', 2, 0),
('AGE43040', 110, '肢體表演藝術', 'Performing Arts of Body Movement', 2, 0),
('AGE44150', 110, '表演藝術欣賞', 'Appreciation to Performing Arts', 2, 0),
('AGE61080', 110, '全民國防教育軍事訓練－國際情勢', 'All-out Defense Education Military Training－International Si', 0, 0),
('AGE61090', 110, '全民國防教育軍事訓練－國防政策', 'All-out Defense Education Military Training－National Defense', 0, 0),
('AGE61100', 110, '全民國防教育軍事訓練－防衛動員', 'All-out Defense Education Military Training－Defense Mobiliza', 0, 0),
('AGE61110', 110, '全民國防教育軍事訓練－全民國防', 'All-out Defense Education Military Training－Civil Defense', 2, 1),
('AGE61120', 110, '全民國防教育軍事訓練－國防科技', 'All-out Defense Education Military Training－Defense Technolo', 0, 0),
('AGE71010', 110, '博雅講堂(一)', 'Lectures of Liberal Arts (I)', 1, 0),
('AGE71020', 110, '博雅講堂(二)', 'Lectures of Liberal Arts (II)', 2, 0),
('AGE71030', 110, '博雅講堂(三)', 'Lectures of Liberal Arts (III)', 3, 0),
('AGE71040', 110, '博雅講堂(四)', 'Lectures of Liberal Arts (IV)', 2, 0),
('AGE71050', 110, '博雅講堂(五)', 'Lectures of Liberal Arts (V)', 2, 0),
('AGE71060', 110, '博雅講堂(六)', 'Lectures of Liberal Arts (VI)', 2, 0),
('AGE71070', 110, '博雅講堂(七)', 'Lectures of Liberal Arts (VII)', 2, 0),
('AGE71080', 110, '博雅講堂(八)', 'Lectures of Liberal Arts (VIII)', 2, 0),
('AGE71090', 110, '博雅講堂(九)', 'Lectures of Liberal Arts (IX)', 2, 0),
('AGE71100', 110, '博雅講堂(十)', 'Lectures of Liberal Arts (X)', 2, 0),
('AGE71110', 110, '博雅講堂(十一)', 'Lectures of Liberal Arts (XI)', 2, 0),
('AGE71120', 110, '博雅講堂(十二)', 'Lectures of Liberal Arts (XII)', 2, 0),
('AGE71130', 110, '博雅講堂(十三)', 'Lectures of Liberal Arts (XIII)', 2, 0),
('AGE71140', 110, '博雅講堂(十四)', 'Lectures of Liberal Arts (IXV)', 2, 0),
('AGE71150', 110, '博雅講堂(十五)', 'Lectures of Liberal Arts (XV)', 2, 0),
('AGE71160', 110, '博雅講堂(十六)', 'Lectures of Liberal Arts (XVI)', 2, 0),
('AGE71170', 110, '博雅講堂(十七)', 'Lectures of Liberal Arts (XVII)', 2, 0),
('AGE71180', 110, '博雅講堂(十八)', 'Lectures of Liberal Arts (XVIII)', 2, 0),
('AGE72010', 110, '自主學習課程(一)', 'Self-Learning (Ⅰ)', 1, 0),
('AGE72020', 110, '自主學習課程(二)', 'Self-Learning (ⅠI)', 1, 0),
('AGE72030', 110, '自主學習課程(三)', 'Self-Learning (ⅠII)', 1, 0),
('AGE72040', 110, '自主學習課程(四)', 'Self-Learning (IV)', 1, 0),
('AGE72050', 110, '自主學習課程(五)', 'Self-Learning (V)', 1, 0),
('AGE72060', 110, '自主學習課程(六)', 'Self-Learning (VI)', 1, 0),
('AGE72070', 110, '自主學習課程(七)', 'Self-Learning (VII)', 1, 0),
('AGE72080', 110, '自主學習課程(八)', 'Self-Learning (VIII)', 1, 0),
('AGE72090', 110, '自主學習課程(九)', 'Self-Learning (IX)', 1, 0),
('AGE72100', 110, '自主學習課程(十)', 'Self-Learning (X)', 1, 0),
('AGE72110', 110, '自主學習課程(十一)', 'Self-Learning (XⅠ)', 1, 0),
('AGE72120', 110, '自主學習課程(十二)', 'Self-Learning (XIⅠ)', 1, 0),
('AGE72130', 110, '自主學習課程(十三)', 'Self-Learning (XIIⅠ)', 1, 0),
('AGE72140', 110, '自主學習課程十四)', 'Self-Learning (IXV)', 1, 0),
('AGE72150', 110, '自主學習課程(十五)', 'Self-Learning (XV)', 1, 0),
('AGE72160', 110, '自主學習課程(十六)', 'Self-Learning (XVI)', 1, 0),
('AMA00030', 110, '幾何學', 'Geometry', 3, 1),
('AMA00060', 110, '數學史', 'History of Mathematics', 3, 1),
('AMA00230', 110, '數學課程通論', 'Theory of Elementary Mathematics Curriculum', 3, 1),
('AMA00280', 110, '離散數學', 'Discrete Mathematics', 3, 0),
('AMA00290', 110, '數學學習心理學', 'Psychology of Mathematics Learning', 3, 0),
('AMA00330', 110, '線性代數(一)', 'Linear Algebra(Ⅰ)', 3, 1),
('AMA00340', 110, '線性代數(二) ', 'Linear Algebra(Ⅱ)', 3, 1),
('AMA00350', 110, '統計學(一)', 'Statistics(Ⅰ)', 3, 1),
('AMA00370', 110, '代數學', 'Algebra', 3, 0),
('AMA00390', 110, '數學素養探究與教學', 'Mathematical Literacy Exploration and Teaching', 3, 1),
('AMA00400', 110, '數學教學與評量', 'Mathematics Instruction and Assessment', 3, 1),
('AMA00410', 110, '專題製作', 'Special Project', 3, 1),
('AMA00420', 110, '統計學(二)', 'Statistics(Ⅱ)', 3, 0),
('AMA20010', 110, '邏輯', 'Logic', 3, 0),
('AMA20240', 110, '拓樸學', 'Topology ', 3, 0),
('AMA20260', 110, '數學導論', 'Introduction to Mathematics', 3, 0),
('AMA20270', 110, '微分方程', 'Differential Equations', 3, 0),
('AMA20280', 110, '科學計算', 'Scientific Computing', 3, 0),
('AMA20290', 110, '數學建模', 'Mathematical Modeling', 3, 0),
('AMA20300', 110, '數學專題研究', 'Study on Mathematical Topic', 3, 0),
('AMA21010', 110, '高等微積分(一)', 'Advanced Calculus (Ⅰ)', 3, 0),
('AMA21020', 110, '高等微積分(二)', 'Advanced Calculus(Ⅱ)', 3, 0),
('AMA22040', 110, '網頁程式設計', 'Webpage Design', 3, 0),
('AMA22060', 110, '數位評量系統', 'Computerized Assessment System', 3, 0),
('AMA22070', 110, '物件導向程式設計', 'Object Oriented Programming', 3, 1),
('AMA22080', 110, '多媒體學習', 'Multimedia Learning', 3, 0),
('AMA22090', 110, '計算機網路', 'Computer Networks', 3, 0),
('AMA22100', 110, '多媒體影音處理', 'Multimedia Processing', 3, 0),
('AMA30040', 110, '兒童數學概念發展', 'Development of Children Mathematics Concept', 3, 0),
('AMA30090', 110, '數學教育研究法 ', 'Research Methods in Mathematics Education', 3, 1),
('AMA30160', 110, '數學解題與思維', 'Mathematics Problem Solving and Thinking', 3, 1),
('AMA40020', 110, '資料結構', 'Data Structure', 3, 0),
('AMA40030', 110, '資料庫', 'Database', 3, 0),
('AMA40050', 110, '數位課程設計', 'E-Learning Course Design', 3, 0),
('AMA40070', 110, '演算法', 'Algorithm', 3, 0),
('AMA40250', 110, '電腦多媒體系統', 'Multimedia System', 3, 0),
('AMA40300', 110, 'Python程式語言', 'Python programming language', 3, 0),
('AMA40310', 110, '機器學習', 'Machine Learning', 3, 0),
('AMA40320', 110, '類神經網路', 'Neural Networks', 3, 0),
('AMA40330', 110, '深度學習', 'Deep Learning', 3, 0),
('AMA50020', 110, '數理統計', 'Mathematical Statistics', 3, 0),
('AMA50130', 110, '科技與測驗統計', 'Technology for Measurement and Statistics', 3, 0),
('AMA50170', 110, '統計套裝軟體', 'Package software of Statistics ', 3, 0),
('AMA50230', 110, '迴歸分析', 'Regression Analysis', 3, 0),
('AMA50240', 110, '變異數分析', 'Analysis of Variance', 3, 0),
('AMA50250', 110, '無母數統計', 'Nonparametric Statistics', 3, 0),
('AMA50260', 110, '大型數學評量資料庫分析', 'Large Mathematics Assessment Database Analysis', 3, 0),
('AMA50270', 110, '多變量分析', 'Multivariate Analysis', 3, 0),
('AMA50280', 110, '機率論', 'Probability Theory', 3, 1),
('AMA60010', 110, '科技在數學教學上之應用', 'Application of Technology in Mathematics Teaching', 3, 0),
('AMA60020', 110, '數學教育文獻批判', 'Critique in Mathematics Education Literatures', 3, 0),
('AMA60030', 110, '數學課程設計', 'Design of Mathematics Curriculum and Instruction', 3, 0),
('AMA60200', 110, '數學教育推廣實地學習', 'Practicum of Mathematics Education', 3, 0),
('AMA60210', 110, '數學試題編製與分析', 'Mathematics Testing Design and Analysis', 3, 0),
('AMA60220', 110, '多元文化數學教育', 'Multicultural Mathematics Education', 3, 0),
('AMA60230', 110, '數學補救教學', 'Mathematics Remedial Instruction', 3, 0),
('AMA60240', 110, '數學遊戲', 'Mathematics Games', 3, 0),
('AMA60250', 110, '數學資優教育模式', 'Models of the Mathematics-gifted Education', 3, 0),
('AMA60260', 110, '數學擬題解題', 'Mathematics Problem Posing and Solving', 3, 0),
('AMA60270', 110, '數學閱讀理解', 'Mathematics Reading Comprehension', 3, 0),
('AMA60280', 110, '數學教育軟體應用', 'Application of Softwares in Mathematics Education', 3, 0),
('ASC00150', 110, '科學教育概論', 'Introduction to Science Education', 3, 1),
('ASC00260', 110, '普通物理實驗', 'General Physics Laboratory', 1, 1),
('ASC00270', 110, '普通化學(一)', 'General Chemistry (Ⅰ)', 2, 1),
('ASC00280', 110, '普通化學(二)', 'General Chemistry (Ⅱ)', 3, 1),
('ASC00290', 110, '普通化學實驗', 'General Chemistry Laboratory', 1, 1),
('ASC00300', 110, '普通生物(一)', 'General Biology (Ⅰ)', 3, 1),
('ASC00310', 110, '普通生物(二)', 'General Biology (Ⅱ)', 2, 1),
('ASC00320', 110, '普通生物實驗', 'General Biology Laboratory', 1, 1),
('ASC00331', 110, '地球科學', 'Earth Science', 4, 1),
('ASC00332', 110, '地球科學', 'Earth Science', 4, 1),
('ASC00340', 110, '地球科學實驗', 'Earth Science Laboratory', 1, 1),
('ASC00350', 110, '科學閱讀與寫作', 'Reading and Writing for Science', 3, 1),
('ASC00360', 110, '科學歷史與哲學', 'History and Philosophy of Science', 3, 1),
('ASC00370', 110, '科技發展與現代社會', 'Technology Development and Modern Society', 3, 1),
('ASC00380', 110, '普通物理學(一)', 'General Physics (Ⅰ)', 2, 1),
('ASC10181', 110, '生物化學', 'Biochemistry', 6, 0),
('ASC10182', 110, '生物化學', 'Biochemistry', 6, 0),
('ASC10200', 110, '遺傳學', 'Genetics', 3, 0),
('ASC10211', 110, '有機化學', 'Organic Chemistry', 6, 0),
('ASC10212', 110, '有機化學', 'Organic Chemistry', 6, 0),
('ASC10221', 110, '分析化學(含實驗)', 'Analytical Chemistry(and Laboratory)', 6, 0),
('ASC10222', 110, '分析化學(含實驗)', 'Analytical Chemistry(and Laboratory)', 6, 0),
('ASC10231', 110, '細胞生物學（含實驗）', 'Cell Biology(and Laboratory)', 6, 0),
('ASC10232', 110, '細胞生物學（含實驗）', 'Cell Biology(and Laboratory)', 6, 0),
('ASC10241', 110, '生理學', 'Physiology', 4, 0),
('ASC10242', 110, '生理學', 'Physiology', 4, 0),
('ASC20420', 110, '全球環境變遷', 'Global Environmental Change', 3, 0),
('ASC20460', 110, '國小自然科學雙語教學概論', 'Introduction of Bilingual Teaching in Elementary Science', 3, 0),
('ASC20470', 110, '國小自然科跨領域教學實踐', 'Interdisciplinary Teaching in Elementary Science', 3, 0),
('ASC30160', 110, '電磁學', 'Electro-Magnetism', 3, 0),
('ASC40180', 110, '氣象學', 'Meteorology', 3, 0),
('ASC40190', 110, '地質學', 'Geology', 3, 0),
('ASC40200', 110, '天文學', 'Astronomy', 3, 0),
('ASC40210', 110, '海洋學', 'Oceanography', 3, 0),
('ASC71060', 110, '發育生物學', 'Developmental Biology', 2, 0),
('ASC71070', 110, '微生物學', 'Microbiology', 3, 0),
('ASC71110', 110, '生態學', 'Ecology', 2, 0),
('ASC71180', 110, '動物學', 'Zoology', 3, 0),
('ASC71190', 110, '植物學', 'Botany', 3, 0),
('ASC71210', 110, '分子生物學（含實驗）', 'Molecular Biology(and Laboratory)', 3, 0),
('ASC71220', 110, '生物化學實驗', 'Biochemistry Laboratory', 2, 0),
('ASC71230', 110, '生理學實驗(一)', 'Physiology Laboratory(Ⅰ)', 1, 0),
('ASC71240', 110, '生理學實驗(二)', 'Physiology Laboratory(Ⅱ)', 1, 0),
('ASC72210', 110, '海洋化學', 'Chemical Oceanography', 3, 0),
('ASC74350', 110, '量子物理', 'Quantum Mechanics', 3, 0),
('ASC74360', 110, '理論力學', 'Theoretical Mechanics', 3, 0),
('ASC75020', 110, '物理化學(一)', 'Physical Chemistry (Ⅰ)', 3, 0),
('ASC75030', 110, '物理化學(二)', 'Physical Chemistry (Ⅱ)', 3, 0),
('ASC75040', 110, '物理化學(三)', 'Physical Chemistry (Ⅲ)', 2, 0),
('ASC75061', 110, '無機化學', 'Inorganic Chemistry', 6, 0),
('ASC75062', 110, '無機化學', 'Inorganic Chemistry', 6, 0),
('ASC75071', 110, '儀器分析', 'Instrumental Analysis', 6, 0),
('ASC75072', 110, '儀器分析', 'Instrumental Analysis', 6, 0),
('ASC75090', 110, '化學數學', 'Mathematics for Chemistry', 3, 0),
('ASC75100', 110, '有機化學實驗', 'Organic Chemistry Laboratory', 1, 0),
('ASC75110', 110, '儀器分析實習', 'Instrumental Analysis Laboratory', 1, 0),
('ASC75120', 110, '有機化學特論', 'Special Topics on Organic Chemistry', 3, 0),
('ASC80020', 110, '科學學習心理學', 'Psychology of Science Learning ', 3, 0),
('ASC80030', 110, '科學創造力培育', 'Cultivation of Scientific Creativity', 3, 0),
('ASC80050', 110, '資訊科學發展與應用', 'Development and Application of Information Science', 3, 0),
('ASC80110', 110, '自然科學實驗研究', 'Study on Natural Science Experiment', 3, 0),
('ASC80130', 110, '科普文章寫作與編輯', 'Popular Science Article Writing and Editing', 3, 0),
('ASC80190', 110, '攝影與媒體製作', 'Photograph and Media Design', 3, 0),
('ASC80220', 110, '教育統計學', 'Educational Statistics', 3, 0),
('ASC80230', 110, '科學教育研究方法', 'Methodology of Science Education', 3, 0),
('ASC80290', 110, '科學課程與教材發展', 'Development of Science Curriculum and Instructional Material', 3, 0),
('ASC80300', 110, '科學教學與學習', 'Science Teaching and Learning', 3, 0),
('ASC80310', 110, '科學教育測驗與評量', 'Measurement and Assessment of Science Education', 3, 0),
('ASC80320', 110, '科學教室規劃與經營', 'Planning and Management in Science Classroom', 3, 0),
('ASC80330', 110, '環境教育', 'Environmental Education', 3, 0),
('ASC80340', 110, '幼兒科學教育', 'Science Education for Young Children', 3, 0),
('ASC80360', 110, '大眾科學推廣', 'Dissemination for Public Science', 3, 0),
('ASC80370', 110, '科學博物館活動設計', 'Activity Design for Science Museum', 3, 0),
('ASC80380', 110, '科學教育活動規劃與指導', 'Planning and Instruction of Science Activity', 3, 0),
('ASC80390', 110, '大眾傳播理論與實務', 'Theory and Practice for Public Communication', 3, 0),
('ASC80400', 110, '科學展覽製作與指導', 'Implement and Guidance for Science Exhibition', 3, 0),
('ASC80410', 110, '科學遊戲設計與指導', 'Design and Guidance for Scientific Game', 3, 0),
('ASC80420', 110, '傳播科技與媒體', 'Communicational Technology and Media', 3, 0),
('ASC80430', 110, '環境解說', 'Environmental Interpretation', 3, 0),
('ASC80440', 110, '兒童科學讀物寫作與編輯', 'Children’s Science Reading Materials Writing and Editing', 3, 0),
('ASC80450', 110, '科學玩具製作與設計', 'Science Toys Design', 3, 0),
('ASC80510', 110, '科普文本翻譯', 'Translations in Science Popularization Texts', 3, 0),
('ASC80520', 110, '節能減碳教育及管理', 'Education & Management for Energy Saving & Carbon Conversati', 3, 0),
('ASC80531', 110, '書報討論與專題研究（一）', 'Seminar and Research （Ⅰ）', 2, 0),
('ASC80532', 110, '書報討論與專題研究（一）', 'Seminar and Research （Ⅰ）', 2, 0),
('ASC80541', 110, '書報討論與專題研究（二）', 'Seminar and Research （Ⅱ）', 2, 0),
('ASC80542', 110, '書報討論與專題研究（二）', 'Seminar and Research （Ⅱ）', 2, 0),
('ASC80550', 110, '環境科學', 'Environmental Science', 3, 0),
('ASC80570', 110, '科學傳播概論', 'Introduction to Science Communication', 3, 0),
('ASC80580', 110, '科學教育推廣實習（一）', 'Practicum of Science Education（Ⅰ）', 1, 0),
('ASC80590', 110, '科學教育推廣實習（二）', 'Practicum of Science Education（Ⅱ）', 1, 0),
('ASC80610', 110, '國小自然科學課程研究', 'Natural Science Curriculum study in Elementary Grades', 3, 0),
('ASC80620', 110, '資優兒童科學教育', 'Science Education for Gifted Children', 3, 0),
('ASC80630', 110, '科學素養特論', 'Special topics in Scientific Literacy', 3, 0),
('ASC80640', 110, '科學探究與實作', 'Scientific inquiry and Practice', 3, 0),
('ASC91170', 110, '健康科學', 'Health Science', 3, 0),
('ASC91180', 110, '科學魔術', 'Science Magic', 3, 0),
('ZCS00010', 110, '微積分(一)', 'Calculus(Ⅰ)', 3, 1),
('ZCS00020', 110, '微積分(二) ', 'Calculus(Ⅱ)', 3, 1),
('ZCS00031', 110, '微積分', 'Calculus', 6, 1),
('ZCS00032', 110, '微積分', 'Calculus', 6, 1),
('ZCS00040', 110, '微積分', 'Calculus', 3, 1),
('ZCS00050', 110, '微積分(I)', 'Calculus(I)', 3, 1),
('ZCS00060', 110, '普通物理學', 'General Physics', 3, 0),
('ZCS00070', 110, '普通物理學(二) ', 'General Physics(Ⅱ)', 3, 1),
('ZCS00080', 110, '普通物理學', 'General Physics', 3, 1),
('ZCS00090', 110, '計算機概論', 'Introduction to Computer Science', 3, 1),
('ZCS00100', 110, '計算機概論', 'Introduction to Computer Science', 3, 0),
('ZCS00110', 110, '數位學習概論', 'Introduction to Digital Learning', 3, 0),
('ZCS00120', 110, '數位學習概論', 'Introduction to Digital Learning', 3, 1),
('ZCS00140', 110, '專業服務學習', 'Professional Service Learning', 3, 0),
('ZCS00150', 110, '微積分(II)', 'Calculus(II)', 3, 0),
('ZCS00170', 110, '計算機概論', 'Introduction to Computer Science', 3, 1),
('ZCS00200', 110, '跨領域專題製作', 'Interdisciplinary Project', 3, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `version`
--

CREATE TABLE `version` (
  `Version_ID` int(11) NOT NULL,
  `Version_Name` varchar(60) NOT NULL,
  `Student_ID` varchar(9) NOT NULL,
  `Major_Department_ID` int(11) NOT NULL,
  `Auxiliary_Department_ID` int(11) NOT NULL,
  `Double_Major_Department_ID` int(11) NOT NULL,
  `Teach_Class_ID` int(11) NOT NULL,
  `Classes_taken_Credit` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`Classes_taken_Credit`)),
  `Classes_Passed` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`Classes_Passed`)),
  `Total_Credit` int(11) NOT NULL,
  `Department_Passed` tinyint(1) NOT NULL,
  `Department_Chair_Passed` tinyint(1) NOT NULL,
  `General_Studies_Passed` tinyint(1) NOT NULL,
  `Academic_Affairs_Office_Passed` tinyint(1) NOT NULL,
  `Remark` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`user_ID`);

--
-- 資料表索引 `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`Staff_ID`),
  ADD KEY `Unit_ID` (`Unit_ID`);

--
-- 資料表索引 `classmodule`
--
ALTER TABLE `classmodule`
  ADD PRIMARY KEY (`Class_Module_ID`);

--
-- 資料表索引 `coursemodule`
--
ALTER TABLE `coursemodule`
  ADD PRIMARY KEY (`Course_Package_ID`,`Course_Module_ID`),
  ADD KEY `coursemodule_ibfk_2` (`Unit_ID`),
  ADD KEY `Class_Module_ID` (`Class_Module_ID`);

--
-- 資料表索引 `coursemodule_subject`
--
ALTER TABLE `coursemodule_subject`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `cms_table_ibfk_2` (`Course_Package_ID`,`Course_Module_ID`),
  ADD KEY `cms_table_ibfk_3` (`Subject_ID`,`Academic_Year`);

--
-- 資料表索引 `coursestructure`
--
ALTER TABLE `coursestructure`
  ADD PRIMARY KEY (`Course_Structure_ID`),
  ADD KEY `coursestructure_ibfk_1` (`Department_ID`);

--
-- 資料表索引 `course_data`
--
ALTER TABLE `course_data`
  ADD PRIMARY KEY (`Course_Data_ID`),
  ADD KEY `Student_ID` (`Student_ID`),
  ADD KEY `Subject_ID` (`Subject_ID`,`Academic_Year`);

--
-- 資料表索引 `cscm_table`
--
ALTER TABLE `cscm_table`
  ADD KEY `cscm_table_ibfk_1` (`Course_Structure_ID`),
  ADD KEY `Class_Module_ID` (`Class_Module_ID`);

--
-- 資料表索引 `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Department_ID`);

--
-- 資料表索引 `department_list`
--
ALTER TABLE `department_list`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CourseStructure_ID` (`CourseStructure_ID`),
  ADD KEY `Subject_ID` (`Subject_ID`,`Academic_Year`),
  ADD KEY `Equivalent_Subject_ID` (`Equivalent_Subject_ID`,`Academic_Year`);

--
-- 資料表索引 `mentor_assignment`
--
ALTER TABLE `mentor_assignment`
  ADD PRIMARY KEY (`Mentor_ID`),
  ADD KEY `Version_ID` (`Version_ID`);

--
-- 資料表索引 `recognition_table`
--
ALTER TABLE `recognition_table`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Student_ID` (`Student_ID`),
  ADD KEY `recognition_table_ibfk_2` (`Equivalent_Subject_ID`,`Academic_Year`),
  ADD KEY `recognition_table_ibfk_3` (`Subject_ID`,`Academic_Year`);

--
-- 資料表索引 `school_unit`
--
ALTER TABLE `school_unit`
  ADD PRIMARY KEY (`Unit_ID`);

--
-- 資料表索引 `sgdc`
--
ALTER TABLE `sgdc`
  ADD KEY `Course_Data_ID` (`Course_Data_ID`),
  ADD KEY `Version_ID` (`Version_ID`);

--
-- 資料表索引 `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_ID`),
  ADD KEY `student_ibfk_1` (`Major_Department_ID`),
  ADD KEY `student_ibfk_2` (`Auxiliary_Department_ID`),
  ADD KEY `student_ibfk_3` (`Double_Major_Department_ID`),
  ADD KEY `Teach_Class_ID` (`Teach_Class_ID`);

--
-- 資料表索引 `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`Subject_ID`,`Academic_Year`);

--
-- 資料表索引 `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`Version_ID`),
  ADD KEY `version_ibfk_1` (`Major_Department_ID`),
  ADD KEY `version_ibfk_2` (`Auxiliary_Department_ID`),
  ADD KEY `version_ibfk_3` (`Double_Major_Department_ID`),
  ADD KEY `version_ibfk_5` (`Student_ID`),
  ADD KEY `Teach_Class_ID` (`Teach_Class_ID`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `coursemodule_subject`
--
ALTER TABLE `coursemodule_subject`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `coursestructure`
--
ALTER TABLE `coursestructure`
  MODIFY `Course_Structure_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`Unit_ID`) REFERENCES `school_unit` (`Unit_ID`);

--
-- 資料表的限制式 `coursemodule`
--
ALTER TABLE `coursemodule`
  ADD CONSTRAINT `coursemodule_ibfk_2` FOREIGN KEY (`Unit_ID`) REFERENCES `school_unit` (`Unit_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `coursemodule_ibfk_3` FOREIGN KEY (`Class_Module_ID`) REFERENCES `classmodule` (`Class_Module_ID`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `coursemodule_subject`
--
ALTER TABLE `coursemodule_subject`
  ADD CONSTRAINT `coursemodule_subject_ibfk_2` FOREIGN KEY (`Course_package_ID`,`Course_module_ID`) REFERENCES `coursemodule` (`Course_package_ID`, `Course_module_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `coursemodule_subject_ibfk_3` FOREIGN KEY (`Subject_ID`,`Academic_Year`) REFERENCES `subject` (`Subject_ID`, `Academic_Year`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `coursestructure`
--
ALTER TABLE `coursestructure`
  ADD CONSTRAINT `coursestructure_ibfk_1` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`Department_ID`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `course_data`
--
ALTER TABLE `course_data`
  ADD CONSTRAINT `course_data_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`),
  ADD CONSTRAINT `course_data_ibfk_2` FOREIGN KEY (`Subject_ID`,`Academic_Year`) REFERENCES `subject` (`Subject_ID`, `Academic_Year`);

--
-- 資料表的限制式 `cscm_table`
--
ALTER TABLE `cscm_table`
  ADD CONSTRAINT `cscm_table_ibfk_1` FOREIGN KEY (`Course_Structure_ID`) REFERENCES `coursestructure` (`Course_Structure_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cscm_table_ibfk_2` FOREIGN KEY (`Class_Module_ID`) REFERENCES `classmodule` (`Class_Module_ID`);

--
-- 資料表的限制式 `department_list`
--
ALTER TABLE `department_list`
  ADD CONSTRAINT `department_list_ibfk_1` FOREIGN KEY (`CourseStructure_ID`) REFERENCES `coursestructure` (`Course_Structure_ID`),
  ADD CONSTRAINT `department_list_ibfk_2` FOREIGN KEY (`Subject_ID`) REFERENCES `subject` (`Subject_ID`),
  ADD CONSTRAINT `department_list_ibfk_3` FOREIGN KEY (`Equivalent_Subject_ID`,`Academic_Year`) REFERENCES `subject` (`Subject_ID`, `Academic_Year`);

--
-- 資料表的限制式 `mentor_assignment`
--
ALTER TABLE `mentor_assignment`
  ADD CONSTRAINT `mentor_assignment_ibfk_1` FOREIGN KEY (`Mentor_ID`) REFERENCES `administrator` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mentor_assignment_ibfk_2` FOREIGN KEY (`Version_ID`) REFERENCES `version` (`Version_ID`);

--
-- 資料表的限制式 `recognition_table`
--
ALTER TABLE `recognition_table`
  ADD CONSTRAINT `recognition_table_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`),
  ADD CONSTRAINT `recognition_table_ibfk_2` FOREIGN KEY (`Equivalent_Subject_ID`,`Academic_Year`) REFERENCES `subject` (`Subject_ID`, `Academic_Year`),
  ADD CONSTRAINT `recognition_table_ibfk_3` FOREIGN KEY (`Subject_ID`,`Academic_Year`) REFERENCES `subject` (`Subject_ID`, `Academic_Year`);

--
-- 資料表的限制式 `sgdc`
--
ALTER TABLE `sgdc`
  ADD CONSTRAINT `sgdc_ibfk_1` FOREIGN KEY (`Course_Data_ID`) REFERENCES `course_data` (`Course_Data_ID`),
  ADD CONSTRAINT `sgdc_ibfk_2` FOREIGN KEY (`Version_ID`) REFERENCES `version` (`Version_ID`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Major_Department_ID`) REFERENCES `coursestructure` (`Course_Structure_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`Auxiliary_Department_ID`) REFERENCES `coursestructure` (`Course_Structure_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`Double_Major_Department_ID`) REFERENCES `coursestructure` (`Course_Structure_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_4` FOREIGN KEY (`Teach_Class_ID`) REFERENCES `classmodule` (`Class_Module_ID`) ON UPDATE CASCADE;

--
-- 資料表的限制式 `version`
--
ALTER TABLE `version`
  ADD CONSTRAINT `version_ibfk_1` FOREIGN KEY (`Major_Department_ID`) REFERENCES `coursestructure` (`Course_Structure_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `version_ibfk_2` FOREIGN KEY (`Auxiliary_Department_ID`) REFERENCES `coursestructure` (`Course_Structure_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `version_ibfk_3` FOREIGN KEY (`Double_Major_Department_ID`) REFERENCES `coursestructure` (`Course_Structure_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `version_ibfk_5` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `version_ibfk_6` FOREIGN KEY (`Teach_Class_ID`) REFERENCES `classmodule` (`Class_Module_ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
