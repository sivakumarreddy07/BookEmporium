DELETE FROM book;
ALTER TABLE book AUTO_INCREMENT = 1001;

DELETE FROM category;
ALTER TABLE category AUTO_INCREMENT = 1001;

INSERT INTO `category` (`name`) VALUES ('Classics'),('Fantasy'),('Mystery'),('Science Fiction');

INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Suffocate', 'Niklas Reiniger', '', 1099, 0, FALSE, FALSE, 1001);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Without a Trace', 'Danielle Steel', '', 1710, 0, TRUE, FALSE, 1001);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Doctor’s Daughter', 'Sharu J. Ryan', '', 1099, 0, FALSE, FALSE, 1001);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Haunting Adeline', 'H.D. Carlton', '', 2100, 0, FALSE, FALSE, 1001);

INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Six Of Crows', 'Leigh bardugo', '', 1589, 0, TRUE, FALSE, 1002);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Enemy Tribe', 'Lori Holmes', '', 2000, 0, FALSE, FALSE, 1002);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Kalki', 'M Rajaram', '', 1799, 0, FALSE, FALSE, 1002);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Witch Secrets', 'Lisa Morrow', '', 1200, 0, FALSE, FALSE, 1002);

INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Institute', 'Stephen King', '', 800, 0, FALSE, FALSE, 1004);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Ferryman', 'Justin Cronin', '', 2155, 0, FALSE, FALSE, 1004);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Fractal Noise', 'Christopher Paolini', '',  2000, 0, FALSE, FALSE, 1004);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Outriders', 'Jay Posey', '', 1216, 0, TRUE, FALSE, 1004);

INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Rescue Of Flight 1421', 'T J Newman', '', 1865, 0, FALSE, FALSE, 1003);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Never Never', 'Tarryn Fisher', '', 1300, 0, FALSE, FALSE, 1003);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Last Thing He Told Me', 'Laura Dave', '', 1289, 0, TRUE, FALSE, 1003);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Fairy Tale', 'Stephen King', '', 1700, 0, FALSE, FALSE, 1003);

INSERT INTO `category` (`name`) VALUES ('Romance');

INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Things We Never Got Over', 'Lucy score', '', 1167, 0, TRUE, FALSE, 1005);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Twisted Love', 'Ana Huang', '', 1115, 0, FALSE, FALSE, 1005);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('It Starts with Us', 'Colleen Hoover', '', 1049, 0, FALSE, FALSE, 1005);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Meet Me at the Lake', 'Carley Fortune', '', 1112, 0, FALSE, FALSE, 1005);

