-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 03, 2024 at 01:39 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exam_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_acc`
--

CREATE TABLE `admin_acc` (
  `admin_id` int(11) NOT NULL,
  `admin_user` varchar(1000) NOT NULL,
  `admin_pass` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_acc`
--

INSERT INTO `admin_acc` (`admin_id`, `admin_user`, `admin_pass`) VALUES
(1, 'Souramoy', 'itsmess10');

-- --------------------------------------------------------

--
-- Table structure for table `course_tbl`
--

CREATE TABLE `course_tbl` (
  `cou_id` int(11) NOT NULL,
  `cou_name` varchar(1000) NOT NULL,
  `cou_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `course_tbl`
--

INSERT INTO `course_tbl` (`cou_id`, `cou_name`, `cou_created`) VALUES
(73, 'PYTHON', '2024-02-27 15:01:29'),
(74, 'GRAPHIC DESIGN', '2024-03-02 18:35:36');

-- --------------------------------------------------------

--
-- Table structure for table `examinee_tbl`
--

CREATE TABLE `examinee_tbl` (
  `exmne_id` int(11) NOT NULL,
  `exmne_fullname` varchar(1000) NOT NULL,
  `exmne_course` varchar(1000) NOT NULL,
  `exmne_gender` varchar(1000) NOT NULL,
  `exmne_birthdate` varchar(1000) NOT NULL,
  `exmne_year_level` varchar(1000) NOT NULL,
  `exmne_email` varchar(1000) NOT NULL,
  `exmne_password` varchar(1000) NOT NULL,
  `exmne_status` varchar(1000) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `examinee_tbl`
--

INSERT INTO `examinee_tbl` (`exmne_id`, `exmne_fullname`, `exmne_course`, `exmne_gender`, `exmne_birthdate`, `exmne_year_level`, `exmne_email`, `exmne_password`, `exmne_status`) VALUES
(17, 'xyz', '74', 'male', '0012-12-12', 'first year', 'xyz@gmail.com', '123', 'active'),
(18, 'POULAMI NAHA (STURSEC23GD001)', '74', 'female', '2002-08-13', 'first year', 'poulami.naha12@gmail.com', '13082002', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `exam_answers`
--

CREATE TABLE `exam_answers` (
  `exans_id` int(11) NOT NULL,
  `axmne_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `exans_answer` varchar(1000) NOT NULL,
  `exans_status` varchar(1000) NOT NULL DEFAULT 'new',
  `exans_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `exam_answers`
--

INSERT INTO `exam_answers` (`exans_id`, `axmne_id`, `exam_id`, `quest_id`, `exans_answer`, `exans_status`, `exans_created`) VALUES
(417, 17, 35, 48, 'e', 'old', '2024-02-29 17:16:11'),
(418, 17, 35, 47, 'f', 'old', '2024-02-29 17:16:11'),
(419, 17, 35, 47, 'a', 'old', '2024-02-29 19:34:03'),
(420, 17, 35, 48, 'l', 'old', '2024-02-29 19:34:03'),
(421, 17, 35, 49, '3', 'old', '2024-02-29 19:49:00'),
(422, 17, 35, 47, 'd', 'old', '2024-02-29 19:49:00'),
(423, 17, 35, 49, 't', 'new', '2024-02-29 19:49:14'),
(424, 17, 35, 48, 'l', 'new', '2024-02-29 19:49:14'),
(425, 17, 35, 47, 'f', 'new', '2024-02-29 19:49:14'),
(426, 17, 37, 53, 'B) Conveying ideas solely through words', 'old', '2024-03-02 19:38:51'),
(427, 17, 37, 55, 'A) It has remained stagnant over the centuries.', 'old', '2024-03-02 20:07:53'),
(428, 17, 37, 53, 'A) Creating textual representations', 'old', '2024-03-02 21:48:28'),
(429, 17, 37, 56, 'D) The impact of color theory', 'old', '2024-03-02 21:48:28'),
(430, 17, 37, 52, 'A) They distract the audience from the narrative.', 'old', '2024-03-02 21:50:55'),
(431, 17, 37, 56, 'A) The importance of typography', 'old', '2024-03-02 21:56:58'),
(432, 17, 37, 51, 'C) Enhances typography', 'old', '2024-03-02 22:01:55'),
(433, 17, 37, 52, 'C) They add depth and engage the audience.', 'old', '2024-03-02 22:01:55'),
(434, 17, 37, 56, 'D) The impact of color theory', 'old', '2024-03-02 22:11:50'),
(435, 17, 37, 53, 'B) Conveying ideas solely through words', 'old', '2024-03-02 22:11:50'),
(436, 17, 37, 54, 'B) By simplifying them', 'old', '2024-03-02 22:11:50'),
(437, 17, 37, 51, 'B) Conveys information visually', 'old', '2024-03-02 22:11:50'),
(438, 17, 37, 55, 'D) It has become less influential in modern times.', 'old', '2024-03-02 22:11:50'),
(439, 17, 37, 54, 'C) By adding unnecessary details', 'old', '2024-03-02 22:13:09'),
(440, 17, 37, 52, 'C) They add depth and engage the audience.', 'old', '2024-03-02 22:13:09'),
(441, 17, 37, 56, 'C) The evolution of graphic design', 'old', '2024-03-02 22:13:09'),
(442, 17, 37, 53, 'C) Utilizing images to enhance understanding', 'old', '2024-03-02 22:13:09'),
(443, 17, 37, 54, 'C) By adding unnecessary details', 'old', '2024-03-02 22:39:43'),
(444, 17, 37, 53, 'D) Exclusively for decorative purposes', 'old', '2024-03-02 22:39:43'),
(445, 17, 37, 52, 'C) They add depth and engage the audience.', 'old', '2024-03-02 22:39:43'),
(446, 17, 37, 55, 'C) It has responded to cultural, technological, and artistic changes.', 'old', '2024-03-02 22:42:48'),
(447, 17, 37, 56, 'C) The evolution of graphic design', 'old', '2024-03-02 22:42:48'),
(448, 17, 37, 54, 'D) By obscuring the meaning', 'old', '2024-03-02 22:42:48'),
(449, 17, 37, 53, 'A) Creating textual representations', 'old', '2024-03-02 22:42:48'),
(450, 17, 37, 52, 'B) They make the narrative less memorable.', 'old', '2024-03-02 22:42:48'),
(451, 17, 37, 51, 'A) Solely decorative', 'old', '2024-03-02 22:42:48'),
(452, 17, 37, 52, 'A) They distract the audience from the narrative.', 'new', '2024-03-02 22:42:48'),
(453, 17, 37, 54, 'D) By obscuring the meaning', 'new', '2024-03-02 22:42:48'),
(454, 17, 37, 56, 'B) The significance of illustration', 'new', '2024-03-02 22:42:48'),
(455, 17, 37, 53, 'D) Exclusively for decorative purposes', 'new', '2024-03-02 22:42:48'),
(456, 17, 37, 55, 'C) It has responded to cultural, technological, and artistic changes.', 'new', '2024-03-02 22:42:48'),
(457, 17, 37, 51, 'C) Enhances typography', 'new', '2024-03-02 22:42:48');

-- --------------------------------------------------------

--
-- Table structure for table `exam_attempt`
--

CREATE TABLE `exam_attempt` (
  `examat_id` int(11) NOT NULL,
  `exmne_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `examat_status` varchar(1000) NOT NULL DEFAULT 'used'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `exam_attempt`
--

INSERT INTO `exam_attempt` (`examat_id`, `exmne_id`, `exam_id`, `examat_status`) VALUES
(113, 17, 37, 'used');

-- --------------------------------------------------------

--
-- Table structure for table `exam_question_tbl`
--

CREATE TABLE `exam_question_tbl` (
  `eqt_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `exam_question` varchar(1000) NOT NULL,
  `exam_ch1` varchar(1000) NOT NULL,
  `exam_ch2` varchar(1000) NOT NULL,
  `exam_ch3` varchar(1000) NOT NULL,
  `exam_ch4` varchar(1000) NOT NULL,
  `exam_answer` varchar(1000) NOT NULL,
  `exam_status` varchar(1000) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `exam_question_tbl`
--

INSERT INTO `exam_question_tbl` (`eqt_id`, `exam_id`, `exam_question`, `exam_ch1`, `exam_ch2`, `exam_ch3`, `exam_ch4`, `exam_answer`, `exam_status`) VALUES
(47, 35, 'hi', 'a', 'b', 'd', 'f', 'f', 'active'),
(48, 35, 'hello', 'e', 'f', 'g', 'l', 'l', 'active'),
(49, 35, 'okey', '1', '2', '3', 't', 't', 'active'),
(51, 37, 'According to the document, what role does illustration play in communication?', 'A) Solely decorative', 'B) Conveys information visually', 'C) Enhances typography', 'D) Limits storytelling possibilities', 'B) Conveys information visually', 'active'),
(52, 37, 'Which statement best describes the impact of illustrations on storytelling?', 'A) They distract the audience from the narrative.', 'B) They make the narrative less memorable.', 'C) They add depth and engage the audience.', 'D) They hinder comprehension of the story.', 'C) They add depth and engage the audience.', 'active'),
(53, 37, 'What is the definition of illustration as presented in the document?', 'A) Creating textual representations', 'B) Conveying ideas solely through words', 'C) Utilizing images to enhance understanding', 'D) Exclusively for decorative purposes', 'C) Utilizing images to enhance understanding', 'active'),
(54, 37, 'How does illustration contribute to conveying complex concepts?', 'A) By complicating them further', 'B) By simplifying them', 'C) By adding unnecessary details', 'D) By obscuring the meaning', 'B) By simplifying them', 'active'),
(55, 37, 'Which statement accurately reflects the evolution of illustration?', 'A) It has remained stagnant over the centuries.', 'B) It has only evolved due to technological advancements.', 'C) It has responded to cultural, technological, and artistic changes.', 'D) It has become less influential in modern times.', 'C) It has responded to cultural, technological, and artistic changes.', 'active'),
(56, 37, 'What is the primary focus of the document \"The Power of Visual Storytelling\"?', 'A) The importance of typography', 'B) The significance of illustration', 'C) The evolution of graphic design', 'D) The impact of color theory', 'B) The significance of illustration', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `exam_tbl`
--

CREATE TABLE `exam_tbl` (
  `ex_id` int(11) NOT NULL,
  `cou_id` int(11) NOT NULL,
  `ex_title` varchar(1000) NOT NULL,
  `ex_time_limit` varchar(1000) NOT NULL,
  `ex_questlimit_display` int(11) NOT NULL,
  `ex_description` varchar(1000) NOT NULL,
  `ex_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `exam_tbl`
--

INSERT INTO `exam_tbl` (`ex_id`, `cou_id`, `ex_title`, `ex_time_limit`, `ex_questlimit_display`, `ex_description`, `ex_created`) VALUES
(35, 73, 'Python basic test', '10', 3, 'testing ', '2024-02-27 15:02:23'),
(37, 74, 'Graphics designing test exam', '30', 10, 'Best of Luck', '2024-03-02 18:36:44');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks_tbl`
--

CREATE TABLE `feedbacks_tbl` (
  `fb_id` int(11) NOT NULL,
  `exmne_id` int(11) NOT NULL,
  `fb_exmne_as` varchar(1000) NOT NULL,
  `fb_feedbacks` varchar(1000) NOT NULL,
  `fb_date` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_acc`
--
ALTER TABLE `admin_acc`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `course_tbl`
--
ALTER TABLE `course_tbl`
  ADD PRIMARY KEY (`cou_id`);

--
-- Indexes for table `examinee_tbl`
--
ALTER TABLE `examinee_tbl`
  ADD PRIMARY KEY (`exmne_id`),
  ADD UNIQUE KEY `exmne_email` (`exmne_email`);

--
-- Indexes for table `exam_answers`
--
ALTER TABLE `exam_answers`
  ADD PRIMARY KEY (`exans_id`);

--
-- Indexes for table `exam_attempt`
--
ALTER TABLE `exam_attempt`
  ADD PRIMARY KEY (`examat_id`);

--
-- Indexes for table `exam_question_tbl`
--
ALTER TABLE `exam_question_tbl`
  ADD PRIMARY KEY (`eqt_id`);

--
-- Indexes for table `exam_tbl`
--
ALTER TABLE `exam_tbl`
  ADD PRIMARY KEY (`ex_id`);

--
-- Indexes for table `feedbacks_tbl`
--
ALTER TABLE `feedbacks_tbl`
  ADD PRIMARY KEY (`fb_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_acc`
--
ALTER TABLE `admin_acc`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course_tbl`
--
ALTER TABLE `course_tbl`
  MODIFY `cou_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `examinee_tbl`
--
ALTER TABLE `examinee_tbl`
  MODIFY `exmne_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `exam_answers`
--
ALTER TABLE `exam_answers`
  MODIFY `exans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=458;

--
-- AUTO_INCREMENT for table `exam_attempt`
--
ALTER TABLE `exam_attempt`
  MODIFY `examat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `exam_question_tbl`
--
ALTER TABLE `exam_question_tbl`
  MODIFY `eqt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `exam_tbl`
--
ALTER TABLE `exam_tbl`
  MODIFY `ex_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `feedbacks_tbl`
--
ALTER TABLE `feedbacks_tbl`
  MODIFY `fb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
