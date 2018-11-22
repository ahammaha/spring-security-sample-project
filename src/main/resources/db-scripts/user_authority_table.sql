DROP DATABASE  IF EXISTS `sample_spring_security`;

CREATE DATABASE  IF NOT EXISTS `sample_spring_security`;
USE `sample_spring_security`;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Inserting data for table `users`
-- {noop} => means no encryption 

INSERT INTO `users` 
VALUES 
('user1','{noop}pwd',1),
('user2','{noop}pwd',1),
('user3','{noop}pwd',1);


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

