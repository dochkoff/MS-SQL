SELECT
    H.[Name] AS HotelName,
    SUM(r.Price * DATEDIFF(DAY, b.ArrivalDate, b.DepartureDate)) AS TotalRevenue
FROM Hotels H
JOIN Bookings b ON h.Id = b.HotelId
JOIN Rooms r ON b.RoomId = r.Id
GROUP BY h.[Name]
ORDER BY TotalRevenue DESC;