use LibraryNotes;

DROP TABLE [Orders];
DROP TABLE [Book_Genres];
DROP TABLE [Book_Tags];
DROP TABLE [Tags];
DROP TABLE [Books];
DROP TABLE [Users];
DROP TABLE [Authors];
DROP TABLE [Genres];


------------------------------
--Table Users-----------------
------------------------------
CREATE TABLE [Users](
    [Id] int identity(1,1) primary key,
	[Login] NVARCHAR(100) unique NOT NULL,
	[Password] NVARCHAR(100) NOT NULL,
    [Name] NVARCHAR(50),
    [Address] NVARCHAR(200),
	[Sex] NVARCHAR(6) check( Sex in('Male','Female')),
	[PhoneNumber] CHAR(25) NOT NULL
);

------------------------------
--Books Authors---------------
------------------------------
CREATE TABLE [Authors] (
    [Id] INT identity(1,1) primary key,
    [First_Name] NVARCHAR(50) NOT NULL,
    [Last_Name] NVARCHAR(50) NOT NULL,
    [Birth_date] DATE NOT NULL,
	[Die_date] DATE 
);

------------------------------
--Books Genres---------------
------------------------------
CREATE TABLE [Genres] (
    [Id] INT identity(1,1) primary key,
    [Genre] NVARCHAR(50) NOT NULL,
    [Description] NVARCHAR(700),
);

------------------------------
--Books-----------------------
------------------------------
CREATE TABLE [Books] (
    [Id] INT identity(1,1) primary key,
    [Name] NVARCHAR(100) NOT NULL,
	[Year] SMALLINT,
	[Author_Id] INT foreign key references  Authors(Id) null,
	[Description] NVARCHAR(1000),			
);

------------------------------
--Books/Genres----------------
------------------------------
CREATE TABLE [Book_Genres] (
	[Id] INT identity(1,1) primary key,
    [Book_Id] INT foreign key references Books(Id),
    [Genre_Id] INT foreign key references Genres(Id),
);

------------------------------
--Orders----------------------
------------------------------
CREATE TABLE [Orders] (
	[Id] INT identity(1,1) primary key,
    [Book_Id] INT foreign key references Books(Id) NOT NULL,
    [User_Id] INT foreign key references Users(Id) NOT NULL,
	[Order_date] DATE NOT NULL,
	[Days_of_use] TINYINT not NULL CHECK ([Days_of_use] > 0),
);

------------------------------
--Tags----------------------
------------------------------
CREATE TABLE [Tags] (
	[Id] INT identity(1,1) primary key,
    [Name] NVARCHAR(50) NOT NULL
);

------------------------------
--Books/Tags----------------
------------------------------
CREATE TABLE [Book_Tags] (
	[Id] INT identity(1,1) primary key,
    [Book_Id] INT foreign key references Books(Id),
    [Tag_Id] INT foreign key references Tags(Id)
);
