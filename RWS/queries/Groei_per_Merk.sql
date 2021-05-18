SELECT COUNT(`Merk`) AS 'Aantal', `Datum eerste toelating`, SUM(COUNT(`Merk`)) OVER(ORDER BY `Datum eerste toelating`) AS 'cumulative sum'
FROM data
WHERE `Datum eerste toelating` BETWEEN DATE_FORMAT("{{ Datum.start }}", "%Y%m%d") AND DATE_FORMAT("{{ Datum.end }}", "%Y%m%d") AND `Merk` IN({{Merk}}) 
GROUP BY `Datum eerste toelating`;