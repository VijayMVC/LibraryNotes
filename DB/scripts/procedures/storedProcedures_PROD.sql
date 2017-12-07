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


--херота какая-то. зачем я это написал?
----------------------[Поиск книг по автору] ------------------------------------
----поиск по фирст нэйму, ласт нэйму или по всему
IF OBJECT_ID('[dbo].[selectBooksByAuthors]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectBooksByAuthors] 
END 
GO
CREATE PROC [dbo].[selectBooksByAuthors] 
    @First NVARCHAR(50),
    @Last NVARCHAR(50)=NULL
AS 
	begin
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

	IF @Last IS NULL
		BEGIN
		  SELECT b.ID, b.name, a.First_Name, a.Last_Name
		    FROM [Books] as b 
			 INNER JOIN [Authors] as a
			 ON a.id = b.Author_Id
			 WHERE a.First_Name = @First OR a.Last_Name = @First
		  END;
	ELSE
		BEGIN
		  SELECT b.ID, b.name, a.First_Name, a.Last_Name
		    FROM [Books] as b 
			 INNER JOIN [Authors] as a
			 ON a.id = b.Author_Id
			 WHERE (a.First_Name = @First AND a.Last_Name = @Last) OR
				   (a.Last_Name = @First AND a.First_Name = @Last)
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
			WHERE (@Date1 < [Order_date] AND [Order_date] < @Date2)
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


----------------------[топ полупярных жанров] ------------------------------------
IF OBJECT_ID('[dbo].[selectTopPopularGenres]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectTopPopularGenres] 
END 
GO
CREATE PROC [dbo].[selectTopPopularGenres] 
AS 
	begin
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры
		
		SELECT count(g.[Genre]) as Rating,g.[Genre], g.Id
			FROM [Books] as b
				INNER JOIN [Book_Genres] as bg
			ON b.[Id] = bg.[Book_Id]
				INNER JOIN [Genres] as g
			ON g.[Id] = bg.[Genre_Id] 
				INNER JOIN [Orders] as o 
			ON o.Book_Id = b.Id
			group by g.Genre,g.Id
			order by Rating desc

	end;
GO

----------------------[проверка паролей] ------------------------------------
IF OBJECT_ID('[dbo].[selectUserExist]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectUserExist] 
END 
GO
CREATE PROC [dbo].[selectUserExist] 
   @Login NVARCHAR(100)=NULL,
   @Password NVARCHAR(100)=NULL
AS 
	begin
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		DECLARE @auth tinyint = NULL;         
		Select @auth = [Admin] from Users 	where Login = @Login and Password = @Password;

		if(@auth != 0)
			select * from Users 	where Login = @Login and Password = @Password;
			return @auth;

	end;
GO
----------------------[получить книги + автор] ------------------------------------
IF OBJECT_ID('[dbo].[selectAuthorsAndBooks]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectAuthorsAndBooks] 
END 
GO
CREATE PROC [dbo].[selectAuthorsAndBooks] 
AS 
	begin
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		SELECT  b.[Id],[Name], [Year], [Description], [First_Name], [Last_Name] 							
		FROM   [dbo].[Books] as b join [dbo].[Authors] as a																		
		on b.Author_Id = a.Id

	end;
GO
----------------------[получить книги + автор ID] ------------------------------------
IF OBJECT_ID('[dbo].[selectAuthorsAndBooksId]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectAuthorsAndBooksId] 
END 
GO
CREATE PROC [dbo].[selectAuthorsAndBooksId] 
	@Id int
AS 
	begin
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		SELECT  b.[Id],[Name], [Year], [Description], [First_Name], [Last_Name] 							
		FROM   [dbo].[Books] as b join [dbo].[Authors] as a																		
		on b.Author_Id = a.Id
		where b.Id = @Id;

	end;
GO


-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------ЭТО МОЯ ВЕРШИНА-------------------------
----------------------[Поиск похожих книг] ------------------------------------
IF OBJECT_ID('[dbo].[selectSimilarBooks]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectSimilarBooks] 
END 
GO
CREATE PROC [dbo].[selectSimilarBooks] 
  @Book NVARCHAR(50),
  @Top integer =5
AS 
	begin
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		declare @genre1 nvarchar(50);
		declare @genre2 nvarchar(50);
		declare @genre3 nvarchar(50);
		declare @tag1 nvarchar(50);
		declare @tag2 nvarchar(50);
		declare @tag3 nvarchar(50);				--по 3 переменных тегов и жанром книги

		declare @genres table(name nvarchar(50));		--таблица для поиска всех жанров
		declare @tags table(name nvarchar(50));			--таблица для поиска всех тэгов

		insert into @genres(name) exec [dbo].[selectGenresByBook]  @Book;		--заполняем все жанры и тэги
		insert into @tags(name) exec [dbo].[selectTagsByBook]   @Book;


		DECLARE @genre_cursor cursor 
		set @genre_cursor = CURSOR FOR 
			select name from @genres
		OPEN @genre_cursor 
		FETCH NEXT FROM @genre_cursor into @genre1;
		FETCH NEXT FROM @genre_cursor into @genre2;
		FETCH NEXT FROM @genre_cursor into @genre3;					--заполняем наши 3 переменные выборкой из всех жанров
		close @genre_cursor;

		DECLARE @tag_cursor cursor 
		set @tag_cursor = CURSOR FOR 
			select name from @tags
		OPEN @tag_cursor 
		FETCH NEXT FROM @tag_cursor into @tag1;
		FETCH NEXT FROM @tag_cursor into @tag2;
		FETCH NEXT FROM @tag_cursor into @tag3;						--заполняем наши 3 переменные выборкой из всех тэгов
		close @tag_cursor;

		Declare @tmpSimilarBooks table(id int, name NVARCHAR(100), Concurrences int);			--таблица для совпадений книги
		insert into @tmpSimilarBooks(id, name,Concurrences) exec [dbo].[selectSimilarBooksByTags]  @tag1,@tag2,@tag3;			--ищем похожие по тэгам 
		insert into @tmpSimilarBooks(id, name,Concurrences) exec [dbo].[selectSimilarBooksByGenres]  @genre1,@genre2,@genre3;	--ищем похожие по жанрам
		select distinct top (@Top) *  from @tmpSimilarBooks where name!=  @Book order by Concurrences desc;					--отбираем неповторяющие + топ N + сорировка по совпадениям + убираем саму же искомую книгу
	
	end;
GO

----------------------[Поиск книг по заданным тегам с учетом частоты их использования]------------------------------------
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

		  SELECT b.id, b.name, count(t.id) as Concurrences FROM [Books] as b, [Book_Tags] as bt, [Tags] as t
		    WHERE bt.tag_id = t.id
		    AND (t.name IN (@tag1, @tag2, @tag3))
			AND b.id = bt.book_id 
			GROUP BY b.name,b.id
			order by Concurrences desc
	end;
GO

----------------------[Поиск книг по заданным жарнам с учетом частоты их использования] ------------------------------------
IF OBJECT_ID('[dbo].[selectSimilarBooksByGenres]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectSimilarBooksByGenres] 
END 
GO
CREATE PROC [dbo].[selectSimilarBooksByGenres] 
    @genre1 NVARCHAR(50),
    @genre2 NVARCHAR(50) = NULL,
    @genre3 NVARCHAR(50) = NULL
AS 
	begin
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		  SELECT b.id,b.name, count(g.id) as Concurrences FROM [Books] as b, [Book_Genres] as bg, [Genres] as g
		    WHERE bg.Genre_Id = g.id
		    AND (g.Genre IN (@genre1, @genre2, @genre3))
			AND b.id = bg.book_id 
			GROUP BY b.name,b.id
			order by Concurrences desc
	end;
GO
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
----------------------[Поиск заказов юзера] ------------------------------------
IF OBJECT_ID('[dbo].[selectUserOrders]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectUserOrders] 
END 
GO
CREATE PROC [dbo].[selectUserOrders] 
  @Id integer
AS 
	begin
		SET NOCOUNT ON  --отлючить вывод кол-ва обработанных строк
		SET XACT_ABORT ON  --ролбэк транзакции и прекращение процедуры

		select o.[Id], [Name], [Order_date], [Required_date], [Return_date] from [dbo].[Orders] o join [dbo].[Books] b on o.Book_Id = b.Id where [User_Id] =  @Id;
	end;
GO
-----------------------------------------------------------------------------------------
--1 поиск по жанрам
exec [dbo].[selectBooksByGenre] 'Thriller';

--2 поиск по тэгу
exec [dbo].[selectBooksByTag] 'leo';

--3 поиск по совпадениям тэгов
exec [dbo].[selectSimilarBooksByTags]  'nibh', 'leo', 'id';
exec [dbo].[selectSimilarBooksByTags]  'pede', 'venenatis', 'iaculis';
exec [dbo].[selectSimilarBooksByTags]  'pede', 'integer', 'purus';
exec [dbo].[selectSimilarBooksByTags]  'id', 'venenatis'

-- поиск по совпадениям жанрам
exec [dbo].[selectSimilarBooksByGenres]  'Drama', 'Action', 'Crime';
exec [dbo].[selectSimilarBooksByGenres]  'Adventure', 'Drama', 'Horror';


--4 поиск по авторам 
exec [dbo].[selectBooksByAuthors]   'Ye'
exec [dbo].[selectBooksByAuthors]   'Dykins'
exec [dbo].[selectBooksByAuthors]   'Orjan'
exec [dbo].[selectBooksByAuthors]   'Kerford'
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
exec [dbo].[selectOrdersBetweenDates] '2015-02-02', '2017-11-02'
--8 получить * что еще на руках
exec [dbo].[selectActiveOrders] 

--9 получить список просроченные заказы
exec [dbo].[selectOverdueOrders]

--10 обновить поле заказа -> пользователь вернул книгу
exec [dbo].[OrdersSelectAll]
exec [dbo].[updateOrderWithReturnBook] @OrderId = 3

--11 топ заказываемых жанров
exec [dbo].[selectTopPopularGenres] 

--12 проверить пароль
exec [dbo].[selectUserExist] '1', '1';

--13 книги+авторы
exec [dbo].[selectAuthorsAndBooks] 
--14 книги+авторы Id
exec [dbo].[selectAuthorsAndBooksId] 2

--15 ПОИСК СХОЖИХ КНИГ
EXEC [dbo].[selectSimilarBooks] '2', 4;
EXEC [dbo].[selectSimilarBooks] 'Lust for Gold', 8;

--16 все заказы челика
EXEC [dbo].[selectUserOrders] 4

select * from orders 