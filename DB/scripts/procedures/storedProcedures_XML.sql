use LibraryNotes;
go



IF OBJECT_ID('[dbo].[insertUsersFromXML]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[insertUsersFromXML] 
END 
GO
CREATE PROC [dbo].[insertUsersFromXML] 
	@path NVARCHAR(256)
AS 
	begin
		DECLARE @xml table (x xml); 
		
		declare @sql nvarchar(max)=
		'select CAST(x AS xml) 
			FROM OPENROWSET(BULK '''+ @path +''',
			 SINGLE_BLOB)
			AS T1(x); ';
				
			INSERT INTO @xml EXEC (@sql)

			select * from @xml;

		INSERT INTO Genres(Genre, Description) 
		SELECT 
		C3.value('Genre[1]', 'NVARCHAR(50)') AS Genre,
		C3.value('Description[1]', 'NVARCHAR(700)') AS Description
		FROM @xml.nodes('Root/GenreItem') AS T3(C3) 

		select * from Tags		
	end;
GO





--------------------------------------------дима
DECLARE @xml XML; 
SELECT @xml = CAST(C1 AS xml) FROM OPENROWSET(BULK 'C:\Users\Dmitry\Desktop\курсач\CITY.xml', SINGLE_BLOB) AS T1(C1); 


INSERT INTO CITY(NAME) 
SELECT 
C3.value('name[1]', 'NVARCHAR(100)') AS NAME 
FROM @xml.nodes('dataroot/city') AS T3(C3) 

select * from CITY
--дима


IF OBJECT_ID('[dbo].[insertUsersFromXML1]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[insertUsersFromXML1] 
END 
GO
CREATE PROC [dbo].[insertUsersFromXML1] 
	@path nvarchar(200)
AS 
	begin

declare @results table (x xml)
declare @xml XML;

declare @sql nvarchar(max)=
               'SELECT 
		CAST(REPLACE(CAST(x AS VARCHAR(MAX)), ''encoding="utf-16"'', ''encoding="utf-8"'') AS XML)
		FROM OPENROWSET(BULK '''+@path+''', SINGLE_BLOB) AS T(x)'

	INSERT INTO @results EXEC (@sql)

	SET  @xml = (SELECT  TOP 1 x from  @results);

	INSERT INTO Genres(Genre, Description) 
		SELECT 
		C3.value('Genre[1]', 'NVARCHAR(50)') AS Genre,
		C3.value('Description[1]', 'NVARCHAR(700)') AS Description
		FROM @xml.nodes('Root/GenreItem') AS T3(C3) 
	end;
GO

select * from genres

exec [dbo].[insertUsersFromXML1] 'D:\БГТУ\Курсовой проект\Course project\DB\js\genXML\content\genres.xml'