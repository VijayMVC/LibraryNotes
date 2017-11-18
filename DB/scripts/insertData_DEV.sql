use LibraryNotes;

delete from [Orders];
delete from [Book_Genres];
delete from [Books];
delete from [Users];
delete from [Authors];
delete from [Genres];

DBCC CHECKIDENT ('[Orders]', RESEED, 0);				--обнуление всех Identity
DBCC CHECKIDENT ('[Book_Genres]', RESEED, 0);
DBCC CHECKIDENT ('[Books]', RESEED, 0);
DBCC CHECKIDENT ('[Users]', RESEED, 0);
DBCC CHECKIDENT ('[Authors]', RESEED, 0);
DBCC CHECKIDENT ('[Genres]', RESEED, 0);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Users
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
exec dbo.UsersInsert 'user1', '6ff99740dca09d027c4ff58396b0d06c', 'Sheelagh Saunton', '00 Meadow Ridge Parkway', 'Male', '+86 775 607-4927';
exec dbo.UsersInsert 'user2', '4fd4ffab1716cd5d43356452a8dcaadd', 'Clare Bentzen', '3 Commercial Lane', 'Male', '+33 982 508-5896';
exec dbo.UsersInsert 'user3', 'f26c0d44a1371fa083d82a024c51cc7b', 'Willy Sells', '047 Nancy Circle', 'Male', '+55 295 653-6644';
exec dbo.UsersInsert 'user4', 'be1583f52f4fae02ce241177835f9289', 'Merridie Dunan', '7 Pleasure Way', 'Male', '+62 304 827-9565';
exec dbo.UsersInsert 'user5', '7163bbbb90281071d59289fe999d33de', 'Ave Langsbury', '23672 Coleman Park', 'Male', '+351 527 321-4831';



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Authors
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
exec dbo.AuthorsInsert 'Styrbjörn', 'Felstead', '1956-01-29', null;
exec dbo.AuthorsInsert 'Méng', 'Southworth',	'1973-08-09','2013-09-05';
exec dbo.AuthorsInsert 'Yè', 'Kerford', '1939-06-25', '1979-04-06';
exec dbo.AuthorsInsert 'Åke', 'Bloodworth', '1981-08-13',null;
exec dbo.AuthorsInsert 'Célia', 'Lansley', '1939-12-20','1996-01-06';
exec dbo.AuthorsInsert 'Yè', 'Domokos', '1976-08-11', null;
exec dbo.AuthorsInsert 'Estève', 'Ahmed', '1968-09-17', null;
exec dbo.AuthorsInsert 'Inès', 'Mallia', '1965-08-14', '2003-06-19';
exec dbo.AuthorsInsert 'Françoise', 'Wipper', '1919-04-02', '1985-09-11';
exec dbo.AuthorsInsert 'Mén', 'Seeley', '1969-03-18', '2005-10-06';
exec dbo.AuthorsInsert 'Marie-françoise', 'Gumme', '1977-02-01', null;
exec dbo.AuthorsInsert 'Anaïs', 'Zammett', '1913-01-03', '1966-06-26';
exec dbo.AuthorsInsert 'Åsa', 'Seakings', '1920-04-05','1958-04-07';
exec dbo.AuthorsInsert 'Örjan', 'Dykins', '1981-09-29', null;
exec dbo.AuthorsInsert 'Anaël', 'Gallamore', '1946-01-27', '2002-05-27';
exec dbo.AuthorsInsert 'Léa', 'Dank', '1976-11-25', null;
exec dbo.AuthorsInsert 'Bécassine', 'Aughtie', '1916-10-07', '1965-11-12';
exec dbo.AuthorsInsert 'Méline', 'Press', '1998-02-25', null;
exec dbo.AuthorsInsert 'Tán', 'Twycross', '1991-02-28', null;
exec dbo.AuthorsInsert 'Geneviève', 'Ackenhead', '1995-06-12',null;



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Genres
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
exec dbo.GenresInsert 'Romance', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.';
exec dbo.GenresInsert 'Documentary', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.
Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.
Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.';
exec dbo.GenresInsert 'Action', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.';
exec dbo.GenresInsert 'Comedy', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.
Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.
Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.';
exec dbo.GenresInsert 'Adventure', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.';
exec dbo.GenresInsert 'Thriller', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.';
exec dbo.GenresInsert 'Drama', 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.';
exec dbo.GenresInsert 'Crime', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.
Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur c
onvallis.'
exec dbo.GenresInsert 'Musical', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.
Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.';
exec dbo.GenresInsert 'Horror', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'
;
exec dbo.GenresInsert 'Animation', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.
Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.
Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.';
exec dbo.GenresInsert 'Children', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.';
exec dbo.GenresInsert 'Sci-Fi', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.
Fusce consequat. Nulla nisl. Nunc nisl.
Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.';
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Books
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
exec dbo.BooksInsert 'Lust for Gold', 2000, 5, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hend
rerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.';
exec dbo.BooksInsert 'Becky Sharp', 2010, 13, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, 5a. Sed accumsan felis. Ut at dolor quis odio consequat varius.';
exec dbo.BooksInsert 'Rosewood Lane', 1987, 11, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubili
a Curae; Duis faucibus accumsan odio. Curabitur convallis.';
exec dbo.BooksInsert 'Let the Fire Burn', 1996, 8, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie,
hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.';
exec dbo.BooksInsert 'Chitty Chitty Bang Bang', 1985, 6, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.';
exec dbo.BooksInsert 'Last Time I Saw Archie, The', 2011, 17, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis i
n faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.';
exec dbo.BooksInsert 'Chairman of the Board', 2010, 16, 'Praesent blandit. Nam 17a. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.';
exec dbo.BooksInsert 'Balloonatic, The', 2005, 13, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, solli
citudin ut, suscipit a, feugiat et, eros.';
exec dbo.BooksInsert 'Blood Creek (a.k.a. Town Creek)', 2000, 19, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultri
ces posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.';
exec dbo.BooksInsert 'King Kelly', 1984, 11, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauri
s viverra diam vitae quam. Suspendisse potenti.';
exec dbo.BooksInsert 'To Catch a Thief', 1994, 15, 'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.';
exec dbo.BooksInsert '101 Dalmatians (One Hundred and One Dalmatians)', 2003, 11, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.';
exec dbo.BooksInsert 'Great Bank Hoax, The', 2012, 3, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.';
exec dbo.BooksInsert 'Wildest Dream, The', 2010, 5, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.';
exec dbo.BooksInsert 'Battle of the Year', 2008, 1, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.';
exec dbo.BooksInsert 'Bastards, The (Los bastardos)', 2000, 17, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.';
exec dbo.BooksInsert 'Vali', 1999, 18, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Al
iquam erat volutpat.';
exec dbo.BooksInsert 'Knightriders', 2006, 13, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Null
a dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.';
exec dbo.BooksInsert 'King Boxer: Five Fingers of Death (Tian xia di yi quan)', 2011, 19, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt i
n, leo. Maecenas pulvinar lobortis est.';
exec dbo.BooksInsert 'Glowing Stars', 1995, 2, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.';
exec dbo.BooksInsert 'Prospero''s Books', 1983, 19, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est con
gue elementum.';
exec dbo.BooksInsert 'Where''s Marlowe?', 1992, 14, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.';
exec dbo.BooksInsert 'New Jack City', 2005, 9, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.';
exec dbo.BooksInsert 'Stolen Collection, (Skradziona kolekcja)', 2010, 13, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh
ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.';
exec dbo.BooksInsert 'Belle comme la femme d''un autre', 1998, 19, 'Nam ultrices, libero non mattis pulvinar, 12a pede ullamcorper augue, a suscipit 2a elit ac 10a. Sed vel enim sit amet nunc viv
erra dapibus. Nulla suscipit ligula in lacus.';
exec dbo.BooksInsert 'Rescuers, The', 2005, 5, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel
 accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.';
exec dbo.BooksInsert 'Bucket List, The', 2011, 6, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere c
ubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.';
exec dbo.BooksInsert 'Morvern Callar', 2002, 13, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.';
exec dbo.BooksInsert 'Beerfest', 1993, 17, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.';
exec dbo.BooksInsert 'Prize, The', 2001, 9, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia
 Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.';
exec dbo.BooksInsert 'Broken Lullaby (a.k.a. The Man I Killed)', 2000, 20, 'Nam ultrices, libero non mattis pulvinar, 11a pede ullamcorper augue, a suscipit 17a elit ac 15a. Sed vel enim sit amet
 nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet 10a. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.';
exec dbo.BooksInsert 'Moulin Rouge', 2012, 12, 'Fusce consequat. Nulla nisl. Nunc nisl.';
exec dbo.BooksInsert 'Head Games', 1997, 19, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, 6a pede ullamcorper augue, a suscipit 16a elit ac 2a. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.';
exec dbo.BooksInsert 'Presidentintekijät', 2013, 15, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.';
exec dbo.BooksInsert 'Tiny Furniture', 2008, 18, 'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.';
exec dbo.BooksInsert 'Days and Nights in the Forest (Aranyer Din Ratri)', 1983, 16, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretiu
m nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.';
exec dbo.BooksInsert 'Lovers and Lollipops', 2011, 19, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sa
pien quis libero.';
exec dbo.BooksInsert 'Museum Hours', 2004, 2, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.';
exec dbo.BooksInsert 'Way... Way Out', 2004, 15, 'Fusce consequat. Nulla nisl. Nunc nisl.';
exec dbo.BooksInsert 'Auggie Rose (a.k.a. Beyond Suspicion)', 1997, 13, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.';
exec dbo.BooksInsert 'Iron Eagle', 1997, 19, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci l
uctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.';
exec dbo.BooksInsert 'We''re No Angels', 2010, 16, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam 13a. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.';
exec dbo.BooksInsert 'Paradise Now', 2001, 10, 'Praesent blandit. Nam 10a. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.';
exec dbo.BooksInsert 'See No Evil, Hear No Evil', 2012, 4, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.';
exec dbo.BooksInsert 'Scent of a Woman', 1993, 5, 'Praesent blandit. Nam 9a. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.';
exec dbo.BooksInsert 'Freeze Frame', 1998, 9, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.';
exec dbo.BooksInsert 'Poltergeist', 2009, 16, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.';
exec dbo.BooksInsert 'Taken', 1995, 5, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibu
s dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.';
exec dbo.BooksInsert 'I Think I Do', 1994, 18, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.';
exec dbo.BooksInsert 'Red Like the Sky (Rosso come il cielo)', 2000, 17, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices p
osuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.';



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Book_genres
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
exec [dbo].[Book_GenresInsert] 1, 7;
exec [dbo].[Book_GenresInsert] 1, 3;
exec [dbo].[Book_GenresInsert] 1, 9;
exec [dbo].[Book_GenresInsert] 2, 13;
exec [dbo].[Book_GenresInsert] 2, 6;
exec [dbo].[Book_GenresInsert] 3, 3;
exec [dbo].[Book_GenresInsert] 4, 3;
exec [dbo].[Book_GenresInsert] 5, 8;
exec [dbo].[Book_GenresInsert] 6, 7;
exec [dbo].[Book_GenresInsert] 7, 6;
exec [dbo].[Book_GenresInsert] 8, 2;
exec [dbo].[Book_GenresInsert] 8, 4;
exec [dbo].[Book_GenresInsert] 8, 9;
exec [dbo].[Book_GenresInsert] 9, 4;
exec [dbo].[Book_GenresInsert] 9, 7;
exec [dbo].[Book_GenresInsert] 10, 12;
exec [dbo].[Book_GenresInsert] 11, 5;
exec [dbo].[Book_GenresInsert] 12, 6;
exec [dbo].[Book_GenresInsert] 13, 11;
exec [dbo].[Book_GenresInsert] 14, 10;
exec [dbo].[Book_GenresInsert] 15, 13;
exec [dbo].[Book_GenresInsert] 16, 7;
exec [dbo].[Book_GenresInsert] 16, 10;
exec [dbo].[Book_GenresInsert] 16, 11;
exec [dbo].[Book_GenresInsert] 17, 8;
exec [dbo].[Book_GenresInsert] 17, 6;
exec [dbo].[Book_GenresInsert] 18, 5;
exec [dbo].[Book_GenresInsert] 19, 10;
exec [dbo].[Book_GenresInsert] 20, 9;
exec [dbo].[Book_GenresInsert] 20, 12;
exec [dbo].[Book_GenresInsert] 20, 11;
exec [dbo].[Book_GenresInsert] 20, 2;
exec [dbo].[Book_GenresInsert] 21, 9;
exec [dbo].[Book_GenresInsert] 22, 11;
exec [dbo].[Book_GenresInsert] 22, 2;
exec [dbo].[Book_GenresInsert] 22, 3;
exec [dbo].[Book_GenresInsert] 22, 9;
exec [dbo].[Book_GenresInsert] 22, 8;
exec [dbo].[Book_GenresInsert] 23, 11;
exec [dbo].[Book_GenresInsert] 23, 7;
exec [dbo].[Book_GenresInsert] 23, 6;
exec [dbo].[Book_GenresInsert] 23, 5;
exec [dbo].[Book_GenresInsert] 24, 5;
exec [dbo].[Book_GenresInsert] 25, 9;
exec [dbo].[Book_GenresInsert] 25, 11;
exec [dbo].[Book_GenresInsert] 25, 13;
exec [dbo].[Book_GenresInsert] 26, 3;
exec [dbo].[Book_GenresInsert] 26, 2;
exec [dbo].[Book_GenresInsert] 26, 4;
exec [dbo].[Book_GenresInsert] 27, 13;
exec [dbo].[Book_GenresInsert] 27, 2;
exec [dbo].[Book_GenresInsert] 28, 8;
exec [dbo].[Book_GenresInsert] 29, 3;
exec [dbo].[Book_GenresInsert] 30, 7;
exec [dbo].[Book_GenresInsert] 31, 6;
exec [dbo].[Book_GenresInsert] 32, 7;
exec [dbo].[Book_GenresInsert] 33, 13;
exec [dbo].[Book_GenresInsert] 34, 9;
exec [dbo].[Book_GenresInsert] 35, 9;
exec [dbo].[Book_GenresInsert] 36, 6;
exec [dbo].[Book_GenresInsert] 36, 9;
exec [dbo].[Book_GenresInsert] 36, 13;
exec [dbo].[Book_GenresInsert] 37, 10;
exec [dbo].[Book_GenresInsert] 37, 7;
exec [dbo].[Book_GenresInsert] 37, 6;
exec [dbo].[Book_GenresInsert] 37, 4;
exec [dbo].[Book_GenresInsert] 38, 9;
exec [dbo].[Book_GenresInsert] 39, 8;
exec [dbo].[Book_GenresInsert] 39, 9;
exec [dbo].[Book_GenresInsert] 39, 6;
exec [dbo].[Book_GenresInsert] 39, 10;
exec [dbo].[Book_GenresInsert] 39, 7;
exec [dbo].[Book_GenresInsert] 40, 9;
exec [dbo].[Book_GenresInsert] 41, 5;
exec [dbo].[Book_GenresInsert] 42, 12;
exec [dbo].[Book_GenresInsert] 42, 2;
exec [dbo].[Book_GenresInsert] 42, 5;
exec [dbo].[Book_GenresInsert] 43, 6;
exec [dbo].[Book_GenresInsert] 44, 8;
exec [dbo].[Book_GenresInsert] 45, 11;
exec [dbo].[Book_GenresInsert] 45, 4;
exec [dbo].[Book_GenresInsert] 46, 8;
exec [dbo].[Book_GenresInsert] 47, 13;
exec [dbo].[Book_GenresInsert] 47, 10;
exec [dbo].[Book_GenresInsert] 47, 2;
exec [dbo].[Book_GenresInsert] 47, 3;
exec [dbo].[Book_GenresInsert] 48, 10;
exec [dbo].[Book_GenresInsert] 48, 12;
exec [dbo].[Book_GenresInsert] 49, 3;
exec [dbo].[Book_GenresInsert] 50, 8;




---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Orders
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
exec dbo.OrdersInsert 20, 2, '2015-05-05', 225;
exec dbo.OrdersInsert 15, 4, '2013-05-25', 222;
exec dbo.OrdersInsert 26, 2, '2013-03-20', 142;
exec dbo.OrdersInsert 45, 2, '2013-04-14', 182;
exec dbo.OrdersInsert 12, 1, '2016-12-28', 84;
exec dbo.OrdersInsert 41, 4, '2016-02-20', 103;
exec dbo.OrdersInsert 19, 1, '2016-06-05', 19;
exec dbo.OrdersInsert 18, 5, '2017-01-31', 29;
exec dbo.OrdersInsert 16, 3, '2013-01-11', 148;
exec dbo.OrdersInsert 42, 4, '2013-11-13', 196;
exec dbo.OrdersInsert 36, 4, '2017-04-08', 76;
exec dbo.OrdersInsert 47, 1, '2016-01-03', 30;
exec dbo.OrdersInsert 33, 5, '2015-01-22', 254;
exec dbo.OrdersInsert 3, 1, '2015-02-03', 249;
exec dbo.OrdersInsert 25, 1, '2017-04-17', 178;
exec dbo.OrdersInsert 5, 3, '2014-06-17', 249;
exec dbo.OrdersInsert 21, 5, '2013-03-21', 163;
exec dbo.OrdersInsert 31, 3, '2014-11-13', 18;
exec dbo.OrdersInsert 21, 4, '2017-04-14', 185;
exec dbo.OrdersInsert 15, 4, '2015-12-03', 249;
exec dbo.OrdersInsert 12, 5, '2017-10-21', 213;
exec dbo.OrdersInsert 18, 4, '2014-04-03', 87;
exec dbo.OrdersInsert 19, 5, '2013-11-27', 107;
exec dbo.OrdersInsert 45, 4, '2015-08-31', 139;
exec dbo.OrdersInsert 49, 3, '2013-08-21', 174;
exec dbo.OrdersInsert 47, 3, '2012-12-03', 185;
exec dbo.OrdersInsert 40, 4, '2016-12-15', 240;
exec dbo.OrdersInsert 28, 3, '2013-07-30', 89;
exec dbo.OrdersInsert 43, 5, '2016-07-03', 88;
exec dbo.OrdersInsert 48, 2, '2014-06-30', 97;
exec dbo.OrdersInsert 26, 2, '2017-07-23', 215;
exec dbo.OrdersInsert 6, 5, '2013-12-21', 66;
exec dbo.OrdersInsert 38, 2, '2016-10-17', 131;
exec dbo.OrdersInsert 7, 2, '2014-03-18', 7;
exec dbo.OrdersInsert 12, 5, '2013-03-10', 220;
exec dbo.OrdersInsert 27, 3, '2013-01-19', 168;
exec dbo.OrdersInsert 15, 5, '2017-08-22', 152;
exec dbo.OrdersInsert 2, 2, '2016-04-05', 16;
exec dbo.OrdersInsert 32, 3, '2015-12-17', 92;
exec dbo.OrdersInsert 32, 5, '2013-02-07', 136;
exec dbo.OrdersInsert 26, 3, '2013-12-14', 223;
exec dbo.OrdersInsert 11, 2, '2015-07-13', 121;
exec dbo.OrdersInsert 47, 5, '2015-10-18', 180;
exec dbo.OrdersInsert 50, 5, '2013-02-15', 51;
exec dbo.OrdersInsert 3, 1, '2014-11-29', 196;
exec dbo.OrdersInsert 11, 1, '2013-07-14', 212;
exec dbo.OrdersInsert 49, 5, '2012-12-07', 9;
exec dbo.OrdersInsert 50, 5, '2013-07-30', 252;
exec dbo.OrdersInsert 47, 5, '2014-06-30', 5;
exec dbo.OrdersInsert 42, 1, '2016-01-29', 252;



select  * from genres;

select * from books;

select * from book_genres;

select * from users;

select * from authors;

select * from orders;


select name, year, [First_Name] from authors a join books b on a.id = b.Author_Id order by author_id; --получить книги и их авторов

SELECT b.id, name, genre
FROM Books as b
INNER JOIN Book_Genres as bg
    ON b.id = bg.Book_Id
INNER JOIN genres as g
    ON g.id = bg.Genre_Id
WHERE genre = 'Thriller'	--получить книги по жанру

SELECT u.name, b.name
FROM Books as b
INNER JOIN orders as o
    ON b.id = o.Book_Id
INNER JOIN users as u
    ON u.id = o.User_Id
