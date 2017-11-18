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

	BEGIN TRAN

	SELECT b.[Name], b.[Year]
		FROM [dbo].[Books] as b
			INNER JOIN [dbo].[Book_Genres] as bg
		ON b.id = bg.Book_Id
			INNER JOIN [dbo].[Genres] as g
		ON g.[Id] = bg.[Genre_Id]
		WHERE g.[Genre] = @genre	

	COMMIT
GO



exec [dbo].[selectBooksByGenre] 'Thriller';