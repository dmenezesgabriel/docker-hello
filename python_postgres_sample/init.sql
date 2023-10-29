-- Create books table and populate it
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    isbn VARCHAR(100),
    author VARCHAR(100),
    year VARCHAR(100)
);

INSERT INTO books (title, isbn, author, year) VALUES ('The Hobbit', '978-0547928227', 'J.R.R. Tolkien', '1937');
INSERT INTO books (title, isbn, author, year) VALUES ('Oh, the Places You''ll Go!', '978-0679805274', 'Dr. Seuss', '1990');
INSERT INTO books (title, isbn, author, year) VALUES ('The Cat in the Hat', '978-0394800011', 'Dr. Seuss', '1957');
INSERT INTO books (title, isbn, author, year) VALUES ('Green Eggs and Ham', '978-0394800165', 'Dr. Seuss', '1960');