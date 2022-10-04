-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema friendships_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema friendships_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `friendships_schema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `friendships_schema` ;

-- -----------------------------------------------------
-- Table `friendships_schema`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `friendships_schema`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SELECT * FROM users;
INSERT INTO users (first_name, last_name) 
VALUES ('Amy', 'Giver'), ('Eli', 'Byers'), ('Marky', 'Mark'), ('Kermit', 'the Frog'), ('Big', 'Bird'), ('Cookie', 'Monster');


-- -----------------------------------------------------
-- Table `friendships_schema`.`friendships`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `friendships_schema`.`friendships` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `friend_id` INT NOT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`, `friend_id`),
  INDEX `fk_users_has_users_users1_idx` (`friend_id` ASC) VISIBLE,
  INDEX `fk_users_has_users_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_users_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `friendships_schema`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_users_users1`
    FOREIGN KEY (`friend_id`)
    REFERENCES `friendships_schema`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
