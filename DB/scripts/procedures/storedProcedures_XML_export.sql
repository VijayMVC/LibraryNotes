use LibraryNotes;

EXEC master.dbo.sp_configure 'show advanced options', 1;							--allow= instance tuning 
RECONFIGURE;
EXEC master.dbo.sp_configure 'xp_cmdshell', 1;										--start xp_cmdshell for bcp operates
RECONFIGURE;

----------------------------------------Write Books+Authors to XML-----------------------
IF OBJECT_ID('[dbo].[exportBooksToXML]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[exportBooksToXML] 
END 
GO
CREATE PROC [dbo].[exportBooksToXML] 
	@path nvarchar(256)																	--path to file
AS 
begin
	BEGIN TRAN
		declare @sql nvarchar(500)=
				  'bcp "SELECT  [Name], [Year], [Description], [First_Name], [Last_Name], [Birth_Date] '+								--select 
		'FROM   [dbo].[Books] as b join [dbo].[Authors] as a '+																			--select
		'on b.Author_Id = a.Id'+																										--select
		'  FOR XML PATH(''Order''), ROOT(''Root'')" queryout "'+@path+'"  -S DESKTOP-FFV5E68\SQLEXPRESS  -d LibraryNotes   -w -T ';     --once_item_name/ root_name/ path to file/ server path/ warchar + T
		EXEC xp_cmdshell @sql;
	COMMIT;
end;
GO


----------------------------------------Write ORDERS to XML-----------------------

IF OBJECT_ID('[dbo].[exportOrdersToXML]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[exportOrdersToXML] 
END 
GO
CREATE PROC [dbo].[exportOrdersToXML] 
	@path nvarchar(256)
AS 
begin
	BEGIN TRAN
		declare @sql nvarchar(500)=
				  'bcp "SELECT [Book_Id], [User_Id], [Order_date], [Required_date], [Return_date] FROM   [dbo].[Orders]  FOR XML PATH(''Order''), ROOT(''Root'')" queryout "'+
				  @path+'"  -S DESKTOP-FFV5E68\SQLEXPRESS  -d LibraryNotes   -w -T ';
		EXEC xp_cmdshell @sql;
	COMMIT;
end;
GO

----------------------------------------Orders with date range to XML-----------------------

IF OBJECT_ID('[dbo].[exportOrdersToXMLBetweenDate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[exportOrdersToXMLBetweenDate] 
END 
GO
CREATE PROC [dbo].[exportOrdersToXMLBetweenDate] 
	@path nvarchar(256),
	@Date1 date,
	@Date2 date
AS 
begin
	BEGIN TRAN
		declare @str_date1 nvarchar(300) = CONVERT(VARCHAR, @Date1, 120);
		declare @str_date2 nvarchar(300) = CONVERT(VARCHAR, @Date2, 120);
		declare @sql nvarchar(500)=
				  'bcp "SELECT [Book_Id], [User_Id], [Order_date], [Required_date], [Return_date] FROM'+
				     '[dbo].[Orders] WHERE ('''+@str_date1+''' <= [Order_date] AND [Order_date] <='''+ @str_date2+''') order by Order_date FOR XML PATH(''Order''), ROOT(''Root'')" queryout "'+
				  @path+'"  -S DESKTOP-FFV5E68\SQLEXPRESS  -d LibraryNotes   -w -T ';
		EXEC xp_cmdshell @sql;
	COMMIT;
end;
GO

------------------------------------------------------
exec [exportBooksToXML] 'D:\books.xml'

exec [exportOrdersToXML] 'D:\orders.xml'

exec [exportOrdersToXMLBetweenDate] 'D:\ordersDateRange.xml', '2015-01-02', '2015-04-06'