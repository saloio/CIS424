-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Alumni_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Alumni_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Alumni_db` DEFAULT CHARACTER SET utf8 ;
USE `Alumni_db` ;

-- -----------------------------------------------------
-- Table `Alumni_db`.`user_t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Alumni_db`.`user_t` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `fname` VARCHAR(255) NOT NULL,
  `lnamediploma` VARCHAR(255) NOT NULL,
  `lname` VARCHAR(255) NOT NULL,
  `cellphone` VARCHAR(15) NULL,
  `selfDescription` LONGTEXT NULL,
  `photo` INT NULL,
  PRIMARY KEY (`userID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Alumni_db`.`major_t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Alumni_db`.`major_t` (
  `majorID` INT NOT NULL,
  `majorName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`majorID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Alumni_db`.`degree_t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Alumni_db`.`degree_t` (
  `degreeID` INT NOT NULL,
  `degreeName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`degreeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Alumni_db`.`diploma_t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Alumni_db`.`diploma_t` (
  `diplomaID` INT NOT NULL AUTO_INCREMENT,
  `graduationYear` YEAR NOT NULL,
  `userID` INT NOT NULL,
  `majorID` INT NOT NULL,
  `degreeID` INT NOT NULL,
  INDEX `email_idx` (`userID` ASC),
  INDEX `majorID_idx` (`majorID` ASC),
  INDEX `degreeID_idx` (`degreeID` ASC),
  PRIMARY KEY (`diplomaID`),
  CONSTRAINT `FK_diploma_userid`
    FOREIGN KEY (`userID`)
    REFERENCES `Alumni_db`.`user_t` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `FK_majorID`
    FOREIGN KEY (`majorID`)
    REFERENCES `Alumni_db`.`major_t` (`majorID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `FK_degreeID`
    FOREIGN KEY (`degreeID`)
    REFERENCES `Alumni_db`.`degree_t` (`degreeID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Alumni_db`.`userpass_t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Alumni_db`.`userpass_t` (
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Alumni_db`.`userrole_t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Alumni_db`.`userrole_t` (
  `email` VARCHAR(255) NOT NULL,
  `rolename` VARCHAR(45) NOT NULL,
  INDEX `FK_userrole_email_idx` (`email` ASC),
  PRIMARY KEY (`email`),
  CONSTRAINT `FK_userrole_email`
    FOREIGN KEY (`email`)
    REFERENCES `Alumni_db`.`userpass_t` (`email`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Alumni_db`.`employment_t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Alumni_db`.`employment_t` (
  `userID` INT NOT NULL,
  `employer` VARCHAR(255) NOT NULL,
  `position` VARCHAR(255) NOT NULL,
  `workphone` VARCHAR(255) NOT NULL,
  INDEX `email_idx` (`userID` ASC),
  CONSTRAINT `FK_emp_userID`
    FOREIGN KEY (`userID`)
    REFERENCES `Alumni_db`.`user_t` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Alumni_db`.`skills_t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Alumni_db`.`skills_t` (
  `userID` INT NOT NULL,
  `skills` TINYINT(1) NULL,
  INDEX `FK_skills_email_idx` (`userID` ASC),
  CONSTRAINT `FK_skills_userID`
    FOREIGN KEY (`userID`)
    REFERENCES `Alumni_db`.`user_t` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
