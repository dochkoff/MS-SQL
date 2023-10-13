-- --P01
-- CREATE PROC usp_GetEmployeesSalaryAbove35000
-- AS
-- BEGIN
--     SELECT FirstName, LastName
--     FROM Employees
--     WHERE Salary > 35000
-- END

-- --P02
-- CREATE PROC usp_GetEmployeesSalaryAboveNumber (@n DECIMAL(18,4))
-- AS
-- BEGIN
--     SELECT FirstName, LastName
--     FROM Employees
--     WHERE Salary >= @n
-- END

-- EXEC usp_GetEmployeesSalaryAboveNumber 48100

-- --P03
-- CREATE PROC usp_GetTownsStartingWith (@townString VARCHAR(10))
-- AS
-- BEGIN
--     SELECT [Name]
--     FROM Towns
--     WHERE [Name] LIKE @townString + '%'
-- END

-- --P04
-- CREATE PROC usp_GetEmployeesFromTown (@townName VARCHAR(50))
-- AS
-- BEGIN
--     SELECT FirstName, LastName
--     FROM Employees AS e
--     JOIN Addresses as a ON a.AddressID=e.AddressID
--     JOIN Towns AS t ON t.TownID=a.TownID
--     WHERE t.Name=@townName
-- END

-- --P05
-- CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4))
-- RETURNS NVARCHAR(10)
-- AS
-- BEGIN
--     DECLARE @salaryLevel VARCHAR(10)
--     IF (@salary < 30000)
--         SET @salaryLevel = 'Low'
--     ELSE IF (@salary <= 50000)
--         SET @salaryLevel = 'Average'
--     ELSE
--         SET @salaryLevel = 'High'

--     RETURN @salaryLevel
-- END

-- SELECT 
--     Salary,
--     dbo.ufn_GetSalaryLevel(Salary) AS [Salary Level]
-- FROM Employees

-- --P06
-- CREATE PROC usp_EmployeesBySalaryLevel(@SalaryLvl VARCHAR(10))
-- AS
-- BEGIN
--     SELECT FirstName, LastName
--     FROM Employees AS e
--     WHERE dbo.ufn_GetSalaryLevel(e.Salary)=@SalaryLvl
-- END

-- EXEC usp_EmployeesBySalaryLevel 'High'

-- --P07
-- CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(50), @word VARCHAR(50))
-- RETURNS BIT
-- AS
-- BEGIN
--     DECLARE @n INT = 1
--     WHILE @n<=LEN(@word)
--         BEGIN
--         IF CHARINDEX(SUBSTRING(@word,@n,1),@setOfLetters) > 0
--             SET += 1
--         ELSE
--             RETURN 0
--         END
--     RETURN 1
-- END

-- --P08
-- CREATE PROCEDURE usp_DeleteEmployeesFromDepartment
-- @departmentId INT
-- AS
-- BEGIN
--     DECLARE @employeesToBeDeleted TABLE (ID INT)
--     INSERT INTO @employeesToBeDeleted(ID)
--     SELECT EmployeeID
--     FROM Employees
--     WHERE DepartmentID = @departmentId
    
--     ALTER TABLE Departments
--     ALTER COLUMN ManagerID INT

--     UPDATE Departments
--     SET ManagerID = NULL
--     WHERE ManagerID IN (SELECT * FROM @employeesToBeDeleted)

--     UPDATE Employees
--     SET ManagerID = NULL
--     WHERE ManagerID IN (SELECT * FROM @employeesToBeDeleted)

--     DELETE FROM EmployeesProjects
--     WHERE EmployeeID IN (SELECT * FROM @employeesToBeDeleted)

--     DELETE FROM Employees
--     WHERE DepartmentID = @departmentId

--     DELETE FROM Departments
--     WHERE DepartmentID = @departmentId

--     SELECT COUNT(*)
--     FROM Employees
--     WHERE DepartmentID = @departmentId
-- END