-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 09 Şub 2017, 19:32:15
-- Sunucu sürümü: 5.6.24
-- PHP Sürümü: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `testrepository`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tetikleyiciler `admin`
--
DELIMITER $$
CREATE TRIGGER `admin_delete` AFTER DELETE ON `admin`
 FOR EACH ROW DELETE FROM admin WHERE id = 8
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `correct`
--

CREATE TABLE IF NOT EXISTS `correct` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `id` int(11) NOT NULL,
  `course_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `course_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `instructor`
--

CREATE TABLE IF NOT EXISTS `instructor` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `img` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `instructor_course`
--

CREATE TABLE IF NOT EXISTS `instructor_course` (
  `id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL,
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_option` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `second_option` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `third_option` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fourth_option` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `begin_date` datetime NOT NULL,
  `end_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `repository`
--

CREATE TABLE IF NOT EXISTS `repository` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `correct_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `img` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `student_quiz`
--

CREATE TABLE IF NOT EXISTS `student_quiz` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `correct_answer` int(11) NOT NULL,
  `incorrect_answer` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `complete` int(11) NOT NULL,
  `quiz_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `student_test_performance`
--
CREATE TABLE IF NOT EXISTS `student_test_performance` (
`course_name` varchar(50)
,`course_code` varchar(50)
,`student_name` varchar(25)
,`student_last_name` varchar(25)
,`department_name` varchar(50)
,`correct` int(11)
,`incorrect` int(11)
,`score` int(11)
);

-- --------------------------------------------------------

--
-- Görünüm yapısı `student_test_performance`
--
DROP TABLE IF EXISTS `student_test_performance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_test_performance` AS select `c`.`course_name` AS `course_name`,`c`.`course_code` AS `course_code`,`s`.`name` AS `student_name`,`s`.`last_name` AS `student_last_name`,`d`.`name` AS `department_name`,`sq`.`correct_answer` AS `correct`,`sq`.`incorrect_answer` AS `incorrect`,`sq`.`score` AS `score` from (((((`instructor_course` `ic` join `course` `c`) join `student` `s`) join `student_quiz` `sq`) join `quiz` `q`) join `department` `d`) where ((`s`.`department_id` = `d`.`id`) and (`sq`.`student_id` = `s`.`id`) and (`sq`.`quiz_id` = `q`.`course_id`) and (`c`.`id` = `q`.`course_id`)) group by `s`.`id`;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `correct`
--
ALTER TABLE `correct`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Tablo için indeksler `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `course_name` (`course_name`), ADD UNIQUE KEY `course_code` (`course_code`);

--
-- Tablo için indeksler `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Tablo için indeksler `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `instructor_course`
--
ALTER TABLE `instructor_course`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `question` (`question`);

--
-- Tablo için indeksler `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `repository`
--
ALTER TABLE `repository`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `student_quiz`
--
ALTER TABLE `student_quiz`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `correct`
--
ALTER TABLE `correct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `instructor`
--
ALTER TABLE `instructor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `instructor_course`
--
ALTER TABLE `instructor_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `repository`
--
ALTER TABLE `repository`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `student_quiz`
--
ALTER TABLE `student_quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
