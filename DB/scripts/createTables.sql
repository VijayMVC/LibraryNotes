use LibraryNotes;
------------------------------
--Table Users-----------------
------------------------------
CREATE TABLE [Users](
    [Id] int identity(1,1) primary key,
	[Login] varchar(100) unique NOT NULL,
	[Password] varchar(100) NOT NULL,
    [Name] varchar(100),
    [Address] varchar(255),
	[Sex] varchar(10) check( Sex in('Male','Female')),
	[PhoneNumber] varchar(25) NOT NULL
);

------------------------------
--Books Authors---------------
------------------------------
CREATE TABLE [Authors] (
    [Id] int identity(1,1) primary key,
    [First_Name] varchar(50) NOT NULL,
    [Last_Name] varchar(50) NOT NULL,
    [Birth_date] date NOT NULL,
	[Die_date] date 
);

------------------------------
--Books Genres---------------
------------------------------
CREATE TABLE [Genres] (
    [Id] int identity(1,1) primary key,
    [Genre] varchar(50) NOT NULL,
    [Description] varchar(700),
);

------------------------------
--Books-----------------------
------------------------------
CREATE TABLE [Books] (
    [Id] int identity(1,1) primary key,
    [Name] varchar(100) NOT NULL,
	[Year] smallint,
	[Author_Id] int foreign key references  Authors(Id) null,
	[Description] varchar(500),			
);

------------------------------
--Books/Genres----------------
------------------------------
CREATE TABLE [Book_Genres] (
	[Id] int identity(1,1) primary key,
    [Book_Id] int foreign key references Books(Id),
    [Genre_Id] int foreign key references Genres(Id),
);

------------------------------
--Orders----------------------
------------------------------
CREATE TABLE [Orders] (
	[Id] int identity(1,1) primary key,
    [Book_Id] int foreign key references Books(Id) NOT NULL,
    [User_Id] int foreign key references Users(Id) NOT NULL,
	[Order_date] date NOT NULL,
	[Issue_date] date NOT NULL,
	[Days_of_use] int not NULL CHECK ([Days_of_use] > 0),
);

DROP TABLE [Orders];
DROP TABLE [Book_Genres];
DROP TABLE [Books];
DROP TABLE [Users];
DROP TABLE [Authors];
DROP TABLE [Genres];
