-- 1. Write a SELECT statement that returns all of the rows and columns in the planes table
SELECT *
FROM planes;

-- 2. Using the weather table, concatenate the year, month, and day columns to display a date in the form "3/17/2013"
SELECT month || '/' || day || '/' || year
FROM weather;

-- 3. Order by planes table by number of seats, in descending order.
SELECT *
FROM planes
ORDER BY seats DESC;

-- 4. List only those planes that have an engine that is 'Reciprocating'
SELECT *
FROM planes
WHERE engine = 'Reciprocating';

-- 5. List only the first 5 rows in the flights table
SELECT *
FROM flights
LIMIT 5;

-- 6. What was the longest (non-blank) air time?
SELECT MAX(air_time)
FROM flights;

-- 7. What was the shortest (non-blank) air time for Delta?
SELECT MIN(air_time)
FROM flights f
JOIN airlines a
ON (f.carrier = a.carrier)
WHERE a.name = 'Delta Air Lines Inc.';

-- 8. Show all of the Alaska Airlines flights between June 1st, 2013 and June 3rd, 2013.
-- Is the way the data is stored in the databasehelpful to you in making your query?

SELECT *
FROM flights f
JOIN airlines a
ON (f.carrier = a.carrier)
WHERE a.name = 'Alaska Airlines Inc.' AND month = 6 AND (day >=0 AND day <= 4) AND year= 2013;
-- The format could be more useful. Having to specify the ranges this way is kind of cumbersome.

--9.  Show all of the airlines whose names contain 'America'

SELECT a.name
FROM airlines a
WHERE a.name LIKE '%America%';

--10. How many flights went to Miami?

SELECT COUNT(*)
FROM flights f
JOIN airports a
ON f.dest=a.faa
WHERE a.name LIKE '%Miami%';

--10. How many flights went to Miami?

SELECT COUNT(*)
FROM flights
WHERE dest = 'MIA';

--11. Were there more flights to Miami in January 2013 or July 2013?  (Multiple queries are OK)

SELECT COUNT(*)
FROM flights
WHERE dest = 'MIA' AND month = 1 AND year = 2013;

SELECT COUNT(*)
FROM flights
WHERE dest = 'MIA' AND month = 7 AND year = 2013;

-- Jan 2013 had more

--12. what is the average altitude of airports?

SELECT AVG(alt)
FROM airports;

--13. What is the average altitude of the three major New York airports?

SELECT AVG(alt)
FROM airports
WHERE faa = 'EWR' OR faa = 'LGA' OR faa = 'JFK';

--14. What is the average altitude for airports grouped by timezone.

SELECT tz, AVG(alt)
FROM airports
GROUP BY tz
ORDER BY tz;

-- Which timezone has the highest altitude? 
SELECT name
FROM airports
WHERE tz = -11;
