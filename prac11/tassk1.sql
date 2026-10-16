/*Функциональные зависимости:
 book_id - title, author_name, publisher_id;
 publisher_id - publisher_name, publisher_city;
 следовательно, book_id - publisher_name, publisher_city.

транзитная зависимость
book_id - publisher_id - publisher_name, publisher_city
Название и город издательства зависят от неключевого атрибута publisher_id. Сведения об издательстве дублируются для каждой книги.*/

CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(255),
    publisher_city VARCHAR(100)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_name VARCHAR(255),
    publisher_id INT,
    FOREIGN KEY (publisher_id)
        REFERENCES Publishers(publisher_id)
);