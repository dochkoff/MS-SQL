CREATE FUNCTION udf_CreatorWithBoardgames(@name NVARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @result INT
    SET @result=(SELECT COUNT(*)
    FROM Creators AS c
        JOIN CreatorsBoardgames AS cb ON cb.CreatorId=c.Id
        JOIN Boardgames AS bg ON bg.Id=cb.BoardgameId
    WHERE c.FirstName=@name)
    RETURN @result
END