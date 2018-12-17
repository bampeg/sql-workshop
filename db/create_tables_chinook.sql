-- this script has been modified so you can run it in chinook.ml
-- it will remove the default tables and then create our own

-----------------------------------------------------------
-----------------------------------------------------------
-- the order that these tables are dropped is important
-- they contain dependent foreign key constraints
drop table if exists InvoiceLine;
drop table if exists PlaylistTrack;
drop table if exists Track;
drop table if exists Genre;
drop table if exists Playlist;
drop table if exists MediaType;
drop table if exists Invoice;
drop table if exists Album;
drop table if exists Artist;
drop table if exists Customer;
drop table if exists Employee;

drop table if exists authors;
create table if not exists authors (
    author_id integer primary key,
    name text
);

drop table if exists books;
create table if not exists books (
    book_id integer primary key,
    title text 
);

-- one to many relation >>> many reviews for one book
-- all of the reviews for all the books will be kept 
-- in the same table referenced by a foreign key

drop table if exists reviews;
create table if not exists reviews (
    review_id integer primary key,
    review text,
    rating int,
    book_id int, 
      foreign key(book_id) references books(book_id)
);

-- many to many relation >>> many books which can be
-- written by many authors
-- whenever a link is created between two tables a
-- junction table is used to store the two corresponding
-- foreign keys

-- junction table
drop table if exists authors_and_books;
create table if not exists authors_and_books (
  authors_and_books_id integer primary key,
  author_id int,
  book_id int
);

-----------------------------------------------------------
-----------------------------------------------------------

-- some working data
insert into authors (name)
values
('Fred'),
('George'),
('Marge'),
('Anne'),
('Sharon'),
('Harold');

insert into books (title)
values
('The Train of Mars'),
('Wrecked on Mars'),
('The History of Chocolate and the Mars Bar'),
('Green is the New Mars'),
('Mars or Break'),
('My Marsian Husband'),
('Mars, the Desolate Planet'),
('If Mars were made of Marshmellow');

insert into reviews (review, rating, book_id)
values
('terrible!', 1, 5),
('Mediocre Read, great illustration', 3, 2),
('So so', 2, 5),
('The best book I have ever read', 5, 6),
('Great book! Woo!', 5, 1);

insert into authors_and_books (author_id, book_id)
values
(1, 5),
(1, 1),
(3, 2),
(1, 4),
(4, 7),
(1, 6),
(5, 6),
(4, 6),
(5, 6),
(5, 2),
(6, 6);