
-- membuat tabel
CREATE TABLE ragunan (
    id INT PRIMARY KEY NOT NULL,
    binatang VARCHAR(100) 
);

CREATE TABLE safari (
    id INT PRIMARY KEY NOT NULL,
    binatang VARCHAR(100) 
);

-- mengisi data
INSERT INTO ragunan
VALUES
    (1, 'Kucing'),
    (2, 'Gajah'),
    (3, 'Harimau'),
    (4, 'Ayam');
   
INSERT INTO safari
VALUES
    (1, 'Ayam'),
    (2, 'Kucing'),
    (3, 'Gajah'),
    (4, 'Elang');

-- INNER JOIN:
-- Mengembalikan baris yang memiliki pasangan yang cocok di kedua tabel
SELECT
    ragunan.id,
    ragunan.binatang,    
    safari.id,
    safari.binatang
FROM ragunan INNER JOIN safari 
ON ragunan.binatang = safari.binatang;

-- LEFT JOIN:
-- Mengembalikan semua baris dari tabel kiri dan baris yang cocok dari tabel kanan
SELECT
    ragunan.id id_ragunan,
    ragunan.binatang binatang_ragunan,     
    safari.id id_safari,
    safari.binatang binatang_safari
FROM ragunan LEFT JOIN safari 
ON ragunan.binatang = safari.binatang;

-- RIGHT JOIN:
-- Mengembalikan semua baris dari tabel kanan dan baris yang cocok dari tabel kiri
SELECT
    ragunan.id id_ragunan,
    ragunan.binatang binatang_ragunan,     
    safari.id id_safari,
    safari.binatang binatang_safari
FROM ragunan RIGHT JOIN safari 
ON ragunan.binatang = safari.binatang;

-- FULL JOIN:
-- Mengambil semua data dari kedua tabel, baik yang cocok maupun tidak
SELECT
    ragunan.id id_ragunan,
    ragunan.binatang binatang_ragunan,     
    safari.id id_safari,
    safari.binatang binatang_safari
FROM ragunan FULL JOIN safari 
ON ragunan.binatang = safari.binatang;

-- Menampilkan baris yang tidak punya pasangan / kecocokan
SELECT * FROM ragunan FULL JOIN safari 
ON ragunan.binatang = safari.binatang
WHERE ragunan.id IS NULL OR safari.id IS NULL;

-- CROSS JOIN:
-- Menghasilkan semua kombinasi data antar tabel (perkalian Cartesian)
SELECT * FROM ragunan
CROSS JOIN safari;

-- ======================================================================
-- studi kasus lain: pelanggan dan pesanan
-- menampilkan pelanggan yang memiliki pesanan

-- membuat tabel
CREATE TABLE pelanggan(
    id INT PRIMARY KEY NOT NULL,
    nama_pelanggan VARCHAR(100)
);

CREATE TABLE pesanan(
    id INT PRIMARY KEY NOT NULL,
    pelanggan_id INT REFERENCES pelanggan(id),
    nama_menu VARCHAR(50)
);

-- mengisi data
INSERT INTO pelanggan VALUES
(1, 'Andi'), (2, 'Budi'), (3, 'Citra'), (4, 'Dika');

INSERT INTO pesanan VALUES
(1, 1, 'Nasi Goreng'), (2, 1, 'Es Teh'), (3, 2, 'Mie Ayam'), (4,4, 'Soto Ayam');

-- menampilkan semua data
SELECT * FROM pelanggan;
SELECT * FROM pesanan;

-- menampilkan pelanggan yang memiliki pesanan (INNER JOIN)
SELECT 
      pelanggan.nama_pelanggan, 
      pesanan.nama_menu
FROM pelanggan INNER JOIN pesanan
ON pelanggan.id = pesanan.pelanggan_id;

-- menampilkan pelanggan yang belum melakukan pesanan (FULL JOIN dengan kondisi)
SELECT 
      pelanggan.nama_pelanggan
FROM pelanggan FULL JOIN pesanan
ON pelanggan.id = pesanan.pelanggan_id
WHERE pesanan.id IS NULL;