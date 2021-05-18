 SELECT i.`Kenteken`,
       i.`Merk` AS Merk,
       i.`Handelsbenaming` AS Handelsbenaming,
       eerstekleur.value AS 'Eerste kleur',
       IFNULL(tweedekleur.value, 'Niet van toepassing') AS 'Tweede kleur',
       soort.value AS Voertuigsoort,
       IFNULL(i.`Klasse hybride elektrisch voertuig`, 'Niet van toepassing') AS 'Hybride Klasse',
       IFNULL(i.`Netto max vermogen elektrisch`, 'Niet van toepassing') AS 'Netto max elektrisch vermogen',
       taxi.value AS 'Taxi Indicator',
       brandstof.value AS 'Brandstof',
       wielen.value AS Wielen,
       i.`Wielbasis`
FROM import i
JOIN `import_Brandstof omschrijving` brandstof ON brandstof.id = i.`Brandstof omschrijving`
JOIN `import_Aantal wielen` wielen ON wielen.id = i.`Aantal wielen`
JOIN `import_Taxi indicator` taxi ON taxi.id = i.`Taxi indicator`
JOIN `import_Voertuigsoort` soort ON soort.id = i.`Voertuigsoort`
JOIN `import_Eerste kleur` eerstekleur ON eerstekleur.id = i.`Eerste kleur`
JOIN `import_Tweede kleur` tweedekleur ON tweedekleur.id = i.`Tweede kleur`
-- WHERE i.`Kenteken` = '{{ Kenteken }}'
LIMIT 100
