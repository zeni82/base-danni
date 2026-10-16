/*Функциональные зависимости:
 (race_id, driver_id) - car_model, finish_time;
 car_model - car_manufacturer;
 следовательно, (race_id, driver_id) - car_manufacturer.
Нарушение: производитель автомобиля зависит от составного ключа через модель:
(race_id, driver_id) - car_model - car_manufacturer
Это транзитивная зависимость, нарушающая 3НФ. При этом условие не задаёт зависимости driver_id - car_model: водитель может использовать разные модели в разных заездах.*/

CREATE TABLE CarModels (
    car_model VARCHAR(100) PRIMARY KEY,
    car_manufacturer VARCHAR(100)
);

CREATE TABLE RaceResults (
    race_id INT NOT NULL,
    driver_id INT NOT NULL,
    car_model VARCHAR(100),
    finish_time TIME,
    PRIMARY KEY (race_id, driver_id),
    FOREIGN KEY (car_model)
        REFERENCES CarModels(car_model)
);