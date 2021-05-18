 SELECT Count(i.Merk) AS Aantal,
       i.Merk,
       i.kenteken,
       klasse.value AS `Hybride klasse`,
       brandstof.value AS Brandstof,
       voertuigsoort.value AS `Voertuigsoort::filter`,
       i.handelsbenaming AS "handelsbenaming",
       i.uitvoering,
       i.`Datum eerste toelating`,
       SUM(COUNT(i.Merk)) OVER(
                               ORDER BY i.`Datum eerste toelating`) AS cumulative_sum
FROM import i
LEFT JOIN `import_Klasse hybride elektrisch voertuig` klasse ON klasse.id = i.`Klasse hybride elektrisch voertuig`
JOIN `import_Brandstof omschrijving` brandstof ON brandstof.id = i.`Brandstof omschrijving`
JOIN `import_Voertuigsoort` voertuigsoort ON voertuigsoort.id = i.`Voertuigsoort`
WHERE voertuigsoort.value IN("Bedrijfsauto", "Personenauto")
  AND ((brandstof.value = 'Elektriciteit'
        AND klasse.value IS NULL)
       OR (klasse.value IN ('OVC-HEV')))
GROUP BY i.handelsbenaming
ORDER BY cumulative_sum desc;
