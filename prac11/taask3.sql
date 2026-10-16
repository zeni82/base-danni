/*Функциональные зависимости по условию:
 (booking_time, room_name) - event_name;
 event_name - event_type;
 event_type - room_name.
Потенциальные ключи:
 (booking_time, room_name);
 (booking_time, event_name);
 (booking_time, event_type).
Последняя пара тоже является ключом: тип определяет комнату, а комната вместе со временем определяет мероприятие.

Нарушение НФБК: в зависимости event_type - room_name определяющий атрибут event_type не является суперключом - он не определяет всю строку бронирования.
Зависимость event_name - event_type также нарушает НФБК: мероприятие определяет тип, но не время бронирования.*/

CREATE TABLE EventTypes (
    event_type VARCHAR(50) PRIMARY KEY,
    room_name VARCHAR(100) NOT NULL
);

CREATE TABLE Events (
    event_name VARCHAR(255) PRIMARY KEY,
    event_type VARCHAR(50) NOT NULL,
    FOREIGN KEY (event_type)
        REFERENCES EventTypes(event_type)
);

CREATE TABLE RoomBookings (
    booking_time DATETIME NOT NULL,
    event_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (booking_time, event_name),
    FOREIGN KEY (event_name)
        REFERENCES Events(event_name)
);