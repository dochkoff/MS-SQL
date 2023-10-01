--P18
SELECT ProductName, OrderDate,
    DATEADD(day, 3, OrderDate) AS [Pay Due],
    DATEADD(month, 1, OrderDate) AS [Deliver Due]
FROM T10_Orders

--P19
CREATE TABLE People (
    Id INT PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Birthdate DATETIME NOT NULL
);

INSERT INTO People (Id, Name, Birthdate)
VALUES
    (1, 'Victor', '2000-12-07 00:00:00.000'),
    (2, 'Steven', '1992-09-10 00:00:00.000'),
    (3, 'Stephen', '1910-09-19 00:00:00.000'),
    (4, 'John', '2010-01-06 00:00:00.000');

SELECT
    Name,
    DATEDIFF(YEAR, Birthdate, GETDATE()) AS [Age in Years],
    DATEDIFF(MONTH, Birthdate, GETDATE()) AS [Age in Months],
    DATEDIFF(DAY, Birthdate, GETDATE()) AS [Age in Days],
    DATEDIFF(MINUTE, Birthdate, GETDATE()) AS [Age in Minutes]
FROM
    People;
