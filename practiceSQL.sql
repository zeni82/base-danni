CREATE TABLE author (
    id_author SERIAL PRIMARY KEY,
    full_name VARCHAR(1000) NOT NULL
);

CREATE TABLE book (
    isbn_book INT PRIMARY KEY,
    name_b VARCHAR(1000) NOT NULL,
    date_public VARCHAR(4)
);

CREATE TABLE authorship (
    id_author INT,
    isbn_book INT,
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
    isbn_book INT,
    date_issuance DATE,
    date_return_planned DATE,
    date_return_actual DATE,
    FOREIGN KEY (id_reader) REFERENCES Reader(id_reader),
    FOREIGN KEY (isbn_book) REFERENCES book(isbn_book)
)