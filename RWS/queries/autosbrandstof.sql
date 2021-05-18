SELECT COUNT(`Kenteken`) AS 'Autos',
 brandstof.value AS Brandstof,
 voertuigsoort.value AS Voertuigsoort
FROM import i
LEFT JOIN `import_Klasse hybride elektrisch voertuig` klasse ON klasse.id = i.`Klasse hybride elektrisch voertuig`
JOIN `import_Brandstof omschrijving` brandstof ON brandstof.id = i.`Brandstof omschrijving`
JOIN `import_Voertuigsoort` voertuigsoort ON voertuigsoort.id = i.`Voertuigsoort`
WHERE voertuigsoort.value IN("Personenauto",
                             "Bedrijfsauto")
   AND ((brandstof.value = 'Elektriciteit'
        OR brandstof.value = 'Waterstof'
        OR brandstof.value = 'LPG'
        OR brandstof.value = 'CNG'
        OR brandstof.value = 'LNG'
        OR brandstof.value = 'Benzine')
       OR (brandstof.value  = 'Diesel'))
GROUP BY `Brandstof`
