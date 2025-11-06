--membuat tabel minuman
CREATE TABLE minuman(
    id SERIAL PRIMARY KEY NOT NULL,
    nama VARCHAR(100),
    jenis VARCHAR(50),
    harga INT,
    stok INT
);

--mengisi data
INSERT INTO minuman VALUES
(DEFAULT, 'Ale-ale', 'Kemasan', 1000, 10),
(DEFAULT, 'Power F', 'Kemasan', 1000, 5),
(DEFAULT, 'Tea Jus', 'Cekek', 2000, 15),
(DEFAULT, 'Starbuck', 'Mewah', 70000, 2),
(DEFAULT, 'Matcha','Standar', 30000, 2);

--menampilkan semua data
SELECT * FROM minuman;

-- OPERATOR
-- equality operator
SELECT * FROM minuman
WHERE nama = 'Ale-ale' AND stok = 10;

-- inequeality
SELECT * FROM minuman WHERE stok != 2;

-- greater than &/ equal
SELECT * FROM minuman WHERE stok >= 5;

--less than 

 &/ equal
SELECT * FROM minuman WHERE harga <= 5000;

--in()
SELECT * FROM minuman
WHERE nama IN('Ale-ale', 'Power F');

--not in()
SELECT * FROM minuman
WHERE nama NOT IN('Ale-ale', 'Power F');

--BETWEEN
SELECT * FROM minuman
WHERE harga BETWEEN 2000 AND 70000;

--IS NULL
SELECT * FROM minuman WHERE stok IS NULL;

--IS NULL
SELECT * FROM minuman WHERE stok IS NOT NULL;  

INSERT INTO minuman VALUES
(DEFAULT, NULL, NULL, NULL, NULL);

-- LIKE: mencari pola
-- kalimat
SELECT * FROM minuman
WHERE nama LIKE 'Tea%';
SELECT * FROM minuman
WHERE nama LIKE '%Jus';
SELECT * FROM minuman
WHERE nama LIKE '%a%';

-- bukan kalimat
SELECT * FROM minuman
WHERE CAST(stok AS TEXT) LIKE '%15%';


-- FUNGSI BAWAAN
-- fungsi string
SELECT nama AS minuman, UPPER(nama) AS nama_besar,
LOWER(nama) FROM minuman;

-- fungsi numerik
SELECT ROUND(3.6), CEIL(3.6), FLOOR(3.6);

-- tanggal & waktu
SELECT CURRENT_DATE, NOW(), CURRENT_TIME;

-- AGREGAT
SELECT stok, COUNT(*) FROM minuman
GROUP BY stok;

SELECT MAX(harga) AS harga_termahal,
MIN(harga) AS harga_termurah FROM minuman;


-- VIEW
-- membuat view
CREATE VIEW view_data_minuman AS
SELECT * FROM minuman;

-- menampilkan view
SELECT nama FROM view_data_minuman;

-- menghapus view
DROP VIEW view_data_minuman;

-- view versi kompleks
CREATE VIEW harga_minuman AS
SELECT MAX(harga) AS harga_termahal,
MIN(harga) AS harga_termurah FROM minuman;
