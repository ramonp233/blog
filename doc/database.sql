-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Loomise aeg: Okt 20, 2014 kell 03:11 EL
-- Serveri versioon: 5.6.20
-- PHP versioon: 5.5.15

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Andmebaas: `blog`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(10) unsigned NOT NULL,
  `comment_author` varchar(50) NOT NULL,
  `comment_text` text NOT NULL,
  `comment_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `post_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Andmete tõmmistamine tabelile `comment`
--

INSERT INTO `comment` (`comment_id`, `comment_author`, `comment_text`, `comment_created`, `post_id`) VALUES
  (1, 'Gunnar', 'aaaaaaaaaaaaaaaaaa', '2014-09-20 23:33:23', 1),
  (2, 'Gunnar', 'dddddddddddddddddddd', '2014-09-21 00:37:19', 1),
  (3, 'Gunnar', 'dfdsfsf', '2014-09-21 08:40:30', 1),
  (4, 'Gunnar', 'sdfdsfsfsf', '2014-09-21 08:40:32', 1),
  (5, 'Gunnar', 'Teeeegelt', '2014-09-21 08:40:38', 2),
  (6, 'Gunnar', 'zsdczxc', '2014-09-21 08:46:26', 2),
  (7, 'Gunnar', 'Tervitus teile', '2014-09-22 19:43:01', 2),
  (8, 'Gunnar', 'asdas', '2014-10-15 19:52:26', 1);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int(11) unsigned NOT NULL,
  `post_subject` varchar(255) NOT NULL,
  `post_text` text NOT NULL,
  `post_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) unsigned NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Andmete tõmmistamine tabelile `post`
--

INSERT INTO `post` (`post_id`, `post_subject`, `post_text`, `post_created`, `user_id`) VALUES
  (1, 'Post subjeeekt', 'Random post text', '2014-09-20 16:45:24', 1),
  (2, 'Post subjeekt 2', 'Random post test 22222 Testing', '2014-09-20 16:45:44', 1);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
CREATE TABLE IF NOT EXISTS `post_tags` (
  `post_id` int(11) unsigned NOT NULL,
  `tag_id` int(11) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Andmete tõmmistamine tabelile `post_tags`
--

INSERT INTO `post_tags` (`post_id`, `tag_id`) VALUES
  (1, 3),
  (1, 4);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `tag_id` int(10) unsigned NOT NULL,
  `tag_name` varchar(25) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Andmete tõmmistamine tabelile `tag`
--

INSERT INTO `tag` (`tag_id`, `tag_name`) VALUES
  (3, 'Niisama'),
  (4, 'Hommikul');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) unsigned NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Andmete tõmmistamine tabelile `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `deleted`) VALUES
  (1, 'demo', 'demo', 0);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `comment`
--
ALTER TABLE `comment`
ADD PRIMARY KEY (`comment_id`,`post_id`);

--
-- Indeksid tabelile `post`
--
ALTER TABLE `post`
ADD PRIMARY KEY (`post_id`), ADD KEY `user_id` (`user_id`);

--
-- Indeksid tabelile `post_tags`
--
ALTER TABLE `post_tags`
ADD PRIMARY KEY (`post_id`,`tag_id`), ADD KEY `tag_id` (`tag_id`);

--
-- Indeksid tabelile `tag`
--
ALTER TABLE `tag`
ADD PRIMARY KEY (`tag_id`);

--
-- Indeksid tabelile `user`
--
ALTER TABLE `user`
ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `comment`
--
ALTER TABLE `comment`
MODIFY `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT tabelile `post`
--
ALTER TABLE `post`
MODIFY `post_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT tabelile `tag`
--
ALTER TABLE `tag`
MODIFY `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT tabelile `user`
--
ALTER TABLE `user`
MODIFY `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `post`
--
ALTER TABLE `post`
ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Piirangud tabelile `post_tags`
--
ALTER TABLE `post_tags`
ADD CONSTRAINT `post_tags_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
ADD CONSTRAINT `post_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`);
SET FOREIGN_KEY_CHECKS=1;
