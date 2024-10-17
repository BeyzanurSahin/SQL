--/*1*/ select * from person

--/*2*/select movie_id,title,popularity from movie where release_date > '2016-01-01' and budget > 100000000

--/*3*/ select * from movie_crew where (job ='Editor'or job ='Producer')  and person_id like '27%'