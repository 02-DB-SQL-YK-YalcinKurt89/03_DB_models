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

/*  PURCHASES (Kaufprozesse)*/

-- ServantsProducts (purchases)
CREATE TABLE IF NOT EXISTS `mydb`.`purchases` (
  `servants_id` INT NOT NULL,  										-- Definieren Sie die Spalte `servants_id` vom Datentyp INT, die nicht NULL-Werte akzeptiert.
  `products_id` INT NOT NULL,  										-- Definieren Sie die Spalte `products_id` vom Datentyp INT, die nicht NULL-Werte akzeptiert.
  PRIMARY KEY (`servants_id`, `products_id`),  -- Festlegen des Primärschlüssels für die Tabelle "purchases" mit den Spalten `servants_id` und `products_id`.
  INDEX `fk_servants_has_products_products1_idx` (`products_id` ASC),  -- Erstellen eines Index mit dem Namen `fk_servants_has_products_products1_idx` für die Spalte `products_id`.
  INDEX `fk_servants_has_products_servants_idx` (`servants_id` ASC),  -- Erstellen eines Index mit dem Namen `fk_servants_has_products_servants_idx` für die Spalte `servants_id`.
  CONSTRAINT `fk_servants_has_products_servants`  					-- Definieren einer Fremdschlüssel-Einschränkung mit dem Namen `fk_servants_has_products_servants` für die Spalte `servants_id`.
    FOREIGN KEY (`servants_id`)    									-- Legen Sie fest, dass die Spalte `servants_id` auf die Tabelle `servants` in der Spalte `id` verweist.
    REFERENCES `mydb`.`servants` (`id`)
    ON DELETE NO ACTION    											-- Festlegen der Aktion bei Löschung des referenzierten Datensatzes (NO ACTION bedeutet, dass keine Aktion ausgeführt wird).
    ON UPDATE NO ACTION,    										-- Festlegen der Aktion bei Aktualisierung des referenzierten Datensatzes (NO ACTION bedeutet, dass keine Aktion ausgeführt wird).
  CONSTRAINT `fk_servants_has_products_products1`  					-- Definieren einer Fremdschlüssel-Einschränkung mit dem Namen `fk_servants_has_products_products1` für die Spalte `products_id`.
    FOREIGN KEY (`products_id`)    									-- Legen Sie fest, dass die Spalte `products_id` auf die Tabelle `products` in der Spalte `id` verweist.
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION    											-- Festlegen der Aktion bei Löschung des referenzierten Datensatzes (NO ACTION bedeutet, dass keine Aktion ausgeführt wird).
    ON UPDATE NO ACTION)    										-- Festlegen der Aktion bei Aktualisierung des referenzierten Datensatzes (NO ACTION bedeutet, dass keine Aktion ausgeführt wird).
ENGINE = InnoDB;													-- Festlegen des Storage-Engines für die Tabelle auf InnoDB.

-- Purchases: Struktur
DESCRIBE mydb.purchases;

-- Purchases: Inserts (Kaufprozesse : Käufer - Produkt)
INSERT INTO `mydb`.`purchases` (`servants_id`, `products_id`) VALUES (1, 2);
INSERT INTO `mydb`.`purchases` (`servants_id`, `products_id`) VALUES (1, 3);
INSERT INTO `mydb`.`purchases` (`servants_id`, `products_id`) VALUES (2, 1);
INSERT INTO `mydb`.`purchases` (`servants_id`, `products_id`) VALUES (2, 2);
INSERT INTO `mydb`.`purchases` (`servants_id`, `products_id`) VALUES (2, 3);
INSERT INTO `mydb`.`purchases` (`servants_id`, `products_id`) VALUES (2, 4);

-- Purchases: Inhalte 
SELECT * FROM mydb.purchases;