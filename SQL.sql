-- 1757. Recyclable and Low Fat Products --
SELECT product_id FROM Products WHERE low_fats='Y' AND recyclable='Y';

-- 584. Find Customer Referee --
SELECT name FROM Customer WHERE referee_id !=2 OR referee_id IS NULL;

-- 595. Big Countries --
SELECT name, population, area FROM World WHERE area>=3000000 OR population>=25000000;

-- 1148. Article Views I --
SELECT DISTINCT(author_id) as id FROM Views WHERE author_id=viewer_id ORDER BY author_id ASC;

--- 1683. Invalid Tweets ---
SELECT tweet_id FROM Tweets WHERE CHAR_LENGTH(content) >15;

--- 1378. Replace Employee ID With The Unique Identifier ---
SELECT u.unique_id, e.name FROM Employees as e LEFT JOIN EmployeeUNI as u ON (e.id = u.id);

--- 1068. Product Sales Analysis I ---
SELECT p.product_name, s.year, s.price FROM Sales as s LEFT JOIN Product as p ON (p.product_id=s.product_id);

--- 1581. Customer Who Visited but Did Not Make Any Transactions ---
SELECT v.customer_id, COUNT(v.visit_id) as count_no_trans FROM Visits as v LEFT JOIN Transactions as t ON (v.visit_id=t.visit_id) WHERE t.transaction_id IS NULL GROUP BY v.customer_id;

--- 197. Rising Temperature ---
SELECT w1.id FROM Weather w1
INNER JOIN Weather w2
ON w1.recordDate = w2.recordDate + INTERVAL 1 DAY
WHERE w1.temperature > w2.temperature
--- or ---
WITH temps AS (SELECT id, temperature, LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp, LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date FROM Weather)
SELECT id FROM temps WHERE temperature - prev_temp > 0
AND DATEDIFF(recordDate, prev_date) = 1;


--- 1661. Average Time of Process per Machine ---
SELECT a1.machine_id, ROUND(AVG(a2.timestamp - a1.timestamp), 3) as processing_time FROM Activity a1 INNER JOIN Activity a2
ON a1.machine_id = a2.machine_id AND a1.process_id = a2.process_id AND a2.activity_type='end'
WHERE a1.activity_type='start'
GROUP BY a1.machine_id

---  ---


---  ---


---  ---


---  ---
