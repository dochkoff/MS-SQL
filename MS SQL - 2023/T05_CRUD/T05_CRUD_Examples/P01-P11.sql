--P01
SELECT EmployeeID AS ID,
        FirstName,
        LastName
FROM Employees

--P02
SELECT FirstName + ' ' + LastName AS [Full Name],
        EmployeeID AS [No.]
FROM Employees

--P03
SELECT DISTINCT DepartmentID
  FROM Employees

--P04
SELECT LastName, DepartmentID
  FROM Employees
 WHERE DepartmentID = 1

 --P05
SELECT LastName, Salary 
FROM Employees 
WHERE Salary <= 20000

--P06
SELECT LastName
  FROM Employees
 WHERE NOT (ManagerID = 3 OR ManagerID = 4)

 --P07
SELECT LastName, Salary
FROM Employees
WHERE Salary BETWEEN 20000 AND 22000

--P08
SELECT FirstName, LastName, ManagerID
  FROM Employees
 WHERE ManagerID IN (109, 3, 16)

 --P09 /FALSE
SELECT LastName, ManagerId
FROM Employees
WHERE ManagerId = NULL

--P10
SELECT LastName, ManagerId FROM Employees
 WHERE ManagerId IS NULL

 SELECT LastName, ManagerId FROM Employees
 WHERE ManagerId IS NOT NULL

 --P11
 SELECT LastName, HireDate FROM Employees
ORDER BY HireDate

SELECT LastName, HireDate FROM Employees
ORDER BY HireDate DESC