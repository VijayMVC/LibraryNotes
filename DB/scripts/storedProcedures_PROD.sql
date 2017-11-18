use LibraryNotes;

----------------------[�������� ����� �� �����] ------------------------------------
IF OBJECT_ID('[dbo].[selectBooksByGenre]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectBooksByGenre] 
END 
GO
CREATE PROC [dbo].[selectBooksByGenre] 
    @genre NVARCHAR(50)
AS 
	SET NOCOUNT ON  --�������� ����� ���-�� ������������ �����
	SET XACT_ABORT ON  --������ ���������� � ����������� ���������

	SELECT b.[Name], b.[Year]
		FROM [dbo].[Books] as b
			INNER JOIN [dbo].[Book_Genres] as bg
		ON b.id = bg.Book_Id
			INNER JOIN [dbo].[Genres] as g
		ON g.[Id] = bg.[Genre_Id]
		WHERE g.[Genre] = @genre	

GO


----------------------[�������� ����� �� ����] ------------------------------------
IF OBJECT_ID('[dbo].[selectBooksByTag]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectBooksByTag] 
END 
GO
CREATE PROC [dbo].[selectBooksByTag] 
    @tag NVARCHAR(50)
AS 
	begin
		SET NOCOUNT ON  --�������� ����� ���-�� ������������ �����
		SET XACT_ABORT ON  --������ ���������� � ����������� ���������

		SELECT t.name, b.name
			FROM [Books] as b
				INNER JOIN [Book_Tags] as bt
			ON b.[Id] = bt.[Book_Id]
				INNER JOIN [Tags] as t
			ON t.[Id] = bt.[Tag_Id]  --�������� ��� ����� �� ����
			WHERE t.[Name] = @tag

	end;
GO

----------------------[�������� ����� � 3/3 ������: ������ ������������ �� ��������] ------------------------------------
IF OBJECT_ID('[dbo].[selectBooksByTag]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[selectBooksByTag] 
END 
GO
CREATE PROC [dbo].[selectBooksByTag] 
    @tag1 NVARCHAR(50),
    @tag2 NVARCHAR(50),
    @tag3 NVARCHAR(50)
AS 
	begin
		SET NOCOUNT ON  --�������� ����� ���-�� ������������ �����
		SET XACT_ABORT ON  --������ ���������� � ����������� ���������

		SELECT  count(b.name), t.name
			FROM [Books] as b
				INNER JOIN [Book_Tags] as bt
			ON b.[Id] = bt.[Book_Id]
				INNER JOIN [Tags] as t
			ON t.[Id] = bt.[Tag_Id] group by t.name  --�������� ��� ����� �� ����
			WHERE t.[Name] = @tag 

	end;
GO


exec [dbo].[selectBooksByTag] 'leo';
exec [dbo].[selectBooksByGenre] 'Thriller';