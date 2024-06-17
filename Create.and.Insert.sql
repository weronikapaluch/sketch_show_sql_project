-- MSSQL Project 2
-- Weronika Paluch

--Zmiana formatu daty 
SET DATEFORMAT ymd;

--required tables
CREATE TABLE Category(
  id_category int not null identity (1,1) PRIMARY key,
  category_name varchar (50)
);

CREATE table Host(
  id_host int not null identity (1,1) PRIMARY key,
  name varchar (50),
  surname varchar (50),
  stage_name varchar (50),
  agency varchar (50)
);

 CREATE table Musical_Guest(
   id_music_guest int not null identity (1,1) PRIMARY key,
   stage_name varchar (50),
   agency varchar (50),
   genre varchar (50)
 ); 

CREATE TABLE Actor(
  id_actor int not null identity (1,1) PRIMARY KEY,
  name varchar (50),
  surname varchar (50) UNIQUE,
  agency varchar (50), 
  compensation int not null DEFAULT 1000,
  gender varchar (50),
  nationality varchar (50),
  date_of_birth DATE not null
);
  
CREATE TABLE Character(
  id_character int not null identity (1,1) PRIMARY key,
  id_actor int not null UNIQUE REFERENCES Actor(id_actor),
  name varchar (50) UNIQUE,
  gender varchar (50),
  age int not null
);
       
CREATE table Episode(
  id_episode int not null identity (1,1) PRIMARY key,
  id_host int not null UNIQUE REFERENCES Host(id_host),
  id_music_guest int not null UNIQUE REFERENCES Musical_Guest(id_music_guest),
  title varchar (50),
  season int not null,
  air_date date not null,
  episode_number int not null CHECK (episode_number != 0)
);
  
CREATE TABLE Sketch(
  id_sketch int not null identity (1,1) PRIMARY key,
  id_category int not null UNIQUE REFERENCES Category(id_category),
  id_episode int not null UNIQUE REFERENCES Episode(id_episode),
  title varchar (50),
  duration varchar (5) CHECK (duration like '[0-9][0-9]:[0-5][0-9]')
); 
  
CREATE TABLE Character_in_sketch(
  character_in_sketch int not null identity (1,1) PRIMARY key,
  id_character int not null UNIQUE REFERENCES Character(id_character),
  id_sketch int not null UNIQUE REFERENCES Sketch(id_sketch)
);



-- Inserting values into the tables
INSERT INTO Category (category_name)
values 
('cold open'),
('political'),
('parody'),
('musical'),
('fish out of water'),
('satire'),
('impossible task');

INSERT into Host (Host.name, Host.surname, Host.stage_name, Host.agency)
Values
('Barack', 'Obama', 'Barack Obama', 'Stars'),
('Tom', 'Cruise', 'Tom. Cruise', 'HollywoodGame'),
('Kimberly', 'Kardashian', 'Kim Kardashian' , 'Kriss'),
('Stefani', 'Germanotta', 'Lady Gaga', 'Stars'),
('Cherilyn', 'Sarkisian', 'Cher', 'Stars'),
('Alfredo', 'Pacino', 'Al Pacino', 'HollywoodGame'),
('María' , 'del Rosario Mercedes Pilar', 'Charo', 'HollywoodGame');

INSERT into Musical_Guest (Musical_Guest.stage_name, Musical_Guest.agency, Musical_Guest.genre)
VALUES
('U2', 'Kriss', 'Rock'),
('Foo Fighters', 'Stars', 'Rock'),
('Maroon 5', 'HollywoodGame', 'Pop'),
('The Black Eyed Peas', 'Kriss', 'Hiphop'),
('Michael Bublé', 'Stars', 'Jazz'),
('Florence + the Machine', 'HollywoodGame', 'Indie'),
('Lady Antebellum', 'HollywoodGame', 'Country');


INSERT  into Actor (Actor.name, Actor.surname, Actor.agency, Actor.compensation, Actor.gender, Actor.nationality, Actor.date_of_birth)
VALUES
('Mary', 'Thomas', 'Stars', 2500, 'Female', 'American', '1998-12-02'),
('Jack', 'Lee', 'HollywoodGame', 1500, 'Male', 'English', '1973-08-03'),
('Tadhg', 'O’Sullivan', 'Kriss', 2000, 'Male','Irish', '2000-05-07'),
('Jürgen', 'Müller', 'Stars', 2000, 'Male', 'German', '1997-07-25'),
('Amano', 'Takana', 'HollywoodGame', 2000, 'Female', 'Japanese', '1976-10-11'),
('Gloria', 'Hernández', 'Kriss', 2000, 'Female', 'Indian',  '1988-03-28'),
('Fatima', 'Sharma', 'Stars', 2200, 'Female', 'Indian', '1991-09-08');

INSERT INTO Character(Character.id_actor,Character.name, Character.gender, Character.age)
VALUES
(1,'Pizza Guy', 'Male', '19'),
(2,'Big Bird', 'Unknown', '540'),
(3,'JFK jrs brain-worm', 'Unknown', '1'),
(4,'Daisy Lou', 'Female', '65'), 
(5,'Drag Quen', 'Male', '35'),
(6,'Pixy', 'Female', '5'), 
(7,'Robot Tom', 'Male', '1500');

INSERT INTO Episode (Episode.id_host, Episode.id_music_guest, Episode.title, Episode.season, Episode.air_date, Episode.episode_number)
VALUES
(1, 1, 'Homecoming', 3, '2024-05-07', 1),
(2, 2, 'Lights, camera...', 3, '2024-06-03', 2),
(3, 3, 'Coworking', 3, '2024-07-11', 3),
(4, 4, 'Dace Party', 3, '2024-08-03', 4),
(5, 5, 'No way back', 3, '2024-08-08', 5), 
(6, 6, 'Rodeo', 3, '2024-10-11', 6),
(7, 7, 'Bridgt', 3, '2024-11-03', 7); 

INSERT into Sketch (Sketch.id_category, Sketch.id_episode, Sketch.title, Sketch.duration)
VALUES
(1,1, 'Dreams', '05:45'),
(2,2, 'Let them eat cake', '06:30'),
(3,3, 'Stop that', '02:05'),
(4,4, 'Hop', '08:25'),
(5,5, 'Stop', '02:20'),
(6,6, 'Up and down', '01:55'),
(7,7, 'STEM', '03:40');

INSERT INTO Character_in_sketch (Character_in_sketch.id_character, Character_in_sketch.id_sketch)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7)



--QUERIES 

--1
-- for every episode display the actors who play in it
-- SELECT Actor.name, Actor.surname, Episode.episode_number from Actor inner join 
-- Character on Actor.id_actor = Character.id_actor inner join 
-- Character_in_sketch on Character.id_character = Character_in_sketch.id_character inner join
-- Sketch  on Character_in_sketch.id_sketch = Sketch.id_sketch inner join 
-- Episode on sketch.id_episode = Episode.id_episode

--2
-- display every category of a sketch that appeared in an episode
--SELECT Category.id_category, Category.category_name, Episode.episode_number, Episode.title from
--Category inner join Sketch on Category.id_category = Sketch.id_category inner join Episode 
--on Sketch.id_episode = Episode.id_episode


--3
-- display which actor and host appeard in the same episode, plus check their agencies
--SELECT Actor.name, Actor.surname, Actor.agency, Host.name, Host.surname, Host.agency FROM
--Actor inner join character on actor.id_actor = Character.id_actor 
--inner join Character_in_sketch on Character.id_character = Character_in_sketch.id_character
--inner join Sketch on Character_in_sketch.id_sketch = Sketch.id_sketch
--inner join Episode on Sketch.id_episode = Episode.id_episode
--inner join Host on Episode.id_host = host.id_host


--4
-- display the nationality of actors in particular episodes
--SELECT Actor.name, Actor.name, Actor.nationality, Episode.episode_number from 
--Actor inner join character on actor.id_actor = Character.id_actor 
--inner join Character_in_sketch on Character.id_character = Character_in_sketch.id_character
--inner join Sketch on Character_in_sketch.id_sketch = Sketch.id_sketch
--inner join Episode on Sketch.id_episode = Episode.id_episode


--5
--Show how many actors are from th same agency
--SELECT Actor.agency, COUNT (Actor.id_actor) from Actor
--GROUP by Actor.agency ORDER by Actor.agency


--6
--Show the actor with the biggest compensation
--SELECT top 1 * from Actor ORDER by Actor.compensation DESC

--7
-- Show the category of sketches that appeard in specific episodes
--SELECT Sketch.title, Category.category_name, Episode.episode_number, Episode.title from 
--Category inner join Sketch on Category.id_category = Sketch.id_category
--inner join Episode on Sketch.id_episode = Episode.id_episode order by Episode.episode_number

--8
-- Show how many episodes an actor appeard in 
--SELECT Actor.name, Actor.surname, count(Episode.episode_number) as 'number_of_episodes_they_played_in'
--FROM Actor 
--inner join Character on Actor.id_actor = Character.id_actor 
--inner join Character_in_sketch on Character.id_character = Character_in_sketch.id_character 
--inner join Sketch  on Character_in_sketch.id_sketch = Sketch.id_sketch 
--inner join Episode on sketch.id_episode = Episode.id_episode 
--group by Actor.name, Actor.surname order by Actor.name, Actor.surname

--9
-- Display all episodes with musical guest who play rock
--SELECT Episode.title, Episode.episode_number, Episode.season, Musical_Guest.stage_name, Musical_Guest.genre
--from Episode inner join Musical_Guest on Episode.id_music_guest = Musical_Guest.id_music_guest 
--where Musical_Guest.id_music_guest IN 
--(SELECT Musical_Guest.id_music_guest from Musical_Guest
--where genre in ('Rock', 'Country'))
