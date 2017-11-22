USE [master]
GO
drop login [userln];
drop login [adminln];

--connection login to user
CREATE LOGIN [userln] WITH PASSWORD=N'userln',
 DEFAULT_DATABASE=[LibraryNotes], DEFAULT_LANGUAGE=[русский], 
 CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [userln] ENABLE
GO

--connection login to admin
CREATE LOGIN [adminln] WITH PASSWORD=N'admin',
 DEFAULT_DATABASE=[LibraryNotes], DEFAULT_LANGUAGE=[русский], 
 CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [adminln] ENABLE
GO


use LibraryNotes;

drop user [user];
drop user [admin];


CREATE USER [user] FOR LOGIN [userln];  
GO  
CREATE USER [admin] FOR LOGIN [adminln];  
GO  

--@"Data Source=DESKTOP-FFV5E68\SQLEXPRESS;Integrated Security=False;User ID=userln;Password=userln;ApplicationIntent=ReadWrite;"))
--@"Data Source=DESKTOP-FFV5E68\SQLEXPRESS;Integrated Security=False;User ID=adminln;Password=adminln;ApplicationIntent=ReadWrite;"))


