create database LibraryNotes 
ON(
		NAME = 'ControlDiet_DB',
		FILENAME = 'D:\БГТУ\Курсовой проект\Course project\DB\files\LibraryNotes.mdf',
		SIZE = 20MB,
		MAXSIZE = 50MB,
		FILEGROWTH = 10%
)
LOG ON(
		NAME = 'ControlDiet_Log',
		FILENAME = 'D:\БГТУ\Курсовой проект\Course project\DB\files\LibraryNotes.ldf',
		SIZE = 20MB,
		MAXSIZE = 50MB,
		FILEGROWTH = 5%
)
use LibraryNotes;

use master;
drop database LibraryNotes;

