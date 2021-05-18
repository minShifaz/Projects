# RWS PROJECT

Voor het RWS project hebben wij de opdracht gekregen om een Dashboard te creëren om inzicht te krijgen in de groei van Elektrische Auto's in Nederland. Zo kan er gekeken worden hoeveel laadpalen Nederland nodig zou hebben aan de hand van de huidige groei.



Het Dashboard werd gemaakt in Redash, de server is helaas niet meer running maar hier zijn wat screenshots:

[Redash Dashboard Groei](RWS/Dashboard/Groei EV's.png)

[Redash Dropdown](RWS/Dashboard/Dropdown benaming.png)

[Redash Voorpagina grafieken](RWS/Dashboard/Dashboard grafieken.png)



Om de grafieken en dropdowns te laten werken zaten er SQL queries in de backend:

[De SQL queries voor het Dashboard](RWS/queries)



Om de data te verkrijgen werd er gebruik gemaakt van [EvCompare](https://evcompare.io/) en de [RDW DataBase](https://opendata.rdw.nl/). Door deze twee te combineren hebben we geprobeerd om alle Hybride & Elektrische auto's uit de database te halen. Hier is een lijst met onderzoeken, deze werden gedaan in Python (met gebruikt van pandas) en SQL:



***Hoe kunnen we er achter komen welke auto’s Hybride zijn?\***

- De RDW gekentekende brandstof dataset bevat een Hybride Kolom die verschillende waarde aangeeft zoals, NOVC-HEV,OVC-HEV, NOVC-FCHEV, OVC-FCHEV. NOVC-HEV en OVC-HEV zijn de Plug In Hybride. NOVC-FCHEV en OVC-FCHEV gebruiken waterstof. Hier zijn we achter gekomen door op voertuig.net te zoeken naar auto’s met een van deze markeringen en vervolgens deze auto’s op te zoeken op google. Daarnaast zijn de vertalingen hiervan: Novc = extra powersource available on the move(also charges stationary), OVC = only charge when stationary

 

***Zijn NOVC-HEV,OVC-HEV, NOVC-FCHEV, OVC-FCHEV de enige waardes in de Hybride kolom?\***

- Nee uit onderzoek blijkt dat er ook andere waardes zijn, deze zijn getallen zoals 53. We hebben niet kunnen vinden waar deze getallen voor staan. Wel hebben we kunnen vinden dat een onbekend aantal hiervan Plug In Hybride Auto’s zijn.

 

***Is het mogelijk om er achter te komen welke versie van de handelsbenamingen er staan in de RDW database. Zoals Tesla Model 3 performance etc.\***

- De RDW Database bevat geen versies van de handelsbenamingen. Maar een zeer kleine percentage van de complete dataset geeft aan wat voor versie het is. Er is onderzoek gedaan naar enige overeenkomende waarde tussen EvCompare en de RDW dataset maar er was geen mogelijk patroon gevonden. Dit onderzoek bevatte onder andere gewicht van de versies, prijs, EEG codes en andere mogelijke kolommen uit EvCompare. Er zijn nog kentekenchecks uitgevoerd maar het lijkt erop dat de versies bij de RDW niet word bijgehouden.

 

***Hoe kunnen we zoveel mogelijk relevante Plug In Hybride en Elektrische Auto’s selecteren uit de database?\***

- Dit kan gedaan worden door alle ten eerste alle persoonsauto’s en Bedrijfsauto’s te selecteren. Daarna alle ‘Elektrisch’ gemarkeerde voertuigen te selecteren in de Brandstof Type kolom waarbij de Hybride markering leeg is of Plug in Hybride (NOVC-HEV of OVC-HEV) is.

 

***Zijn alle persoonsauto’s daadwerkelijk ook persoonsauto’s?\***

- Uit ons onderzoek blijkt dat er ook bussen tussen de persoonsauto’s zitten. Deze horen eigenlijk een bus markering te hebben in plaats van een persoonsauto. Ook waren hier elektrische Kranen tussen zoals SPIERINGS.

 

***Kunnen we achter een groei komen van Ev’s en Plug in Hybrides?\***

- Dit bleek dus mogelijk te zijn door de Gekentekende voertuigen rdw dataset die een datum bevat de joinen met de Gekentekende voertuigen brandstof die een brandstof type bevat door middel van kenteken. Zo kunnen de Ev’s en de datums hiervan geïdentificeerd worden.

 

***Zijn de merken in de Merk kolom wel echt allemaal merken?\***

- Uit onderzoek bleek dit niet zo te zijn sommige namen in de Merk kolom waren ‘Zie Bijzonderheden’ of bedrijfsnamen etc. Hiervan bleken er vaak maar enkele van te zijn daarom hebben we besloten om alles met een aantal lager dan 10 niet mee te selecteren. Ook waren er vele TESLA MOTORS tussen in plaats van alleen TESLA

**Percentage van overlap tussen RDW en EVcompare**

- In RDW staan ongeveer 680 verschillende elektrische automodellen. We zijn al eerder erachter gekomen dat niet alle auto’s hiervan puur elektrisch zijn. Uit deze lijst komen 72 elektrische auto handelsbenaming van RDW komen voor in EVcompare Dit zijn 38 auto modellen in EVcompare en 229 verschillende modellen. Uit deze onderzoek blijkt dat we 16% van de in Evcompare overeenkomen met RDW elektrische auto. Van puur elektrische auto’s uit RDW zijn 10% van de auto te vinden in Evcompare.



Uiteindelijk is het gebleken dat de RDW database niet consistent is bijgehouden. Veel auto's hadden een verkeerde benaming of zijn verkeerd gemarkeerd. Hierdoor was het eindresultaat niet 100% betrouwbaar. 