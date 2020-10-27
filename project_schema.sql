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
-- Table `mydb`.`FOOD_TYPE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FOOD_TYPE` (
  `food_id` INT NOT NULL AUTO_INCREMENT,
  `food_name` VARCHAR(45) NULL,
  PRIMARY KEY (`food_id`),
  UNIQUE INDEX `food_id_UNIQUE` (`food_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AIRLINE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AIRLINE` (
  `air_code` VARCHAR(5) NOT NULL,
  `air_name` VARCHAR(45) NULL,
  PRIMARY KEY (`air_code`),
  UNIQUE INDEX `air_id_UNIQUE` (`air_code` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HOTEL_BRAND`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`HOTEL_BRAND` (
  `hotel_id` INT NOT NULL AUTO_INCREMENT,
  `hotel_name` VARCHAR(45) NULL,
  `hotel_stars` INT NULL,
  PRIMARY KEY (`hotel_id`),
  UNIQUE INDEX `hotel_id_UNIQUE` (`hotel_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DESTINATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DESTINATION` (
  `dest_id` INT NOT NULL AUTO_INCREMENT,
  `dest_name` VARCHAR(45) NULL,
  `dest_country` VARCHAR(2) NULL,
  `dest_continent` VARCHAR(2) NULL,
  `food_id` INT NOT NULL,
  `air_id` INT NOT NULL,
  `HOTEL_BRAND_hotel_id` INT NOT NULL,
  PRIMARY KEY (`dest_id`),
  UNIQUE INDEX `dest_id_UNIQUE` (`dest_id` ASC) VISIBLE,
  INDEX `fk_DESTINATION_FOOD_TYPE1_idx` (`food_id` ASC) VISIBLE,
  INDEX `fk_DESTINATION_AIRLINE1_idx` (`air_id` ASC) VISIBLE,
  INDEX `fk_DESTINATION_HOTEL_BRAND1_idx` (`HOTEL_BRAND_hotel_id` ASC) VISIBLE,
  CONSTRAINT `fk_DESTINATION_FOOD_TYPE1`
    FOREIGN KEY (`food_id`)
    REFERENCES `mydb`.`FOOD_TYPE` (`food_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DESTINATION_AIRLINE1`
    FOREIGN KEY (`air_id`)
    REFERENCES `mydb`.`AIRLINE` (`air_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DESTINATION_HOTEL_BRAND1`
    FOREIGN KEY (`HOTEL_BRAND_hotel_id`)
    REFERENCES `mydb`.`HOTEL_BRAND` (`hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ITEM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ITEM` (
  `item_id` INT NOT NULL AUTO_INCREMENT,
  `item_name` VARCHAR(45) NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE INDEX `item_id_UNIQUE` (`item_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DEST_ITEM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DEST_ITEM` (
  `item_id` INT NOT NULL,
  `dest_id` INT NOT NULL,
  INDEX `fk_DEST_ITEM_ITEM_idx` (`item_id` ASC) VISIBLE,
  INDEX `fk_DEST_ITEM_DESTINATION1_idx` (`dest_id` ASC) VISIBLE,
  PRIMARY KEY (`item_id`, `dest_id`),
  CONSTRAINT `fk_DEST_ITEM_ITEM`
    FOREIGN KEY (`item_id`)
    REFERENCES `mydb`.`ITEM` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DEST_ITEM_DESTINATION1`
    FOREIGN KEY (`dest_id`)
    REFERENCES `mydb`.`DESTINATION` (`dest_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MEMBER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MEMBER` (
  `member_id` INT NOT NULL AUTO_INCREMENT,
  `member_fname` VARCHAR(45) NULL,
  `member_lname` VARCHAR(45) NULL,
  `member_city` VARCHAR(45) NULL,
  `member_country` VARCHAR(2) NULL,
  `member_continent` VARCHAR(2) NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE INDEX `member_id_UNIQUE` (`member_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RATING`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RATING` (
  `rating_id` INT NOT NULL AUTO_INCREMENT,
  `rat_stars` INT NULL,
  `rat_amt_spent` INT NULL,
  `hotel_id` INT NOT NULL,
  `air_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  PRIMARY KEY (`rating_id`, `member_id`),
  UNIQUE INDEX `rating_id_UNIQUE` (`rating_id` ASC) VISIBLE,
  INDEX `fk_RATING_HOTEL_BRAND1_idx` (`hotel_id` ASC) VISIBLE,
  INDEX `fk_RATING_AIRLINE1_idx` (`air_id` ASC) VISIBLE,
  INDEX `fk_RATING_MEMBER1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_RATING_HOTEL_BRAND1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `mydb`.`HOTEL_BRAND` (`hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RATING_AIRLINE1`
    FOREIGN KEY (`air_id`)
    REFERENCES `mydb`.`AIRLINE` (`air_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RATING_MEMBER1`
    FOREIGN KEY (`member_id`)
    REFERENCES `mydb`.`MEMBER` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HIGHLIGHT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`HIGHLIGHT` (
  `highlight_id` INT NOT NULL AUTO_INCREMENT,
  `highlight_name` VARCHAR(45) NULL,
  PRIMARY KEY (`highlight_id`),
  UNIQUE INDEX `highlight_id_UNIQUE` (`highlight_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RAT_HIGHLIGHT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RAT_HIGHLIGHT` (
  `highlight_id` INT NOT NULL,
  `rating_id` INT NOT NULL,
  PRIMARY KEY (`highlight_id`, `rating_id`),
  INDEX `fk_RAT_HIGHLIGHT_RATING1_idx` (`rating_id` ASC) VISIBLE,
  CONSTRAINT `fk_RAT_HIGHLIGHT_HIGHLIGHT1`
    FOREIGN KEY (`highlight_id`)
    REFERENCES `mydb`.`HIGHLIGHT` (`highlight_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RAT_HIGHLIGHT_RATING1`
    FOREIGN KEY (`rating_id`)
    REFERENCES `mydb`.`RATING` (`rating_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FRIEND`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FRIEND` (
  `MEMBER_member_id1` INT NOT NULL,
  `MEMBER_member_id2` INT NOT NULL,
  PRIMARY KEY (`MEMBER_member_id1`, `MEMBER_member_id2`),
  INDEX `fk_FRIEND_MEMBER2_idx` (`MEMBER_member_id2` ASC) VISIBLE,
  CONSTRAINT `fk_FRIEND_MEMBER1`
    FOREIGN KEY (`MEMBER_member_id1`)
    REFERENCES `mydb`.`MEMBER` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FRIEND_MEMBER2`
    FOREIGN KEY (`MEMBER_member_id2`)
    REFERENCES `mydb`.`MEMBER` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`REC_DEST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`REC_DEST` (
  `member_id` INT NOT NULL,
  `dest_id` INT NOT NULL,
  PRIMARY KEY (`member_id`, `dest_id`),
  INDEX `fk_REC_DEST_DESTINATION1_idx` (`dest_id` ASC) VISIBLE,
  CONSTRAINT `fk_REC_DEST_MEMBER1`
    FOREIGN KEY (`member_id`)
    REFERENCES `mydb`.`MEMBER` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_REC_DEST_DESTINATION1`
    FOREIGN KEY (`dest_id`)
    REFERENCES `mydb`.`DESTINATION` (`dest_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`WANT_TO_GO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`WANT_TO_GO` (
  `member_id` INT NOT NULL,
  `dest_id` INT NOT NULL,
  PRIMARY KEY (`member_id`, `dest_id`),
  INDEX `fk_WANT_TO_GO_DESTINATION1_idx` (`dest_id` ASC) VISIBLE,
  CONSTRAINT `fk_WANT_TO_GO_MEMBER1`
    FOREIGN KEY (`member_id`)
    REFERENCES `mydb`.`MEMBER` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_WANT_TO_GO_DESTINATION1`
    FOREIGN KEY (`dest_id`)
    REFERENCES `mydb`.`DESTINATION` (`dest_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
