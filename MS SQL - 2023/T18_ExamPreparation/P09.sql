SELECT
    CONCAT_WS(' ', FirstName, LastName) AS FullName,
    Email,
    MAX(Rating) AS Raiting
FROM Creators AS c
JOIN CreatorsBoardgames AS cb ON cb.CreatorId=c.Id
JOIN Boardgames AS bg ON bg.Id=cb.BoardgameId
WHERE RIGHT(Email,4)='.com'
GROUP BY CONCAT_WS(' ', FirstName, LastName), Email