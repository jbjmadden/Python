-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema books_schema
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `books_schema` ;

-- -----------------------------------------------------
-- Schema books_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `books_schema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `books_schema` ;

-- -----------------------------------------------------
-- Table `books_schema`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `books_schema`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SELECT * FROM users;
INSERT INTO users (first_name, last_name) VALUES ('Jane', 'Amsden'), ('Emily', 'Dixon'), ('Theodore', 'Dostoevsky'), ('William', 'Shapiro'), ('Lao', 'Xiu');
UPDATE users SET first_name = 'Bill' WHERE id = 4;

-- -----------------------------------------------------
-- Table `books_schema`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `books_schema`.`books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `num_of_pages` INT NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SELECT * FROM books;
INSERT INTO books (title, num_of_pages) VALUES ('C Sharp', 300), ('Java', 320), ('Python', 350), ('PHP', 345), ('Ruby', 360);
UPDATE books SET title = 'C#' WHERE id = 1;

-- -----------------------------------------------------
-- Table `books_schema`.`favorites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `books_schema`.`favorites` (
  `user_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `book_id`),
  INDEX `fk_users_has_books_books1_idx` (`book_id` ASC) VISIBLE,
  INDEX `fk_users_has_books_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_books_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `books_schema`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_books_books1`
    FOREIGN KEY (`book_id`)
    REFERENCES `books_schema`.`books` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SELECT * FROM favorites;
INSERT INTO favorites (user_id, book_id) VALUES (1,1), (1,2);
INSERT INTO favorites (user_id, book_id) VALUES (2,1), (2,2), (2,3);
INSERT INTO favorites (user_id, book_id) VALUES (3,1), (3,2), (3,3), (3,4);
INSERT INTO favorites (user_id, book_id) VALUES (4,1), (4,2), (4,3), (4,4), (4,5);

SELECT * FROM users
JOIN favorites ON users.id = favorites.user_id WHERE book_id = 3;

SELECT * FROM users 
JOIN favorites ON users.id = favorites.user_id WHERE book_id = 3 LIMIT 1,3;

INSERT INTO favorites (user_id, book_id) VALUES (5, 2);

SELECT * FROM users
JOIN favorites ON users.id = favorites.user_id WHERE book_id = 5;

SELECT * FROM books
JOIN favorites ON books.id = favorites.book_id WHERE book_id = 5;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
