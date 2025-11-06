CREATE Table dosen{
	id INT PRIMARY KY NOR NULL,
	nama VARCHAR(30),
	nidn VARCHAR(100),
	email TEXT
};

SELECT * FROM dosen;

ALTER TABLE dosen
ADD COLUMN nama_belakang VARCHAR(100);

ALTER TABLE dosen 
RENAME COLUMN nama TO nama_depan;

ALTER TABLE dosen 
RENAME TO tbl_dosen;

SELECT * FROM tbl_dosen;

DROP tbl_dosen;

DROP DATABASE "5520124028_Robi_Septiandi";
-- drop database harus di querytool lain, dan jangan buka databse yang akan di drop