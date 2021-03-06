CREATE TABLE books 
    (
        book_id INT NOT NULL AUTO_INCREMENT,
        title VARCHAR(100),
        author_fname VARCHAR(100),
        author_lname VARCHAR(100),
        released_year INT,
        stock_quantity INT,
        pages INT,
        PRIMARY KEY(book_id)
    );

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


SELECT  
   author_lname AS forwards,
   REVERSE(author_lname) AS backwards 
FROM books;


SELECT
    CONCAT (author_fname, ' ', author_lname) AS 'full name in caps'
FROM books;


SELECT
    CONCAT (title, ' was released in ', released_year) AS 'blurb'
FROM books;

SELECT 
    title,
    CHAR_LENGTH(title) AS 'character count'
FROM books;
 
 
SELECT
    CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
    CONCAT(author_lname, ',',author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM books;

SELECT
   CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
   CONCAT(author_lname, ',', author_fname) AS author,
   CONCAT(stock_quantity, ' in stock') AS quantity
FROM books;



SELECT 
    title, 
    stock_quantity AS pages
FROM books ORDER BY 2 DESC LIMIT 1;


SELECT
    CONCAT(title, ' - ', released_year ) AS summary
FROM books ORDER BY released_year DESC LIMIT 4;

SELECT 
    title,
    author_lname
FROM books WHERE author_lname LIKE '% %';

SELECT
    title,
    released_year,
    stock_quantity
FROM books ORDER BY 3 LIMIT 3;

SELECT 
    title,
    author_lname
FROM books ORDER BY author_lname, title;

SELECT 
    CONCAT('MY FAVORITE AUTHOR IS ', author_fname, ' ',  author_lname,'!') AS yell
FROM books ORDER BY author_lname;
    
    
SELECT  
    COUNT(DISTINCT author_fname) 
FROM books;

SELECT  
    COUNT(DISTINCT author_fname, author_lname) 
FROM books;

SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

SELECT 
    title, 
    pages 
FROM books WHERE pages=(SELECT Min(pages) FROM books);

SELECT title, pages FROM books
    ORDER BY pages ASC LIMIT 1;
    
SELECT AVG(stock_quantity)
FROM books
GROUP BY released_year;

SELECT
    released_year,
    COUNT(released_year)
FROM books GROUP BY released_year;
    
SELECT
    COUNT(title) AS books
FROM books;

SELECT
    CONCAT(author_fname,' ', author_lname) AS name
FROM books WHERE pages = (SELECT Max(pages) FROM books);

INSERT INTO dogs(name, breed)
VALUES ('bob', 'beagle');


CREATE TABLE dogs (name CHAR(5), breed VARCHAR(10));   

CREATE TABLE people(
    name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES
('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');


INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES ('Microwave', CURDATE(), CURTIME(), NOW());


 SELECT name, DAYNAME(birthdate) FROM people;      
 SELECT name, DAYOFWEEK(birthdate) FROM people;   
 
 SELECT DATE_FORMAT(birthdt, 'WAS born in %W %D') FROM people;
 SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
 
 CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
 );
 
 CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at INT TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
 );
 
 SELECT DAYNAME(NOW());
 
 SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');
 SELECT * FROM books ORDER BY pages LIMIT 1;
 select * from books WHERE ORDER BY pages ;
 
 SELECT -10 > -20 && 0<= 0;
 
 SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2014;
 
 SELECT title, author_lname FROM books
 WHERE author_lname IN('Carver', 'Smith');
 
  SELECT title, released_year FROM books
 WHERE released_year IN(2017, 1985);
 
   SELECT title, released_year FROM books
 WHERE released_year >= 2000 AND released_year NOT IN(2000, 2002);
 
    SELECT title, released_year FROM books
 WHERE released_year >= 2000 AND released_year % 2 != 0;
 
 SELECT title, released_year,
    CASE 
        WHEN released_year >= 2000 THEN 'Modern Lit'
        ELSE '20th Century Lit'
    END AS GENRE
FROM books;

 SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 50 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books ORDER BY STOCK DESC;


SELECT 10 != 10;    
SELECT 15 > 14 && 99 -5 <=94;
SELECT 9 BETWEEN 8 AND 10;
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;
SELECT 1 IN (5,3);

SELECT title, author_lname
FROM books WHERE author_lname='Eggers' OR author_lname='Chabon';

SELECT title, released_year, author_lname FROM books
WHERE author_lname IN ("Lahiri") && released_year>2000;

SELECT title, released_year, author_lname, pages FROM books
WHERE pages BETWEEN 100 AND 200;

SELECT title, released_year, author_lname, pages FROM books
WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

SELECT title, released_year, author_lname, pages ,
    CASE 
        WHEN title LIKE '%stories%' THEN "Short stories" 
        WHEN title = 'Just Kids' OR title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
        ELSE "Novel"
    END AS TYPE
FROM books;
        
SELECT title, author_lname,
    CASE 
        WHEN COUNT(*) = 1 then '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books
GROUP BY author_lname, author_fname;

SELECT AVG(stock_quantity) FROM books;d