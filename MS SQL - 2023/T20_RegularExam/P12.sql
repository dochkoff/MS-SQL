CREATE PROC usp_SearchByCountry(@country NVARCHAR(50))
AS
BEGIN
    SELECT
        t.[Name],
        t.PhoneNumber,
        t.Email,
        COUNT(b.Id)
    FROM Tourists AS t
    JOIN Bookings AS b ON b.TouristId=t.Id
    JOIN Countries AS c ON c.Id=t.CountryId
    WHERE c.Name=@country
    GROUP BY t.[Name],
        t.PhoneNumber,
        t.Email
END
