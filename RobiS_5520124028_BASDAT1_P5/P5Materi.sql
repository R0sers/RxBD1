CREATE TABLE product_motor(
	id_motor SERIAL PRIMARY KEY,
	nama_motor VARCHAR(30),
	harga INT
);

CREATE TABLE log_harga(
	id_long SERIAL PRIMARY KEY,
	id_motor INT REFERENCES product_motor(id_motor),
	harga_lama INT,
	harga_baru INT,
	tgl_ubah DATE
);

INSERT INTO product_motor VALUES
(DEFAULT, 'Supra Fit', 5000000),
(DEFAULT, 'Astrea', 3000000),
(DEFAULT, 'Beat Karbu', 7000000),
(DEFAULT, 'Satri FU', 7000000)

SELECT * FROM product_motor;
SELECT * FROM log_harga;


CREATE OR REPLACE FUNCTION
func_log_harga()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
	AS
$$
BEGIN
	INSERT INTO log_harga
	VALUES
		(DEFAULT, OLD.id_motor, OLD.harga, NEW.harga, CURRENT_DATE);
	RETURN NEW;
END;
$$

CREATE TRIGGER trig_log_harga
	BEFORE UPDATE ON product_motor
	FOR EACH ROW 
	EXECUTE PROCEDURE func_log_harga();

UPDATE product_motor SET harga = 10000000 
WHERE id_motor = '3';

ALTER TRIGGER trig_log_harga
ON product_motor
RENAME TO ini_trigger_harga;

SELECT * FROM pg_trigger;

DROP TRIGGER ini_trigger_harga ON product_motor;


CREATE OR REPLACE FUNCTION tambah(angka1 INT, angka2 INT)
	RETURNS INT 
	LANGUAGE PLPGSQL
AS
$$
	BEGIN
		RETURN angka1 - angka2;
END;
$$

SELECT tambah(8,9);


CREATE OR REPLACE FUNCTION cekHarga(harga NUMERIC)
RETURNS TEXT
LANGUAGE PLPGSQL
AS
$$
	BEGIN
	IF harga > 5000000 THEN
		RETURN 'Mahal Nyooo';
	ELSE
		RETURN 'Murah Teing';
	END IF;
END;
$$

SELECT cekHarga(harga) FROM product_motor WHERE id_motor = '4';


