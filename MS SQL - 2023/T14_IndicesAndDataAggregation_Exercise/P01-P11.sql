--P01
SELECT COUNT(Id)
FROM WizzardDeposits

--P02
SELECT MAX(MagicWandSize) AS LongestMagicWand
FROM WizzardDeposits

--P03
SELECT DepositGroup, MAX(MagicWandSize) AS LongestMagicWand
FROM WizzardDeposits
GROUP BY DepositGroup

--P04
SELECT TOP(2) DepositGroup
FROM WizzardDeposits
GROUP BY DepositGroup
ORDER BY AVG(MagicWandSize)

--P05
SELECT DepositGroup, SUM(DepositAmount) AS TotalSum
FROM WizzardDeposits
GROUP BY DepositGroup

--P06
SELECT DepositGroup, SUM(DepositAmount) AS TotalSum
FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY DepositGroup

--P07
SELECT *
FROM
    (SELECT DepositGroup, SUM(DepositAmount) AS TotalSum
    FROM WizzardDeposits
    WHERE MagicWandCreator = 'Ollivander family'
    GROUP BY DepositGroup) AS CoreQuery
WHERE TotalSum < 150000
ORDER BY TotalSum DESC

--P08
SELECT
    DepositGroup,
    MagicWandCreator,
    MIN(DepositCharge) AS MinDepositCharge
FROM WizzardDeposits
GROUP BY DepositGroup, MagicWandCreator
ORDER BY MagicWandCreator,DepositGroup

--P09
SELECT AgeGroups, COUNT(*)
FROM
    (SELECT
        CASE
            WHEN Age <= 10 THEN '[0-10]'
            WHEN Age > 10 AND Age <= 20 THEN '[11-20]'
            WHEN Age > 20 AND Age <= 30 THEN '[21-30]'
            WHEN Age > 30 AND Age <= 40 THEN '[31-40]'
            WHEN Age > 40 AND Age <= 50 THEN '[41-50]'
            WHEN Age > 50 AND Age <= 60 THEN '[51-60]'
            ELSE '[61+]'
        END AS AgeGroups
    FROM WizzardDeposits) AS AgeGrouped
GROUP BY AgeGroups

--P10
SELECT FirstLetter
FROM
    (SELECT LEFT(FirstName, 1) AS FirstLetter
    FROM WizzardDeposits
    WHERE DepositGroup = 'Troll Chest') AS AllFirstLetters
GROUP BY FirstLetter
ORDER BY FirstLetter

--P11
SELECT DepositGroup, IsDepositExpired, AVG(DepositInterest) AS AverageInterest
FROM WizzardDeposits
WHERE DepositStartDate > '1985-01-01'
GROUP BY DepositGroup, IsDepositExpired
ORDER BY DepositGroup DESC, IsDepositExpired