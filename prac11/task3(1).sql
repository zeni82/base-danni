-- 1. Функциональные зависимости
-- (booking_time, room_name) -> event_name
-- event_name -> event_type
-- event_type -> room_name

-- 2. Потенциальные ключи
-- (booking_time, room_name), (booking_time, event_name), (booking_time, event_type)
-- По типу узнаём комнату, а по времени и комнате находим конкретную бронь.

-- 3. Нарушение НФБК
-- Название мероприятия определяет тип, а тип определяет комнату.
-- Ни название, ни тип сами по себе не определяют время брони.

-- 4. Приведение к НФБК
-- Храним отдельно типы и их комнаты, мероприятия и их типы, а также время броней.

CREATE TABLE EventTypes (
    event_type VARCHAR(50) PRIMARY KEY,
    room_name VARCHAR(100) NOT NULL
);

CREATE TABLE Events (
    event_name VARCHAR(255) PRIMARY KEY,
    event_type VARCHAR(50) NOT NULL,
    FOREIGN KEY (event_type) REFERENCES EventTypes(event_type)
);

CREATE TABLE RoomBookings (
    booking_time DATETIME NOT NULL,
    event_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (booking_time, event_name),
    FOREIGN KEY (event_name) REFERENCES Events(event_name)
);