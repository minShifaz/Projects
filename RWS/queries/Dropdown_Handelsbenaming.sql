-- This script retrieves every EV manufacturer/brand. These are brands that produce Pure EV's. They might produce regular vehicles or HEV's (hybrids), but that is not implied thijs_rdw_gekentekendevoertuigen.import
-- The first query does basically the same as the second (before/after UNION), but the first query formats all brands in a ["",""] comma separated list
-- so we can use it as a shorthand for 'all brands'. This eliminates the need to select every brand manually when we just want all electric vehicles.
-- Query selects all brands, in no particular order, in format "brand A","Brand B" as a single value.

  (
      SELECT 
        'AAAA' AS 'Merk', -- The 'all brands' has been artificially put on top by specifying 1 million vehicles. This number does not actually represent anything!!
        'Alle handelsbenamingen' AS 'Name', -- Entry name. 
        (
            SELECT GROUP_CONCAT(DISTINCT handelsbenaming SEPARATOR '","') -- Instead of printing out in new rows, concat and separate by ","  ; resulting in a quoted CSV output. Leading and trailing " are missing on purpose.
            FROM import i
            LEFT JOIN `import_Klasse hybride elektrisch voertuig` klasse ON klasse.id = i.`Klasse hybride elektrisch voertuig`
            LEFT JOIN `import_Brandstof omschrijving` brandstof ON brandstof.id = i.`Brandstof omschrijving`
            LEFT JOIN `import_Voertuigsoort` voertuigsoort ON voertuigsoort.id = i.`Voertuigsoort`
            WHERE voertuigsoort.value IN("Personenauto",
                             "Bedrijfsauto")
              AND ((brandstof.value = 'Elektriciteit'
                    AND klasse.value IS NULL)
                   OR (klasse.value IN ('OVC-HEV')))
        ) AS Value
  )
  
UNION -- Same query, but show every brand in it's own row.
 
  (
      SELECT 
             Merk AS 'Merk',
              CONCAT(i.Merk, ': ', i.handelsbenaming)  AS 'Name', 
              i.handelsbenaming AS 'Value' 
       FROM import i 
       LEFT JOIN `import_Klasse hybride elektrisch voertuig` klasse ON klasse.id = i.`Klasse hybride elektrisch voertuig` 
       LEFT JOIN `import_Brandstof omschrijving` brandstof ON brandstof.id = i.`Brandstof omschrijving` 
       LEFT JOIN `import_Voertuigsoort` voertuigsoort ON voertuigsoort.id = i.`Voertuigsoort` 
       WHERE voertuigsoort.value IN("Personenauto",
                             "Bedrijfsauto")
          AND ((brandstof.value = 'Elektriciteit'
                AND klasse.value IS NULL)
               OR (klasse.value IN ('OVC-HEV')))
       GROUP BY handelsbenaming
        HAVING COUNT(i.id) > 10
        
   )
ORDER BY `Merk` asc
-- Sort the complete output of UNION on number of vehicles driving around in the netherlands for particular Brand 
-- The 'all brands' has been artificially put on top by specifying 1 million vehicles. This number does not actually represent anything!!
