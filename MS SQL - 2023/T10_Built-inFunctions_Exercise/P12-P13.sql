--P12
SELECT CountryName, IsoCode
FROM Countries
WHERE LOWER(CountryName) LIKE ('%a%a%a%')
ORDER BY IsoCode

--P13
SELECT p.PeakName, r.RiverName, LOWER(LEFT(p.PeakName, LEN(p.PeakName)-1)+r.RiverName) AS Mix
FROM Peaks p, Rivers r
WHERE RIGHT(p.PeakName,1) = LEFT(r.RiverName,1)
ORDER BY Mix