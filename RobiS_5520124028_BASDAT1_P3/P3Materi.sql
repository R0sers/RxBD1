
CREATE TABLE drink(
	--id INT GENERATED ALWAYS  AS IDENTITY // KALO PAKE "INT"
	id SERIAL PRIMARY KEY,
	nama VARCHAR(100),
	jenis VARCHAR(100),
	harga INT,
	stok INT
);

INSERT INTO drink VALUES 
(DEFAULT, 'Fruittea', 'Standar', 1000, null);
(DEFAULT, 'Ale-Ale', 'Kemasan', 1000, 10),
(DEFAULT, 'Power R', 'Kemasan', 1500, 5),
(DEFAULT, 'TGB', 'Sachet', 2000, 15),
(DEFAULT, 'Starbuck', 'Mewah', 70000, 2),
(DEFAULT, 'Matcha', 'Standar', 30000, 2);


SELECT * FROM drink;

--equality operator
SELECT * FROM drink 
WHERE nama = 'Ale-Ale';

--inequality operator
SELECT * FROM drink WHERE nama != 'Ale-Ale';
SELECT * FROM drink WHERE stok != 2;

--greater than
SELECT * FROM drink WHERE stok > 10;
SELECT * FROM drink WHERE stok >= 10;

--lower than
SELECT * FROM drink WHERE stok < 5;
SELECT * FROM drink WHERE harga  <= 80000;

--in()
SELECT * FROM drink 
WHERE nama IN ('Ale-Ale', 'Power R');

--not in()
SELECT * FROM drink 
WHERE nama NOT IN ('Ale-Ale', 'Power R');

--between
SELECT * FROM drink 
WHERE harga BETWEEN 2000 AND 69000;

-- is null, IS NOT NULL
SELECT * FROM drink 
WHERE stok IS NULL;

--like (cocok untuk type data char dan varchar)
SELECT * FROM drink 
WHERE nama LIKE 'Pow%';

SELECT * FROM drink 
WHERE nama LIKE '%tar%';

--untuk int harus di casting
SELECT * FROM drink 
WHERE CAST(stok AS TEXT) LIKE '%10%';

--FUNGSI
--upper
SELECT nama, UPPER(nama) FROM drink;

SELECT nama, UPPER(nama) AS nama_kapitalsemua FROM drink;

--numerik
SELECT ROUND (3.6), CEIL(3.6), FLOOR(3.6);
SELECT POWER(122,3);

--TANGGAL DAN WAKTU
SELECT CURRENT_DATE, NOW(), CURRENT_TIME;

--AGREGAT
SELECT stok, COUNT(*) FROM drink
GROUP BY stok;

SELECT MAX(harga) AS harga_tertinggi,
SUM(harga) FROM drink;

--view 
CREATE VIEW view_drink AS 
SELECT * FROM drink;

SELECT * FROM view_drink;
SELECT nama FROM view_drink;

DROP VIEW view_drink;

