-- Ключ исходной таблицы состоит из client_id и equipment_id.
-- client_id -> client_name, client_email (частичная зависимость)
-- equipment_id -> equipment_name (частичная зависимость)
-- (client_id, equipment_id) -> rental_date (полная зависимость)
-- Нарушена 2НФ, так как данные клиента и название оборудования зависят
-- только от части ключа. Выносим их в таблицы Clients и Equipment.
-- Дата аренды зависит от всей пары и остаётся в EquipmentRentals.

CREATE TABLE Clients (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(255),
    client_email VARCHAR(255)
);

CREATE TABLE Equipment (
    equipment_id INT PRIMARY KEY,
    equipment_name VARCHAR(255)
);

CREATE TABLE EquipmentRentals (
    client_id INT NOT NULL,
    equipment_id INT NOT NULL,
    rental_date DATE,
    PRIMARY KEY (client_id, equipment_id),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);
