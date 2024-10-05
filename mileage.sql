-- Create the 'mileage' database if it doesn't exist
CREATE DATABASE IF NOT EXISTS mileage;
USE mileage;

-- Create the 'fillups' table
CREATE TABLE fillups (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date_time DATETIME,
    volume DECIMAL(7, 3),
    vehicle_id INT,
    odometer INT,
    mpg DECIMAL(7, 2),
    total_cost DECIMAL(7, 2),
    price_per_gal DECIMAL(7, 3),
    is_partial INT
);

-- Insert sample data
INSERT INTO fillups (date_time, volume, vehicle_id, odometer, mpg, total_cost, price_per_gal, is_partial)
VALUES
    ('2023-01-01 08:00:00', 10.0, 1, 10000, 25.5, 40.0, 4.00, 0),
    ('2023-01-10 15:30:00', 12.0, 2, 12000, 20.0, 48.0, 4.00, 0),
    ('2023-01-15 12:00:00', 9.0, 1, 11000, 30.0, 30.0, 3.33, 0),
    ('2023-01-20 09:45:00', 11.0, 3, 10500, 22.0, 44.0, 4.00, 0),
    ('2023-01-25 18:20:00', 8.0, 1, 11500, 28.0, 32.0, 4.00, 0);

-- Insert erroneous data
INSERT INTO fillups (date_time, volume, vehicle_id, odometer, mpg, total_cost, price_per_gal, is_partial)
VALUES
    ('2023-02-05 10:15:00', 10.0, 9999, 12500, 22.0, 40.0, 4.00, 0); -- Erroneous 'vehicle_id'

-- Insert more sample data
INSERT INTO fillups (date_time, volume, vehicle_id, odometer, mpg, total_cost, price_per_gal, is_partial)
VALUES
    ('2023-02-10 14:00:00', 14.0, 2, 13000, 21.0, 56.0, 4.00, 0),
    ('2023-02-15 16:45:00', 10.0, 1, 12500, 26.0, 40.0, 4.00, 0);

-- Task 4: Lowest, average, and highest gas prices
SELECT
    MIN(price_per_gal) AS lowest_price,
    AVG(price_per_gal) AS average_price,
    MAX(price_per_gal) AS highest_price
FROM fillups;

-- Task 5: Total amount spent on gas for each vehicle
SELECT
    vehicle_id,
    SUM(total_cost) AS total_spent_on_gas
FROM fillups
GROUP BY vehicle_id;

-- Task 6: Average fuel economy for each vehicle
SELECT
    vehicle_id,
    ROUND(AVG(mpg)) AS average_mpg
FROM fillups
WHERE vehicle_id != 9999 -- Exclude erroneous 'vehicle_id'
GROUP BY vehicle_id;

-- Task 7: Display vehicle names ("Prius" or "Other")
SELECT
    CASE
        WHEN vehicle_id = 1 THEN 'Prius'
        ELSE 'Other'
    END AS vehicle_name,
    ROUND(AVG(mpg)) AS average_mpg
FROM fillups
WHERE vehicle_id != 9999 -- Exclude erroneous 'vehicle_id'
GROUP BY vehicle_name;

-- Task 8: Gas fillup count by hour
SELECT
    HOUR(date_time) AS hour_of_day,
    COUNT(*) AS fillup_count
FROM fillups
GROUP BY hour_of_day;

-- Task 9: Gas fillup count by day of the week
SELECT
    DATE_FORMAT(date_time, '%a') AS day_of_week,
    COUNT(*) AS fillup_count
FROM fillups
GROUP BY day_of_week
ORDER BY fillup_count DESC;

-- Task 10: Gas fillup summary by month
SELECT
    DATE_FORMAT(date_time, '%Y-%m') AS month_year,
    vehicle_id,
    COUNT(*) AS fillup_count,
    ROUND(SUM(volume)) AS total_gallons
FROM fillups
GROUP BY month_year, vehicle_id
ORDER BY total_gallons DESC;
