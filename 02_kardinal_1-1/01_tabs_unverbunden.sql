-- Tabellen, unverbunden
DROP TABLE IF EXISTS mydb.servants;
DROP TABLE IF EXISTS mydb.cats;

CREATE TABLE IF NOT EXISTS `mydb`.`cats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cat_name` VARCHAR(45) NOT NULL,
  `fur_color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`servants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `servant_name` VARCHAR(45) NOT NULL,
  `yrs_served` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

DESCRIBE mydb.cats;
DESCRIBE mydb.servants;