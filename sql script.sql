-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `idclient` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `contact` VARCHAR(15) NULL,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`idclient`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Photographer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Photographer` (
  `idPhotographer` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `contact` VARCHAR(15) NULL,
  PRIMARY KEY (`idPhotographer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`booking` (
  `idbooking` INT NOT NULL AUTO_INCREMENT,
  `idclient` INT NULL,
  `idPhotographer` INT NULL,
  `date` DATETIME NULL,
  PRIMARY KEY (`idbooking`),
  INDEX `idclient_idx` (`idclient` ASC) VISIBLE,
  INDEX `idPhotographer_idx` (`idPhotographer` ASC) VISIBLE,
  CONSTRAINT `idclient`
    FOREIGN KEY (`idclient`)
    REFERENCES `mydb`.`client` (`idclient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPhotographer`
    FOREIGN KEY (`idPhotographer`)
    REFERENCES `mydb`.`Photographer` (`idPhotographer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`package`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`package` (
  `idpackage` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `price` DECIMAL(10,2) NULL,
  `duration` INT NULL,
  PRIMARY KEY (`idpackage`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`payment` (
  `idpayment` INT NOT NULL AUTO_INCREMENT,
  `idbooking` INT NULL,
  `amount` DECIMAL(10,2) NULL,
  `paymentcol` ENUM('credit card', 'debit card', 'paypal', 'bank transfer') NULL,
  `status` ENUM('pending', 'completed', 'failed') NULL,
  PRIMARY KEY (`idpayment`),
  INDEX `idbooking_idx` (`idbooking` ASC) VISIBLE,
  CONSTRAINT `idbooking`
    FOREIGN KEY (`idbooking`)
    REFERENCES `mydb`.`booking` (`idbooking`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gallery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gallery` (
  `idgallery` INT NOT NULL AUTO_INCREMENT,
  `idclient` INT NULL,
  `idbooking` INT NULL,
  `url` VARCHAR(255) NULL,
  PRIMARY KEY (`idgallery`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
