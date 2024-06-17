-- PROCEDURES 
--1
-- Procedure to show what genre of music was played by the musical guest 
--in a given episode

--CREATE procedure muisc_genre_in_episode @episode_number INT
--AS
--SELECT Episode.title, Episode.episode_number, Episode.season, Musical_Guest.stage_name, Musical_Guest.genre
--from Episode inner join Musical_Guest on Episode.id_music_guest = Musical_Guest.id_music_guest 
--where Episode.episode_number = @episode_number

--EXEC muisc_genre_in_episode @episode_number = 3


--2
-- Procedure to show how many episodes an actor appeard in.

--create procedure actor_in_episode @actor_surname varchar(50)
--AS
--SELECT Actor.name, Actor.surname, count(Episode.episode_number) as 'number_of_episodes_they_played_in'
--FROM Actor 
--inner join Character on Actor.id_actor = Character.id_actor 
--inner join Character_in_sketch on Character.id_character = Character_in_sketch.id_character 
--inner join Sketch  on Character_in_sketch.id_sketch = Sketch.id_sketch 
--inner join Episode on sketch.id_episode = Episode.id_episode where Actor.surname = @actor_surname
--group by Actor.name, Actor.surname 

--EXEC actor_in_episode @actor_surname = 'Lee'

-- FUNCTIONS
-- 1

--This function is to get the category of sketches that appeared in a given episode

--CREATE function sketch_category_in_episode (@ep_num int)
--returns varchar(50)
--AS
--begin
--declare @cat varchar(50)
--SELECT @cat = Category.category_name from
--Category inner join Sketch on Category.id_category = Sketch.id_category inner join Episode 
--on Sketch.id_episode = Episode.id_episode where Episode.episode_number = @ep_num
--return @cat
--end

--select dbo.sketch_category_in_episode(6) as 'category'

--2
-- This function is to see which actors (via their id) come from the same place (nationality)

--CREATE function actors_nationality_2 (@nation varchar(50))
--returns @actor_ids TABLE (
--id_actor int)
--AS
--BEGIN
--INSERT INTO @actor_ids (id_actor)
--SELECT Actor.id_actor 
--FROM Actor
--WHERE Actor.nationality = @nation;

--return
--end

--select * from dbo.actors_nationality_2('Indian')

--VIEW 

--1 
-- The goal of this view is to show if an actor and a host from the same agency
-- appeard in the same episode (this is something we are trying to avoid)

--CREATE view actor_host_agency_relationship  
--as 
--sELECT Episode.episode_number, 
--Actor.name as 'actor_name', Actor.surname as 'actor_surname', Actor.agency as 'actor_agency',
--Host.name as 'host_name', Host.surname 'host_surname', Host.agency as 'host_agency' 
--FROM
--Actor inner join character on actor.id_actor = Character.id_actor 
--inner join Character_in_sketch on Character.id_character = Character_in_sketch.id_character
--inner join Sketch on Character_in_sketch.id_sketch = Sketch.id_sketch
--inner join Episode on Sketch.id_episode = Episode.id_episode
--inner join Host on Episode.id_host = host.id_host

--SELECT * from actor_host_agency_relationship where episode_number = 3
--In this case we see that the actor and host are from the same agency "Kriss",
--and this would be communicated to the show runner in case of accusation of favouring a given agency

--2
--The goal of this view is to show all the actor who appeard in a sketch in a given category

--CREATE view actors_in_category  
--as 
--sELECT Actor.id_actor, Actor.name, Actor.surname, Category.category_name 
--from Actor inner join Character on Actor.id_actor = Character.id_character
--inner join Character_in_sketch on Character.id_character = Character_in_sketch.id_character
--inner JOIN Sketch on Character_in_sketch.id_sketch = Sketch.id_sketch
--inner JOIN Category on Sketch.id_category = Category.id_category

--SELECT * from actors_in_category WHERE category_name = 'cold open'
