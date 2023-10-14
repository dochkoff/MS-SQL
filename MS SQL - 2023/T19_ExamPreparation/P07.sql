SELECT 
    c.Id,
    c.[Name] AS Client,
    CONCAT(a.StreetName, ' ', a.StreetNumber, ', ', a.City, ', ', a.PostCode, ', ', cntr.[Name]) AS [Address]
FROM Clients AS c
LEFT JOIN ProductsClients AS pc ON pc.ClientId=c.Id
JOIN Addresses AS a ON a.Id=c.AddressId
JOIN Countries AS cntr ON cntr.Id=a.CountryId
WHERE pc.ProductId IS NULL