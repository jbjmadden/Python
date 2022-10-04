-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dojos_and_ninjas_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dojos_and_ninjas_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dojos_and_ninjas_schema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `dojos_and_ninjas_schema` ;

-- -----------------------------------------------------
-- Table `dojos_and_ninjas_schema`.`dojos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dojos_and_ninjas_schema`.`dojos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SELECT * FROM dojos;
INSERT INTO dojos (id, name) VALUES (1, 'Chicago'), (2, 'Bellvue'), (3, 'Online');
SET SQL_SAFE_UPDATES = 1;
DELETE FROM dojos;
INSERT INTO dojos (id, name) VALUES (1, 'Chicago'), (2, 'Bellvue'), (3, 'Online');

-- -----------------------------------------------------
-- Table `dojos_and_ninjas_schema`.`ninjas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dojos_and_ninjas_schema`.`ninjas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `age` INT NOT NULL,
  `dojo_id` INT NOT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_ninjas_dojos_idx` (`dojo_id` ASC) VISIBLE,
  CONSTRAINT `fk_ninjas_dojos`
    FOREIGN KEY (`dojo_id`)
    REFERENCES `dojos_and_ninjas_schema`.`dojos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SELECT * FROM ninjas;
INSERT INTO ninjas (id, first_name, last_name, age, dojo_id)
VALUES (1, 'Jason', 'Madden', 28, 1), (2, 'Ari', 'Winters', 22, 1), (3, 'Kevin', 'Stevens', 23, 1);
INSERT INTO ninjas (id, first_name, last_name, age, dojo_id)
VALUES (4, 'Olivia', 'Banks', 24, 2), (5, 'Donna', 'McCoy', 26, 2), (6, 'Carlos', 'Reyes', 25, 2);
INSERT INTO ninjas (id, first_name, last_name, age, dojo_id)
VALUES (7, 'Austin', 'Betty', 27, 3), (8, 'Jenny', 'Tory', 29, 3), (9, 'Trisha', 'Bush', 20, 3);

SELECT * FROM ninjas WHERE dojo_id = 1;
SELECT * FROM ninjas WHERE dojo_id = 3;

SELECT * FROM dojos 
JOIN ninjas ON dojos.id = ninjas.dojo_id WHERE ninjas.id = 9;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
