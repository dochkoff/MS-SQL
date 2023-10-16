SELECT
    h.[Name] AS HotelName,
    r.Price AS RoomPrice
FROM Tourists AS t
RIGHT JOIN Bookings AS b ON b.TouristId=t.Id
RIGHT JOIN Hotels AS h ON h.Id=b.HotelId
RIGHT JOIN Rooms AS r ON r.Id=b.RoomId
WHERE t.Name NOT LIKE('%EZ')
ORDER BY r.Price DESC