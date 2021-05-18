 SELECT COUNT(`car`) AS 'Amount of Cars in EVCompare',
       ROUND(AVG(`Avg. charging speed (DC)`),2) AS 'Average Charging Speed in Kw(DC)',
       ROUND(AVG(`Max charging power (AC)`),2) AS 'Average Max Charging power in Kw(AC)',
       ROUND(AVG(`Max charging power (DC)`), 2) AS 'Average Max Avg. charging speed in Kw(DC)',
       ROUND(AVG(`Acceleration 0-100 km-h`),2) AS 'Average Acceleration 0-100 km/h',
       ROUND(AVG(`Top speed kmh`), 2) AS 'Average Top Speed in Km/h'
FROM evcompare
