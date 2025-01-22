create database project;
use project;

CREATE TABLE Locations (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL,
    region VARCHAR(50) NOT NULL
);


CREATE TABLE Sensors (
    sensor_id INT PRIMARY KEY AUTO_INCREMENT,
    location_id INT,
    sensor_type VARCHAR(50) NOT NULL,
    installation_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

CREATE TABLE Air_Quality (
    aq_id INT PRIMARY KEY AUTO_INCREMENT,
    sensor_id INT,
    reading_date DATE NOT NULL,
    pm2_5 FLOAT,
    pm10 FLOAT,
    no2 FLOAT,
    o3 FLOAT,
    co FLOAT,
    FOREIGN KEY (sensor_id) REFERENCES Sensors(sensor_id)
);

CREATE TABLE Water_Quality (
    wq_id INT PRIMARY KEY AUTO_INCREMENT,
    sensor_id INT,
    reading_date DATE NOT NULL,
    ph_level FLOAT,
    dissolved_oxygen FLOAT,
    turbidity FLOAT,
    nitrate_levels FLOAT,
    lead_concentration FLOAT,
    FOREIGN KEY (sensor_id) REFERENCES Sensors(sensor_id)
);

CREATE TABLE Temperature (
    temp_id INT PRIMARY KEY AUTO_INCREMENT,
    sensor_id INT,
    reading_date DATE NOT NULL,
    temperature FLOAT NOT NULL,
    humidity FLOAT NOT NULL,
    FOREIGN KEY (sensor_id) REFERENCES Sensors(sensor_id)
);


CREATE TABLE Health_Records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    location_id INT,
    report_date DATE NOT NULL,
    disease_type VARCHAR(50) NOT NULL,
    cases_reported INT NOT NULL,
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);


CREATE TABLE Alerts (
    alert_id INT PRIMARY KEY AUTO_INCREMENT,
    sensor_id INT,
    alert_date DATE NOT NULL,
    alert_type VARCHAR(50) NOT NULL,
    severity VARCHAR(20) NOT NULL,
    description TEXT NOT NULL,
    FOREIGN KEY (sensor_id) REFERENCES Sensors(sensor_id)
);

INSERT INTO Locations (name, latitude, longitude, region) VALUES
('Marine Drive', 18.943501, 72.823622, 'Mumbai'),
('India Gate', 28.612864, 77.229304, 'New Delhi'),
('Cubbon Park', 12.976347, 77.592903, 'Bengaluru'),
('Connaught Place', 28.631451, 77.216667, 'New Delhi'),
('Charminar', 17.361563, 78.474664, 'Hyderabad'),
('Vidhana Soudha', 12.979691, 77.590669, 'Bengaluru'),
('Gateway of India', 18.921984, 72.834654, 'Mumbai'),
('Red Fort', 28.656473, 77.242532, 'New Delhi'),
('Juhu Beach', 19.098219, 72.826125, 'Mumbai'),
('Qutub Minar', 28.524428, 77.185456, 'New Delhi'),
('Marina Beach', 13.047488, 80.282896, 'Chennai'),
('Howrah Bridge', 22.585033, 88.346812, 'Kolkata'),
('Victoria Memorial', 22.544808, 88.342592, 'Kolkata'),
('Meenakshi Temple', 9.919504, 78.119453, 'Madurai'),
('Mysore Palace', 12.305163, 76.655235, 'Mysore'),
('Rishikesh', 30.103525, 78.294329, 'Uttarakhand'),
('Sundarbans', 21.949727, 89.183327, 'West Bengal'),
('Golconda Fort', 17.383309, 78.401076, 'Hyderabad'),
('Dal Lake', 34.120590, 74.822231, 'Srinagar'),
('Ranthambore National Park', 26.017334, 76.502574, 'Rajasthan');

SELECT*FROM Locations;

INSERT INTO Sensors (location_id, sensor_type, installation_date, status) VALUES
(1, 'Air Quality', '2023-01-15', 'Active'),
(2, 'Water Quality', '2023-02-10', 'Active'),
(3, 'Temperature', '2023-03-20', 'Inactive'),
(4, 'Air Quality', '2023-01-15', 'Active'),
(5, 'Water Quality', '2023-02-10', 'Active'),
(6, 'Temperature', '2023-03-20', 'Inactive'),
(7, 'Air Quality', '2023-04-05', 'Active'),
(8, 'Water Quality', '2023-05-18', 'Maintenance'),
(9, 'Temperature', '2023-06-22', 'Inactive'),
(10, 'Air Quality', '2023-07-10', 'Active'),
(11, 'Water Quality', '2023-08-11', 'Active'),
(12, 'Temperature', '2023-09-15', 'Inactive'),
(13, 'Air Quality', '2023-04-05', 'Active'),
(14, 'Water Quality', '2023-05-18', 'Maintenance'),
(15, 'Temperature', '2023-06-22', 'Inactive'),
(16, 'Air Quality', '2023-07-10', 'Active'),
(17, 'Water Quality', '2023-08-11', 'Active'),
(18, 'Temperature', '2023-09-15', 'Inactive'),
(19, 'Air Quality', '2023-01-15', 'Active'),
(20, 'Water Quality', '2023-02-10', 'Active');

select*from Sensors;

INSERT INTO Air_Quality (sensor_id, reading_date, pm2_5, pm10, no2, o3, co) VALUES
(1, '2024-01-01', 45.2, 70.3, 25.1, 15.6, 0.8),
(2, '2024-01-02', 50.1, 80.0, 30.2, 18.4, 0.7),
(3, '2024-01-03', 55.0, 85.1, 35.3, 20.5, 1.0),
(4, '2024-01-04', 60.2, 90.5, 40.7, 22.3, 1.2),
(5, '2024-01-05', 45.2, 70.3, 25.1, 15.6, 0.8),  -- Repeated record (same values as 1st)
(6, '2024-01-06', 65.4, 95.7, 45.9, 25.0, 1.3),
(7, '2024-01-07', 70.6, 100.2, 50.4, 28.7, 1.5),
(8, '2024-01-08', 75.8, 105.5, 55.6, 30.1, 1.6),
(9, '2024-01-09', 55.0, 85.1, 35.3, 20.5, 1.0),  -- Repeated record (same values as 3rd)
(10, '2024-01-10', 80.0, 110.8, 60.7, 32.5, 1.8),
(11, '2024-01-11', 82.1, 115.3, 62.9, 34.1, 1.9),
(12, '2024-01-12', 85.4, 120.7, 65.0, 36.0, 2.1),
(13, '2024-01-13', 60.2, 90.5, 40.7, 22.3, 1.2),  -- Repeated record (same values as 4th)
(14, '2024-01-14', 87.5, 125.0, 68.1, 37.8, 2.2),
(15, '2024-01-15', 90.2, 130.1, 70.4, 40.0, 2.4),
(16, '2024-01-16', 92.3, 135.4, 73.2, 41.5, 2.5),
(17, '2024-01-17', 95.0, 140.8, 75.6, 43.0, 2.6),
(18, '2024-01-18', 97.4, 145.9, 77.8, 44.3, 2.7),
(19, '2024-01-19', 100.0, 150.0, 80.0, 46.0, 2.9),
(20, '2024-01-20', 105.0, 160.0, 85.0, 50.0, 3.0);

select*from Air_Quality;

INSERT INTO Water_Quality (sensor_id, reading_date, ph_level, dissolved_oxygen, turbidity, nitrate_levels, lead_concentration) VALUES
(1, '2024-01-01', 7.2, 8.5, 1.0, 2.1, 0.01),
(2, '2024-01-02', 6.8, 8.3, 1.5, 2.5, 0.02),
(3, '2024-01-03', 7.0, 8.0, 2.0, 2.8, 0.03),
(4, '2024-01-04', 7.4, 8.2, 1.8, 3.0, 0.01),
(5, '2024-01-05', 7.2, 8.5, 1.0, 2.1, 0.01),  -- Repeated record (same values as 1st)
(6, '2024-01-06', 6.9, 8.1, 1.7, 2.9, 0.04),
(7, '2024-01-07', 7.3, 8.4, 1.2, 3.2, 0.02),
(8, '2024-01-08', 7.5, 8.6, 1.4, 3.4, 0.03),
(9, '2024-01-09', 7.0, 8.0, 2.0, 2.8, 0.03),  -- Repeated record (same values as 3rd)
(10, '2024-01-10', 7.6, 8.7, 1.6, 3.6, 0.05),
(11, '2024-01-11', 7.7, 8.8, 1.3, 3.8, 0.01),
(12, '2024-01-12', 7.8, 8.9, 1.1, 4.0, 0.02),
(13, '2024-01-13', 7.4, 8.2, 1.8, 3.0, 0.01),  -- Repeated record (same values as 4th)
(14, '2024-01-14', 7.9, 9.0, 1.4, 4.2, 0.03),
(15, '2024-01-15', 7.5, 8.6, 1.4, 3.4, 0.03),  -- Repeated record (same values as 8th)
(16, '2024-01-16', 7.6, 8.7, 1.6, 3.6, 0.05),  -- Repeated record (same values as 10th)
(17, '2024-01-17', 8.0, 9.1, 1.5, 4.5, 0.04),
(18, '2024-01-18', 8.1, 9.2, 1.9, 4.7, 0.02),
(19, '2024-01-19', 8.2, 9.3, 1.7, 5.0, 0.06),
(20, '2024-01-20', 8.3, 9.4, 2.1, 5.2, 0.07);

select*from Water_Quality;

INSERT INTO Temperature (sensor_id, reading_date, temperature, humidity) VALUES
(1, '2024-01-01', 25.6, 60.0),
(2, '2024-01-02', 26.1, 58.0),
(3, '2024-01-03', 27.3, 57.0),
(4, '2024-01-04', 28.0, 56.0),
(5, '2024-01-05', 25.6, 60.0),  -- Repeated record (same values as 1st)
(6, '2024-01-06', 26.8, 59.0),
(7, '2024-01-07', 27.5, 55.0),
(8, '2024-01-08', 28.2, 54.0),
(9, '2024-01-09', 27.3, 57.0),  -- Repeated record (same values as 3rd)
(10, '2024-01-10', 28.5, 53.0),
(11, '2024-01-11', 29.0, 52.0),
(12, '2024-01-12', 29.5, 51.0),
(13, '2024-01-13', 28.0, 56.0),  -- Repeated record (same values as 4th)
(14, '2024-01-14', 30.0, 50.0),
(15, '2024-01-15', 28.2, 54.0),  -- Repeated record (same values as 8th)
(16, '2024-01-16', 29.5, 51.0),  -- Repeated record (same values as 12th)
(17, '2024-01-17', 30.5, 49.0),
(18, '2024-01-18', 31.0, 48.0),
(19, '2024-01-19', 31.5, 47.0),
(20, '2024-01-20', 32.0, 46.0);

select*from Temperature;

INSERT INTO Health_Records (location_id, report_date, disease_type, cases_reported) VALUES
(1, '2024-01-01', 'Respiratory Issues', 50),
(2, '2024-01-02', 'Waterborne Diseases', 30),
(3, '2024-01-03', 'Heat Stroke', 20),
(4, '2024-01-04', 'Asthma', 40),
(5, '2024-01-05', 'Respiratory Issues', 50),  -- Repeated record (same values as 1st)
(6, '2024-01-06', 'Waterborne Diseases', 35),
(7, '2024-01-07', 'Heat Stroke', 25),
(8, '2024-01-08', 'Asthma', 45),
(9, '2024-01-09', 'Heat Stroke', 20),  -- Repeated record (same values as 3rd)
(10, '2024-01-10', 'Respiratory Issues', 55),
(11, '2024-01-11', 'Waterborne Diseases', 38),
(12, '2024-01-12', 'Heat Stroke', 28),
(13, '2024-01-13', 'Asthma', 40),  -- Repeated record (same values as 4th)
(14, '2024-01-14', 'Respiratory Issues', 60),
(15, '2024-01-15', 'Asthma', 45),  -- Repeated record (same values as 8th)
(16, '2024-01-16', 'Heat Stroke', 28),  -- Repeated record (same values as 12th)
(17, '2024-01-17', 'Waterborne Diseases', 42),
(18, '2024-01-18', 'Respiratory Issues', 65),
(19, '2024-01-19', 'Asthma', 48),
(20, '2024-01-20', 'Heat Stroke', 30);

INSERT INTO Alerts (sensor_id, alert_date, alert_type, severity, description) VALUES
(1, '2024-01-01', 'High PM2.5', 'High', 'Active'),
(2, '2024-01-02', 'High NO2', 'Medium', 'Resolved'),
(3, '2024-01-03', 'Low Dissolved Oxygen', 'Critical', 'Active'),
(4, '2024-01-04', 'High Temperature', 'Medium', 'Acknowledged'),
(5, '2024-01-05', 'High PM10', 'High', 'Active'),
(6, '2024-01-06', 'High CO', 'Critical', 'Active'),
(7, '2024-01-07', 'High PM2.5', 'High', 'Resolved'),
(8, '2024-01-08', 'High NO2', 'Medium', 'Active'),
(9, '2024-01-09', 'Low Dissolved Oxygen', 'Critical', 'Resolved'),
(10, '2024-01-10', 'High Temperature', 'Medium', 'Active'),
(11, '2024-01-11', 'High PM2.5', 'High', 'Active'),  -- Repeated alert (same values as 1st)
(12, '2024-01-12', 'High CO', 'Critical', 'Acknowledged'),
(13, '2024-01-13', 'High PM10', 'High', 'Resolved'),
(14, '2024-01-14', 'Low Dissolved Oxygen', 'Critical', 'Active'),  -- Repeated alert (same values as 3rd)
(15, '2024-01-15', 'High Temperature', 'Medium', 'Resolved'),
(16, '2024-01-16', 'High PM2.5', 'High', 'Acknowledged'),
(17, '2024-01-17', 'High NO2', 'Medium', 'Active'),  -- Repeated alert (same values as 8th)
(18, '2024-01-18', 'High CO', 'Critical', 'Resolved'),  -- Repeated alert (same values as 6th)
(19, '2024-01-19', 'High PM10', 'High', 'Acknowledged'),
(20, '2024-01-20', 'High NO2', 'Medium', 'Resolved');



DESC Air_Quality;
DESC Water_Quality;

DESC Temperature;
DESC Alerts;

DESC Health_Records;
DESC Sensors;

DESC Locations;

select * from Locations;

select * from Sensors;

select*from Health_Records;

select * from Alerts;

select * from Temperature;

select * from Water_Quality;

select * from Air_Quality;

-- find all the sensors which measures water quality and status is active. 

SELECT sensor_id, sensor_type
FROM Sensors
WHERE status = 'Active'
AND sensor_id IN (
    SELECT sensor_id
    FROM Sensors
    WHERE sensor_type = 'Water Quality'
);

--  1.Display all the locations where cases of respiratory diseases reported.

SELECT location_id, name
FROM Locations
WHERE location_id IN (
    SELECT location_id
    FROM Health_Records
    WHERE disease_type = 'Respiratory Issues'
);

-- Find the locations where sensors detect air quality and are active. (Joins) 

SELECT s.sensor_id, l.name
FROM Sensors s
JOIN Locations l ON s.location_id = l.location_id
WHERE s.sensor_type = 'Air Quality' 
  AND s.status = 'Active';

--  2. Display Name of the locations where No. of Asthma cases >40. 
SELECT name,region FROM Locations WHERE location_id IN 
(SELECT location_id FROM Health_Records WHERE 
disease_type='Asthma' AND cases_reported>40);

-- 3. Show the reading dates where temperature>30 and humidity is>40

SELECT reading_date,temperature,humidity FROM Temperature WHERE sensor_id 
IN (SELECT temp_id WHERE temperature>30 AND humidity>40);

-- 4. Display the locations where either Heat stroke or Waterborne diseases reported. 

SELECT name, region FROM locations WHERE location_id
IN (SELECT location_id FROM Health_Records
     WHERE disease_type= 'Heat Stroke'
     OR disease_type='Waterborne Diseases');

-- 5. Display Alerts whose severity is either high or critical and is currently active. 

SELECT alert_type FROM alerts WHERE sensor_id
IN (SELECT alert_id WHERE severity='High' OR severity='Critical' AND description='Active');


-- 6. Find dates where co emission > 2 and no2 emission between 65 and 80. 

SELECT reading_date,co,no2 FROM Air_Quality WHERE sensor_id
IN (SELECT aq_id WHERE co>2 AND no2 BETWEEN 65 AND 80);


SELECT l.name, COUNT(s.sensor_id) AS active_sensor_count
FROM Locations l
JOIN Sensors s ON l.location_id = s.location_id
WHERE s.status = 'Active'
GROUP BY l.name;

SELECT l.name, hr.disease_type, SUM(hr.cases_reported) AS total_cases
FROM locations l
LEFT JOIN health_records hr ON l.location_id = hr.location_id
WHERE hr.disease_type='Waterborne Diseases'
GROUP BY l.name, hr.disease_type;

SELECT l.name, MAX(t.temperature) AS max_temperature, MAX(t.humidity) AS max_humidity
FROM locations l
LEFT JOIN sensors s ON l.location_id = s.location_id
LEFT JOIN temperature t ON s.sensor_id = t.sensor_id
GROUP BY l.name
ORDER BY max_temperature DESC
LIMIT 5;

-- Display locations with ph_level above 7.5 

SELECT l.name, wq.reading_date, wq.ph_level
FROM water_quality wq
RIGHT JOIN locations l ON wq.sensor_id = l.location_id where ph_level>7.5;

-- Show No. of cases and nitrate level when disease type is waterborne diseases. 

SELECT hr.disease_type, hr.cases_reported, wq.nitrate_levels
FROM water_quality wq
RIGHT JOIN health_records hr ON wq.sensor_id = hr.location_id 
Where disease_type='Waterborne Diseases';

-- Display all locations with their pm2.5 and pm10 readings. 
SELECT l.name, aq.reading_date, aq.pm2_5, aq.pm10
FROM air_quality aq
RIGHT JOIN locations l ON aq.sensor_id = l.location_id;

-- View 1

CREATE VIEW View_AirQualityByLocation AS
SELECT l.name, AVG(a.pm2_5) AS avg_pm25_level
FROM Locations l
JOIN Sensors s ON l.location_id = s.location_id
JOIN Air_Quality a ON s.sensor_id = a.sensor_id
GROUP BY l.name;

SELECT * from View_AirQualityByLocation;

-- View 2
CREATE VIEW View_HealthAndAirQuality AS
SELECT l.name, COUNT(hr.disease_type='Respiratory Issues') AS total_respiratory_issues, AVG(a.pm2_5) AS avg_pm25_level
FROM Locations l
JOIN Health_Records hr ON l.location_id = hr.location_id
JOIN Sensors s ON l.location_id = s.location_id
JOIN Air_Quality a ON s.sensor_id = a.sensor_id
GROUP BY l.name;

select * from View_HealthAndAirQuality;


CREATE VIEW View_AlertsByLocation AS
SELECT l.name, a.severity, COUNT(a.alert_id) AS total_alerts
FROM Locations l
JOIN Sensors s ON l.location_id = s.location_id
JOIN Alerts a ON s.sensor_id = a.sensor_id
GROUP BY l.name, a.severity;

select * from View_AlertsByLocation;
