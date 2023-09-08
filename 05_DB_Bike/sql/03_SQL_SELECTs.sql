-- Relation = Tabelle

USE bike;
SHOW TABLES;

/* Query 1
Schreiben Sie einen Select-Befehl, 
der aus der Relation (Tabelle) Personal die Namen aller Personen ermittelt, 
die mehr als 3000 Euro verdienen.
*/
-- ges. Tabelle
SELECT * FROM Personal;

-- Query
SELECT
	Name,
    Gehalt
FROM Personal
WHERE Gehalt > 3000
ORDER BY Gehalt DESC;
#ORDER BY Gehalt ASC;
;

/* Query 2
Geben Sie die Gesamtanzahl der für Aufträge reservierten Artikel aus 
(die benötigten Informationen stehen in der Relation Reservierung).
*/

-- ges. Tabelle
SELECT * FROM Reservierung;

-- Query
SELECT 
	 sum(Anzahl) AS "Reservierungen (kum.)" 
FROM Reservierung;

/* Query 3
Geben Sie alle Artikel der Relation Lager aus, deren Bestand abzüglich 
des Mindestbestands und der Reservierungen unter den Wert 3 gesunken ist. 
Als Ausgabe werden Artikelnummer und Artikelbezeichnung erwartet.
*/
-- Bedingung:  (Bestand - Mindbest - Reserviert) < 3

SELECT * FROM Lager; -- Tab. Lager
SELECT * FROM Artikel; -- Tab. Artikel

-- Vorbereitung: Tab. Lager + Bedingung
SELECT 
	Artnr AS Artikelnummer,
    (Bestand - Mindbest - Reserviert) AS Berechnung
FROM Lager
WHERE (Bestand - Mindbest - Reserviert) < 3
ORDER BY Berechnung DESC
; 

-- Tab. Lager + Artikel m. INNER JOIN + Bedingung
SELECT 
	Artnr AS Artikelnummer,
    Bezeichnung,
    (Bestand - Mindbest - Reserviert) AS Berechnung
FROM Lager 
INNER JOIN Artikel ON Lager.Artnr = Artikel.Anr
WHERE Bestand - Mindbest - Reserviert < 3
ORDER BY Berechnung DESC
;

/* Query 4
Aus wie vielen Einzelheiten bestehen alle zusammengesetzten Artikel?
Falls ein Einzelteil wieder aus noch kleineren Einzelteilen besteht, 
so ist dies nicht weiter zu berücksichtigen. Tab. Teilestruktur --> Anzahl
*/

SELECT * FROM Teilestruktur;
SELECT * FROM Artikel;

SELECT 
	Artnr,
	Bezeichnung,
    count(Artnr) AS Teile
FROM Teilestruktur INNER JOIN Artikel ON Teilestruktur.Artnr = Artikel.Anr
GROUP BY Artnr,Bezeichnung
HAVING Teile > 1  # wirklich nur zusammengesetzte Artikel > 1
;





/* Query 5
Geben Sie alle Artikel aus, die vom Auftrag mit der Auftragsnummer 2 reserviert sind.
Geben Sie dazu zu jedem Artikel die Artikelnummer, die Artikelbezeichnung und die Anzahl 
der für diesen Auftrag reservierten Artikel aus. 
*/

SELECT * FROM Auftragsposten; -- Alias AP
SELECT * FROM Reservierung; -- Alias R
SELECT * FROM Artikel; -- A

-- Vorbereitung
SELECT  * FROM Auftragsposten WHERE AuftrNr = 2;

-- mit INNER JOIN / ON
SELECT 
	R.Artnr,
    A.Bezeichnung,
    R.Anzahl
FROM Auftragsposten AS AP
INNER JOIN Reservierung AS R ON AP.PosNr = R.Posnr
INNER JOIN Artikel AS A ON A.ANr = R.Artnr
WHERE AP.AuftrNr = 2
;

-- mit Kreuzprodukt / WHERE
-- Kreuzprodukt
SELECT 
	R.Artnr, 
    A.Bezeichnung, 
    R.Anzahl 
FROM  Auftragsposten AP, Reservierung R, Artikel A 
WHERE AP.PosNr = R.Posnr AND A.ANr = R.Artnr AND AP.AuftrNr = 2



