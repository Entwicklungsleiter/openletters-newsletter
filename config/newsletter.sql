-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: openletters
-- ------------------------------------------------------
-- Server version	5.5.47-0+deb7u1

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
INSERT INTO `migrations` VALUES (1,'00074_add_database_versioning.php','2016-07-12 19:18:44'),(2,'00075_user_groups.php','2016-07-12 19:18:44'),(3,'00081_userTimestamps.php','2016-07-12 19:18:44'),(4,'00019_add_newsletter_receivers_active.php','2016-07-12 19:18:44'),(5,'00026_add_double_opt_in.php','2016-07-12 19:18:44');
UNLOCK TABLES;

--
-- Table structure for table `newsletter`
--

CREATE TABLE IF NOT EXISTS `newsletter` (
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `anrede` varchar(8) NOT NULL,
  `aktiv` tinyint(1) NOT NULL DEFAULT '0',
  `double_optin_token` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `newsletter`
--

LOCK TABLES `newsletter` WRITE;
INSERT INTO `newsletter` VALUES (1,'webmaster@open-letters.de','Stefan Rank-Kunitz','Herr',0,NULL,'2016-07-12 19:18:44','2016-07-12 19:18:44');
UNLOCK TABLES;

--
-- Table structure for table `newsletterCont`
--

CREATE TABLE IF NOT EXISTS `newsletterCont` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL DEFAULT '0',
  `sent` int(11) NOT NULL DEFAULT '0',
  `templatefile` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `newsletterCont`
--

LOCK TABLES `newsletterCont` WRITE;
INSERT INTO `newsletterCont` VALUES (10,1259314905,0,'template_02_xmas'),(13,1270915082,4,'template_01');
UNLOCK TABLES;

--
-- Table structure for table `newsletterEntries`
--

CREATE TABLE IF NOT EXISTS `newsletterEntries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsletterContId` int(11) NOT NULL DEFAULT '0',
  `headline` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `newsletterEntries`
--

LOCK TABLES `newsletterEntries` WRITE;
INSERT INTO `newsletterEntries` VALUES (13,10,'Neuer Eintrag 2','<p style=\"text-align:justify;\">Sed ut perspi<strong>ciatis </strong><span><strong>unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab ill</strong>o in</span>ventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>',1),(12,10,'Ein neuer Newslettereintrag:','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',0),(16,13,'Ein neues Newslettersystem:','<p style=\"text-align:center;\"><img src=\"http://localhost/~kermit/newsletter/uploaded/newslettersystem_versand_300x284.jpg\" alt=\"\" /></p>\n<p>Seit heute hat Open-Letters ein neues Newslettersystem! FÃ¼hlen Sie sich frei, dieses Newslettersystem herunterzuladen und zu nutzen.</p>\n<p>Wenn Sie VerÃ¤nderungen am System vornehmen, also zum Beispiel:</p>\n<ul><li>neue Templates entwickeln</li>\n<li>Funktionserweiterungen vornehmen</li>\n<li>Fehler finden und beheben</li>\n</ul><p>so bitten wir Sie, diese Ã„nderungen an uns zurÃ¼ckzugeben: Wir wÃ¼rden Sie gern allen anderen Nutzern zur VerfÃ¼gung stellen!</p>',0),(14,10,'Frohe Weihnachten!','<p style=\"text-align:right;\">Ihr Open-Letters-Team wÃ¼nscht Ihnen<br />ein gesegnetes Weihnachtsfest</p>',2),(18,13,'Vielen Dank!','<p>Ihr Open-Letters-Team</p>',1);
UNLOCK TABLES;

--
-- Table structure for table `newsletterGroups`
--

CREATE TABLE IF NOT EXISTS `newsletterGroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userGroup` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `specialGroup` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `newsletterGroups`
--

LOCK TABLES `newsletterGroups` WRITE;
INSERT INTO `newsletterGroups` VALUES (1,'Ungruppiert','2016-07-12 19:18:44',2),(2,'Neue Anmeldungen','2016-07-12 19:18:44',1);
UNLOCK TABLES;

--
-- Table structure for table `newsletterUserInGroup`
--

CREATE TABLE IF NOT EXISTS `newsletterUserInGroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `userGroup` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `newsletterUserInGroup`
--

LOCK TABLES `newsletterUserInGroup` WRITE;
INSERT INTO `newsletterUserInGroup` VALUES (1,1,1,'2016-07-12 19:18:44');
UNLOCK TABLES;
