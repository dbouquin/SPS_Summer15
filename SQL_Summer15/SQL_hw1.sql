-- SQL Homework Assignment 1
-- Due July 7th, 2015
-- Daina Bouquin

--1. Show the total number of flights

SELECT COUNT(*)
FROM flights;

--2. Show the total number of flights by airline (carrier).

SELECT carrier, COUNT(*)
FROM flights
GROUP BY carrier;

--3. Show all of the airlines, ordered by number of flights in descending order.

SELECT carrier, COUNT(*)
FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC;

--4. Show only the top 5 airlines, by number of flights,
--ordered by number of flights in descending order.

SELECT carrier, COUNT(*)
FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;

--5. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater,
--ordered by number of flights in descending order.

SELECT carrier, COUNT(*)
FROM flights
WHERE distance >= 1000
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;

--6. Create a question that (a) uses data from the flights database, and
-- (b) requires aggregation to answer it, and write down both the question, and the query that answers it.

-- Identify the top manufacturer whose planes are flown the most frequently to Honolulu.

SELECT p.manufacturer, COUNT(*)
FROM planes p
JOIN flights f
ON p.tailnum = f.tailnum
WHERE f.dest = 'HNL'
GROUP BY p.manufacturer
ORDER BY COUNT(*) DESC
LIMIT 1;
