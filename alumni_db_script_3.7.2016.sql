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
  `password` VARCHAR(255) NOT NULL,
  `fname` VARCHAR(255) NOT NULL,
  `lnamediploma` VARCHAR(255) NOT NULL,
  `lname` VARCHAR(255) NOT NULL,
  `graduation_year` INT NOT NULL,
  `major` VARCHAR(45) NOT NULL,
  `degree` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`userID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Alumni_db`.`diploma_t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Alumni_db`.`diploma_t` (
  `userID` INT NOT NULL,
  `graduation_year` INT NULL,
  `major` VARCHAR(45) NULL,
  `degree` VARCHAR(45) NULL,
  INDEX `email_idx` (`userID` ASC),
  CONSTRAINT `FK_diploma_userid`
    FOREIGN KEY (`userID`)
    REFERENCES `Alumni_db`.`user_t` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Alumni_db`.`userrole_t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Alumni_db`.`userrole_t` (
  `email` VARCHAR(255) NOT NULL,
  `rolename` VARCHAR(45) NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Alumni_db`.`employment_t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Alumni_db`.`employment_t` (
  `userID` INT NOT NULL,
  `employer` VARCHAR(255) NULL,
  `position` VARCHAR(255) NULL,
  `workphone` VARCHAR(255) NULL,
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
