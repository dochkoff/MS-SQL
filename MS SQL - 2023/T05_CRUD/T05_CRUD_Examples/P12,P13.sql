--P12 /create & execute view/
CREATE VIEW v_EployeesByDepartment AS
SELECT FirstName + ' ' + LastName AS [Full Name],
        Salary
FROM Employees

SELECT * FROM v_EployeesByDepartment

--P13
CREATE VIEW v_HighestPeak
AS
SELECT TOP 1 * FROM Peaks
ORDER BY Elevation DESC