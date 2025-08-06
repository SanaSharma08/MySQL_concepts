-- Create a new database named 'date_test_db'
CREATE DATABASE date_test_db;

-- Use the newly created database
USE date_test_db;

-- Create a table named 'events' with a DATETIME column
CREATE TABLE events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(255) NOT NULL,
    event_datetime DATETIME NOT NULL
);

-- Insert some sample data into the 'events' table

-- NOW()
INSERT INTO events (event_name, event_datetime) VALUES
('Project Start', '2023-01-15 10:00:00'),
('Midpoint Review', '2023-06-20 14:30:00'),
('Project Launch', '2023-12-05 09:00:00'),
('Client Meeting', '2024-03-10 11:45:00'),
('Annual Conference', '2024-08-22 16:00:00'),
('Next Quarter Planning', NOW());

SELECT NOW();

select * from events;

-- YEAR(),MONTH(),DAY()
SELECT event_name, YEAR(event_datetime) AS event_year
FROM events;

-- EXTRACT()
SELECT EXTRACT(MONTH FROM '2025-08-06') AS event_month;

-- DATEDIFF()
SELECT DATEDIFF(CURDATE(), event_datetime)
AS days_lived
FROM events;

-- TIMESTAMPDIFF()
SELECT TIMESTAMPDIFF(MONTH , CURDATE(), event_datetime)
AS months_t_go
FROM events;

SELECT TIMESTAMPDIFF(DAY, '2023-01-15', '2024-03-10');

-- ADDDATE(column_name,INTERVAL num UNIT(MONTH,DAY,YEAR))
SELECT event_name, event_datetime AS original_date, 
ADDDATE(event_datetime, INTERVAL 30 DAY) 
AS future_date
FROM events;


-- Select event details and format the date in different ways

SELECT
    event_name,
    -- Display the date as "Month Day, Year" (e.g., "January 15th, 2023")
    DATE_FORMAT(event_datetime, '%M %D, %Y') AS 'Formatted Date 1',
    
    -- Display the date and time as "Weekday, Month Day, Year at Hour:Minute AM/PM"
    -- (e.g., "Monday, January 15th, 2023 at 10:00 AM")
    DATE_FORMAT(event_datetime, '%W, %M %e, %Y at %h:%i %p') AS 'Formatted Date 2',
    
    -- Display the date as "Year-Month-Day"
    DATE_FORMAT(event_datetime, '%Y-%m-%d') AS 'Formatted Date 3'
FROM
    events;
    
    
