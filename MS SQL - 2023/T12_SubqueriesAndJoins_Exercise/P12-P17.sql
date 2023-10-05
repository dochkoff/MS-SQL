--P12
SELECT
    mc.CountryCode,
    m.MountainRange,
    p.PeakName,
    p.Elevation
FROM
    Peaks AS p
    INNER JOIN Mountains AS m ON m.Id = p.MountainId
    INNER JOIN MountainsCountries AS mc ON mc.MountainId = m.Id
WHERE
mc.CountryCode = 'BG' AND p.Elevation > 2835
ORDER BY
p. Elevation DESC;

--P13
SELECT CountryCode, COUNT(DISTINCT MountainRange) AS MountainRanges
FROM (
    SELECT mc.CountryCode, m.MountainRange   
    FROM MountainsCountries AS mc
    JOIN Mountains AS m ON m.Id = mc.MountainId
    WHERE mc.CountryCode IN ('BG','US','RU')
) AS CoreQuery
GROUP BY CountryCode;

--P14
SELECT TOP(5) CountryName, r.RiverName
FROM Countries AS c
    LEFT JOIN CountriesRivers AS cr ON cr.CountryCode = c.CountryCode
    LEFT JOIN Rivers AS r ON cr.RiverId = r.Id
WHERE ContinentCode = 'AF'
ORDER BY CountryName

--P15
SELECT ContinentCode, CurrencyCode, CurrencyUsage
FROM
    (SELECT *,
    DENSE_RANK() OVER (PARTITION BY ContinentCode ORDER BY CurrencyUsage DESC) AS CurremcyRank
    FROM
        (SELECT ContinentCode, CurrencyCode, COUNT(CurrencyCode) AS CurrencyUsage
        FROM Countries
        GROUP BY ContinentCode, CurrencyCode) AS CoreQuery
    Where CurrencyUsage > 1) AS SocondSubQuery
WHERE CurremcyRank = 1
ORDER BY ContinentCode

--P16
SELECT COUNT(*) AS Count
FROM
    (SELECT mc.CountryCode AS ForCount,c.CountryCode
    FROM MountainsCountries AS mc
    JOIN Mountains AS m ON m.Id = mc.MountainId
    RIGHT JOIN Countries AS c ON c.CountryCode = mc.CountryCode) AS CoreQuery
WHERE ForCount IS NULL

--P17
SELECT TOP(5)
    c.CountryName,
    MAX(p.Elevation) AS HighestPeakElevation,
    MAX(r.Length) AS LongestRiverLength
FROM
    Countries c
LEFT JOIN MountainsCountries mc ON c.CountryCode = mc.CountryCode
LEFT JOIN Mountains m ON mc.MountainId = m.Id
LEFT JOIN Peaks p ON m.Id = p.MountainId
LEFT JOIN CountriesRivers cr ON c.CountryCode = cr.CountryCode
LEFT JOIN Rivers r ON cr.RiverId = r.Id
GROUP BY c.CountryName
ORDER BY
    HighestPeakElevation DESC,
    LongestRiverLength DESC,
    c.CountryName ASC;


