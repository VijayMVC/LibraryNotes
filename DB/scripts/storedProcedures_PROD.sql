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
    @tag2 NVARCHAR(50),
    @tag3 NVARCHAR(50)
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

exec [dbo].[selectBooksByGenre] 'Thriller';
exec [dbo].[selectBooksByTag] 'leo';
exec [dbo].[selectSimilarBooksByTags]  'integer', 'leo', 'id';

exec [dbo].[selectBooksByAuthors]  @First_Name = 'Ye'
exec [dbo].[selectBooksByAuthors]  @Last_Name = 'Dykins'
exec [dbo].[selectBooksByAuthors]  'Ye', 'DOmokos'

exec [dbo].[selectTagsByBook] 'Lust for Gold'
exec [dbo].[selectTagsByBook] 'Becky Sharp'
exec [dbo].[selectTagsByBook] 'Battle of the Year'

exec [dbo].[selectGenresByBook] 'Lust for Gold'
exec [dbo].[selectGenresByBook] 'Becky Sharp'
exec [dbo].[selectGenresByBook] 'Battle of the Year'