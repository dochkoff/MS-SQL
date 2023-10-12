SELECT bg.Id, bg.[Name], YearPublished, c.Name
FROM Boardgames AS bg
JOIN Categories AS c ON c.Id=bg.CategoryId
WHERE c.Name IN ('Strategy Games','Wargames')
ORDER BY YearPublished DESC