SELECT TOP(5) bg.[Name], bg.Rating, c.[Name] AS CategoryName
FROM Boardgames AS bg
JOIN Categories AS c ON c.Id=bg.CategoryId
JOIN PlayersRanges AS pr ON pr.Id=bg.PlayersRangeId
WHERE
    Rating>7
    AND bg.[Name] LIKE '%a%' OR Rating > 7.5
    AND pr.PlayersMin=2
    AND pr.PlayersMAx=5
ORDER BY bg.[Name], Rating DESC
