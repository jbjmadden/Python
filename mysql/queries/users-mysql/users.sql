-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema users_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema users_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `users_schema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `users_schema` ;

-- -----------------------------------------------------
-- Table `users_schema`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users_schema`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SELECT * FROM users;

INSERT INTO users (id, first_name, last_name) VALUES (1, 'Jason', 'Madden');
INSERT INTO users(id, first_name, last_name) VALUES (2, 'Ari', 'Winters'), (3, 'James', 'Stevens');
UPDATE users SET email = 'jm@gmail.com' WHERE id = 1;
UPDATE users SET email = 'aw@gmail.com' WHERE id = 2;
UPDATE users SET email = 'js@gmail.com' WHERE id = 3;

SELECT * FROM users WHERE email = 'jm@gmail.com';
SELECT * FROM users WHERE id = 3;

UPDATE users SET last_name = 'Pancakes' WHERE id = 3;

DELETE FROM users WHERE id = 2;

SELECT * FROM users ORDER BY first_name;