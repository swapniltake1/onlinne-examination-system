/*
SQLyog Community Edition- MySQL GUI v6.07
Host - 5.5.24 : Database - cbseExam
*********************************************************************
Server version : 5.5.24
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `cbseExam`;

USE `cbseExam`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `questionpaper` */

DROP TABLE IF EXISTS `questionpaper`;

CREATE TABLE `questionpaper` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `quiznumber` int(11) NOT NULL,
  `quiz` mediumblob,
  `option1` mediumblob,
  `option2` mediumblob,
  `option3` mediumblob,
  `option4` mediumblob,
  `correctoption` int(11) DEFAULT NULL,
  `marks` float NOT NULL DEFAULT '0',
  `negativemarks` float NOT NULL DEFAULT '0',
  `entrydate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `quizID` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `questionpaper` */

insert  into `questionpaper`(`id`,`quiznumber`,`quiz`,`option1`,`option2`,`option3`,`option4`,`correctoption`,`marks`,`negativemarks`,`entrydate`,`quizID`) values (1,1,'Hello how are you','Hi','Hello','Hi','How',1,5,2,'2019-03-04 18:33:08',1),(2,2,'Please','Yes','No','Ok','Fine',1,3,2,'2019-03-04 18:29:09',1),(3,3,'Seeyou','No','Ok','Good','Not',1,2.4,0,'2019-03-04 18:29:27',1),(4,4,'How','Good','Ok','Bad','Very Good',1,3,0.5,'2019-03-04 18:28:43',1),(5,5,'How is the Question paper','Very Tough','Good','Not Good','Ok',1,5,1,'2019-03-05 17:49:33',1),(6,6,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'2019-02-01 17:48:14',1),(7,1,'What is Java','Programming Language','Sport Langauge','Subject ','Nothing',1,2,0.5,'2019-03-05 17:20:07',2),(8,2,'What is abstract Method','A method in Super Class','Normal Method','Method Without Signature','Private method',3,2,0.5,'2019-03-05 17:26:27',2),(9,3,'What is thread','Flow','Process','Prohram','Operating',1,2,0.5,'2019-03-14 15:29:32',2),(10,4,'What is Grabage Collection','Destructor in java','Final Method','Program','Process',2,4,1,'2019-03-05 17:28:13',2),(11,1,'How are You','Fine','OK','Not OK','Good',2,2,0.25,'2019-03-19 03:49:26',3),(12,2,'dhoni higest score','183','200','198','243',1,2,0,'2019-03-19 03:51:06',3);

/*Table structure for table `setexam` */

DROP TABLE IF EXISTS `setexam`;

CREATE TABLE `setexam` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `questionpapername` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `availablecode` char(3) NOT NULL DEFAULT 'no',
  `staffid` int(11) NOT NULL,
  `time` int(20) NOT NULL DEFAULT '0',
  `totalquestions` int(11) NOT NULL DEFAULT '0',
  `marks` float NOT NULL DEFAULT '0',
  `class` char(2) NOT NULL,
  `entrydate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `setexam` */

insert  into `setexam`(`id`,`questionpapername`,`subject`,`availablecode`,`staffid`,`time`,`totalquestions`,`marks`,`class`,`entrydate`) values (1,'MathWinter2018','math','no',1,240,6,12,'fy','2019-02-12 21:26:51'),(2,'JavaQuestionPaper','phy','no',1,1200,4,8,'fy','2019-03-05 17:17:46'),(3,'March2019','Java','no',1,600,2,4,'TY','2019-03-19 03:48:11');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `rollno` char(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `class` char(2) NOT NULL,
  `password` varchar(150) NOT NULL,
  `status` char(3) NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `student` */

insert  into `student`(`id`,`rollno`,`name`,`class`,`password`,`status`) values (1,'12','Sachin Nanasaheb Thorat','fy','123456','yes'),(2,'1111111111','Virat Kohli','fy','123456','yes'),(3,'2222222222','Virat Kohli','fy','123456','yes'),(4,'3333333333','Shikhar Dhawan','sy','123456','yes'),(5,'1122334455','MS Dhoni','fy','123456','yes');

/*Table structure for table `studentappea` */

DROP TABLE IF EXISTS `studentappea`;

CREATE TABLE `studentappea` (
  `appearid` int(50) NOT NULL AUTO_INCREMENT,
  `studentid` int(20) NOT NULL,
  `quizID` int(20) NOT NULL,
  `status` char(3) NOT NULL DEFAULT 'no',
  `entrydate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`appearid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `studentappea` */

insert  into `studentappea`(`appearid`,`studentid`,`quizID`,`status`,`entrydate`) values (1,1,1,'yes','2019-03-05 19:31:59'),(2,2,1,'no','2019-03-05 17:32:11'),(3,3,2,'yes','2019-03-05 17:32:57'),(4,1,2,'no','2019-03-12 16:42:35'),(5,4,2,'yes','2019-03-14 15:32:36'),(6,4,1,'no','2019-03-14 17:08:41'),(7,5,2,'yes','2019-03-19 03:45:44'),(8,5,3,'yes','2019-03-19 03:52:23');

/*Table structure for table `studentresponses` */

DROP TABLE IF EXISTS `studentresponses`;

CREATE TABLE `studentresponses` (
  `rid` int(100) NOT NULL AUTO_INCREMENT,
  `studentid` int(20) NOT NULL,
  `quizID` int(20) NOT NULL,
  `qnumber` int(11) NOT NULL,
  `optionselected` int(11) NOT NULL,
  `entrytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Data for the table `studentresponses` */

insert  into `studentresponses`(`rid`,`studentid`,`quizID`,`qnumber`,`optionselected`,`entrytime`) values (1,1,1,1,2,'2019-03-04 22:30:10'),(2,1,1,2,1,'2019-03-04 22:44:47'),(3,1,1,3,2,'2019-03-04 22:53:31'),(4,1,1,4,1,'2019-03-04 22:44:56'),(5,1,1,5,1,'2019-03-04 22:45:01'),(6,1,1,6,1,'2019-03-04 22:40:25'),(7,2,1,1,2,'2019-03-05 22:08:29'),(8,2,1,2,2,'2019-03-05 21:53:35'),(9,2,1,3,2,'2019-03-05 21:53:40'),(10,2,1,4,1,'2019-03-05 21:53:42'),(11,2,1,5,1,'2019-03-05 21:55:08'),(12,2,1,6,1,'2019-03-05 21:53:54'),(13,3,2,1,1,'2019-03-05 17:30:28'),(14,3,2,2,3,'2019-03-05 17:32:16'),(15,3,2,3,2,'2019-03-05 17:32:23'),(16,3,2,4,2,'2019-03-05 17:32:35'),(17,1,2,1,0,'2019-03-12 16:42:35'),(18,1,2,2,0,'2019-03-12 16:42:35'),(19,1,2,3,0,'2019-03-12 16:42:35'),(20,1,2,4,0,'2019-03-12 16:42:35'),(21,4,2,1,1,'2019-03-14 15:32:00'),(22,4,2,2,2,'2019-03-14 15:32:05'),(23,4,2,3,1,'2019-03-14 15:32:09'),(24,4,2,4,0,'2019-03-14 15:29:52'),(25,4,1,1,0,'2019-03-14 17:08:40'),(26,4,1,2,2,'2019-03-14 17:09:43'),(27,4,1,3,1,'2019-03-14 17:09:46'),(28,4,1,4,2,'2019-03-14 17:09:48'),(29,4,1,5,2,'2019-03-14 17:09:52'),(30,4,1,6,1,'2019-03-14 17:09:55'),(31,5,2,1,1,'2019-03-19 03:45:12'),(32,5,2,2,2,'2019-03-19 03:45:16'),(33,5,2,3,1,'2019-03-19 03:45:24'),(34,5,2,4,2,'2019-03-19 03:45:36'),(35,5,3,1,2,'2019-03-19 03:52:10'),(36,5,3,2,1,'2019-03-19 03:52:16');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
