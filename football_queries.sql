Find all the matches from 2017.
-- SOLUTION 1
<! SELECT *  FROM matches WHERE season = '2017'


Find all the matches featuring Barcelona.
-- SOLUTION 2
<! SELECT * FROM matches WHERE hometeam = 'Barcelona' OR awayteam = 'Barcelona'


What are the names of the Scottish divisions included?
-- SOLUTION 3
<! SELECT name FROM divisions WHERE country = 'Scotland'


Find the division code for the Bundesliga. Use that code to find out how many matches Freiburg have played in the Bundesliga since the data started being collected.
<! 
-- SOLUTION 4
SELECT COUNT(id) FROM matches WHERE division_code ='D1' AND (hometeam = 'Freiburg' OR awayteam = 'Freiburg')
-- first do: SELECT code FROM divisions WHERE name = 'Bundesliga'; (D1 value)
-- then do :SELECT COUNT(id) FROM matches WHERE division_code ='D1' AND (hometeam = 'Freiburg' OR awayteam = 'Freiburg'); ... count = 374



Find the unique names of the teams which include the word "City" in their name (as entered in the database)
-- SOLUTION 5
<! SELECT DISTINCT hometeam FROM matches WHERE hometeam LIKE '%City' 
--  LIKE (%word)-> contains words 


How many different teams have played in matches recorded in a French division?
-- SOLUTION 6
<! SELECT COUNT(DISTINCT hometeam) FROM matches WHERE division_code ='F1' OR division_code = 'F2'
-- ... 61. Note that count always neeeds bracket 


Have Huddersfield played Swansea in the period covered?
-- SOLUTION 7
<!SELECT * FROM matches WHERE (hometeam = 'Huddersfield' AND awayteam= 'Swansea')


How many draws were there in the Eredivisie between 2010 and 2015?
-- SOLUTION 8
<!SELECT COUNT(ftr) FROM matches WHERE (ftr = 'D') AND (season> 2009 AND season <2016) AND division_code = 'N1'
-- count = 431
-- Alternatively:SELECT COUNT(ftr) FROM matches WHERE (ftr = 'D') AND (season BETWEEN 2010 AND 2015) AND division_code = 'N1';


Select the matches played in the Premier League in order of total goals scored from highest to lowest. Where there is a tie the match with more home goals should come first.
-- SOLUTION 9
<!SELECT * FROM matches WHERE division_code= 'E0' ORDER BY (ftag + fthg) DESC, fthg DESC


In which division and which season were the most goals scored?
-- SOLUTION 10
<! SELECT SUM(fthg + ftag), season, division_code FROM matches GROUP BY division_code, season ORDER BY SUM DESC LIMIT 1
-- sum= 1592	season = 2013	division_code = EC
