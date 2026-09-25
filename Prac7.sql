CREATE TABLE author (
    id_author SERIAL PRIMARY KEY,
    full_name VARCHAR(1000) NOT NULL
);

CREATE TABLE book (
    isbn_book VARCHAR(13) PRIMARY KEY,
    name_b VARCHAR(1000) NOT NULL,
    date_public VARCHAR(4)
);

CREATE TABLE authorship (
    id_author INT,
    isbn_book VARCHAR(13),
    PRIMARY KEY (id_author, isbn_book),
    FOREIGN KEY (id_author) REFERENCES author(id_author),
    FOREIGN KEY (isbn_book) REFERENCES book(isbn_book)
);

CREATE TABLE Reader (
    id_reader INT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    number_telephone VARCHAR(11)
);

CREATE TABLE issuance (
    id_issuance SERIAL PRIMARY KEY,
    id_reader INT,
    isbn_book VARCHAR(13),
    date_issuance DATE,
    date_return_planned DATE,
    date_return_actual DATE,
    FOREIGN KEY (id_reader) REFERENCES Reader(id_reader),
    FOREIGN KEY (isbn_book) REFERENCES book(isbn_book)
);

INSERT INTO Reader (id_reader, full_name, number_telephone) VALUES
(1, 'Анна Петрова', '79001112233'),
(2, 'Иван Соколов', '79002223344'),
(3, 'Мария Ким', '79003334455'),
(4, 'Олег Васильев', '79004445566'),
(5, 'Тестовый Читатель', '79005556677');


INSERT INTO book (isbn_book, name_b, date_public) VALUES
(9785171183668, 'Мастер и Маргарита', '1967'),
(9785389062566, 'Преступление и наказание', '1866'),
(9785041167163, 'Война и мир', '1869'),
(9785699120147, 'Золотой теленок', '1931'),
(9785389037137, 'Пикник на обочине', '1972');


INSERT INTO author (id_author, full_name) VALUES
(1, 'Михаил Булгаков'),
(2, 'Федор Достоевский'),
(3, 'Лев Толстой'),
(4, 'Илья Ильф'),
(5, 'Евгений Петров'),
(6, 'Аркадий Стругацкий'),
(7, 'Борис Стругацкий');


INSERT INTO authorship (id_author, isbn_book) VALUES
(1, 9785171183668),
(2, 9785389062566),
(3, 9785041167163),
(4, 9785699120147),
(5, 9785699120147),
(6, 9785389037137),
(7, 9785389037137);


INSERT INTO issuance
(id_reader, isbn_book, date_issuance, date_return_planned, date_return_actual)
VALUES
(1, 9785171183668, '2026-09-01', '2026-09-15', '2026-09-10'),
(2, 9785389062566, '2026-09-03', '2026-09-17', NULL),
(3, 9785041167163, '2026-09-05', '2026-09-19', '2026-09-18'),
(4, 9785699120147, '2026-09-07', '2026-09-21', NULL),
(1, 9785389037137, '2026-09-09', '2026-09-23', NULL),
(3, 9785699120147, '2026-08-20', '2026-09-03', '2026-09-01');



SELECT *
FROM Reader;


SELECT name_b, date_public
FROM book;


SELECT name_b, date_public
FROM book
WHERE date_public BETWEEN '1801' AND '1900';


SELECT name_b, date_public
FROM book
WHERE date_public BETWEEN '1917' AND '1991';


SELECT *
FROM Reader
WHERE number_telephone = '79001112233';


SELECT *
FROM Reader
WHERE full_name LIKE '%Иван%';


SELECT *
FROM issuance
WHERE date_return_actual IS NULL;


SELECT name_b, date_public
FROM book
ORDER BY name_b;


SELECT *
FROM issuance
WHERE date_return_actual IS NULL
ORDER BY date_return_planned;


SELECT name_b, date_public
FROM book
ORDER BY date_public DESC
LIMIT 3;