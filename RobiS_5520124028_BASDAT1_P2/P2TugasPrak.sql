CREATE TABLE movie{
	id INT PRIMARY KEY NOT NULL,
	title VARCHAR(100),
	year CHARACTER(4),
	category CHARACTER(30),
	rating INT 
};

INSERT INTO movie (id,title,year,category,rating) VALUES
('1','The Godfather', '1972','Crime', '9'),
('2','The Godfather Part II', '1974','Crime', '9'),
('3','The War With Grandpa', '2020','Comedy', '5'),
('1','Spiderman No Way Home', '2021','Action', '9'),

SELECT title FROM movie;

SELECT * FROM movie ORDER BY title ASC;

SELECT * FROM movie ORDER BY title DESC;

SELECT rating, COUNT (rating) FROM movie GROUP BY rating;
