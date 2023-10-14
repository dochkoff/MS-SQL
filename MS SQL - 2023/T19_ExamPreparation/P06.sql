SELECT p.Id, p.[Name], p.Price, c.Name
FROM Products AS p
JOIN Categories AS c ON c.Id=p.CategoryId
WHERE c.Name IN ('ADR','Others')
ORDER BY Price DESC