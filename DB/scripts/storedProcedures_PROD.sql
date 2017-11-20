use LibraryNotes;

----------------------[Получить книги по жанру] ------------------------------------
IF OBJECT_ID('[dbo].[selectBooksByGenre]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectBooksByGenre] 
END 
GO
CREATE PROC [dbo].[selectBooksByGenre] 
    @genre NVARCHAR(50)
AS 
	begin
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		SELECT b.[Name], b.[Year]
			FROM [dbo].[Books] as b
				INNER JOIN [dbo].[Book_Genres] as bg
			ON b.id = bg.Book_Id
				INNER JOIN [dbo].[Genres] as g
			ON g.[Id] = bg.[Genre_Id]
			WHERE g.[Genre] = @genre	
	end;
GO


----------------------[Получить книги по тэгу] ------------------------------------
IF OBJECT_ID('[dbo].[selectBooksByTag]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectBooksByTag] 
END 
GO
CREATE PROC [dbo].[selectBooksByTag] 
    @tag NVARCHAR(50)
AS 
	begin
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		SELECT t.name, b.name
			FROM [Books] as b
				INNER JOIN [Book_Tags] as bt
			ON b.[Id] = bt.[Book_Id]
				INNER JOIN [Tags] as t
			ON t.[Id] = bt.[Tag_Id]  --получить все книги по тегу
			WHERE t.[Name] = @tag

	end;
GO

----------------------[Поиск книг по заданным тегам с учетом частоты их использования] ------------------------------------
IF OBJECT_ID('[dbo].[selectSimilarBooksByTags]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectSimilarBooksByTags] 
END 
GO
CREATE PROC [dbo].[selectSimilarBooksByTags] 
    @tag1 NVARCHAR(50),
    @tag2 NVARCHAR(50) = NULL,
    @tag3 NVARCHAR(50) = NULL
AS 
	begin
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		  SELECT b.name, count(t.id) as Concurrences FROM [Books] as b, [Book_Tags] as bt, [Tags] as t
		    WHERE bt.tag_id = t.id
		    AND (t.name IN (@tag1, @tag2, @tag3))
			AND b.id = bt.book_id 
			GROUP BY b.name
			order by Concurrences desc
	end;
GO

--херота какая-то. зачем я это написал?
----------------------[Поиск книг по автору] ------------------------------------
----поиск по фирст нэйму, ласт нэйму или по всему
IF OBJECT_ID('[dbo].[selectBooksByAuthors]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectBooksByAuthors] 
END 
GO
CREATE PROC [dbo].[selectBooksByAuthors] 
    @First_Name NVARCHAR(50)=NULL,
    @Last_Name NVARCHAR(50)=NULL
AS 
	begin
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

	IF @First_Name IS NULL
		BEGIN
		  SELECT b.ID, b.name, a.First_Name, a.Last_Name
		    FROM [Books] as b 
			 INNER JOIN [Authors] as a
			 ON a.id = b.Author_Id
			 WHERE a.Last_Name = @Last_Name
		  END;
		  
	ELSE IF @Last_Name IS NULL
		BEGIN
		  SELECT b.ID, b.name, a.First_Name, a.Last_Name
		    FROM [Books] as b 
			 INNER JOIN [Authors] as a
			 ON a.id = b.Author_Id
			 WHERE a.First_Name = @First_Name
		  END;
	ELSE
		BEGIN
		  SELECT b.ID, b.name, a.First_Name, a.Last_Name
		    FROM [Books] as b 
			 INNER JOIN [Authors] as a
			 ON a.id = b.Author_Id
			 WHERE a.First_Name = @First_Name AND a.Last_Name = @Last_Name
		  END;
	end;
GO

----------------------[Получить тэги книги] ------------------------------------
IF OBJECT_ID('[dbo].[selectTagsByBook]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectTagsByBook] 
END 
GO
CREATE PROC [dbo].[selectTagsByBook] 
    @Book NVARCHAR(50)
AS 
	begin
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		SELECT t.name
			FROM [Books] as b
				INNER JOIN [Book_Tags] as bt
			ON b.[Id] = bt.[Book_Id]
				INNER JOIN [Tags] as t
			ON t.[Id] = bt.[Tag_Id]  --получить все книги по тегу
			WHERE b.[Name] = @Book

	end;
GO

----------------------[Получить жанры книги] ------------------------------------
IF OBJECT_ID('[dbo].[selectGenresByBook]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectGenresByBook] 
END 
GO
CREATE PROC [dbo].[selectGenresByBook] 
    @Book NVARCHAR(50)
AS 
	begin
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		SELECT g.[Genre]
			FROM [Books] as b
				INNER JOIN [Book_Genres] as bg
			ON b.[Id] = bg.[Book_Id]
				INNER JOIN [Genres] as g
			ON g.[Id] = bg.[Genre_Id]  --получить все книги по тегу
			WHERE b.[Name] = @Book

	end;
GO

----------------------[получить заказы за определенную дату] ------------------------------------
IF OBJECT_ID('[dbo].[selectOrdersBetweenDates]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectOrdersBetweenDates] 
END 
GO
CREATE PROC [dbo].[selectOrdersBetweenDates] 
    @Date1 date,
    @Date2 date 
AS 
	begin
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

			SELECT * FROM [Orders] 
			WHERE NOT (@Date1 > [Order_date] AND [Order_date] < @Date2)
	end;
GO

----------------------[получить активные заказы на руках](выборка прошлых просроченных + тех, что просрочены уже) ------------------------------------
IF OBJECT_ID('[dbo].[selectActiveOrders]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectActiveOrders] 
END 
GO
CREATE PROC [dbo].[selectActiveOrders] 
AS 
	begin
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		SELECT * FROM [Orders] 
		WHERE [Return_date] IS NULL
	end;
GO

----------------------[получить просроченные заказы] ------------------------------------
IF OBJECT_ID('[dbo].[selectOverdueOrders]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectOverdueOrders] 
END 
GO
CREATE PROC [dbo].[selectOverdueOrders] 
AS 
	begin
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		SELECT * FROM [Orders] 
		WHERE DATEDIFF(day, [Required_date],[Return_date]) >0 
		OR (DATEDIFF(day, [Required_date],getdate()) > 0 AND [Return_date] IS NULL) 
	end;
GO


----------------------[обновить заказ при сдаче книги] ------------------------------------
IF OBJECT_ID('[dbo].[updateOrderWithReturnBook]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[updateOrderWithReturnBook] 
END 
GO
CREATE PROC [dbo].[updateOrderWithReturnBook] 
   @OrderId int
AS 
	begin
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры
		begin tran
			UPDATE [Orders] set [Return_date] = getdate() where [Id]=@OrderId;

			SELECT * FROM   [dbo].[Orders] WHERE  [Id] = @OrderId	
		commit
	end;
GO
-----------------------------------------------------------------------------------------
--1 поиск по жанрам
exec [dbo].[selectBooksByGenre] 'Thriller';


--2 поиск по тэгу
exec [dbo].[selectBooksByTag] 'leo';


--3 поиск по совпадениям тэгов
exec [dbo].[selectSimilarBooksByTags]  'nibh', 'leo', 'id';
exec [dbo].[selectSimilarBooksByTags]  'pede', 'integer', 'purus';
exec [dbo].[selectSimilarBooksByTags]  'pede', 'venenatis', 'iaculis';
exec [dbo].[selectSimilarBooksByTags]  'pede', 'integer', 'purus';
exec [dbo].[selectSimilarBooksByTags]  'id', 'venenatis'


--4 поиск по авторам 
exec [dbo].[selectBooksByAuthors]  @First_Name = 'Ye'
exec [dbo].[selectBooksByAuthors]  @Last_Name = 'Dykins'
exec [dbo].[selectBooksByAuthors]  'Ye', 'DOmokos'


--5 получить все тэги книги
exec [dbo].[selectTagsByBook] 'Lust for Gold'
exec [dbo].[selectTagsByBook] 'Becky Sharp'
exec [dbo].[selectTagsByBook] 'Battle of the Year'


--6 получить все жанры книги
exec [dbo].[selectGenresByBook] 'Lust for Gold'
exec [dbo].[selectGenresByBook] 'Becky Sharp'
exec [dbo].[selectGenresByBook] 'Battle of the Year'

--7 получить заказы за период дат
exec [dbo].[selectOrdersBetweenDates] '2017-02-02', '2017-11-02'

--8 получить * что еще на руках
exec [dbo].[selectActiveOrders] 

--9 получить список просроченные заказы
exec [dbo].[selectOverdueOrders]

--10 обновить поле заказа -> пользователь вернул книгу
exec [dbo].[OrdersSelectAll]
exec [dbo].[updateOrderWithReturnBook] 3
