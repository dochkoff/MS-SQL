SELECT h.id, h.[Name]
FROM Hotels AS h
JOIN HotelsRooms AS hr ON hr.HotelId=h.Id
JOIN Rooms AS r ON r.Id=hr.RoomId
JOIN Bookings as b ON b.HotelId=h.Id
WHERE r.[Type]='VIP Apartment'
GROUP BY h.id, h.[Name]
ORDER BY COUNT(b.Id) DESC