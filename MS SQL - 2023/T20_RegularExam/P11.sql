CREATE FUNCTION udf_RoomsWithTourists(@name NVARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @result INT
    SET @result=
    (
        SELECT SUM(b.AdultsCount+b.ChildrenCount)
        FROM Bookings AS b
        JOIN Rooms AS r ON r.Id=b.RoomId
        WHERE r.[Type]=@name
    )
    RETURN @result
END