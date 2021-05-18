 SELECT i.`Kenteken`,
       zuinigheid.value AS Zuinigheidslabel,
       i.`CO2 uitstoot gecombineerd`,
       emissie.value AS Emissieklasse,
       IFNULL(i.`Milieuklasse EG Goedkeuring (licht)`, 'Niet van toepassing') AS 'Milieuklasse EG Goedkeuring (licht)'
FROM import i
JOIN `import_Zuinigheidslabel` zuinigheid ON zuinigheid.id = i.`Zuinigheidslabel`
JOIN `import_Emissieklasse` emissie ON emissie.id = i.`Emissieklasse`
WHERE i.`Kenteken` = '{{ Kenteken }}'
LIMIT 1
