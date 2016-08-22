-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2016 at 06:22 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `csstuff`
--

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int(10) NOT NULL AUTO_INCREMENT,
  `topic_dt_id` int(10) NOT NULL,
  `post_title` mediumtext NOT NULL,
  `post_small_desc` mediumtext NOT NULL,
  `post_image_url` varchar(100) DEFAULT NULL,
  `total_likes` int(10) DEFAULT NULL,
  `total_comments` int(10) DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `post_details`
--

CREATE TABLE IF NOT EXISTS `post_details` (
  `post_dt_id` int(10) NOT NULL AUTO_INCREMENT,
  `post_id` int(10) NOT NULL,
  `topic_dt_id` int(10) NOT NULL,
  `post_title` mediumtext NOT NULL,
  `post_desc` text,
  `post_image_url` varchar(100) DEFAULT NULL,
  `total_likes` int(10) DEFAULT NULL,
  `total_comments` int(10) DEFAULT NULL,
  PRIMARY KEY (`post_dt_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE IF NOT EXISTS `topic` (
  `topic_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Unique Topic ID',
  `topic_name` varchar(20) NOT NULL,
  `topic_desc` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `topic_name` (`topic_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`topic_id`, `topic_name`, `topic_desc`) VALUES
(1, 'Alogorithm', 'Talks about Algorithm'),
(2, 'DS', 'Talks about Data Structure'),
(3, 'API', 'Talks about API'),
(4, 'RealSystem', 'Talks about Real System');

-- --------------------------------------------------------

--
-- Table structure for table `topic_details`
--

CREATE TABLE IF NOT EXISTS `topic_details` (
  `topic_dt_id` int(10) NOT NULL AUTO_INCREMENT,
  `topic_dt_name` varchar(30) NOT NULL,
  `topic_id` int(10) NOT NULL,
  `topic_dt_desc` varchar(100) NOT NULL,
  `topic_icon` varchar(10) NOT NULL,
  `total_posts` int(11) NOT NULL,
  `created_on_dt` date NOT NULL,
  `last_updated` date NOT NULL,
  PRIMARY KEY (`topic_dt_id`),
  FULLTEXT KEY `topic_dt_name` (`topic_dt_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
