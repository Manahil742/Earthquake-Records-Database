
-- PROJECT: Earthquake Monitoring and Disaster Analysis Database System
-- GROUP MEMBERS: Ambiya Shah Zaib Khan, Laiba Tufail, Manahil Nasir

CREATE DATABASE earthquake_project;
USE earthquake_project;

-- TABLE 1

CREATE TABLE locations 
(
location_id INT AUTO_INCREMENT PRIMARY KEY,
country VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
latitude DECIMAL(9,6) NOT NULL,
longitude DECIMAL(9,6) NOT NULL
);

-- TABLE 2 

CREATE TABLE fault_lines
 (
fault_id INT AUTO_INCREMENT PRIMARY KEY,
fault_name VARCHAR(100) NOT NULL UNIQUE,
tectonic_plate VARCHAR(100) NOT NULL,
risk_level ENUM('Low','Medium','High','Very High') NOT NULL
);

-- TABLE 3

CREATE TABLE sensors
 (
sensor_id INT AUTO_INCREMENT PRIMARY KEY,
location_id INT NOT NULL,
installation_date DATE NOT NULL,
status ENUM('Active','Inactive') DEFAULT 'Active',

FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

-- TABLE 4

CREATE TABLE earthquake
(
earthquake_id INT AUTO_INCREMENT PRIMARY KEY,
location_id INT NOT NULL,
sensor_id INT NOT NULL,
fault_id INT NOT NULL,
magnitude DECIMAL(3,1) NOT NULL,
depth_km DECIMAL(6,1) NOT NULL,
event_time DATETIME NOT NULL,
CHECK (magnitude BETWEEN 0 AND 10),

FOREIGN KEY (location_id) REFERENCES locations(location_id),
FOREIGN KEY (sensor_id) REFERENCES sensors(sensor_id),
FOREIGN KEY (fault_id) REFERENCES fault_lines(fault_id)
);

-- TABLE 5

CREATE TABLE tsunami_warning
(
warning_id INT AUTO_INCREMENT PRIMARY KEY,
earthquake_id INT NOT NULL,
warning_level ENUM('Low','Medium','High') NOT NULL,
issued_time DATETIME NOT NULL,

FOREIGN KEY (earthquake_id) REFERENCES earthquake(earthquake_id)
);

-- TABLE 6

CREATE TABLE damage_report
(
report_id INT AUTO_INCREMENT PRIMARY KEY,
earthquake_id INT NOT NULL,
casualties INT DEFAULT 0,
buildings_damaged INT DEFAULT 0,
estimated_loss DECIMAL(15,2) DEFAULT 0,

FOREIGN KEY (earthquake_id) REFERENCES earthquake(earthquake_id)
);


INSERT INTO locations(country,city,latitude,longitude) VALUES
('Japan','Tokyo',35.6895,139.6917),
('USA','San Francisco',37.7749,-122.4194),
('Chile','Santiago',-33.4489,-70.6693),
('Indonesia','Jakarta',-6.2088,106.8456),
('Turkey','Istanbul',41.0082,28.9784),
('India','Delhi',28.7041,77.1025),
('Pakistan','Islamabad',33.6844,73.0479),
('China','Beijing',39.9042,116.4074),
('Mexico','Mexico City',19.4326,-99.1332),
('Peru','Lima',-12.0464,-77.0428),
('Philippines','Manila',14.5995,120.9842),
('Nepal','Kathmandu',27.7172,85.3240),
('Iran','Tehran',35.6892,51.3890),
('Italy','Rome',41.9028,12.4964),
('Greece','Athens',37.9838,23.7275),
('Russia','Moscow',55.7558,37.6173),
('USA','Los Angeles',34.0522,-118.2437),
('Japan','Osaka',34.6937,135.5023),
('New Zealand','Wellington',-41.2865,174.7762),
('Canada','Vancouver',49.2827,-123.1207);

INSERT INTO fault_lines(fault_name,tectonic_plate,risk_level) VALUES
('San Andreas Fault','Pacific Plate','High'),
('Nankai Trough','Philippine Plate','Very High'),
('Nazca Fault','Nazca Plate','Medium'),
('Sumatra Fault','Sunda Plate','High'),
('North Anatolian Fault','Anatolian Plate','Very High'),
('Himalayan Fault','Indian Plate','Very High'),
('Alpine Fault','Pacific Plate','High'),
('East African Rift','African Plate','Medium'),
('Cascadia Subduction Zone','Juan de Fuca Plate','Very High'),
('Kuril Trench','Pacific Plate','High'),
('Java Trench','Indo-Australian Plate','High'),
('Aleutian Trench','Pacific Plate','Very High'),
('Red Sea Rift','African Plate','Medium'),
('Caribbean Fault','Caribbean Plate','High'),
('Mediterranean Fault','Eurasian Plate','Medium'),
('Zagros Fault','Arabian Plate','High'),
('New Madrid Fault','North American Plate','High'),
('Tonga Trench','Pacific Plate','Very High'),
('Philippine Fault','Philippine Plate','High'),
('Anatolia Rift','Anatolian Plate','Medium');

INSERT INTO sensors(location_id,installation_date,status) VALUES
(1,'2021-01-15','Active'),
(2,'2021-03-20','Active'),
(3,'2021-05-11','Active'),
(4,'2022-02-01','Active'),
(5,'2022-06-10','Inactive'),
(6,'2022-07-12','Active'),
(7,'2022-08-15','Active'),
(8,'2022-09-10','Active'),
(9,'2023-01-05','Active'),
(10,'2023-02-14','Active'),
(11,'2023-03-18','Active'),
(12,'2023-04-22','Inactive'),
(13,'2023-05-30','Active'),
(14,'2023-06-12','Active'),
(15,'2023-07-19','Active'),
(16,'2023-08-25','Inactive'),
(17,'2023-09-14','Active'),
(18,'2023-10-01','Active'),
(19,'2023-11-11','Active'),
(20,'2023-12-05','Active');

INSERT INTO earthquake(location_id,sensor_id,fault_id,magnitude,depth_km,event_time) VALUES
(1,1,2,7.2,30.5,'2024-01-20 13:45:00'),
(2,2,1,6.5,12.0,'2024-02-11 09:10:00'),
(3,3,3,5.8,15.0,'2024-03-02 21:30:00'),
(4,4,4,7.8,28.0,'2024-04-04 12:10:00'),
(5,5,5,6.9,18.5,'2024-04-20 18:20:00'),
(6,6,6,6.1,22.0,'2024-05-01 07:15:00'),
(7,7,7,7.0,35.0,'2024-05-12 05:50:00'),
(8,8,8,5.5,17.0,'2024-06-08 11:45:00'),
(9,9,9,6.8,10.0,'2024-07-01 16:00:00'),
(10,10,10,7.5,40.0,'2024-07-22 23:10:00'),
(11,11,11,6.3,25.0,'2024-08-10 10:00:00'),
(12,12,12,5.9,14.0,'2024-08-15 12:30:00'),
(13,13,13,7.1,33.0,'2024-09-05 14:20:00'),
(14,14,14,6.4,19.0,'2024-09-18 09:45:00'),
(15,15,15,5.7,11.0,'2024-10-02 08:10:00'),
(16,16,16,6.6,27.0,'2024-10-20 22:15:00'),
(17,17,17,7.3,38.0,'2024-11-11 19:00:00'),
(18,18,18,5.6,16.0,'2024-11-25 06:40:00'),
(19,19,19,6.2,21.0,'2024-12-05 13:25:00'),
(20,20,20,7.4,29.0,'2024-12-28 17:55:00');

INSERT INTO tsunami_warning(earthquake_id,warning_level,issued_time) VALUES
(1,'High',NOW()),
(2,'Medium',NOW()),
(3,'Low',NOW()),
(4,'High',NOW()),
(5,'Medium',NOW()),
(6,'Low',NOW()),
(7,'High',NOW()),
(8,'Low',NOW()),
(9,'Medium',NOW()),
(10,'High',NOW()),
(11,'Medium',NOW()),
(12,'Low',NOW()),
(13,'High',NOW()),
(14,'Medium',NOW()),
(15,'Low',NOW()),
(16,'High',NOW()),
(17,'High',NOW()),
(18,'Low',NOW()),
(19,'Medium',NOW()),
(20,'High',NOW());

INSERT INTO damage_report(earthquake_id,casualties,buildings_damaged,estimated_loss) VALUES
(1,120,450,25000000),
(2,20,80,5000000),
(3,10,30,2000000),
(4,300,900,60000000),
(5,75,250,12000000),
(6,40,120,8000000),
(7,150,500,30000000),
(8,5,10,500000),
(9,60,200,9000000),
(10,210,700,45000000),
(11,25,90,6000000),
(12,15,40,3000000),
(13,180,600,35000000),
(14,35,110,7000000),
(15,8,20,1000000),
(16,95,300,18000000),
(17,220,750,50000000),
(18,12,25,1500000),
(19,55,170,9500000),
(20,260,800,55000000);

SELECT location_id, AVG(magnitude) AS avg_magnitude
FROM earthquake
GROUP BY location_id
HAVING AVG(magnitude) >= 7;

SELECT magnitude, COUNT(*) AS total_earthquakes
FROM earthquake
WHERE magnitude >= 6.5
GROUP BY magnitude;

SELECT country, COUNT(earthquake_id) AS total_earthquakes,
AVG(magnitude) AS avg_magnitude
FROM earthquake
JOIN locations
ON earthquake.location_id = locations.location_id
GROUP BY country;


SELECT * FROM earthquake;
SELECT * FROM locations;
SELECT * FROM sensors;
SELECT * FROM fault_lines;
SELECT * FROM damage_report;
SELECT * FROM tsunami_warning;


SELECT * FROM earthquake
WHERE magnitude > 6;

SELECT * FROM sensors
WHERE status='Active';

SELECT * FROM fault_lines
WHERE risk_level='Very High';

SELECT * FROM earthquake
ORDER BY magnitude DESC;

SELECT * FROM earthquake
ORDER BY depth_km DESC;

SELECT country,city,magnitude
FROM earthquake
JOIN locations 
ON earthquake.location_id=locations.location_id;

SELECT earthquake_id,fault_name,magnitude
FROM earthquake
JOIN fault_lines 
ON earthquake.fault_id=fault_lines.fault_id;

SELECT AVG(magnitude) AS avg_magnitude
FROM earthquake;

SELECT MAX(magnitude) AS max_magnitude
FROM earthquake;

SELECT MIN(magnitude) AS min_magnitude
FROM earthquake;

SELECT COUNT(earthquake_id) AS total_earthquakes
FROM earthquake;

SELECT country, COUNT(earthquake_id) AS total_earthquakes_per_country
FROM locations 
JOIN earthquake
ON locations.location_id = earthquake.location_id
GROUP BY country;

SELECT country, AVG(magnitude) AS avg_magnitude_per_country
FROM earthquake
JOIN locations 
ON earthquake.location_id=locations.location_id
GROUP BY country;

SELECT fault_id, COUNT(earthquake_id) AS fault_lines_associated_with_earthquake
FROM earthquake
GROUP BY fault_id;

SELECT DISTINCT country AS countries_with_stronger_earthquake_than_avg
FROM earthquake
JOIN locations
    ON earthquake.location_id = locations.location_id
WHERE magnitude > 
(
    SELECT AVG(magnitude)
    FROM earthquake
);

SELECT earthquake_id AS id_with_highest_magnitude, magnitude AS mag
FROM earthquake
WHERE magnitude = 
(
    SELECT MAX(magnitude)
    FROM earthquake
);

SELECT SUM(casualties) AS total_casualities
FROM damage_report;

SELECT SUM(estimated_loss) AS total_loss
FROM damage_report;

SELECT *
FROM damage_report
WHERE estimated_loss > 20000000;

SELECT warning_level,
COUNT(*) AS total_warnings
FROM tsunami_warning
GROUP BY warning_level;

SELECT risk_level,
COUNT(*) AS fault_lines_based_on_risk_level
FROM fault_lines
GROUP BY risk_level;

SELECT country,
MAX(magnitude) AS highest_magnitude_each_country
FROM earthquake
JOIN locations
ON earthquake.location_id = locations.location_id
GROUP BY country;

-- monthly report
SELECT 
    MONTH(earthquake.event_time) AS month,
    COUNT(earthquake.earthquake_id) AS total_earthquakes,
    AVG(earthquake.magnitude) AS avg_magnitude,
    SUM(damage_report.casualties) AS total_casualties
FROM earthquake 
JOIN damage_report 
ON earthquake.earthquake_id = damage_report.earthquake_id
GROUP BY MONTH(earthquake.event_time)
ORDER BY total_casualties DESC;

-- summary of disasater of all countries
SELECT country, COUNT(earthquake.earthquake_id) AS total_quakes,
AVG(magnitude) AS avg_magnitude,
SUM(casualties) AS total_casualties
FROM earthquake 
JOIN locations 
ON earthquake.location_id = locations.location_id
JOIN damage_report 
ON earthquake.earthquake_id = damage_report.earthquake_id
GROUP BY country;