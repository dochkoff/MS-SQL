ALTER TABLE [Users]
ADD CONSTRAINT DF_Default_LastLoginTime
DEFAULT GETDATE() FOR LastLoginTime