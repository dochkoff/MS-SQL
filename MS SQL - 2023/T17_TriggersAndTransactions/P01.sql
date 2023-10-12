--P01
-- CREATE TABLE Logs
--     (LogID INT PRIMARY KEY,
--     AccountId INT,
--     OldSum FLOAT,
--     NewSum FLOAT
--     )

CREATE OR ALTER TRIGGER tr_AccountSumIsChanged
ON Accounts FOR UPDATE
AS
    INSERT INTO Logs(AccountId, OldSum, NewSum)
    SELECT i.AccountHolderId, d.Balance, i.Balance
    FROM inserted AS i
    JOIN deleted AS d ON i.ID = d.ID
    WHERE i.Balance != d.Balance
GO