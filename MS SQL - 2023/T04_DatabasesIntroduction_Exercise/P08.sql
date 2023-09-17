CREATE TABLE [Users]
(
    [Id] BIGINT PRIMARY KEY IDENTITY,
    [Username] VARCHAR(30) NOT NULL UNIQUE,
    [Pass] VARCHAR(26) NOT NULL,
    [ProfilePicture] VARBINARY(MAX),
    CHECK (DATALENGTH([ProfilePicture]) <= 900000),
    [LastLoginTime] DATETIME2,
    [IsDeleted] BIT, 
)

INSERT INTO [Users]([Username],[Pass],[IsDeleted])
    VALUES
    ('pavelD', 'mh54w5b445', 0),
    ('martin77','f4q342v423', 0),
    ('Anjelina33','b5i8k897', 0),
    ('aneliaTS','3333333', 1),
    ('MiroslavM','MiroslavMPAss', 0)

