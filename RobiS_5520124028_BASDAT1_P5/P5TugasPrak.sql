CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	car_name VARCHAR(30),
	car_available INT
);

CREATE TABLE sold(
	sold_id SERIAL PRIMARY KEY,
	sold_date DATE,
	car_id INT REFERENCES car(car_id),
	sold_by VARCHAR(30)
);

CREATE TABLE bought (
    bought_id SERIAL PRIMARY KEY,
    bought_date DATE,
    car_id INT REFERENCES car(car_id),
    bought_from VARCHAR(50)

);

INSERT INTO car (car_id, car_name, car_available) VALUES
(DEFAULT, 'Car A', 2),
(DEFAULT, 'Car B', 4),
(DEFAULT, 'Car C', 5),
(DEFAULT, 'Car D', 1);

CREATE OR REPLACE FUNCTION func_kurang_stok()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
BEGIN
	UPDATE car
	SET car_available = car_available - 1
	WHERE id_car = NEW.id_car;
	RETURN NEW;
END;
$$;

CREATE TRIGGER trig_kurang_stok
AFTER INSERT ON sold
FOR EACH ROW
EXECUTE PROCEDURE func_kurang_stok();

CREATE OR REPLACE FUNCTION func_tambah_stok()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
BEGIN
	UPDATE car
	SET car_available = car_available + 1
	WHERE id_car = NEW.id_car;
	RETURN NEW;
END;
$$;

CREATE TRIGGER trig_tambah_stok
AFTER INSERT ON bought
FOR EACH ROW
EXECUTE PROCEDURE func_tambah_stok();