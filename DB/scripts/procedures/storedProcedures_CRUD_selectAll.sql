USE [LibraryNotes];
GO

----------------------[Authors].[AuthorsSelectAll] ------------------------------------
IF OBJECT_ID('[dbo].[AuthorsSelectAll]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[AuthorsSelectAll] 
END 
GO
CREATE PROC [dbo].[AuthorsSelectAll] 
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк

		SELECT [Id], [First_Name], [Last_Name], [Birth_date], [Die_date] 
		FROM   [dbo].[Authors] 

	END;
GO


----------------------[Book_Genres].[Book_GenresSelectAll] ------------------------------------
IF OBJECT_ID('[dbo].[Book_GenresSelectAll]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[Book_GenresSelectAll] 
END 
GO
CREATE PROC [dbo].[Book_GenresSelectAll] 
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк

		SELECT [Id], [Book_Id], [Genre_Id] 
		FROM   [dbo].[Book_Genres] 

	END;
GO
-----------------------------------------------------------------------------------

----------------------[Book_Tags].[Book_TagsSelectAll] ------------------------------------
IF OBJECT_ID('[dbo].[Book_TagsSelectAll]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[Book_TagsSelectAll] 
END 
GO
CREATE PROC [dbo].[Book_TagsSelectAll] 
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк

		SELECT [Id], [Book_Id], [Tag_Id] 
		FROM   [dbo].[Book_Tags] 

	END;
GO


----------------------[Books].[BooksSelectAll] ------------------------------------
IF OBJECT_ID('[dbo].[BooksSelectAll]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[BooksSelectAll] 
END 
GO
CREATE PROC [dbo].[BooksSelectAll] 
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк

		SELECT [Id], [Name], [Year], [Author_Id], [Description] 
		FROM   [dbo].[Books] 

	END;
GO


----------------------[Genres].[GenresSelectAll] ------------------------------------
IF OBJECT_ID('[dbo].[GenresSelectAll]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[GenresSelectAll] 
END 
GO
CREATE PROC [dbo].[GenresSelectAll] 
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк

		SELECT [Id], [Genre], [Description] 
		FROM   [dbo].[Genres] 

	END;
GO


----------------------[Orders].[OrdersSelectAll] ------------------------------------
IF OBJECT_ID('[dbo].[OrdersSelectAll]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[OrdersSelectAll] 
END 
GO
CREATE PROC [dbo].[OrdersSelectAll] 
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк

		SELECT [Id], [Book_Id], [User_Id], [Order_date], [Required_date], [Return_date] 
		FROM   [dbo].[Orders] 

	END;
GO

----------------------[Tags].[TagsSelectAll] ------------------------------------
IF OBJECT_ID('[dbo].[TagsSelectAll]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[TagsSelectAll] 
END 
GO
CREATE PROC [dbo].[TagsSelectAll] 
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк

		SELECT * FROM TAGS

	END;
GO

----------------------[Users].[UsersSelectAll] ------------------------------------
IF OBJECT_ID('[dbo].[UsersSelectAll]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[UsersSelectAll] 
END 
GO
CREATE PROC [dbo].[UsersSelectAll] 
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк

		SELECT [Id], [Login], [Password], [Name], [Address], [Sex], [PhoneNumber], [Admin] 
		FROM   [dbo].[Users] 

	END;
GO
