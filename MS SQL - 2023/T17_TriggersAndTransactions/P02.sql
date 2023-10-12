--P02
-- CREATE TABLE NotificationEmails
--     (Id INT PRIMARY KEY,
--     Recipient INT,
--     Subject VARCHAR(20),
--     Body VARCHAR(100)
--     )

CREATE OR ALTER TRIGGER tr_NewEmail
ON Logs FOR UPDATE
AS
    INSERT INTO NotificationEmails(Recipient, [Subject], Body)
    SELECT i.AccountHolderId, d.Balance, i.Balance
    FROM inserted AS i
    JOIN deleted AS d ON i.ID = d.ID
    WHERE i.Balance != d.Balance
GO