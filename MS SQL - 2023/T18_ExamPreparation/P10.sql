SELECT 
    LastName,
    CEILING(AVG(bg.Rating)) AS AverageRating,
    pb.Name AS PublisherName
FROM Creators AS c
JOIN CreatorsBoardgames AS cb ON cb.CreatorId=c.Id
JOIN Boardgames AS bg ON bg.Id=cb.BoardgameId
JOIN Publishers AS pb ON pb.Id=bg.PublisherId
WHERE pb.Name = 'Stonemaier Games'
GROUP BY c.LastName, pb.Name
ORDER BY AVG(bg.Rating) DESC