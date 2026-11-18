-- Ключ исходной таблицы состоит из race_id и driver_id.
-- (race_id, driver_id) -> car_model, finish_time
-- car_model -> car_manufacturer
-- (race_id, driver_id) -> car_model -> car_manufacturer
-- Производитель зависит от ключа через модель. Это нарушает 3НФ.
-- Модель и производителя храним в CarModels, а результат заезда в RaceResults.

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
    FOREIGN KEY (car_model) REFERENCES CarModels(car_model)
);
