drop table if exists authors cascade;
create table if not exists authors (
    author_id serial primary key,
    name text
);

drop table if exists books cascade;
create table if not exists books (
    book_id serial primary key,
    title text 
);

-- one to many relation >>> many reviews for one book
-- all of the reviews for all the books will be kept 
-- in the same table referenced by a foreign key

drop table if exists reviews cascade;
create table if not exists reviews (
    review_id serial primary key,
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
drop table if exists authors_and_books cascade;
create table if not exists authors_and_books (
  authors_and_books_id serial primary key,
  author_id int,
  book_id int
);

--------------------------------------------------------------
--------------------------------------------------------------

-- some working data
-- feel free to add your own entertaining data as well!
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