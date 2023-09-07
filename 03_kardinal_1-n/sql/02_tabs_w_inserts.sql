-- 02. Tabellen verbunden + INSERTS

-- Vorbereitung
DROP DATABASE IF EXISTS mydb;
CREATE DATABASE IF NOT EXISTS mydb;

-- MT: cats
CREATE TABLE IF NOT EXISTS `mydb`.`cats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cat_name` VARCHAR(45) NOT NULL,
  `fur_color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- MT: Struktur
DESCRIBE mydb.cats;

-- MT: Inserts
INSERT INTO `mydb`.`cats` (`id`, `cat_name`, `fur_color`) VALUES (DEFAULT, "Grizabella", "white");
INSERT INTO `mydb`.`cats` (`id`, `cat_name`, `fur_color`) VALUES (DEFAULT, "Mausi", "striped");

-- MT: Inhalte
SELECT * FROM mydb.cats;

-- DT: kittens
CREATE TABLE IF NOT EXISTS `mydb`.`kittens` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `kitten_name` VARCHAR(45) NOT NULL,
  `fur_color` VARCHAR(45) NOT NULL,
  `cats_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_kittens_cats_idx` (`cats_id` ASC),
  CONSTRAINT `fk_kittens_cats`
    FOREIGN KEY (`cats_id`)
    REFERENCES `mydb`.`cats` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- DT: Struktur
DESCRIBE mydb.kittens;

-- DT: Inserts
INSERT INTO `mydb`.`kittens` (`id`, `kitten_name`, `fur_color`, `cats_id`) VALUES (DEFAULT, "Grizzi_1", "white", 1);
INSERT INTO `mydb`.`kittens` (`id`, `kitten_name`, `fur_color`, `cats_id`) VALUES (DEFAULT, "Grizzi_2", "white", 1);
INSERT INTO `mydb`.`kittens` (`id`, `kitten_name`, `fur_color`, `cats_id`) VALUES (DEFAULT, "Mausini", "striped", 2);

-- DT: Inhalte
SELECT * FROM mydb.kittens;



