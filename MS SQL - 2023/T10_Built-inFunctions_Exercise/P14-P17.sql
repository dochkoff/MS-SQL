--P14
SELECT TOP(50) [Name], FORMAT([Start], 'yyyy-MM-dd') AS [Start]
FROM Games
WHERE YEAR([Start]) BETWEEN 2011 AND 2012
ORDER BY [Start],[Name]

--P15
SELECT Username, SUBSTRING(Email, CHARINDEX('@',Email)+1,LEN(Email)) AS [Email Provider]
FROM Users
ORDER BY [Email Provider],Username

--P16
SELECT Username, IpAddress
FROM Users
WHERE IpAddress LIKE '___.1%.%.___'
ORDER BY Username

--P17
SELECT
    [Name] AS Game,
    CASE
        WHEN DATEPART(hour, [Start]) BETWEEN 0 AND 11 THEN 'Morning'
        WHEN DATEPART(hour, [Start]) BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN DATEPART(hour, [Start]) BETWEEN 18 AND 23 THEN 'Evening'
    END AS [Part of the Day],
    CASE
        WHEN Duration <= 3 THEN 'Extra Short'
        WHEN Duration <= 6 THEN 'Short'
        WHEN Duration > 6 THEN 'Long'
        ELSE 'Extra Long'
    END AS Duration
FROM Games
ORDER BY [Name], Duration