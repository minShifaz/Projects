SELECT count(`Kenteken`) AS 'Auto\'s',
       `Brandstof omschrijving`
FROM import
GROUP BY `Brandstof omschrijving`
;

