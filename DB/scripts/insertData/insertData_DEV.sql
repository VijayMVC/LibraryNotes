use LibraryNotes;

delete from [Orders];
delete from [Book_Genres];
delete from [Book_Tags];
delete from [Tags];
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
DBCC CHECKIDENT ('[Book_Tags]', RESEED, 0);
DBCC CHECKIDENT ('[Tags]', RESEED, 0);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Users
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
exec dbo.UsersInsert 'admin', 'admin', 'Sheelagh Saunton', '00 Meadow Ridge Parkway', 'Male', '+86 775 607-4927', 2;

exec dbo.UsersInsert 'user1', '6ff99740dca09d027c4ff58396b0d06c', 'Sheelagh Saunton', '00 Meadow Ridge Parkway', 'Male', '+86 775 607-4927',1;
exec dbo.UsersInsert 'user2', '4fd4ffab1716cd5d43356452a8dcaadd', 'Clare Bentzen', '3 Commercial Lane', 'Male', '+33 982 508-5896',1;
exec dbo.UsersInsert 'user3', 'f26c0d44a1371fa083d82a024c51cc7b', 'Willy Sells', '047 Nancy Circle', 'Male', '+55 295 653-6644',1;
exec dbo.UsersInsert 'user4', 'be1583f52f4fae02ce241177835f9289', 'Merridie Dunan', '7 Pleasure Way', 'Male', '+62 304 827-9565',1;
exec dbo.UsersInsert 'user5', '7163bbbb90281071d59289fe999d33de', 'Ave Langsbury', '23672 Coleman Park', 'Male', '+351 527 321-4831',1;
exec dbo.UsersInsert '1', '1', 'Ave Langsbury', '23672 Coleman Park', 'Male', '+351 527 321-4831',1;



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Authors
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
exec dbo.AuthorsInsert 'Styrbjorn', 'Felstead', '1956-01-29', null;
exec dbo.AuthorsInsert 'Meng', 'Southworth',	'1973-08-09','2013-09-05';
exec dbo.AuthorsInsert 'Ye', 'Kerford', '1939-06-25', '1979-04-06';
exec dbo.AuthorsInsert 'Ake', 'Bloodworth', '1981-08-13',null;
exec dbo.AuthorsInsert 'Celia', 'Lansley', '1939-12-20','1996-01-06';
exec dbo.AuthorsInsert 'Ye', 'Domokos', '1976-08-11', null;
exec dbo.AuthorsInsert 'Esteve', 'Ahmed', '1968-09-17', null;
exec dbo.AuthorsInsert 'Ines', 'Mallia', '1965-08-14', '2003-06-19';
exec dbo.AuthorsInsert 'Francoise', 'Wipper', '1919-04-02', '1985-09-11';
exec dbo.AuthorsInsert 'Men', 'Seeley', '1969-03-18', '2005-10-06';
exec dbo.AuthorsInsert 'Marie', 'Gumme', '1977-02-01', null;
exec dbo.AuthorsInsert 'Anais', 'Zammett', '1913-01-03', '1966-06-26';
exec dbo.AuthorsInsert 'Asa', 'Seakings', '1920-04-05','1958-04-07';
exec dbo.AuthorsInsert 'Orjan', 'Dykins', '1981-09-29', null;
exec dbo.AuthorsInsert 'Anael', 'Gallamore', '1946-01-27', '2002-05-27';
exec dbo.AuthorsInsert 'Lea', 'Dank', '1976-11-25', null;
exec dbo.AuthorsInsert 'Becassine', 'Aughtie', '1916-10-07', '1965-11-12';
exec dbo.AuthorsInsert 'Meline', 'Press', '1998-02-25', null;
exec dbo.AuthorsInsert 'Tan', 'Twycross', '1991-02-28', null;
exec dbo.AuthorsInsert 'Genevieve', 'Ackenhead', '1995-06-12',null;




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
--Tags
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

exec dbo.TagsInsert 'accumsan';
exec dbo.TagsInsert 'integer';
exec dbo.TagsInsert 'ut';
exec dbo.TagsInsert 'congue';
exec dbo.TagsInsert 'mauris';
exec dbo.TagsInsert 'amet';
exec dbo.TagsInsert 'nibh';
exec dbo.TagsInsert 'dignissim';
exec dbo.TagsInsert 'nisl';
exec dbo.TagsInsert 'purus';
exec dbo.TagsInsert 'pellentesque';
exec dbo.TagsInsert 'tempor';
exec dbo.TagsInsert 'eleifend';
exec dbo.TagsInsert 'orci';
exec dbo.TagsInsert 'curabitur';
exec dbo.TagsInsert 'iaculis';
exec dbo.TagsInsert 'vel';
exec dbo.TagsInsert 'cubilia';
exec dbo.TagsInsert 'id';
exec dbo.TagsInsert 'venenatis';
exec dbo.TagsInsert 'pede';
exec dbo.TagsInsert 'nulla';
exec dbo.TagsInsert 'primis';
exec dbo.TagsInsert 'consequat';
exec dbo.TagsInsert 'leo';



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Book_Tags
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
exec [dbo].[Book_TagsInsert] 1, 16;
exec [dbo].[Book_TagsInsert] 1, 13;
exec [dbo].[Book_TagsInsert] 1, 21;
exec [dbo].[Book_TagsInsert] 2, 10;
exec [dbo].[Book_TagsInsert] 2, 20;
exec [dbo].[Book_TagsInsert] 2, 12;
exec [dbo].[Book_TagsInsert] 3, 21;
exec [dbo].[Book_TagsInsert] 3, 4;
exec [dbo].[Book_TagsInsert] 3, 9;
exec [dbo].[Book_TagsInsert] 4, 21;
exec [dbo].[Book_TagsInsert] 4, 16;
exec [dbo].[Book_TagsInsert] 4, 20;
exec [dbo].[Book_TagsInsert] 5, 23;
exec [dbo].[Book_TagsInsert] 5, 9;
exec [dbo].[Book_TagsInsert] 5, 22;
exec [dbo].[Book_TagsInsert] 6, 10;
exec [dbo].[Book_TagsInsert] 6, 6;
exec [dbo].[Book_TagsInsert] 6, 7;
exec [dbo].[Book_TagsInsert] 7, 18;
exec [dbo].[Book_TagsInsert] 7, 13;
exec [dbo].[Book_TagsInsert] 7, 9;
exec [dbo].[Book_TagsInsert] 8, 22;
exec [dbo].[Book_TagsInsert] 8, 21;
exec [dbo].[Book_TagsInsert] 8, 14;
exec [dbo].[Book_TagsInsert] 9, 6;
exec [dbo].[Book_TagsInsert] 9, 17;
exec [dbo].[Book_TagsInsert] 9, 23;
exec [dbo].[Book_TagsInsert] 10, 5;
exec [dbo].[Book_TagsInsert] 10, 14;
exec [dbo].[Book_TagsInsert] 10, 15;
exec [dbo].[Book_TagsInsert] 11, 21;
exec [dbo].[Book_TagsInsert] 11, 6;
exec [dbo].[Book_TagsInsert] 11, 16;
exec [dbo].[Book_TagsInsert] 12, 23;
exec [dbo].[Book_TagsInsert] 12, 17;
exec [dbo].[Book_TagsInsert] 12, 9;
exec [dbo].[Book_TagsInsert] 13, 5;
exec [dbo].[Book_TagsInsert] 13, 3;
exec [dbo].[Book_TagsInsert] 13, 25;
exec [dbo].[Book_TagsInsert] 14, 4;
exec [dbo].[Book_TagsInsert] 14, 14;
exec [dbo].[Book_TagsInsert] 14, 22;
exec [dbo].[Book_TagsInsert] 15, 20;
exec [dbo].[Book_TagsInsert] 15, 21;
exec [dbo].[Book_TagsInsert] 15, 7;
exec [dbo].[Book_TagsInsert] 16, 24;
exec [dbo].[Book_TagsInsert] 16, 11;
exec [dbo].[Book_TagsInsert] 16, 14;
exec [dbo].[Book_TagsInsert] 17, 10;
exec [dbo].[Book_TagsInsert] 17, 3;
exec [dbo].[Book_TagsInsert] 17, 4;
exec [dbo].[Book_TagsInsert] 18, 14;
exec [dbo].[Book_TagsInsert] 18, 5;
exec [dbo].[Book_TagsInsert] 18, 19;
exec [dbo].[Book_TagsInsert] 19, 11;
exec [dbo].[Book_TagsInsert] 19, 25;
exec [dbo].[Book_TagsInsert] 19, 17;
exec [dbo].[Book_TagsInsert] 20, 14;
exec [dbo].[Book_TagsInsert] 20, 21;
exec [dbo].[Book_TagsInsert] 20, 5;
exec [dbo].[Book_TagsInsert] 21, 25;
exec [dbo].[Book_TagsInsert] 21, 16;
exec [dbo].[Book_TagsInsert] 21, 18;
exec [dbo].[Book_TagsInsert] 22, 2;
exec [dbo].[Book_TagsInsert] 22, 7;
exec [dbo].[Book_TagsInsert] 22, 6;
exec [dbo].[Book_TagsInsert] 23, 20;
exec [dbo].[Book_TagsInsert] 23, 25;
exec [dbo].[Book_TagsInsert] 23, 12;
exec [dbo].[Book_TagsInsert] 24, 21;
exec [dbo].[Book_TagsInsert] 24, 16;
exec [dbo].[Book_TagsInsert] 24, 6;
exec [dbo].[Book_TagsInsert] 25, 23;
exec [dbo].[Book_TagsInsert] 25, 5;
exec [dbo].[Book_TagsInsert] 25, 21;
exec [dbo].[Book_TagsInsert] 26, 20;
exec [dbo].[Book_TagsInsert] 26, 25;
exec [dbo].[Book_TagsInsert] 26, 14;
exec [dbo].[Book_TagsInsert] 27, 9;
exec [dbo].[Book_TagsInsert] 27, 15;
exec [dbo].[Book_TagsInsert] 27, 19;
exec [dbo].[Book_TagsInsert] 28, 16;
exec [dbo].[Book_TagsInsert] 28, 5;
exec [dbo].[Book_TagsInsert] 28, 19;
exec [dbo].[Book_TagsInsert] 29, 13;
exec [dbo].[Book_TagsInsert] 29, 8;
exec [dbo].[Book_TagsInsert] 29, 5;
exec [dbo].[Book_TagsInsert] 30, 18;
exec [dbo].[Book_TagsInsert] 30, 14;
exec [dbo].[Book_TagsInsert] 30, 24;
exec [dbo].[Book_TagsInsert] 31, 6;
exec [dbo].[Book_TagsInsert] 31, 4;
exec [dbo].[Book_TagsInsert] 31, 7;
exec [dbo].[Book_TagsInsert] 32, 19;
exec [dbo].[Book_TagsInsert] 32, 18;
exec [dbo].[Book_TagsInsert] 32, 10;
exec [dbo].[Book_TagsInsert] 33, 17;
exec [dbo].[Book_TagsInsert] 33, 12;
exec [dbo].[Book_TagsInsert] 33, 6;
exec [dbo].[Book_TagsInsert] 34, 24;
exec [dbo].[Book_TagsInsert] 34, 25;
exec [dbo].[Book_TagsInsert] 34, 11;
exec [dbo].[Book_TagsInsert] 35, 9;
exec [dbo].[Book_TagsInsert] 35, 7;
exec [dbo].[Book_TagsInsert] 35, 14;
exec [dbo].[Book_TagsInsert] 36, 14;
exec [dbo].[Book_TagsInsert] 36, 20;
exec [dbo].[Book_TagsInsert] 36, 15;
exec [dbo].[Book_TagsInsert] 37, 7;
exec [dbo].[Book_TagsInsert] 37, 23;
exec [dbo].[Book_TagsInsert] 37, 19;
exec [dbo].[Book_TagsInsert] 38, 4;
exec [dbo].[Book_TagsInsert] 38, 15;
exec [dbo].[Book_TagsInsert] 38, 12;
exec [dbo].[Book_TagsInsert] 39, 25;
exec [dbo].[Book_TagsInsert] 39, 5;
exec [dbo].[Book_TagsInsert] 39, 11;
exec [dbo].[Book_TagsInsert] 40, 21;
exec [dbo].[Book_TagsInsert] 40, 22;
exec [dbo].[Book_TagsInsert] 40, 15;
exec [dbo].[Book_TagsInsert] 41, 8;
exec [dbo].[Book_TagsInsert] 41, 16;
exec [dbo].[Book_TagsInsert] 41, 13;
exec [dbo].[Book_TagsInsert] 42, 12;
exec [dbo].[Book_TagsInsert] 42, 9;
exec [dbo].[Book_TagsInsert] 42, 11;
exec [dbo].[Book_TagsInsert] 43, 5;
exec [dbo].[Book_TagsInsert] 43, 19;
exec [dbo].[Book_TagsInsert] 43, 2;
exec [dbo].[Book_TagsInsert] 44, 3;
exec [dbo].[Book_TagsInsert] 44, 7;
exec [dbo].[Book_TagsInsert] 44, 18;
exec [dbo].[Book_TagsInsert] 45, 19;
exec [dbo].[Book_TagsInsert] 45, 20;
exec [dbo].[Book_TagsInsert] 45, 24;
exec [dbo].[Book_TagsInsert] 46, 19;
exec [dbo].[Book_TagsInsert] 46, 20;
exec [dbo].[Book_TagsInsert] 46, 22;
exec [dbo].[Book_TagsInsert] 47, 23;
exec [dbo].[Book_TagsInsert] 47, 24;
exec [dbo].[Book_TagsInsert] 47, 9;
exec [dbo].[Book_TagsInsert] 48, 12;
exec [dbo].[Book_TagsInsert] 48, 24;
exec [dbo].[Book_TagsInsert] 48, 23;
exec [dbo].[Book_TagsInsert] 49, 17;
exec [dbo].[Book_TagsInsert] 49, 25;
exec [dbo].[Book_TagsInsert] 49, 19;
exec [dbo].[Book_TagsInsert] 50, 17;
exec [dbo].[Book_TagsInsert] 50, 12;
exec [dbo].[Book_TagsInsert] 50, 21;

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
--нынешние должники
exec [dbo].[OrdersInsert] 30, 2, '2016-07-11', '2017-08-11', null;
exec [dbo].[OrdersInsert] 12, 5, '2016-09-03', '2017-07-17', null;
exec [dbo].[OrdersInsert] 36, 1, '2017-01-24', '2017-06-12', null;
exec [dbo].[OrdersInsert] 36, 5, '2017-10-16', '2017-11-12', null;

--не должны, но не сдали книгу
exec [dbo].[OrdersInsert] 12, 1, '2017-02-08', '2017-12-03', null;
exec [dbo].[OrdersInsert] 24, 2, '2017-09-23', '2018-12-31', null;
exec [dbo].[OrdersInsert] 40, 3, '2017-10-19', '2018-01-26', null;
exec [dbo].[OrdersInsert] 30, 2, '2017-07-11', '2018-02-11', null;
exec [dbo].[OrdersInsert] 12, 5, '2017-09-03', '2017-12-17', null;
exec [dbo].[OrdersInsert] 36, 1, '2017-01-24', '2017-12-12', null;
exec [dbo].[OrdersInsert] 36, 5, '2017-10-16', '2017-12-12', null;

--просрочка
exec [dbo].[OrdersInsert] 25, 1, '2013-01-11', '2013-12-03', '2016-09-14';
exec [dbo].[OrdersInsert] 18, 5, '2013-08-20', '2014-07-30', '2015-12-01';
exec [dbo].[OrdersInsert] 37, 3, '2012-05-09', '2013-05-09', '2015-04-29';
exec [dbo].[OrdersInsert] 17, 2, '2013-02-19', '2013-03-01', '2013-06-01';
exec [dbo].[OrdersInsert] 47, 2, '2014-02-08', '2014-08-26', '2017-02-12';
exec [dbo].[OrdersInsert] 6, 2, '2014-12-31', '2015-12-10', '2016-01-16';
exec [dbo].[OrdersInsert] 1, 5, '2013-04-18', '2013-05-01', '2016-05-13';
exec [dbo].[OrdersInsert] 49, 4, '2014-08-24', '2014-10-21', '2015-11-30';
exec [dbo].[OrdersInsert] 14, 2, '2014-12-23', '2015-06-30', '2016-09-22';
exec [dbo].[OrdersInsert] 1, 5, '2013-01-01', '2013-02-03', '2016-11-23';
exec [dbo].[OrdersInsert] 11, 2, '2014-04-04', '2014-08-22', '2017-05-05';

exec [dbo].[OrdersInsert] 2, 4, '2013-04-11', '2015-06-13', '2013-11-06';
exec [dbo].[OrdersInsert] 7, 4, '2012-12-04', '2014-01-16', '2013-12-14';
exec [dbo].[OrdersInsert] 9, 5, '2014-11-25', '2017-06-02', '2015-04-01';
exec [dbo].[OrdersInsert] 42, 4, '2017-03-27', '2017-11-04', '2017-04-09';
exec [dbo].[OrdersInsert] 34, 3, '2014-09-03', '2017-03-08', '2015-01-14';
exec [dbo].[OrdersInsert] 28, 5, '2014-07-09', '2016-08-18', '2015-07-10';
exec [dbo].[OrdersInsert] 6, 2, '2016-07-21', '2016-10-28', '2016-08-25';
exec [dbo].[OrdersInsert] 44, 1, '2017-08-06', '2017-09-16', '2017-08-11';
exec [dbo].[OrdersInsert] 44, 5, '2013-02-16', '2015-09-23', '2014-03-03';
exec [dbo].[OrdersInsert] 9, 5, '2014-01-25', '2017-03-01', '2016-07-08';
exec [dbo].[OrdersInsert] 37, 3, '2015-09-10', '2016-08-30', '2015-11-06';
exec [dbo].[OrdersInsert] 34, 4, '2016-09-04', '2017-09-27', '2017-04-02';
exec [dbo].[OrdersInsert] 29, 5, '2015-01-23', '2016-01-03', '2015-11-08';
exec [dbo].[OrdersInsert] 44, 4, '2014-07-30', '2015-07-30', '2014-11-26';
exec [dbo].[OrdersInsert] 31, 3, '2016-04-02', '2016-12-21', '2016-09-06';
exec [dbo].[OrdersInsert] 36, 5, '2016-02-09', '2017-07-13', '2016-09-11';
exec [dbo].[OrdersInsert] 12, 5, '2014-01-27', '2016-02-18', '2015-08-04';
exec [dbo].[OrdersInsert] 45, 5, '2013-03-29', '2015-09-03', '2013-07-03';
exec [dbo].[OrdersInsert] 4, 4, '2013-02-04', '2014-11-11', '2013-08-22';
exec [dbo].[OrdersInsert] 27, 5, '2013-05-01', '2015-02-19', '2013-10-15';
exec [dbo].[OrdersInsert] 18, 1, '2014-08-07', '2017-10-02', '2015-04-02';
exec [dbo].[OrdersInsert] 22, 5, '2014-08-10', '2016-08-06', '2015-06-19';


--select  * from genres;

--select * from books;

--select * from book_genres;

--select * from users;

--select * from authors;

--select * from orders;

--select * from Tags;

--select * from Book_tags;

	
	