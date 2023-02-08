-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `project` ;

-- -----------------------------------------------------
-- Table `project`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`actors` (
  `actor_id` INT NOT NULL,
  `first_name` TEXT NULL DEFAULT NULL,
  `last_name` TEXT NULL DEFAULT NULL,
  `last_update` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`film` (
  `film_id` INT NOT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` TEXT NULL DEFAULT NULL,
  `language_id` TEXT NULL DEFAULT NULL,
  `rental_duration` TEXT NULL DEFAULT NULL,
  `rental_rate` TEXT NULL DEFAULT NULL,
  `length` TEXT NULL DEFAULT NULL,
  `replacement_cost` TEXT NULL DEFAULT NULL,
  `rating` TEXT NULL DEFAULT NULL,
  `special_features` TEXT NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  `genre` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`actors_film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`actors_film` (
  `actors_actor_id` INT NOT NULL,
  `film_film_id` INT NOT NULL,
  PRIMARY KEY (`actors_actor_id`, `film_film_id`),
  INDEX `fk_actors_film_film1_idx` (`film_film_id` ASC) VISIBLE,
  CONSTRAINT `fk_actors_film_actors`
    FOREIGN KEY (`actors_actor_id`)
    REFERENCES `project`.`actors` (`actor_id`),
  CONSTRAINT `fk_actors_film_film1`
    FOREIGN KEY (`film_film_id`)
    REFERENCES `project`.`film` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` DATETIME NULL DEFAULT NULL,
  `inventory_id` INT NULL DEFAULT NULL,
  `return_date` DATETIME NULL DEFAULT NULL,
  `last_update_x` DATETIME NULL DEFAULT NULL,
  `film_id` INT NOT NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `fk_rental_film1_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `project`.`film` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
