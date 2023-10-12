UPDATE PlayersRanges
SET PlayersMAx+=1
WHERE PlayersMin=2 AND PlayersMAx=2

UPDATE Boardgames
SET [Name]+='V2'
WHERE YearPublished >=2020