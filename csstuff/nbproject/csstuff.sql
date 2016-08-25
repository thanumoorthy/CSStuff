-- phpMyAdmin SQL Dump
-- version 2.11.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 25, 2016 at 04:58 AM
-- Server version: 5.1.57
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `a2914448_csstuff`
--

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(10) NOT NULL AUTO_INCREMENT,
  `topic_dt_id` int(10) NOT NULL,
  `post_title` mediumtext NOT NULL,
  `post_small_desc` mediumtext NOT NULL,
  `post_image_url` varchar(100) DEFAULT NULL,
  `total_likes` int(10) DEFAULT NULL,
  `total_comments` int(10) DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `post`
--


-- --------------------------------------------------------

--
-- Table structure for table `post_details`
--

CREATE TABLE `post_details` (
  `post_dt_id` int(10) NOT NULL AUTO_INCREMENT,
  `post_id` int(10) NOT NULL,
  `topic_dt_id` int(10) NOT NULL,
  `post_title` mediumtext NOT NULL,
  `post_desc` text,
  `post_image_url` varchar(100) DEFAULT NULL,
  `total_likes` int(10) DEFAULT NULL,
  `total_comments` int(10) DEFAULT NULL,
  PRIMARY KEY (`post_dt_id`,`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `post_details`
--


-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `topic_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Unique Topic ID',
  `topic_name` varchar(20) NOT NULL,
  `topic_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `topic_name` (`topic_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` VALUES(1, 'Alogorithm', 'Talks about Famous Computer Science Algorithm and their Real Usage');
INSERT INTO `topic` VALUES(2, 'DS', 'Talks about efficient way of Organizing and Storing data');
INSERT INTO `topic` VALUES(3, 'API', 'Talks about API and their Real Usage');
INSERT INTO `topic` VALUES(4, 'RealSystem', 'Talks about Highly scalable RealTime System');

-- --------------------------------------------------------

--
-- Table structure for table `topic_details`
--

CREATE TABLE `topic_details` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `topic_details` 
--

INSERT INTO `topic_details` VALUES(1, 'Analysis of Algorithms', 1, 'Talks about Worst Case, Average Case, Best Case of Computer Science Algorithm', 'fa-flask', 1, '2016-08-25', '2016-08-25');
INSERT INTO `topic_details` VALUES(2, 'Searching and Sorting', 1, 'Talks about Various Sorting Techniques and real time usage for sorting small set and large sets.', 'fa-search', 1, '2016-08-25', '2016-08-25');
INSERT INTO `topic_details` VALUES(3, 'Greedy Algorithm', 1, 'Talks about How Greedy Algorithm works and Real time Usage', 'fa-eye', 1, '2016-08-25', '2016-08-25');
INSERT INTO `topic_details` VALUES(4, 'Bit Manipulation', 1, 'Talks about Bit Algorithm and How we can leverage this methods to Solve Real Problems', 'fa-toggle-', 1, '2016-08-25', '2016-08-25');
INSERT INTO `topic_details` VALUES(5, 'Brain Teaser', 1, 'Talks about Puzzles and way of thinking to solve Real Life Problems', 'fa-puzzle-', 1, '2016-08-25', '2016-08-25');
INSERT INTO `topic_details` VALUES(6, 'Recursion and Dynamic Program', 1, 'Talks about Recursion and Dynamic Programming approach to solve real life Problems', 'fa-sort-am', 1, '2016-08-25', '2016-08-25');
INSERT INTO `topic_details` VALUES(7, 'Graph Algorithm', 1, 'Talks about Various Graph Searching Algorithm and Talks about Real Uage.', 'fa-area-ch', 1, '2016-08-25', '2016-08-25');
INSERT INTO `topic_details` VALUES(8, 'Arrays And String', 2, 'Talks about way of storing contiguous data in the form of Array and String', 'fa-list', 1, '2016-08-25', '2016-08-25');
INSERT INTO `topic_details` VALUES(9, 'Linked List', 2, 'Talks about Storing data in the form of Linked List and how to retrieve them also.', 'fa-link', 0, '2016-08-25', '2016-08-25');
INSERT INTO `topic_details` VALUES(10, 'Stack and Queue', 2, 'Talks about Way of Storing and Retrieving data in the form of Stack and Queue', 'fa-level-u', 0, '2016-08-25', '2016-08-25');
INSERT INTO `topic_details` VALUES(11, 'Trees and Graph', 2, 'Talks about Organizing Data in the From of Trees and Graph', 'fa-tree', 0, '2016-08-25', '2016-08-25');
INSERT INTO `topic_details` VALUES(12, 'Java', 3, 'Talks about famous API and how to use them', 'fa-flask', 0, '2016-08-25', '2016-08-25');
INSERT INTO `topic_details` VALUES(13, 'Google', 4, 'Talks about Famous google APIs', 'fa-flask', 0, '2016-08-25', '2016-08-25');


select a.topic_id , a.topic_name, b.topic_dt_name, b.topic_dt_desc, b.topic_icon,  EXTRACT(YEAR FROM b.last_updated) AS last_updated_year, EXTRACT(MONTH FROM b.last_updated) AS last_updated_month,
EXTRACT(DAY  FROM b.last_updated) AS last_updated_date
from topic a, topic_details b 
where
a.topic_id = b.topic_id
order by a.topic_id 










