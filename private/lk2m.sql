-- MySQL Script generated by MySQL Workbench
-- 01/11/17 14:04:22
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema lk2m
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lk2m
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lk2m` DEFAULT CHARACTER SET utf8 ;
USE `lk2m` ;

-- -----------------------------------------------------
-- Table `lk2m`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lk2m`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lk2m`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lk2m`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lastname` VARCHAR(45) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(10) NOT NULL,
  `log` DATETIME NULL,
  `roles_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `mail_UNIQUE` (`mail` ASC),
  INDEX `fk_user_roles_idx` (`roles_id` ASC),
  CONSTRAINT `fk_user_roles`
    FOREIGN KEY (`roles_id`)
    REFERENCES `lk2m`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lk2m`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lk2m`.`messages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` LONGTEXT NULL,
  `date` DATETIME NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_messages_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_messages_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `lk2m`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lk2m`.`projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lk2m`.`projects` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `date` DATETIME NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lk2m`.`news`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lk2m`.`news` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `comment` LONGTEXT NULL,
  `users_id` INT NOT NULL,
  `date_creation` DATE NULL,
  `date_modification` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_news_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_news_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `lk2m`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lk2m`.`news_pictures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lk2m`.`news_pictures` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `real_name` VARCHAR(45) NULL,
  `type` VARCHAR(5) NULL,
  `size` INT NULL,
  `alt` VARCHAR(255) NULL,
  `news_id` INT NOT NULL,
  `state` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pictures_news1_idx` (`news_id` ASC),
  CONSTRAINT `fk_pictures_news1`
    FOREIGN KEY (`news_id`)
    REFERENCES `lk2m`.`news` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lk2m`.`files`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lk2m`.`files` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `size` INT NULL,
  `project_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_files_project1_idx` (`project_id` ASC),
  CONSTRAINT `fk_files_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `lk2m`.`projects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lk2m`.`project_has_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lk2m`.`project_has_user` (
  `project_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`project_id`, `user_id`),
  INDEX `fk_project_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_project_has_user_project1_idx` (`project_id` ASC),
  CONSTRAINT `fk_project_has_user_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `lk2m`.`projects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `lk2m`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
