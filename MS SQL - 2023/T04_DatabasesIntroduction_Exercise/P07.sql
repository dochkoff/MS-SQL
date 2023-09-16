CREATE TABLE [People]
(
    [Id] INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(200) NOT NULL,
    [Picture] VARBINARY(MAX),
    CHECK (DATALENGTH([Picture]) <= 2000000),
    [Height] DECIMAL(4,2),
    [Weight] DECIMAL(5,2),
    [Gender] CHAR(1) NOT NULL,
    CHECK ([Gender]='m' OR [Gender]='f'),
    [Birthdate] DATETIME2 NOT NULL,
    [Biography] NVARCHAR(MAX)
)

INSERT INTO [People]([Name],[Gender],Birthdate)
    VALUES
    ('Pavel', 'm', '1990-10-12'),
    ('Martin','m','1988-03-02'),
    ('Anjelina','f','1994-12-12'),
    ('Anelia','f', '1970-06-14'),
    ('Miroslav','m','1960-04-19')