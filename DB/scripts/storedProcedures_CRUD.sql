USE [LibraryNotes];
GO

----------------------[Authors].[AuthorsSelect] ------------------------------------
IF OBJECT_ID('[dbo].[AuthorsSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[AuthorsSelect] 
END 
GO
CREATE PROC [dbo].[AuthorsSelect] 
    @Id int
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		BEGIN TRAN

		SELECT [Id], [First_Name], [Last_Name], [Birth_date], [Die_date] 
		FROM   [dbo].[Authors] 
		WHERE  ([Id] = @Id OR @Id IS NULL) 

		COMMIT
	END;
GO
----------------------[Authors].[AuthorsInsert] ------------------------------------
IF OBJECT_ID('[dbo].[AuthorsInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[AuthorsInsert] 
END 
GO
CREATE PROC [dbo].[AuthorsInsert] 
    @First_Name nvarchar(50),
    @Last_Name nvarchar(50),
    @Birth_date date,
    @Die_date date = NULL
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры  
	
		BEGIN TRAN
	
		INSERT INTO [dbo].[Authors] ([First_Name], [Last_Name], [Birth_date], [Die_date])
		SELECT @First_Name, @Last_Name, @Birth_date, @Die_date
	
		SELECT [Id], [First_Name], [Last_Name], [Birth_date], [Die_date]
		FROM   [dbo].[Authors]
		WHERE  [Id] = SCOPE_IDENTITY()
               
		COMMIT
	END;
GO
----------------------[Authors].[AuthorsUpdate] ------------------------------------
IF OBJECT_ID('[dbo].[AuthorsUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[AuthorsUpdate] 
END 
GO
CREATE PROC [dbo].[AuthorsUpdate] 
    @Id int,
    @First_Name nvarchar(50),
    @Last_Name nvarchar(50),
    @Birth_date date,
    @Die_date date = NULL
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры
		
		BEGIN TRAN
	
		UPDATE [dbo].[Authors]
		SET    [First_Name] = @First_Name, [Last_Name] = @Last_Name, [Birth_date] = @Birth_date, [Die_date] = @Die_date
		WHERE  [Id] = @Id
	
		SELECT [Id], [First_Name], [Last_Name], [Birth_date], [Die_date]
		FROM   [dbo].[Authors]
		WHERE  [Id] = @Id	

	COMMIT
	END;
GO
----------------------[Authors].[AuthorsDelete] ------------------------------------
IF OBJECT_ID('[dbo].[AuthorsDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[AuthorsDelete] 
END 
GO
CREATE PROC [dbo].[AuthorsDelete] 
    @Id int
AS 
	BEGIN
		SET NOCOUNT ON --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры
			
		BEGIN TRAN
	
		DELETE
		FROM   [dbo].[Authors]
		WHERE  [Id] = @Id
	
		COMMIT
	END;
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

----------------------[Book_Genres].[Book_GenresSelect] ------------------------------------
IF OBJECT_ID('[dbo].[Book_GenresSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[Book_GenresSelect] 
END 
GO
CREATE PROC [dbo].[Book_GenresSelect] 
    @Id int
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		BEGIN TRAN

		SELECT [Id], [Book_Id], [Genre_Id] 
		FROM   [dbo].[Book_Genres] 
		WHERE  ([Id] = @Id OR @Id IS NULL) 

		COMMIT
	END;
GO
----------------------[Book_Genres].[Book_GenresInsert] ------------------------------------
IF OBJECT_ID('[dbo].[Book_GenresInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[Book_GenresInsert] 
END 
GO
CREATE PROC [dbo].[Book_GenresInsert] 
    @Book_Id int = NULL,
    @Genre_Id int = NULL
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры  
	
		BEGIN TRAN
	
		INSERT INTO [dbo].[Book_Genres] ([Book_Id], [Genre_Id])
		SELECT @Book_Id, @Genre_Id
	
		SELECT [Id], [Book_Id], [Genre_Id]
		FROM   [dbo].[Book_Genres]
		WHERE  [Id] = SCOPE_IDENTITY()
               
		COMMIT
	END;
GO
----------------------[Book_Genres].[Book_GenresUpdate] ------------------------------------
IF OBJECT_ID('[dbo].[Book_GenresUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[Book_GenresUpdate] 
END 
GO
CREATE PROC [dbo].[Book_GenresUpdate] 
    @Id int,
    @Book_Id int = NULL,
    @Genre_Id int = NULL
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры
		
		BEGIN TRAN
	
		UPDATE [dbo].[Book_Genres]
		SET    [Book_Id] = @Book_Id, [Genre_Id] = @Genre_Id
		WHERE  [Id] = @Id
	
		SELECT [Id], [Book_Id], [Genre_Id]
		FROM   [dbo].[Book_Genres]
		WHERE  [Id] = @Id	

	COMMIT
	END;
GO
----------------------[Book_Genres].[Book_GenresDelete] ------------------------------------
IF OBJECT_ID('[dbo].[Book_GenresDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[Book_GenresDelete] 
END 
GO
CREATE PROC [dbo].[Book_GenresDelete] 
    @Id int
AS 
	BEGIN
		SET NOCOUNT ON --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры
			
		BEGIN TRAN
	
		DELETE
		FROM   [dbo].[Book_Genres]
		WHERE  [Id] = @Id
	
		COMMIT
	END;
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

----------------------[Book_Tags].[Book_TagsSelect] ------------------------------------
IF OBJECT_ID('[dbo].[Book_TagsSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[Book_TagsSelect] 
END 
GO
CREATE PROC [dbo].[Book_TagsSelect] 
    @Id int
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		BEGIN TRAN

		SELECT [Id], [Book_Id], [Tag_Id] 
		FROM   [dbo].[Book_Tags] 
		WHERE  ([Id] = @Id OR @Id IS NULL) 

		COMMIT
	END;
GO
----------------------[Book_Tags].[Book_TagsInsert] ------------------------------------
IF OBJECT_ID('[dbo].[Book_TagsInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[Book_TagsInsert] 
END 
GO
CREATE PROC [dbo].[Book_TagsInsert] 
    @Book_Id int = NULL,
    @Tag_Id int = NULL
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры  
	
		BEGIN TRAN
	
		INSERT INTO [dbo].[Book_Tags] ([Book_Id], [Tag_Id])
		SELECT @Book_Id, @Tag_Id
	
		SELECT [Id], [Book_Id], [Tag_Id]
		FROM   [dbo].[Book_Tags]
		WHERE  [Id] = SCOPE_IDENTITY()
               
		COMMIT
	END;
GO
----------------------[Book_Tags].[Book_TagsUpdate] ------------------------------------
IF OBJECT_ID('[dbo].[Book_TagsUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[Book_TagsUpdate] 
END 
GO
CREATE PROC [dbo].[Book_TagsUpdate] 
    @Id int,
    @Book_Id int = NULL,
    @Tag_Id int = NULL
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры
		
		BEGIN TRAN
	
		UPDATE [dbo].[Book_Tags]
		SET    [Book_Id] = @Book_Id, [Tag_Id] = @Tag_Id
		WHERE  [Id] = @Id
	
		SELECT [Id], [Book_Id], [Tag_Id]
		FROM   [dbo].[Book_Tags]
		WHERE  [Id] = @Id	

	COMMIT
	END;
GO
----------------------[Book_Tags].[Book_TagsDelete] ------------------------------------
IF OBJECT_ID('[dbo].[Book_TagsDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[Book_TagsDelete] 
END 
GO
CREATE PROC [dbo].[Book_TagsDelete] 
    @Id int
AS 
	BEGIN
		SET NOCOUNT ON --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры
			
		BEGIN TRAN
	
		DELETE
		FROM   [dbo].[Book_Tags]
		WHERE  [Id] = @Id
	
		COMMIT
	END;
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

----------------------[Books].[BooksSelect] ------------------------------------
IF OBJECT_ID('[dbo].[BooksSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[BooksSelect] 
END 
GO
CREATE PROC [dbo].[BooksSelect] 
    @Id int
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		BEGIN TRAN

		SELECT [Id], [Name], [Year], [Author_Id], [Description] 
		FROM   [dbo].[Books] 
		WHERE  ([Id] = @Id OR @Id IS NULL) 

		COMMIT
	END;
GO
----------------------[Books].[BooksInsert] ------------------------------------
IF OBJECT_ID('[dbo].[BooksInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[BooksInsert] 
END 
GO
CREATE PROC [dbo].[BooksInsert] 
    @Name nvarchar(100),
    @Year smallint = NULL,
    @Author_Id int = NULL,
    @Description nvarchar(1000) = NULL
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры  
	
		BEGIN TRAN
	
		INSERT INTO [dbo].[Books] ([Name], [Year], [Author_Id], [Description])
		SELECT @Name, @Year, @Author_Id, @Description
	
		SELECT [Id], [Name], [Year], [Author_Id], [Description]
		FROM   [dbo].[Books]
		WHERE  [Id] = SCOPE_IDENTITY()
               
		COMMIT
	END;
GO
----------------------[Books].[BooksUpdate] ------------------------------------
IF OBJECT_ID('[dbo].[BooksUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[BooksUpdate] 
END 
GO
CREATE PROC [dbo].[BooksUpdate] 
    @Id int,
    @Name nvarchar(100),
    @Year smallint = NULL,
    @Author_Id int = NULL,
    @Description nvarchar(1000) = NULL
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры
		
		BEGIN TRAN
	
		UPDATE [dbo].[Books]
		SET    [Name] = @Name, [Year] = @Year, [Author_Id] = @Author_Id, [Description] = @Description
		WHERE  [Id] = @Id
	
		SELECT [Id], [Name], [Year], [Author_Id], [Description]
		FROM   [dbo].[Books]
		WHERE  [Id] = @Id	

	COMMIT
	END;
GO
----------------------[Books].[BooksDelete] ------------------------------------
IF OBJECT_ID('[dbo].[BooksDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[BooksDelete] 
END 
GO
CREATE PROC [dbo].[BooksDelete] 
    @Id int
AS 
	BEGIN
		SET NOCOUNT ON --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры
			
		BEGIN TRAN
	
		DELETE
		FROM   [dbo].[Books]
		WHERE  [Id] = @Id
	
		COMMIT
	END;
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

----------------------[Genres].[GenresSelect] ------------------------------------
IF OBJECT_ID('[dbo].[GenresSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[GenresSelect] 
END 
GO
CREATE PROC [dbo].[GenresSelect] 
    @Id int
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		BEGIN TRAN

		SELECT [Id], [Genre], [Description] 
		FROM   [dbo].[Genres] 
		WHERE  ([Id] = @Id OR @Id IS NULL) 

		COMMIT
	END;
GO
----------------------[Genres].[GenresInsert] ------------------------------------
IF OBJECT_ID('[dbo].[GenresInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[GenresInsert] 
END 
GO
CREATE PROC [dbo].[GenresInsert] 
    @Genre nvarchar(50),
    @Description nvarchar(700) = NULL
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры  
	
		BEGIN TRAN
	
		INSERT INTO [dbo].[Genres] ([Genre], [Description])
		SELECT @Genre, @Description
	
		SELECT [Id], [Genre], [Description]
		FROM   [dbo].[Genres]
		WHERE  [Id] = SCOPE_IDENTITY()
               
		COMMIT
	END;
GO
----------------------[Genres].[GenresUpdate] ------------------------------------
IF OBJECT_ID('[dbo].[GenresUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[GenresUpdate] 
END 
GO
CREATE PROC [dbo].[GenresUpdate] 
    @Id int,
    @Genre nvarchar(50),
    @Description nvarchar(700) = NULL
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры
		
		BEGIN TRAN
	
		UPDATE [dbo].[Genres]
		SET    [Genre] = @Genre, [Description] = @Description
		WHERE  [Id] = @Id
	
		SELECT [Id], [Genre], [Description]
		FROM   [dbo].[Genres]
		WHERE  [Id] = @Id	

	COMMIT
	END;
GO
----------------------[Genres].[GenresDelete] ------------------------------------
IF OBJECT_ID('[dbo].[GenresDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[GenresDelete] 
END 
GO
CREATE PROC [dbo].[GenresDelete] 
    @Id int
AS 
	BEGIN
		SET NOCOUNT ON --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры
			
		BEGIN TRAN
	
		DELETE
		FROM   [dbo].[Genres]
		WHERE  [Id] = @Id
	
		COMMIT
	END;
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

----------------------[Orders].[OrdersSelect] ------------------------------------
IF OBJECT_ID('[dbo].[OrdersSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[OrdersSelect] 
END 
GO
CREATE PROC [dbo].[OrdersSelect] 
    @Id int
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		BEGIN TRAN

		SELECT [Id], [Book_Id], [User_Id], [Order_date], [Required_date], [Return_date] 
		FROM   [dbo].[Orders] 
		WHERE  ([Id] = @Id OR @Id IS NULL) 

		COMMIT
	END;
GO
----------------------[Orders].[OrdersInsert] ------------------------------------
IF OBJECT_ID('[dbo].[OrdersInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[OrdersInsert] 
END 
GO
CREATE PROC [dbo].[OrdersInsert] 
    @Book_Id int,
    @User_Id int,
    @Order_date date,
    @Required_date date,
    @Return_date date = NULL
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры  
	
		BEGIN TRAN
	
		INSERT INTO [dbo].[Orders] ([Book_Id], [User_Id], [Order_date], [Required_date], [Return_date])
		SELECT @Book_Id, @User_Id, @Order_date, @Required_date, @Return_date
	
		SELECT [Id], [Book_Id], [User_Id], [Order_date], [Required_date], [Return_date]
		FROM   [dbo].[Orders]
		WHERE  [Id] = SCOPE_IDENTITY()
               
		COMMIT
	END;
GO
----------------------[Orders].[OrdersUpdate] ------------------------------------
IF OBJECT_ID('[dbo].[OrdersUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[OrdersUpdate] 
END 
GO
CREATE PROC [dbo].[OrdersUpdate] 
    @Id int,
    @Book_Id int,
    @User_Id int,
    @Order_date date,
    @Required_date date,
    @Return_date date = NULL
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры
		
		BEGIN TRAN
	
		UPDATE [dbo].[Orders]
		SET    [Book_Id] = @Book_Id, [User_Id] = @User_Id, [Order_date] = @Order_date, [Required_date] = @Required_date, [Return_date] = @Return_date
		WHERE  [Id] = @Id
	
		SELECT [Id], [Book_Id], [User_Id], [Order_date], [Required_date], [Return_date]
		FROM   [dbo].[Orders]
		WHERE  [Id] = @Id	

	COMMIT
	END;
GO
----------------------[Orders].[OrdersDelete] ------------------------------------
IF OBJECT_ID('[dbo].[OrdersDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[OrdersDelete] 
END 
GO
CREATE PROC [dbo].[OrdersDelete] 
    @Id int
AS 
	BEGIN
		SET NOCOUNT ON --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры
			
		BEGIN TRAN
	
		DELETE
		FROM   [dbo].[Orders]
		WHERE  [Id] = @Id
	
		COMMIT
	END;
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

----------------------[Tags].[TagsSelect] ------------------------------------
IF OBJECT_ID('[dbo].[TagsSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[TagsSelect] 
END 
GO
CREATE PROC [dbo].[TagsSelect] 
    @Id int
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		BEGIN TRAN

		SELECT [Id], [Name] 
		FROM   [dbo].[Tags] 
		WHERE  ([Id] = @Id OR @Id IS NULL) 

		COMMIT
	END;
GO
----------------------[Tags].[TagsInsert] ------------------------------------
IF OBJECT_ID('[dbo].[TagsInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[TagsInsert] 
END 
GO
CREATE PROC [dbo].[TagsInsert] 
    @Name nvarchar(50)
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры  
	
		BEGIN TRAN
	
		INSERT INTO [dbo].[Tags] ([Name])
		SELECT @Name
	
		SELECT [Id], [Name]
		FROM   [dbo].[Tags]
		WHERE  [Id] = SCOPE_IDENTITY()
               
		COMMIT
	END;
GO
----------------------[Tags].[TagsUpdate] ------------------------------------
IF OBJECT_ID('[dbo].[TagsUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[TagsUpdate] 
END 
GO
CREATE PROC [dbo].[TagsUpdate] 
    @Id int,
    @Name nvarchar(50)
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры
		
		BEGIN TRAN
	
		UPDATE [dbo].[Tags]
		SET    [Name] = @Name
		WHERE  [Id] = @Id
	
		SELECT [Id], [Name]
		FROM   [dbo].[Tags]
		WHERE  [Id] = @Id	

	COMMIT
	END;
GO
----------------------[Tags].[TagsDelete] ------------------------------------
IF OBJECT_ID('[dbo].[TagsDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[TagsDelete] 
END 
GO
CREATE PROC [dbo].[TagsDelete] 
    @Id int
AS 
	BEGIN
		SET NOCOUNT ON --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры
			
		BEGIN TRAN
	
		DELETE
		FROM   [dbo].[Tags]
		WHERE  [Id] = @Id
	
		COMMIT
	END;
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

----------------------[Users].[UsersSelect] ------------------------------------
IF OBJECT_ID('[dbo].[UsersSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[UsersSelect] 
END 
GO
CREATE PROC [dbo].[UsersSelect] 
    @Id int
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		BEGIN TRAN

		SELECT [Id], [Login], [Password], [Name], [Address], [Sex], [PhoneNumber] 
		FROM   [dbo].[Users] 
		WHERE  ([Id] = @Id OR @Id IS NULL) 

		COMMIT
	END;
GO
----------------------[Users].[UsersInsert] ------------------------------------
IF OBJECT_ID('[dbo].[UsersInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[UsersInsert] 
END 
GO
CREATE PROC [dbo].[UsersInsert] 
    @Login nvarchar(100),
    @Password nvarchar(100),
    @Name nvarchar(50) = NULL,
    @Address nvarchar(200) = NULL,
    @Sex nvarchar(6) = NULL,
    @PhoneNumber char(25)
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры  
	
		BEGIN TRAN
	
		INSERT INTO [dbo].[Users] ([Login], [Password], [Name], [Address], [Sex], [PhoneNumber])
		SELECT @Login, @Password, @Name, @Address, @Sex, @PhoneNumber
	
		SELECT [Id], [Login], [Password], [Name], [Address], [Sex], [PhoneNumber]
		FROM   [dbo].[Users]
		WHERE  [Id] = SCOPE_IDENTITY()
               
		COMMIT
	END;
GO
----------------------[Users].[UsersUpdate] ------------------------------------
IF OBJECT_ID('[dbo].[UsersUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[UsersUpdate] 
END 
GO
CREATE PROC [dbo].[UsersUpdate] 
    @Id int,
    @Login nvarchar(100),
    @Password nvarchar(100),
    @Name nvarchar(50) = NULL,
    @Address nvarchar(200) = NULL,
    @Sex nvarchar(6) = NULL,
    @PhoneNumber char(25)
AS 
	BEGIN
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры
		
		BEGIN TRAN
	
		UPDATE [dbo].[Users]
		SET    [Login] = @Login, [Password] = @Password, [Name] = @Name, [Address] = @Address, [Sex] = @Sex, [PhoneNumber] = @PhoneNumber
		WHERE  [Id] = @Id
	
		SELECT [Id], [Login], [Password], [Name], [Address], [Sex], [PhoneNumber]
		FROM   [dbo].[Users]
		WHERE  [Id] = @Id	

	COMMIT
	END;
GO
----------------------[Users].[UsersDelete] ------------------------------------
IF OBJECT_ID('[dbo].[UsersDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[UsersDelete] 
END 
GO
CREATE PROC [dbo].[UsersDelete] 
    @Id int
AS 
	BEGIN
		SET NOCOUNT ON --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры
			
		BEGIN TRAN
	
		DELETE
		FROM   [dbo].[Users]
		WHERE  [Id] = @Id
	
		COMMIT
	END;
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

