SELECT klasse.value AS `Hybride klasse`,
       brandstof.value AS Brandstof,
       voertuigsoort.value AS Voertuigsoort,
       Merk,
       i.handelsbenaming AS "handelsbenaming"
FROM import i
LEFT JOIN `import_Klasse hybride elektrisch voertuig` klasse ON klasse.id = i.`Klasse hybride elektrisch voertuig`
JOIN `import_Brandstof omschrijving` brandstof ON brandstof.id = i.`Brandstof omschrijving`
JOIN `import_Voertuigsoort` voertuigsoort ON voertuigsoort.id = i.`Voertuigsoort`
WHERE voertuigsoort.value IN("Personenauto",
                             "Bedrijfsauto")
                             
WHERE handelsbenaming = 'CIVIC 4DR HYBRID'                             
  AND ((brandstof.value = 'Elektriciteit'
        AND klasse.value IS NULL)
       OR (klasse.value IN ('OVC-HEV')))
