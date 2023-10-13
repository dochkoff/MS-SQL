CREATE PROCEDURE usp_SearchByCategory
@category NVARCHAR(50)
AS
BEGIN
    SELECT
        bg.Name,
        bg.YearPublished,
        bg.Rating,
        @category AS CategoryName,
        pb.Name AS PublisherName,
        CONCAT(pr.PlayersMin,' people') AS MinPlayers,
        CONCAT(pr.PlayersMAx,' people') AS MaxPlayers
    FROM Boardgames AS bg
    JOIN Categories AS c ON c.Id=bg.CategoryId
    JOIN Publishers AS pb ON pb.Id=bg.PublisherId
    JOIN PlayersRanges AS pr ON pr.Id=bg.PlayersRangeId
    WHERE c.Name=@category
    ORDER BY pb.Name, YearPublished DESC
END