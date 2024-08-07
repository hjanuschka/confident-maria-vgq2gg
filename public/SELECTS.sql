# 1
SELECT persnr, nachname, vorname, eintritt FROM personal WHERE eintritt > '2007-05-01';

# 2
SELECT bestnr, status FROM bestellungen WHERE status != 2;

#3
SELECT * FROM artikel WHERE bezeichnung LIKE '%koch%';

#4
SELECT email FROM kunden WHERE email LIKE '%@%.%';

#5
SELECT nachname, vorname, gebdatum FROM personal WHERE YEAR(gebdatum) BETWEEN 1980 AND 1990;

#6
SELECT bestellungen.bestnr, 
	    bestellungen.datum, 
		( SELECT text FROM anreden WHERE anrnr = personal.geschlecht ) AS anrede, 
		personal.nachname, personal.vorname, 
		( SELECT text FROM abteilungen WHERE abtnr = personal.abtlg) AS abteilung,
		lieferanten.firma1 AS lieferant
FROM bestellungen 
JOIN personal ON personal.persnr = bestellungen.bearbeiter
JOIN lieferanten ON lieferanten.liefnr = bestellungen.lieferant ;

#7
SELECT artnr, 
		 bezeichnung, 
		( SELECT COUNT(*) FROM bestellpositionen WHERE bestellpositionen.artikel = artikel.artnr ) AS Anzahl_Bestellungen 
FROM artikel;

#8
SELECT abtnr, 
		 text,
		 ( SELECT COUNT(*) FROM personal WHERE personal.abtlg = abteilungen.abtnr AND personal.eintritt <= NOW() AND ( personal.austritt IS NULL OR personal.austritt > NOW() ) ) AS anzahl_mitarbeiter
FROM abteilungen 
WHERE ( SELECT COUNT(*) FROM personal WHERE personal.abtlg = abteilungen.abtnr AND personal.eintritt <= NOW() AND ( personal.austritt IS NULL OR personal.austritt > NOW() )  ) > 2;

#9
SELECT nachname, vorname, abtlg FROM personal WHERE personal.abtlg = ( SELECT personal.abtlg FROM personal WHERE personal.nachname = 'Kossegg' );

#10
SELECT persnr, nachname, vorname, abtlg, gebdatum FROM personal WHERE gebdatum < ( SELECT MIN(personal.gebdatum) FROM personal WHERE personal.nachname LIKE 'k%' );

#11
SELECT persnr, nachname, vorname, eintritt FROM personal WHERE personal.eintritt > ( SELECT personal.gebdatum FROM personal WHERE nachname = 'Kofler' );

#12
SELECT COUNT(*) AS Anzahl, ( SELECT TEXT FROM anreden WHERE anrnr = personal.geschlecht ) AS Geschlecht FROM personal WHERE abtlg = ( SELECT personal.abtlg FROM personal WHERE nachname = 'Loderer' ) GROUP BY geschlecht;

#13
SELECT artnr, bezeichnung, vkpreis FROM artikel WHERE vkpreis > (SELECT AVG(vkpreis) FROM artikel);

#14
SELECT COUNT(*) AS Anzahl, gruppe FROM artikel WHERE vkpreis > ( SELECT AVG(vkpreis) FROM artikel) GROUP BY gruppe;