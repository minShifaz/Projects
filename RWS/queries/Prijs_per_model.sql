 select Car, Model,  `New Price` as 'New Price $'from evcompare
where Car = UPPER({{Merk}})
