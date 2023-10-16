SELECT
    LEFT(ArrivalDate,10) AS ArrivalDate,
    AdultsCount,
    ChildrenCount
FROM Bookings AS b
JOIN Rooms AS r ON r.Id=b.RoomId
ORDER BY r.Price DESC, ArrivalDate