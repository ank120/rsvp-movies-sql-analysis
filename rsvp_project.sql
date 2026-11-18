Create database rsvp;
use rsvp;

create table movies(
movie_id int primary key,
title varchar(100),
release_year year,
genre varchar(50),
language varchar(30),
budget decimal (10,2),
revenue decimal (10,2)
);

-- Directors Table
Create Table Directors (
director_id int primary key,
name varchar (100)
);

-- Movie Director Table
create table movie_director (
movie_id Int,
director_id int,
foreign key (movie_id) references movies(movie_id),
foreign key (director_id) references Directors(director_id)
);

-- Rating Table
Create Table Ratings (
movie_id int,
rating decimal(3,1),
foreign key (movie_id) references movies(movie_id)
);

-- Insert Movies
INSERT INTO Movies VALUES
(1, 'Uri: The Surgical Strike', 2019, 'Action', 'Hindi', 25.00,350.00),
(2, 'Kedarnath', 2018, 'Romance', 'Hindi', 40.00, 100.00),
(3, 'Love Per Square Foot', 2018, 'Comedy', 'Hindi', 20.00, 45.00);

-- Insert Directors
INSERT INTO Directors VALUES
(1, 'Aditya Dhar'),
(2, 'Abhishek Kapoor'),
(3, 'Anand Tiwari');

-- Insert Movie_Director
INSERT INTO Movie_Director VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insert Ratings
INSERT INTO Ratings VALUES
(1, 8.3),
(2, 6.9),
(3, 7.3);

-- List all movies released after 2017
select title,release_year from movies
where release_year>2017;

-- Find the highest revenue movie
select * from movies
order by revenue desc
limit 1;

-- Show movies with rating > 7
select m.title,r.rating
from movies m
Join ratings r on m.movie_id = r.movie_id
where r.rating>7;

-- Get directors and their movies
select d.name as director, m.title as movie
from directors d
JOIN movie_Director md on d.director_id = md.director_id
JOIN movies m on md.movie_id = m.movie_id;

-- Calculate Profit = Revenue - Budget
select title,(revenue-budget) as Profit
from movies;

-- Find average rating per genre
select m.genre, avg(r.rating) as avg_rating
from movies m
JOIN Ratings r on m.movie_id = r.movie_id
Group BY m.genre;

-- Recommend Top 3 movies by rating
select m.title, r.rating
from movies m
JOIN ratings r on m.movie_id =r.movie_id
order by r.rating desc
limit 3;





