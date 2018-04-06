SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS LudwigPR;
CREATE DATABASE LudwigPR;

USE LudwigPR;
CREATE TABLE Employees (
	`EmployeeID` INT(11) NOT NULL AUTO_INCREMENT,
	`First-name` VARCHAR(64) DEFAULT NULL,
	`Last-name` VARCHAR(64) DEFAULT NULL,
	`Email` VARCHAR(320) DEFAULT NULL,
	PRIMARY KEY (`EmployeeID`)
)
ENGINE = InnoDB;

CREATE TABLE Company (
	`CompanyID` INT(11) NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(64) NOT NULL,
	PRIMARY KEY (`CompanyID`)
)
ENGINE = InnoDB;

CREATE TABLE Actors (
	`ActorID` INT(11) NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(64) DEFAULT NULL,
	PRIMARY KEY (`ActorID`)
)
ENGINE = InnoDB;

CREATE TABLE Customer (
	`CustomerID` INT(11) NOT NULL AUTO_INCREMENT,
	`First_name` VARCHAR(64) DEFAULT NULL,
	`Last_name` VARCHAR(64) DEFAULT NULL,
	`Phone_nr` INT(22) NOT NULL,
	`Email` VARCHAR(320) NOT NULL,
	PRIMARY KEY (`CustomerID`)
)
ENGINE = InnoDB; 

CREATE TABLE Movies (
	`MovieID` INT(11) NOT NULL AUTO_INCREMENT,
	`Title` VARCHAR(64) DEFAULT NULL,
	`Length` INT(11) NOT NULL,
	`Director` VARCHAR(64) NOT NULL,
	`Release_date` DATE NOT NULL,
    `Company_CompanyID` INT(11),
    `Genre_GenreID` INT(11),
    `Price` INT(11),
    `Actors_ActorID` INT(11),
	PRIMARY KEY (`MovieID`),
	FOREIGN KEY (`Company_CompanyID`) REFERENCES `Company`(`CompanyID`) ON DELETE SET NULL,
	FOREIGN KEY (`Genre_GenreID`) REFERENCES `Genre`(`GenreID`) ON DELETE SET NULL,
    FOREIGN KEY (`Actors_ActorID`) REFERENCES `Actors`(`ActorID`) ON DELETE SET NULL
)
ENGINE = InnoDB;

CREATE TABLE Genre (
	`GenreID` INT(11) NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(64) NOT NULL,
	PRIMARY KEY (`GenreID`)
)
ENGINE = InnoDB;

CREATE TABLE Sales (
	`SaleID` INT(11) NOT NULL AUTO_INCREMENT,
	`sale_date` DATE NOT NULL,
    `Customer_CustomerID` INT(11),
    `Employees_EmployeeID` INT(11),
    `Movies_MovieID` INT(11),
	PRIMARY KEY (`SaleID`),
	FOREIGN KEY (`Customer_CustomerID`) REFERENCES `Customer`(`CustomerID`),
	FOREIGN KEY (`Employees_EmployeeID`) REFERENCES `Employee`(`EmployeeID`),
	FOREIGN KEY (`Movies_MovieID`) REFERENCES `Movies`(`MovieID`)
)
ENGINE = InnoDB;

SET AUTOCOMMIT=0;
INSERT INTO Genre VALUES
(1,'Action'),
(2,'Comedy'),
(3,'Horror'),
(4,'Animation'),
(5,'Drama'),
(6,'Sport'),
(7,'Sci-fi'),
(8,'History');

SET AUTOCOMMIT=0;
INSERT INTO Actors VALUES
(1,'Suraj Sharma'),
(2,'Mel Gibson'),
(3,'Bruce Willis'),
(4,'Tom Hanks'),
(5,'Liam Neeson'),
(6,'Hilary Swank'),
(7,'Jason Statham'),
(8,'Ben Brutt'),
(9,'Adrien Brody'),
(10,'Anthony Perkins');

SET AUTOCOMMIT=0;
INSERT INTO Movies VALUES /*ID, Name, Length, Director, Release date, company, genre, price, actor*/
(1,'Saving Private ryan', '169','Steven Spielberg', '1998-10-09',3, 1, 29, 6), 
(2,'Fight Club', '139', 'David Fincher', '1999-12-23',1,1, 10, 8), 
(3,'Blockers', '155', 'Kay Cannon', '2018-04-06',2, 2, 13, 10), 
(4,'A Quiet place', '90', 'John Krasinski', '2018-04-06',4, 3, 10, 9), 
(5,'The Miracle season', '99', 'Sean McNamara', '2018-04-06',7, 6, 14, 5), 
(6,'Lean on Pete', '121', 'Andrew Haigh', '2018-05-04',5, 5, 9, 3), 
(7,'The endless', '111', 'Justin Benso', '2017-04-06',6, 7, 19, 1), 
(8,'The Shawshank Redemption', '142', 'Frank Darabont', '1995-03-0',1, 5, 35, 2), 
(9,'The dark knight', '192', 'Cristopher Nolan', '2008-07-22', 3, 1, 16, 4), 
(10,'Star Wars Episode IV', '121', 'eorge Lucas', '1977-12-16',4, 7, 27, 7), 
(11,'Psycho', '109', 'Alfred Hitchcock', '1960-1-31',5, 3, 15, 10), 
(12,'The Pianist', '150', 'Roman Polanski', '2003-08-15',4, 5, 14, 9), 
(13,'Wall-E', '98', 'Andrew Stanton', '2008-11-05', 1, 4, 21, 8), 
(14,'Snatch', '104', 'Guy Ritchie', '2000-12-22', 6, 2, 8, 7), 
(15,'Million dollar baby', '132', 'Clint Eastwood', '2005-04-08', 7, 6, 30, 6), 
(16,'Schindlers List', '195', 'Steven Spielberg', '1994-03-04',2, 8, 17, 5), 
(17,'Toy Story', '81', 'Jhon Lasseter', '1996-03-08',3, 4, 24, 4), 
(18,'Die Hard', '132', 'Jhon McTiernan', '1988-11-30',2, 1, 12, 3), 
(19,'Life or Pi', '137', 'Ang Lee', '2012-12-21', 1, 5, 23, 1), 
(20,'Braveheart', '178', 'Mel Gibso', '1995-11-01',7, 8, 22, 2); 

SET AUTOCOMMIT=0;
INSERT INTO Company VALUES
(1,'Columbia Pictures'),
(2,'Sony Pictures'),
(3,'Walt disney Pictures'),
(4,'Twentieth Cenrury Fox'), 
(5,'Warner Boss'),
(6,'Dreamworks SKG'),
(7,'Hollywood Pictures');

SET AUTOCOMMIT=0;
INSERT INTO Customer VALUES
(1,'Alex', 'Anderson', '9820526', 'example1@example1.com'),
(2,'Ryan', 'Dungey', '1569713', 'example2@example2.com'),
(3,'Aron', 'Plessinger', '1697584', 'sql@qsl.com'),
(4,'Cindy', 'Crawford', '346985', 'workbench@benchwork.com'),
(5,'Ronnie', 'Mac', '1679584', 'ronnie@hotmail.com'),
(6,'Mac', 'Miller', '4521986', 'mac@miller@hotmail.com'),
(7,'Jennie', 'Ryan', '1695698', 'jennie.ryan@gmail.com'),
(8,'Jacob', 'Karlsson', '1668452', 'jacob@outlook.com'),
(9,'Andrew', 'Carmichael', '1364976', 'and.car@outlook.com'),
(10,'Mitchell', 'Oldenburg', '1697526', 'Olden@hotmail.com');

SET AUTOCOMMIT=0;
INSERT INTO Employees VALUES 
(1,'Anthony', 'Reacher', 'ant.reach@hotmail.com'),
(2,'Rina', 'Lakeswood', 'Riri@outlook.com'),
(3,'Justin', 'Barchia', 'bambam@gmail.com'),
(4,'Blake', 'Boogle', 'b.b@hotmail.com'),
(5,'Adriana', 'Villopoto', 'adi.vilo@hotmail.com'),
(6,'Jessica', 'Mullins', 'jessieM@outlook.com'),
(7, 'Trisha', 'Andersson', 'trish@gmail.com'),
(8, 'Tyler', 'Tyson', 'tyty@outlook.com'),
(9, 'Chester', 'Davalos', 'chest@gmail.com'),
(10, 'Martinez', 'Edoardo', 'mar.ed@hotmail.com');

SET AUTOCOMMIT=0;
INSERT INTO Sales VALUES
(1, '2012-06-20', 4, 1, 16),
(2, '2017-11-14', 1, 2, 1),
(3, '2013-12-06', 2, 6, 18),
(4, '2015-10-05', 3, 7, 14),
(5, '2010-03-07', 5, 3, 15),
(6, '2010-07-09', 7, 8, 8),
(7, '2017-04-24', 3, 1, 10),
(8, '2016-09-14', 6, 4, 3),
(9, '2015-10-01', 10, 9, 6),
(10, '2017-07-06', 8, 5, 20),
(11, '2014-04-06', 2, 10, 13),
(12, '2018-06-03', 5, 4, 11),
(13, '2012-12-15', 10, 9, 2),
(14, '2013-10-26', 9, 2, 4),
(15, '2018-12-18', 7, 7, 5);

CREATE VIEW `1_MoviesInCompany` AS
SELECT 
Movies.MovieID AS 'Movie ID',
Title AS 'Title', 
Length AS 'Length',
Director AS 'Director',
Release_date AS 'Release date',
Company.Name AS 'Production company',
Actors.Name AS 'Actor'
FROM Movies
INNER JOIN Actors ON Actors.actorID = Movies.Actors_ActorID /*Showing the Actors name instead of ID number.*/
INNER JOIN Company ON Company.CompanyID = Movies.Company_CompanyID /*Showing the Companys name instead of ID number.*/
WHERE MovieID < 50 
ORDER BY (Length);







