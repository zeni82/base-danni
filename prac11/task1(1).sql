-- 1. Функциональные зависимости
-- book_id -> title, author_name, publisher_id
-- publisher_id -> publisher_name, publisher_city

-- 2. Транзитивная зависимость
-- book_id -> publisher_id -> publisher_name, publisher_city
-- Название и город издательства зависят от номера книги через номер издательства.
-- Поэтому исходная таблица нарушает 3НФ.

-- 3. Приведение к 3НФ
-- Сведения об издательстве храним в Publishers. В Books оставил его номер.

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
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);
