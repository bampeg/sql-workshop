# SQL Table Relationships Workshop

It has been my experience that designing / building a database can feel like a daunting task. This workshop is an attempt to dispel these concerns and better solidify database concepts, particularly those that get less attention in lecture. 
I have added tips in each section that have worked well for me, as well as things which I believe to be good practices. My hope is that these will be added upon / updated in the future!

## Resources
* [lucidchart.com](https://lucidchart.com/) - You can create a free account that lets you build all kinds of charts including database diagrams. If you have time before workshop it is beneficial to familiarize yourself with this tool. 
* [Chinook](https://chinook.ml) - You can copy [this SQLite script](./db/create_tables_chinook.sql) and run it in Chinook. It will remove the default tables and replace them with the table structure descriped in this workshop. Alternatively, you can of course copy [this postgres script](./db/create_tables_chinook.sql) and run it in your own sandbox database of choice. 



Begin by asking students to architect the database for a book club application. Explain that this app will allow users to write book reviews. Briefly work with them and talk about some best practices and naming conventions with a [one to many](#one-to-many) relationship.

## One to Many
  * many reviews for one book
  * all book reviews will be kept in the same table referenced by a foreign key  
(3-5 min)
Students should have a grasp on one to many relationships. We are starting here to help set up our many to many relation later on. This also helps demonstrate how a database can grow as new features are added.

> * When labeling, create table names that are unique and descriptive; create column names that make sense, they don't have to be unique from other tables.  
> * I like to label my primary key "table-name_id", and always always label corresponding foreign keys the same! 
> * It is common to use _PascalCase_ or _snake\_case_ 
> * Always think about how you will access the data!

  #### books
  | book_id  | title |
  | -------- | ----- |
  |          |       |

  #### book_reviews
  | review_id  | review | rating | book_id |
  | ---------- | ------ | ------ | ------- |
  |            |        |        |         |

We can search for titles by rating, or find reviews by title.
```
select books.book_id, books.title, reviews.review, reviews.rating
from reviews
join books on books.book_id = reviews.book_id
where reviews.rating <= 5;


```


## Many to Many
  * many books which can be written by many authors
  * whenever a link is created between two tables a junction table is used to store the two corresponding foreign keys  
(7-10 min)
Now ask your audience to add a new feature that allows the user to search for books by author. Point out the fact that many books are often written by more than one author.  

The example below is a possible solution, however it would require us to store duplicate data. For example, if just two authors collaborated on two different books, we would have to create four records in both our authors table and our books table! This problem gets even worse with more authors and books. Following this pattern changes the focus from storing authors and books in their respective tables to storing their relationships.  

  #### authors
  | author_id  | name | book_id |
  | ---------- | ---- | ------- |
  |            |      |         |

  #### books
  | book_id  | title | author_id |
  | -------- | ----- | --------- |
  |          |       |           |

A better pattern is to store the data you need in corresponding tables and add a _junction_ table to track relationships.  

> * Always think about how you will access the data!

  #### authors
  | author_id  | name |
  | ---------- | ---- |
  |            |      |

  #### books
  | book_id  | title |
  | -------- | ----- |
  |          |       |

  #### book_reviews
  | review_id  | review | rating | book_id |
  | ---------- | ------ | ------ | ------- |
  |            |        |        |         |

  #### authors_and_books
  | authors_and_books_id  | author_id | book_id |
  | --------------------- | --------- | ------- |
  |                       |           |         |
  > junction table

## Querying Your DB


## Subqueries


## Join


## Useful Commands
  * `WHERE`
    - `AND / OR`
    - `LIKE`
    - `IS NULL / IS NOT NULL`
    - `BETWEEN x AND y`
    - `IN / NOT IN (set of values to match)`
  * `AS` 
  * ``
  * `ORDER BY table DESC`

## Contributions
@bampeg 