CREATE TABLE [Directors]
(
    [Id] INT PRIMARY KEY,
    [DirectorName] NVARCHAR(100) NOT NULL,
    [Notes] NVARCHAR(MAX)
)

CREATE TABLE [Genres]
(
    [Id] INT PRIMARY KEY,
    [GenreName] NVARCHAR(100) NOT NULL,
    [Notes] NVARCHAR(MAX)
)

CREATE TABLE [Categories]
(
    [Id] INT PRIMARY KEY,
    [CategoryName] NVARCHAR(100) NOT NULL,
    [Notes] NVARCHAR(MAX)
)

CREATE TABLE [Movies]
(
    [Id] INT PRIMARY KEY,
    [Title] NVARCHAR(100) NOT NULL,
    [DirectorId] INT NOT NULL,
    [CopyrightYear] DATE NOT NULL,
    [Length] TIME NOT NULL,
    [GenreId] INT NOT NULL,
    [CategoryId] INT NOT NULL,
    [Rating] TINYINT,
    [Notes] NVARCHAR(MAX)
)

INSERT INTO [Directors]([Id],[DIrectorName])
VALUES
(1, 'Frank Darabont'),
(2, 'Joe Navaro'),
(3, 'Christopher Nolan'),
(4, 'Quentin Tarantino'),
(5, 'Robert Zemeckis')

INSERT INTO [Genres]([Id],[GenreName])
VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Anime'),
(4, 'Crime'),
(5, 'Mistery')

INSERT INTO [Categories]([Id],[CategoryName])
VALUES
(1, 'Oscar'),
(2, 'BG'),
(3, 'US'),
(4, 'EU'),
(5, 'RU')

INSERT INTO [Movies]([Id],[Title],[DirectorId],[CopyrightYear],[Length],[GenreId],[CategoryId])
VALUES
(1, 'The Shawshank Redemption',1,'1994-09-23','01:34:23',1,3),
(2, 'Inception',3,'2010-07-08','01:43:13',3,2),
(3, 'The Dark Knight',2, '2008-07-18','02:09:01',4,1),
(4, 'Pulp Fiction',4, '1994-10-14','02:41:54',5,5),
(5, 'Forrest Gump',5,'1994-07-06','01:12:16',3,2)