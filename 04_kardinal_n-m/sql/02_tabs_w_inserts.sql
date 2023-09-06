-- 2. verbundene Tabellen + Inserts

-- Vorbereitung
DROP DATABASE IF EXISTS mydb;
CREATE DATABASE IF NOT EXISTS mydb;

/* SERVANTS */


-- Servants: ohne Fremdschlüssel
CREATE TABLE IF NOT EXISTS `mydb`.`servants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `servant_name` VARCHAR(45) NOT NULL,
  `yrs_served` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Servants: Struktur
DESCRIBE mydb.servants;

INSERT INTO `mydb`.`servants` (`id`, `servant_name`, `yrs_served`) VALUES (DEFAULT, "Nico", 5);
INSERT INTO `mydb`.`servants` (`id`, `servant_name`, `yrs_served`) VALUES (DEFAULT, "Sohrab", 3);

-- Servants: Inhalte 
SELECT * FROM mydb.servants;


/*  PRODUCTS */

CREATE TABLE IF NOT EXISTS `mydb`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `product_price` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Products: Struktur
DESCRIBE mydb.products;

-- Products: Inserts
INSERT INTO `mydb`.`products` (`id`, `product_name`, `product_price`) VALUES (DEFAULT, "Whiskas|Lachs", 2.75);
INSERT INTO `mydb`.`products` (`id`, `product_name`, `product_price`) VALUES (DEFAULT, "Whiskas|Huhn", 2.80);
INSERT INTO `mydb`.`products` (`id`, `product_name`, `product_price`) VALUES (DEFAULT, "Felix|Jelly", 3.75);
INSERT INTO `mydb`.`products` (`id`, `product_name`, `product_price`) VALUES (DEFAULT, "Felix|Sauce", 3.80);

-- Products: Inhalte 
SELECT * FROM mydb.products;

