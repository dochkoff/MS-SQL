--P01
SELECT TOP (5) EmployeeID, JobTitle, e.AddressID, a.AddressText
FROM Employees AS e
    JOIN Addresses AS a ON e.AddressID = a.AddressID
ORDER BY AddressID

--P02
SELECT TOP (50) FirstName, LastName, t.Name AS Town, a.AddressText
FROM Employees AS e
    JOIN Addresses AS a ON e.AddressID = a.AddressID
    JOIN Towns AS t ON t.TownID = a.TownID
ORDER BY FirstName, LastName

--P03
SELECT EmployeeID, FirstName, LastName, d.Name AS DepartmentName
FROM Employees AS e
    JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE d.Name = 'Sales'
ORDER BY EmployeeID

--P04
SELECT TOP(5) EmployeeID, FirstName, Salary, d.Name AS DepartmentName
FROM Employees AS e
    JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 15000
ORDER BY d.DepartmentID

--P05
SELECT TOP(3) e.EmployeeID, FirstName
FROM Employees AS e
WHERE e.EmployeeID NOT IN
    (SELECT EmployeeID FROM EmployeesProjects)
ORDER BY EmployeeID

--P06
SELECT FirstName, LastName, HireDate, d.Name AS DeptName
FROM Employees AS e
    JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE e.HireDate > '1999-01-01' AND d.Name IN ('Sales', 'Finance')
ORDER BY HireDate

--P07
SELECT TOP(5) e.EmployeeID, FirstName, p.Name AS ProjectName
FROM Employees AS e
    JOIN EmployeesProjects AS ep ON e.EmployeeID = ep.EmployeeID
    JOIN Projects AS p ON ep.ProjectID = p.ProjectID
WHERE p.StartDate > '2002-08-13' AND p.EndDate IS NULL
ORDER BY EmployeeID

--P08
SELECT e.EmployeeID, FirstName,
    CASE
        WHEN p.StartDate > '2004-12-31' THEN NULL
        ELSE p.Name
    END ProjectName
FROM Employees AS e
    JOIN EmployeesProjects AS ep ON e.EmployeeID = ep.EmployeeID
    JOIN Projects AS p ON ep.ProjectID = p.ProjectID
WHERE e.EmployeeID = 24

--P09
SELECT e.EmployeeID, e.FirstName, e.ManagerID, m.FirstName AS ManagerName
FROM Employees AS e
    JOIN  Employees AS m ON e.ManagerID = m.EmployeeID
WHERE e.ManagerID IN (3,7)
ORDER BY e.EmployeeID

--P10
SELECT TOP(50)
  e.EmployeeID
, e.FirstName + ' ' + e.LastName AS EmployeeName
, m.FirstName + ' ' + m.LastName AS ManagerName
, d.Name AS DepaertmentName
FROM Employees AS e
    JOIN  Employees AS m ON e.ManagerID = m.EmployeeID
    JOIN  Departments AS d ON e.DepartmentID = d.DepartmentID
ORDER BY e.EmployeeID

--P11
SELECT TOP(1) AVG(e.Salary) AS MinAverageSalary
FROM Employees AS e
    JOIN Departments AS d ON d.DepartmentID = e.DepartmentID
GROUP BY d.Name
ORDER BY MinAverageSalary