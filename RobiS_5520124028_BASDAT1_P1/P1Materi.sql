BASDAT
CREATE TABLE stackholder (

	np INT PRIMARY KEY NOT NULL,
	nama VARCHAR(100),
	divisi VARCHAR(100),
	jobdesk VARCHAR(100)
	

);
	--Menampilkan
	SELECT * FROM stackholder;

	--Menambah kolom
	ALTER TABLE stackholder ADD COLUMN alamat VARCHAR(100);

	--Hapus kolom
	ALTER TABLE stackholder DROP COLUMN alamat;

	--Ganti nama kolom
	ALTER TABLE stackholder RENAME np TO NP_I;

	-- Hapus primary key
	ALTER TABLE stackholder 
	DROP CONSTRAINT stackholder_pkey;

	--ganti nama tabel
	ALTER TABLE stackholder RENAME TO RoxeCorps;

	--tampilkan tabel setelah ganti nama
	SELECT * FROM RoxeCorps;

	-- hapus tabel
	DROP TABLE RoxeCorps;

	
