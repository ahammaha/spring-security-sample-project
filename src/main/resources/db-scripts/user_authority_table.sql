DROP DATABASE  IF EXISTS `spring_security_bcrypt_ex`;

CREATE DATABASE  IF NOT EXISTS `spring_security_bcrypt_ex`;
USE `spring_security_bcrypt_ex`;

--
-- Table structure for table `users`
-- Password field should have min 68 chars because {bcrypt} => 8 char + 60 char for encrypted pwd

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(68) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Inserting data for table `users`
-- {noop} => means no encryption 

INSERT INTO `users` 
VALUES 
('user1','{bcrypt}$2a$04$Oud190SfbiHMfBv6dt4CPem2TqgVaq1wvyC5rrupenm9zbB8SstQu',1),
('user2','{bcrypt}$2a$04$Oud190SfbiHMfBv6dt4CPem2TqgVaq1wvyC5rrupenm9zbB8SstQu',1),
('user3','{bcrypt}$2a$04$Oud190SfbiHMfBv6dt4CPem2TqgVaq1wvyC5rrupenm9zbB8SstQu',1);


--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Inserting data for table `authorities`
--

INSERT INTO `authorities` 
VALUES 
('user1','ROLE_ADMIN'),
('user1','ROLE_EMPLOYEE'),
('user2','ROLE_MANAGER'),
('user2','ROLE_EMPLOYEE'),
('user3','ROLE_EMPLOYEE');

