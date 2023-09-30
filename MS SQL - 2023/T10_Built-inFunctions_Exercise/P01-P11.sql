--P01
SELECT FirstName, LastName
FROM Employees
WHERE FirstName LIKE 'Sa%'

--P02
SELECT FirstName, LastName
FROM Employees
WHERE LastName LIKE '%ei%'

--P03
SELECT FirstName
FROM Employees
WHERE DepartmentID IN (3,10) AND
    HireDate BETWEEN '1995-01-01' AND '2005-12-31'

--P04
SELECT FirstName, LastName
FROM Employees
WHERE JobTitle NOT LIKE '%engineer%'

--P05
SELECT [Name]
FROM Towns
WHERE LEN([Name]) BETWEEN 5 AND 6
ORDER BY [Name]

--P06
SELECT TownID, [Name]
FROM Towns
WHERE [Name] LIKE '[MKBE]%'
ORDER BY [Name]

--P07
SELECT TownID, [Name]
FROM Towns
WHERE [Name] NOT LIKE '[RBD]%'
ORDER BY [Name]

--P08
CREATE VIEW V_EmployeesHiredAfter2000
AS
SELECT FirstName, LastName
FROM Employees
WHERE HireDate > '2000-12-31'

--P09
SELECT FirstName, LastName
FROM Employees
WHERE LEN(LastName)=5

--P10
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    DENSE_RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) AS Rank
FROM
    Employees
WHERE
    Salary BETWEEN 10000 AND 50000
ORDER BY
    Salary DESC;

--P11
SELECT * FROM
    (SELECT EmployeeID, FirstName, LastName, Salary,
        DENSE_RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) AS [Rank]
    FROM Employees
    WHERE Salary BETWEEN 10000 AND 50000) AS [Subquery]
WHERE Subquery.Rank = 2
ORDER BY Salary DESC;