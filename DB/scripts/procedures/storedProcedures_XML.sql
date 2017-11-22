USE LibraryNotes;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ImportCinemas] AS
BEGIN
    CREATE TABLE XMLwithOpenXML
	(
		Id INT IDENTITY PRIMARY KEY,
		XMLData XML,
		LoadedDateTime DATETIME
	)

	INSERT INTO XMLwithOpenXML(XMLData, LoadedDateTime)
	SELECT CONVERT(XML, BulkColumn) AS BulkColumn, GETDATE() 
	FROM OPENROWSET(BULK 'G:\Univer\5sem\DB\cinema_bookings\cinema_bookings\DataGenerator\bin\Debug\cinemas.xml', SINGLE_BLOB)
	 AS x;

	DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
	SELECT @XML = XMLData FROM XMLwithOpenXML

	EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML

	DELETE  FROM cinemas;

	insert into cinemas
	SELECT id, name, manager, address, phone, status
	FROM OPENXML(@hDoc, 'ArrayOfCinema/Cinema')
	WITH 
	(
		id [int] 'id',
		name [varchar](100) 'name',
		manager [varchar](100) 'manager',
		address [varchar](100) 'address',
		phone [varchar](100) 'phone',
		status [smallint] 'status'
	)

	EXEC sp_xml_removedocument @hDoc

	drop table XMLwithOpenXML;
END;