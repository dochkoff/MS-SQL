--P13
SELECT DepartmentID, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID
ORDER BY DepartmentID

--P14
SELECT DepartmentID, MIN(Salary) AS MinimumSalary
FROM Employees
WHERE DepartmentID IN (2,5,7) AND HireDate > '2000-01-01'
GROUP BY DepartmentID

--15
BEGIN TRY
    SELECT * INTO EmployeesNew
    FROM Employees
    WHERE Salary > 30000

    DELETE FROM EmployeesNew
    WHERE ManagerID = 42

    UPDATE EmployeesNew
    SET Salary = Salary + 5000
    WHERE DepartmentID = 1

    SELECT DepartmentID, AVG(Salary)
    FROM EmployeesNew
    GROUP BY DepartmentID
    COMMIT
END TRY
BEGIN CATCH
    ROLLBACK
END CATCH

--P16
SELECT DepartmentID, MAX(Salary) as MaxSalary
FROM Employees
GROUP BY DepartmentID
HAVING MAX (Salary) NOT BETWEEN 30000 AND 70000

--P17
SELECT COUNT(*) AS Count
FROM Employees
WHERE ManagerID IS NULL

--P18
SELECT DepartmentID, Salary FROM (SELECT Salary, DepartmentID,
DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS SalaryRanking
FROM Employees
GROUP BY DepartmentID, Salary) AS subq
WHERE subq.SalaryRanking = 3

--P19
SELECT TOP(10) FirstName, LastName, DepartmentID
FROM Employees AS ex
WHERE Salary > (
    SELECT AVG(Salary) AS AverageSalary
    FROM Employees AS ein
    WHERE ein.DepartmentID =  ex.DepartmentID
    GROUP BY DepartmentID
)
ORDER BY DepartmentID

