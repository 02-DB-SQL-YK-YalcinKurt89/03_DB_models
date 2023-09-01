-- Tabelle anlegen

CREATE TABLE IF NOT EXISTS `mydb`.`cats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Struktur
DESCRIBE mydb.cats;

-- Inserts
INSERT INTO `mydb`.`cats` (`id`, `name`, `age`) VALUES (DEFAULT, "Grizabella", 29);
INSERT INTO `mydb`.`cats` (`id`, `name`, `age`) VALUES (DEFAULT, "Alonzo", 35);

-- Anzeige
SELECT * FROM mydb.cats;
