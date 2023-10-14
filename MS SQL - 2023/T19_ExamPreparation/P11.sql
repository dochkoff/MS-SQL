CREATE FUNCTION udf_ProductWithClients(@name NVARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @result INT
    SET @result=(
            SELECT COUNT(*)
            FROM Products AS p
            JOIN ProductsClients AS pc ON pc.ProductId=p.Id
            JOIN Clients AS c ON c.Id=pc.ClientId
            WHERE p.Name=@name
        )
    RETURN @result
END