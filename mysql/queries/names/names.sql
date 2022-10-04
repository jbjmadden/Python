-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema names_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema names_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `names_schema` DEFAULT CHARACTER SET utf8 ;
USE `names_schema` ;

-- -----------------------------------------------------
-- Table `names_schema`.`names`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `names_schema`.`names` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SELECT * FROM names;
INSERT INTO names (id, name) VALUES (1, 'Jason Madden');
INSERT INTO names (id, name) VALUES (2, 'Ari Winters'), (3,'Goma Mavi'), (4, 'Olivia Banks');
UPDATE names SET name = 'Jorge Lopez' WHERE id = '3';
DELETE FROM names WHERE id = 3;
