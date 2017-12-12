use LibraryNotes;

-------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------[LibraryNotes_user_Role]--------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

DROP ROLE [LibraryNotes_user_Role];
CREATE ROLE [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[BooksSelectAll]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[AuthorsSelectAll]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[TagsSelectAll]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[GenresSelectAll]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[OrdersSelectAll]  TO [LibraryNotes_user_Role];

GRANT EXECUTE ON [dbo].[BooksSelect]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[AuthorsSelect]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[TagsSelect]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[GenresSelect]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[OrdersSelect]  TO [LibraryNotes_user_Role];

GRANT EXECUTE ON [dbo].[OrdersInsert]  TO [LibraryNotes_user_Role];

GRANT EXECUTE ON [dbo].[UsersUpdate]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[updateOrderWithReturnBook]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[selectBooksByAuthors]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[selectAuthorsAndBooks]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[selectAuthorsAndBooksId]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[selectBooksByGenre]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[selectBooksByTag]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[selectGenresByBook]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[selectSimilarBooksByTags]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[selectSimilarBooksByGenres]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[selectSimilarBooks]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[selectTagsByBook]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[selectTopPopularGenres]  TO [LibraryNotes_user_Role];
GRANT EXECUTE ON [dbo].[selectUserOrders]  TO [LibraryNotes_user_Role];
go

sp_addrolemember 'LibraryNotes_user_Role', 'user';  

-------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------[LibraryNotes_admin]---------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------


DROP ROLE [LibraryNotes_admin_Role];
CREATE ROLE [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[BooksDelete] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[GenresSelect] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[GenresInsert] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[GenresUpdate] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[GenresDelete] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[OrdersSelect] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[OrdersDelete] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[TagsSelect] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[TagsInsert] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[TagsUpdate] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[TagsDelete] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[UsersSelect] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[UsersInsert] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[UsersUpdate] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[UsersDelete] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[BooksUpdate] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[BooksInsert] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[OrdersInsert] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[OrdersUpdate] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectBooksByGenre] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectBooksByTag] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectBooksByAuthors] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectTagsByBook] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectGenresByBook] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectOrdersBetweenDates] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectActiveOrders] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectOverdueOrders] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[updateOrderWithReturnBook] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectTopPopularGenres] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectTopPopularGenresByDateRange] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectTopPopularTagsByDateRange] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectUserExist] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectAuthorsAndBooks] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectAuthorsAndBooksId] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectSimilarBooks] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectSimilarBooksByTags] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectSimilarBooksByGenres] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectUserOrders] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[selectStatUserBooksCountByDateRange] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[insertGenresFromXML] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[insertUsersFromXML] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[insertTagsFromXML] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[insertAuthorsFromXML] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[insertBooksFromXML] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[insertBooksGenresFromXML] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[insertBooksTagsFromXML] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[insertOrdersFromXML] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[exportBooksToXML] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[exportOrdersToXML] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[exportOrdersToXMLBetweenDate] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[AuthorsSelectAll] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[Book_GenresSelectAll] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[Book_TagsSelectAll] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[BooksSelectAll] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[GenresSelectAll] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[OrdersSelectAll] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[TagsSelectAll] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[UsersSelectAll] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[AuthorsSelect] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[AuthorsInsert] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[AuthorsUpdate] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[AuthorsDelete] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[Book_GenresSelect] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[Book_GenresInsert] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[Book_GenresUpdate] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[Book_GenresDelete] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[Book_TagsSelect] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[Book_TagsInsert] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[Book_TagsUpdate] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[Book_TagsDelete] TO [LibraryNotes_admin_Role];
GRANT EXECUTE ON [dbo].[BooksSelect] TO [LibraryNotes_admin_Role];


sp_addrolemember 'LibraryNotes_admin_Role', 'admin';


