ALTER TABLE [Users]
DROP CONSTRAINT PK_Users

ALTER TABLE [Users]
ADD CONSTRAINT PK_Person PRIMARY KEY (Id,Username);