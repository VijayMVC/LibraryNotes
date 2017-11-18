use LibraryNotes;
GO

delete from [Orders];
delete from [Book_Genres];
delete from [Books];
delete from [Users];
delete from [Authors];
delete from [Genres];

--Users
exec dbo.UsersInsert 'user1', '6ff99740dca09d027c4ff58396b0d06c', 'Sheelagh Saunton', '00 Meadow Ridge Parkway', 'Male', '+86 775 607-4927';
exec dbo.UsersInsert 'user2', '4fd4ffab1716cd5d43356452a8dcaadd', 'Clare Bentzen', '3 Commercial Lane', 'Male', '+33 982 508-5896';
exec dbo.UsersInsert 'user3', 'f26c0d44a1371fa083d82a024c51cc7b', 'Willy Sells', '047 Nancy Circle', 'Male', '+55 295 653-6644';
exec dbo.UsersInsert 'user4', 'be1583f52f4fae02ce241177835f9289', 'Merridie Dunan', '7 Pleasure Way', 'Male', '+62 304 827-9565';
exec dbo.UsersInsert 'user5', '7163bbbb90281071d59289fe999d33de', 'Ave Langsbury', '23672 Coleman Park', 'Male', '+351 527 321-4831';



--Authors
exec dbo.AuthorsInsert 'Styrbjörn', 'Felstead', '1956-01-29 23:08:40', '2014-11-22 23:08:40';
exec dbo.AuthorsInsert 'Méng', 'Southworth', '1973-08-09 00:09:10','2013-09-05 00:09:10';
exec dbo.AuthorsInsert 'Yè', 'Kerford', '1939-06-25 12:08:35', '1979-04-06 12:08:35';
exec dbo.AuthorsInsert 'Åke', 'Bloodworth', '1981-08-13 19:37:11','2014-05-25 19:37:11';
exec dbo.AuthorsInsert 'Célia', 'Lansley', '1939-12-20 08:05:52','1996-01-06 08:05:52';
exec dbo.AuthorsInsert 'Yè', 'Domokos', '1976-08-11 19:21:37', '2013-10-05 19:21:37';
exec dbo.AuthorsInsert 'Estève', 'Ahmed', '1968-09-17 17:07:19', '2005-03-05 17:07:19';
exec dbo.AuthorsInsert 'Inès', 'Mallia', '1965-08-14 20:26:31', '2003-06-19 20:26:31';
exec dbo.AuthorsInsert 'Françoise', 'Wipper', '1919-04-02 05:10:18', '1985-09-11 05:10:18';
exec dbo.AuthorsInsert 'Mén', 'Seeley', '1969-03-18 04:48:44', '2005-10-06 04:48:44';
exec dbo.AuthorsInsert 'Marie-françoise', 'Gumme', '1977-02-01 04:11:11', '2008-09-12 04:11:11';
exec dbo.AuthorsInsert 'Anaïs', 'Zammett', '1913-01-03 04:02:19', '1966-06-26 04:02:19';
exec dbo.AuthorsInsert 'Åsa', 'Seakings', '1920-04-05 03:48:26','1958-04-07 03:48:26';
exec dbo.AuthorsInsert 'Örjan', 'Dykins', '1981-09-29 14:22:44', '2017-05-30 14:22:44';
exec dbo.AuthorsInsert 'Anaël', 'Gallamore', '1946-01-27 13:13:05', '2002-05-27 13:13:05';
exec dbo.AuthorsInsert 'Léa', 'Dank', '1976-11-25 13:10:12', '2022-10-01 13:10:12';
exec dbo.AuthorsInsert 'Bécassine', 'Aughtie', '1916-10-07 18:05:01', '1965-11-12 18:05:01';
exec dbo.AuthorsInsert 'Méline', 'Press', '1998-02-25 07:35:06', '2034-01-14 07:35:06';
exec dbo.AuthorsInsert 'Tán', 'Twycross', '1991-02-28 12:08:17', '2047-08-07 12:08:17';
exec dbo.AuthorsInsert 'Geneviève', 'Ackenhead', '1995-06-12 06:57:22', '2039-06-27 06:57:22';

select * from Authors;

--Genres
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



--Books
exec dbo.BooksInsert 'Lust for Gold', 2000, 19, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hen
drerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.';
exec dbo.BooksInsert 'Becky Sharp', 2010, 18, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, 12a. Sed accumsan felis. Ut at dolor quis odio consequat varius.';
exec dbo.BooksInsert 'Rosewood Lane', 1987, 2, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia
 Curae; Duis faucibus accumsan odio. Curabitur convallis.';
exec dbo.BooksInsert 'Let the Fire Burn', 1996, 5, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie,
hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.';
exec dbo.BooksInsert 'Chitty Chitty Bang Bang', 1985, 9, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.';
exec dbo.BooksInsert 'Last Time I Saw Archie, The', 2011, 20, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis i
n faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.';
exec dbo.BooksInsert 'Chairman of the Board', 2010, 15, 'Praesent blandit. Nam 13a. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.';
exec dbo.BooksInsert 'Balloonatic, The', 2005, 14, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, solli
citudin ut, suscipit a, feugiat et, eros.';
exec dbo.BooksInsert 'Blood Creek (a.k.a. Town Creek)', 2000, 11, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultri
ces posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.';
exec dbo.BooksInsert 'King Kelly', 1984, 11, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauri
s viverra diam vitae quam. Suspendisse potenti.';
exec dbo.BooksInsert 'To Catch a Thief', 1994, 17, 'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.';
exec dbo.BooksInsert '101 Dalmatians (One Hundred and One Dalmatians)', 2003, 7, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.';
exec dbo.BooksInsert 'Great Bank Hoax, The', 2012, 3, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.';
exec dbo.BooksInsert 'Wildest Dream, The', 2010, 15, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.';
exec dbo.BooksInsert 'Battle of the Year', 2008, 14, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.';
exec dbo.BooksInsert 'Bastards, The (Los bastardos)', 2000, 2, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.';
exec dbo.BooksInsert 'Vali', 1999, 19, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Al
iquam erat volutpat.';
exec dbo.BooksInsert 'Knightriders', 2006, 8, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla
 dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.';
exec dbo.BooksInsert 'King Boxer: Five Fingers of Death (Tian xia di yi quan)', 2011, 12, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt i
n, leo. Maecenas pulvinar lobortis est.';
exec dbo.BooksInsert 'Glowing Stars', 1995, 5, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.';
exec dbo.BooksInsert 'Prospero''s Books', 1983, 3, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est cong
ue elementum.';
exec dbo.BooksInsert 'Where''s Marlowe?', 1992, 5, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.';
exec dbo.BooksInsert 'New Jack City', 2005, 5, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.';
exec dbo.BooksInsert 'Stolen Collection, (Skradziona kolekcja)', 2010, 11, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh
ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.';
exec dbo.BooksInsert 'Belle comme la femme d''un autre', 1998, 4, 'Nam ultrices, libero non mattis pulvinar, 6a pede ullamcorper augue, a suscipit 3a elit ac 3a. Sed vel enim sit amet nunc viverr
a dapibus. Nulla suscipit ligula in lacus.';
exec dbo.BooksInsert 'Rescuers, The', 2005, 5, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel
 accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.';
exec dbo.BooksInsert 'Bucket List, The', 2011, 15, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere
cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.';
exec dbo.BooksInsert 'Morvern Callar', 2002, 5, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.';
exec dbo.BooksInsert 'Beerfest', 1993, 1, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.';
exec dbo.BooksInsert 'Prize, The', 2001, 18, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubili
a Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.';
exec dbo.BooksInsert 'Broken Lullaby (a.k.a. The Man I Killed)', 2000, 10, 'Nam ultrices, libero non mattis pulvinar, 18a pede ullamcorper augue, a suscipit 14a elit ac 6a. Sed vel enim sit amet
nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet 5a. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.';
exec dbo.BooksInsert 'Moulin Rouge', 2012, 19, 'Fusce consequat. Nulla nisl. Nunc nisl.';
exec dbo.BooksInsert 'Head Games', 1997, 3, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, 18a pede ullamcorper augue, a suscipit 13a elit ac 3a. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.';
exec dbo.BooksInsert 'Presidentintekijät', 2013, 6, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.';
exec dbo.BooksInsert 'Tiny Furniture', 2008, 8, 'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.';
exec dbo.BooksInsert 'Days and Nights in the Forest (Aranyer Din Ratri)', 1983, 19, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretiu
m nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.';
exec dbo.BooksInsert 'Lovers and Lollipops', 2011, 3, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sa
pien quis libero.';
exec dbo.BooksInsert 'Museum Hours', 2004, 14, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.';
exec dbo.BooksInsert 'Way... Way Out', 2004, 20, 'Fusce consequat. Nulla nisl. Nunc nisl.';
exec dbo.BooksInsert 'Auggie Rose (a.k.a. Beyond Suspicion)', 1997, 11, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.';
exec dbo.BooksInsert 'Iron Eagle', 1997, 10, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci l
uctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.';
exec dbo.BooksInsert 'We''re No Angels', 2010, 7, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam 9a. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.';
exec dbo.BooksInsert 'Paradise Now', 2001, 12, 'Praesent blandit. Nam 2a. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.';
exec dbo.BooksInsert 'See No Evil, Hear No Evil', 2012, 3, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.';
exec dbo.BooksInsert 'Scent of a Woman', 1993, 18, 'Praesent blandit. Nam 8a. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.';
exec dbo.BooksInsert 'Freeze Frame', 1998, 3, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.';
exec dbo.BooksInsert 'Poltergeist', 2009, 11, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.';
exec dbo.BooksInsert 'Taken', 1995, 6, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibu
s dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.';
exec dbo.BooksInsert 'I Think I Do', 1994, 16, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.';
exec dbo.BooksInsert 'Red Like the Sky (Rosso come il cielo)', 2000, 11, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices p
osuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.';

--BooksGenres
exec [dbo].[Book_GenresInsert] 2, 3;
exec [dbo].[Book_GenresInsert] 2, 13;
exec [dbo].[Book_GenresInsert] 3, 12;
exec [dbo].[Book_GenresInsert] 4, 7;
exec [dbo].[Book_GenresInsert] 5, 9;
exec [dbo].[Book_GenresInsert] 5, 4;
exec [dbo].[Book_GenresInsert] 5, 11;
exec [dbo].[Book_GenresInsert] 6, 9;
exec [dbo].[Book_GenresInsert] 6, 2;
exec [dbo].[Book_GenresInsert] 6, 13;
exec [dbo].[Book_GenresInsert] 7, 8;
exec [dbo].[Book_GenresInsert] 7, 3;
exec [dbo].[Book_GenresInsert] 7, 11;
exec [dbo].[Book_GenresInsert] 7, 12;
exec [dbo].[Book_GenresInsert] 7, 10;
exec [dbo].[Book_GenresInsert] 7, 13;
exec [dbo].[Book_GenresInsert] 7, 12;
exec [dbo].[Book_GenresInsert] 7, 7;
exec [dbo].[Book_GenresInsert] 7, 5;
exec [dbo].[Book_GenresInsert] 7, 9;
exec [dbo].[Book_GenresInsert] 8, 10;
exec [dbo].[Book_GenresInsert] 8, 8;
exec [dbo].[Book_GenresInsert] 8, 8;
exec [dbo].[Book_GenresInsert] 9, 4;
exec [dbo].[Book_GenresInsert] 9, 12;
exec [dbo].[Book_GenresInsert] 10, 3;
exec [dbo].[Book_GenresInsert] 10, 3;
exec [dbo].[Book_GenresInsert] 11, 5;
exec [dbo].[Book_GenresInsert] 12, 7;
exec [dbo].[Book_GenresInsert] 12, 10;
exec [dbo].[Book_GenresInsert] 12, 4;
exec [dbo].[Book_GenresInsert] 13, 7;
exec [dbo].[Book_GenresInsert] 14, 14;
exec [dbo].[Book_GenresInsert] 15, 11;
exec [dbo].[Book_GenresInsert] 15, 10;
exec [dbo].[Book_GenresInsert] 16, 13;
exec [dbo].[Book_GenresInsert] 16, 9;
exec [dbo].[Book_GenresInsert] 17, 3;
exec [dbo].[Book_GenresInsert] 18, 6;
exec [dbo].[Book_GenresInsert] 19, 5;
exec [dbo].[Book_GenresInsert] 20, 5;
exec [dbo].[Book_GenresInsert] 21, 6;
exec [dbo].[Book_GenresInsert] 22, 14;
exec [dbo].[Book_GenresInsert] 22, 8;
exec [dbo].[Book_GenresInsert] 22, 13;
exec [dbo].[Book_GenresInsert] 23, 8;
exec [dbo].[Book_GenresInsert] 24, 14;
exec [dbo].[Book_GenresInsert] 24, 6;
exec [dbo].[Book_GenresInsert] 24, 4;
exec [dbo].[Book_GenresInsert] 24, 5;
exec [dbo].[Book_GenresInsert] 24, 13;
exec [dbo].[Book_GenresInsert] 24, 8;
exec [dbo].[Book_GenresInsert] 25, 8;
exec [dbo].[Book_GenresInsert] 25, 8;
exec [dbo].[Book_GenresInsert] 25, 8;
exec [dbo].[Book_GenresInsert] 25, 3;
exec [dbo].[Book_GenresInsert] 25, 4;
exec [dbo].[Book_GenresInsert] 26, 12;
exec [dbo].[Book_GenresInsert] 26, 9;
exec [dbo].[Book_GenresInsert] 26, 4;
exec [dbo].[Book_GenresInsert] 26, 7;
exec [dbo].[Book_GenresInsert] 27, 5;
exec [dbo].[Book_GenresInsert] 28, 3;
exec [dbo].[Book_GenresInsert] 29, 7;
exec [dbo].[Book_GenresInsert] 29, 6;
exec [dbo].[Book_GenresInsert] 29, 2;
exec [dbo].[Book_GenresInsert] 29, 12;
exec [dbo].[Book_GenresInsert] 30, 6;
exec [dbo].[Book_GenresInsert] 30, 6;
exec [dbo].[Book_GenresInsert] 30, 11;
exec [dbo].[Book_GenresInsert] 31, 10;
exec [dbo].[Book_GenresInsert] 31, 13;
exec [dbo].[Book_GenresInsert] 32, 12;
exec [dbo].[Book_GenresInsert] 32, 13;
exec [dbo].[Book_GenresInsert] 32, 2;
exec [dbo].[Book_GenresInsert] 32, 6;
exec [dbo].[Book_GenresInsert] 33, 3;
exec [dbo].[Book_GenresInsert] 34, 9;
exec [dbo].[Book_GenresInsert] 35, 12;
exec [dbo].[Book_GenresInsert] 35, 12;
exec [dbo].[Book_GenresInsert] 36, 11;
exec [dbo].[Book_GenresInsert] 36, 4;
exec [dbo].[Book_GenresInsert] 37, 9;
exec [dbo].[Book_GenresInsert] 37, 7;
exec [dbo].[Book_GenresInsert] 37, 12;
exec [dbo].[Book_GenresInsert] 37, 7;
exec [dbo].[Book_GenresInsert] 38, 10;
exec [dbo].[Book_GenresInsert] 38, 2;
exec [dbo].[Book_GenresInsert] 38, 2;
exec [dbo].[Book_GenresInsert] 39, 8;
exec [dbo].[Book_GenresInsert] 40, 6;
exec [dbo].[Book_GenresInsert] 40, 12;
exec [dbo].[Book_GenresInsert] 41, 11;
exec [dbo].[Book_GenresInsert] 42, 10;
exec [dbo].[Book_GenresInsert] 42, 2;
exec [dbo].[Book_GenresInsert] 42, 4;
exec [dbo].[Book_GenresInsert] 42, 4;
exec [dbo].[Book_GenresInsert] 42, 8;
exec [dbo].[Book_GenresInsert] 43, 5;
exec [dbo].[Book_GenresInsert] 43, 12;
exec [dbo].[Book_GenresInsert] 43, 11;
exec [dbo].[Book_GenresInsert] 43, 3;
exec [dbo].[Book_GenresInsert] 44, 12;
exec [dbo].[Book_GenresInsert] 44, 10;
exec [dbo].[Book_GenresInsert] 44, 14;
exec [dbo].[Book_GenresInsert] 45, 9;
exec [dbo].[Book_GenresInsert] 45, 5;
exec [dbo].[Book_GenresInsert] 46, 2;
exec [dbo].[Book_GenresInsert] 46, 4;
exec [dbo].[Book_GenresInsert] 46, 6;
exec [dbo].[Book_GenresInsert] 47, 11;
exec [dbo].[Book_GenresInsert] 47, 6;
exec [dbo].[Book_GenresInsert] 47, 5;
exec [dbo].[Book_GenresInsert] 47, 6;
exec [dbo].[Book_GenresInsert] 48, 5;
exec [dbo].[Book_GenresInsert] 49, 13;
exec [dbo].[Book_GenresInsert] 50, 8;
exec [dbo].[Book_GenresInsert] 51, 12;
	INSERT INTO [dbo].[Book_Genres]  values (5, 5)
	

select name, year, [First_Name] from authors a join books b on a.id = b.Author_Id order by author_id;

select * from Genres;

select * from Books;

select * from authors;

select * from book_genres;