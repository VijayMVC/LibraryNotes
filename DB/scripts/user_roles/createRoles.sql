use LibraryNotes;

DROP ROLE [LibraryNotes_user];

CREATE ROLE [LibraryNotes_user];

GRANT EXECUTE ON [dbo].[BooksSelectAll]  TO [LibraryNotes_user];
GRANT EXECUTE ON [dbo].[AuthorsSelectAll]  TO [LibraryNotes_user];
GRANT EXECUTE ON [dbo].[TagsSelectAll]  TO [LibraryNotes_user];
GRANT EXECUTE ON [dbo].[GenresSelectAll]  TO [LibraryNotes_user];
GRANT EXECUTE ON [dbo].[OrdersSelectAll]  TO [LibraryNotes_user];


GRANT EXECUTE ON [dbo].[BooksSelect]  TO [LibraryNotes_user];
GRANT EXECUTE ON [dbo].[AuthorsSelect]  TO [LibraryNotes_user];
GRANT EXECUTE ON [dbo].[TagsSelect]  TO [LibraryNotes_user];
GRANT EXECUTE ON [dbo].[GenresSelect]  TO [LibraryNotes_user];
GRANT EXECUTE ON [dbo].[OrdersSelect]  TO [LibraryNotes_user];

GRANT EXECUTE ON [dbo].[OrdersInsert]  TO [LibraryNotes_user];

GRANT EXECUTE ON [dbo].[UsersUpdate]  TO [LibraryNotes_user];


GRANT EXECUTE ON [dbo].[selectBooksByAuthors]  TO [LibraryNotes_user];
GRANT EXECUTE ON [dbo].[selectAuthorsAndBooks]  TO [LibraryNotes_user];
GRANT EXECUTE ON [dbo].[selectAuthorsAndBooksId]  TO [LibraryNotes_user];
GRANT EXECUTE ON [dbo].[selectBooksByGenre]  TO [LibraryNotes_user];
GRANT EXECUTE ON [dbo].[selectBooksByTag]  TO [LibraryNotes_user];
GRANT EXECUTE ON [dbo].[selectGenresByBook]  TO [LibraryNotes_user];
GRANT EXECUTE ON [dbo].[selectSimilarBooksByTags]  TO [LibraryNotes_user];
GRANT EXECUTE ON [dbo].[selectTagsByBook]  TO [LibraryNotes_user];
GRANT EXECUTE ON [dbo].[selectTopPopularGenres]  TO [LibraryNotes_user];
go


sp_addrolemember 'LibraryNotes_user', 'user';  

GRANT EXECUTE ON SCHEMA::[dbo] TO [admin]

