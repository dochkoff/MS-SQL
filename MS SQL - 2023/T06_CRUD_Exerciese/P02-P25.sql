--P02
SELECT *
FROM Departments

--P03
SELECT Name
FROM Departments

--P04
SELECT FirstName, LastName, Salary
FROM Employees

--P05
SELECT FirstName, MiddleName, LastName
FROM Employees

--P06
SELECT FirstName + '.' + LastName + '@softuni.bg'
FROM Employees

--P07
SELECT DISTINCT Salary
FROM Employees

--P08
SELECT *
FROM Employees
WHERE JobTitle = 'Sales Representative'

--P09
SELECT FirstName, LastName, JobTitle
FROM Employees
WHERE Salary BETWEEN 20000 AND 30000

--P10
SELECT FirstName + ' ' + MiddleName + ' ' + LastName AS [Full Name]
FROM Employees
WHERE Salary IN (25000, 14000, 12500, 23600)

--P11
SELECT FirstName, LastName
FROM Employees
WHERE ManagerID IS NULL

--P12
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > 50000
ORDER BY Salary DESC

--P13
SELECT TOP(5) FirstName, LastName
FROM Employees
ORDER BY Salary DESC

--P14
SELECT FirstName, LastName
FROM Employees
WHERE NOT DepartmentID=4

--P15
SELECT *
FROM Employees
ORDER BY Salary DESC, FirstName, LastName DESC, MiddleName

--P16
CREATE VIEW V_EmployeesSalaries
AS
SELECT FirstName, LastName, Salary
FROM Employees

--P17
CREATE VIEW V_EmployeeNameJobTitle
AS
SELECT FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName AS [Full Name], JobTitle AS [Job Title]
FROM Employees

--P18
SELECT DISTINCT JobTitle
FROM Employees

--P19
SELECT TOP(10) *
FROM Projects
ORDER BY StartDate, Name

--20
SELECT TOP(7) FirstName, LastName, HireDate
FROM Employees
ORDER BY HireDate DESC

--21
UPDATE Employees
SET Salary=Salary*1.12
WHERE DepartmentID IN(
    SELECT DepartmentID
    FROM Departments
    WHERE [Name] IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services')
)
SELECT Salary
FROM Employees
--Revert back
UPDATE Employees
SET Salary=Salary/1.12
WHERE DepartmentID IN(
    SELECT DepartmentID
    FROM Departments
    WHERE [Name] IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services')
)

--P22
SELECT PeakName
FROM Peaks
ORDER BY PeakName

--P23
SELECT TOP 30 CountryName, [Population]
FROM Countries
WHERE ContinentCode = 'EU'
ORDER BY Population DESC, CountryName

--P24
SELECT CountryName
, [CountryCode]
, CASE [CurrencyCode]
    WHEN 'EUR' THEN 'Euro'
    ELSE 'Not Euro'
    END AS Currency
FROM Countries
ORDER BY CountryName

--P25
SELECT [Name]
FROM Characters
ORDER BY [Name]