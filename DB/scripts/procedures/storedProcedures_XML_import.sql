use LibraryNotes;
go


delete from [Orders];
delete from [Book_Genres];
delete from [Book_Tags];
delete from [Tags];
delete from [Books];
delete from [Users];
delete from [Authors];
delete from [Genres];

DBCC CHECKIDENT ('[Orders]', RESEED, 0);				--обнуление всех Identity
DBCC CHECKIDENT ('[Book_Genres]', RESEED, 0);
DBCC CHECKIDENT ('[Books]', RESEED, 0);
DBCC CHECKIDENT ('[Users]', RESEED, 0);
DBCC CHECKIDENT ('[Authors]', RESEED, 0);
DBCC CHECKIDENT ('[Genres]', RESEED, 0);
DBCC CHECKIDENT ('[Book_Tags]', RESEED, 0);
DBCC CHECKIDENT ('[Tags]', RESEED, 0);
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------
------------------------------Вставка жанров--------------------------------------------
-------------------------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[insertGenresFromXML]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[insertGenresFromXML] 
END 
GO
CREATE PROC [dbo].[insertGenresFromXML] 
	@path nvarchar(256)
AS 
begin
	SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
	SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

	BEGIN TRAN
		declare @results table (x xml)			--таблица для рерзультата прочтения файла xml
		declare @sql nvarchar(300)=
				   'SELECT 
			CAST(REPLACE(CAST(x AS VARCHAR(MAX)), ''encoding="utf-16"'', ''encoding="utf-8"'') AS XML)
			FROM OPENROWSET(BULK '''+@path+''', SINGLE_BLOB) AS T(x)'; --чтение xml 
 
		INSERT INTO @results EXEC (@sql) -- -> результат в поле таблицы @results

		declare @xml XML = (SELECT  TOP 1 x from  @results);	-- поле с xml таблицы в переменную типа xml

		INSERT INTO Genres(Genre, Description) 
			SELECT 
			C3.value('Genre[1]', 'NVARCHAR(50)') AS Genre,
			C3.value('Description[1]', 'NVARCHAR(700)') AS Description
			FROM @xml.nodes('Root/GenreItem') AS T3(C3) 
	COMMIT;
end;
GO

-------------------------------------------------------------------------------------------------------
------------------------------Вставка пользователей--------------------------------------------
-------------------------------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[insertUsersFromXML]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[insertUsersFromXML] 
END 
GO
CREATE PROC [dbo].[insertUsersFromXML] 
	@path nvarchar(256)
AS 
begin
	SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
	SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

	BEGIN TRAN

	declare @results table (x xml)			--таблица для рерзультата прочтения файла xml
	declare @sql nvarchar(300)=
               'SELECT 
		CAST(REPLACE(CAST(x AS VARCHAR(MAX)), ''encoding="utf-16"'', ''encoding="utf-8"'') AS XML)
		FROM OPENROWSET(BULK '''+@path+''', SINGLE_BLOB) AS T(x)'; --чтение xml 
 
	INSERT INTO @results EXEC (@sql) -- -> результат в поле таблицы @results

	declare @xml XML = (SELECT  TOP 1 x from  @results);	-- поле с xml таблицы в переменную типа xml

	INSERT INTO [Users]( [Login], [Password], [Name], [Address], [Sex], [PhoneNumber]) 
		SELECT 
		C3.value('Login[1]', 'NVARCHAR(100)') AS [Login],
		C3.value('Password[1]', 'NVARCHAR(100)') AS [Password],
		C3.value('Name[1]', 'NVARCHAR(50)') AS [Name],
		C3.value('Adress[1]', 'NVARCHAR(200)') AS [Address],
		C3.value('Sex[1]', 'NVARCHAR(6)') AS [Sex],
		C3.value('PhoneNumber[1]', 'CHAR(25)') AS [PhoneNumber]
		FROM @xml.nodes('Root/User') AS T3(C3) 
	COMMIT;
end;
GO

-------------------------------------------------------------------------------------------------------
------------------------------Вставка Tags--------------------------------------------
-------------------------------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[insertTagsFromXML]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[insertTagsFromXML] 
END 
GO
CREATE PROC [dbo].[insertTagsFromXML] 
	@path nvarchar(256)
AS 
begin
	SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
	SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

	BEGIN TRAN

	declare @results table (x xml)			--таблица для рерзультата прочтения файла xml
	declare @sql nvarchar(300)=
               'SELECT 
		CAST(REPLACE(CAST(x AS VARCHAR(MAX)), ''encoding="utf-16"'', ''encoding="utf-8"'') AS XML)
		FROM OPENROWSET(BULK '''+@path+''', SINGLE_BLOB) AS T(x)'; --чтение xml 
 
	INSERT INTO @results EXEC (@sql) -- -> результат в поле таблицы @results

	declare @xml XML = (SELECT  TOP 1 x from  @results);	-- поле с xml таблицы в переменную типа xml

	INSERT INTO [Tags]([Name]) 
		SELECT 
		C3.value('Name[1]', 'NVARCHAR(100)') AS [Name]
		FROM @xml.nodes('Root/Tag') AS T3(C3) 
	
	COMMIT;
end;
GO

-------------------------------------------------------------------------------------------------------
------------------------------Вставка Tags--------------------------------------------
-------------------------------------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[insertAuthorsFromXML]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[insertAuthorsFromXML] 
END 
GO
CREATE PROC [dbo].[insertAuthorsFromXML] 
	@path nvarchar(256)
AS 
begin
	SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

	BEGIN TRAN

	declare @results table (x xml)			--таблица для рерзультата прочтения файла xml
	declare @sql nvarchar(300)=
               'SELECT 
		CAST(REPLACE(CAST(x AS VARCHAR(MAX)), ''encoding="utf-16"'', ''encoding="utf-8"'') AS XML)
		FROM OPENROWSET(BULK '''+@path+''', SINGLE_BLOB) AS T(x)'; --чтение xml 
 
	INSERT INTO @results EXEC (@sql) -- -> результат в поле таблицы @results

	declare @xml XML = (SELECT  TOP 1 x from  @results);	-- поле с xml таблицы в переменную типа xml



		INSERT INTO Authors(First_Name, Last_Name, Birth_date, Die_date) 
			SELECT 
			C3.value('First_Name[1]', 'NVARCHAR(50)') AS [First_Name],
			C3.value('Last_Name[1]', 'NVARCHAR(50)') AS [Last_Name],
			C3.value('Birth_date[1]', 'date') AS [Birth_date],
			C3.value('Die_date[1]', 'date') AS [Die_date]
			FROM @xml.nodes('Root/Author') AS T3(C3) 

	COMMIT;
end;
GO



-------------------------------------------------------------------------------------------------------
------------------------------Вставка книг--------------------------------------------
-------------------------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[insertBooksFromXML]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[insertBooksFromXML] 
END 
GO
CREATE PROC [dbo].[insertBooksFromXML] 
	@path nvarchar(256)
AS 
begin
	SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
	SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

	BEGIN TRAN
		declare @results table (x xml)			--таблица для рерзультата прочтения файла xml
		declare @sql nvarchar(300)=
				   'SELECT 
			CAST(REPLACE(CAST(x AS VARCHAR(MAX)), ''encoding="utf-16"'', ''encoding="utf-8"'') AS XML)
			FROM OPENROWSET(BULK '''+@path+''', SINGLE_BLOB) AS T(x)'; --чтение xml 
 
		INSERT INTO @results EXEC (@sql) -- -> результат в поле таблицы @results

		declare @xml XML = (SELECT  TOP 1 x from  @results);	-- поле с xml таблицы в переменную типа xml

		INSERT INTO Books(Name, Year,Author_Id, Description  ) 
			SELECT 
			C3.value('Name[1]', 'NVARCHAR(100)') AS Name,
			C3.value('Year[1]', 'SMALLINT') AS Year,
			C3.value('Adress[1]', 'INT') AS Adress,
			C3.value('Description[1]', 'NVARCHAR(1000)') AS Description
			FROM @xml.nodes('Root/Book') AS T3(C3) 
	COMMIT;
end;
GO


-------------------------------------------------------------------------------------------------------
------------------------------Вставка книг-жанров--------------------------------------------
-------------------------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[insertBooksGenresFromXML]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[insertBooksGenresFromXML] 
END 
GO
CREATE PROC [dbo].[insertBooksGenresFromXML] 
	@path nvarchar(256)
AS 
begin
	SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
	SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

	BEGIN TRAN
		declare @results table (x xml)			--таблица для рерзультата прочтения файла xml
		declare @sql nvarchar(300)=
				   'SELECT 
			CAST(REPLACE(CAST(x AS VARCHAR(MAX)), ''encoding="utf-16"'', ''encoding="utf-8"'') AS XML)
			FROM OPENROWSET(BULK '''+@path+''', SINGLE_BLOB) AS T(x)'; --чтение xml 
 
		INSERT INTO @results EXEC (@sql) -- -> результат в поле таблицы @results

		declare @xml XML = (SELECT  TOP 1 x from  @results);	-- поле с xml таблицы в переменную типа xml

		INSERT INTO Book_Genres(Book_Id, Genre_Id) 
			SELECT 
			C3.value('Book_Id[1]', 'int') AS Book_Id,
			C3.value('Genre_Id[1]', 'int') AS Genre_Id
			FROM @xml.nodes('Root/BookGenre') AS T3(C3) 
	COMMIT;
end;
GO


-------------------------------------------------------------------------------------------------------
------------------------------Вставка книг-тэгов--------------------------------------------
-------------------------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[insertBooksTagsFromXML]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[insertBooksTagsFromXML] 
END 
GO
CREATE PROC [dbo].[insertBooksTagsFromXML] 
	@path nvarchar(256)
AS 
begin
	SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
	SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

	BEGIN TRAN
		declare @results table (x xml)			--таблица для рерзультата прочтения файла xml
		declare @sql nvarchar(300)=
				   'SELECT 
			CAST(REPLACE(CAST(x AS VARCHAR(MAX)), ''encoding="utf-16"'', ''encoding="utf-8"'') AS XML)
			FROM OPENROWSET(BULK '''+@path+''', SINGLE_BLOB) AS T(x)'; --чтение xml 
 
		INSERT INTO @results EXEC (@sql) -- -> результат в поле таблицы @results

		declare @xml XML = (SELECT  TOP 1 x from  @results);	-- поле с xml таблицы в переменную типа xml

		INSERT INTO Book_Tags(Book_Id, Tag_Id) 
			SELECT 
			C3.value('Book_Id[1]', 'int') AS Book_Id,
			C3.value('Tag_Id[1]', 'int') AS Genre_Id
			FROM @xml.nodes('Root/BookGenre') AS T3(C3) 
	COMMIT;
end;
GO


-------------------------------------------------------------------------------------------------------
------------------------------Вставка заказов--------------------------------------------
-------------------------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[insertOrdersFromXML]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[insertOrdersFromXML] 
END 
GO
CREATE PROC [dbo].[insertOrdersFromXML] 
	@path nvarchar(256)
AS 
begin
	SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
	SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

	BEGIN TRAN
		declare @results table (x xml)			--таблица для рерзультата прочтения файла xml
		declare @sql nvarchar(300)=
				   'SELECT 
			CAST(REPLACE(CAST(x AS VARCHAR(MAX)), ''encoding="utf-16"'', ''encoding="utf-8"'') AS XML)
			FROM OPENROWSET(BULK '''+@path+''', SINGLE_BLOB) AS T(x)'; --чтение xml 
 
		INSERT INTO @results EXEC (@sql) -- -> результат в поле таблицы @results

		declare @xml XML = (SELECT  TOP 1 x from  @results);	-- поле с xml таблицы в переменную типа xml

		INSERT INTO Orders(Book_Id, User_Id,Order_date,Required_date,Return_date) 
			SELECT 
			C3.value('Book_Id[1]', 'int') AS Book_Id,
			C3.value('User_Id[1]', 'int') AS User_Id,
			C3.value('Order_date[1]', 'date') AS Order_date,
			C3.value('Required_date[1]', 'date') AS Required_date,
			C3.value('Return_date[1]', 'date') AS Return_date  
			FROM @xml.nodes('Root/Order') AS T3(C3) 
	COMMIT;
end;
GO

-----genres
exec [dbo].[insertGenresFromXML] 'D:\БГТУ\Курсовой проект\Course project\DB\js\genXML\content\genres.xml';
select * from genres;

-----users

exec [dbo].[insertUsersFromXML] 'D:\БГТУ\Курсовой проект\Course project\DB\js\genXML\content\users.xml';
select * from users;

-----tags
exec [dbo].[insertTagsFromXML] 'D:\БГТУ\Курсовой проект\Course project\DB\js\genXML\content\tags.xml';
select * from Tags;

-----Authors
exec [dbo].[insertAuthorsFromXML] 'D:\БГТУ\Курсовой проект\Course project\DB\js\genXML\content\authors.xml';
select * from authors;

-----Books
exec [dbo].[insertBooksFromXML] 'D:\БГТУ\Курсовой проект\Course project\DB\js\genXML\content\books.xml';
select * from books;

-----Book_genres
exec [dbo].[insertBooksGenresFromXML] 'D:\БГТУ\Курсовой проект\Course project\DB\js\genXML\content\books_genres.xml';
select * from Book_Genres;

-----Book_tags
exec [dbo].[insertBooksTagsFromXML] 'D:\БГТУ\Курсовой проект\Course project\DB\js\genXML\content\books_tag.xml';
select * from Book_Tags;

-----Orders
exec [dbo].[insertOrdersFromXML] 'D:\БГТУ\Курсовой проект\Course project\DB\js\genXML\content\orders.xml';
exec [dbo].[insertOrdersFromXML] 'D:\orders.xml';
select * from Orders;

