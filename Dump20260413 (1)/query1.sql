
-- Project: Coffee Production Database 


-- Create Database
CREATE DATABASE IF NOT EXISTS coffee_production;
USE coffee_production;

-- Disable FK checks during clean-up
SET FOREIGN_KEY_CHECKS = 0;

-- Clean up existing tables to ensure a fresh start
DROP TABLE IF EXISTS advice_sessions;
DROP TABLE IF EXISTS distributions;
DROP TABLE IF EXISTS productions;
DROP TABLE IF EXISTS farms;
DROP TABLE IF EXISTS resources;
DROP TABLE IF EXISTS extension_workers;
DROP TABLE IF EXISTS farmers;
DROP TABLE IF EXISTS ministry_officials;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS locations;

-- Re-enable FK checks
SET FOREIGN_KEY_CHECKS = 1;

-- 1. locations table
CREATE TABLE locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    district VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
);

-- 2. users table
CREATE TABLE users (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    contact VARCHAR(20) UNIQUE NOT NULL
);

-- 2. ministry_officials table
CREATE TABLE ministry_officials (
    official_id INT PRIMARY KEY,
    role VARCHAR(50) NOT NULL,
    FOREIGN KEY (official_id) REFERENCES users(person_id) ON DELETE CASCADE
);

-- 3. extension_workers table
CREATE TABLE extension_workers (
    worker_id INT PRIMARY KEY,
    supervisor_id INT,
    field_area VARCHAR(100) NOT NULL,
    FOREIGN KEY (worker_id) REFERENCES users(person_id) ON DELETE CASCADE,
    FOREIGN KEY (supervisor_id) REFERENCES ministry_officials(official_id) ON DELETE SET NULL
);

-- 4. farmers table
CREATE TABLE farmers (
    farmer_id INT PRIMARY KEY,
    location_id INT NOT NULL,
    FOREIGN KEY (farmer_id) REFERENCES users(person_id) ON DELETE CASCADE,
    FOREIGN KEY (location_id) REFERENCES locations(location_id) ON DELETE RESTRICT
);

-- 5. farms table
CREATE TABLE farms (
    farm_id INT AUTO_INCREMENT PRIMARY KEY,
    farmer_id INT NOT NULL,
    farm_name VARCHAR(100) NOT NULL,
    size_hectares DECIMAL(10, 2) NOT NULL CHECK (size_hectares > 0),
    location_id INT NOT NULL,
    FOREIGN KEY (farmer_id) REFERENCES farmers(farmer_id) ON DELETE CASCADE,
    FOREIGN KEY (location_id) REFERENCES locations(location_id) ON DELETE RESTRICT
);

-- 6. productions table
CREATE TABLE productions (
    production_id INT AUTO_INCREMENT PRIMARY KEY,
    farm_id INT NOT NULL,
    coffee_type ENUM('Arabica', 'Robusta', 'Liberica') NOT NULL,
    quantity_kg DECIMAL(10, 2) NOT NULL CHECK (quantity_kg >= 0),
    quality_grade VARCHAR(10) NOT NULL,
    harvest_date DATE NOT NULL,
    FOREIGN KEY (farm_id) REFERENCES farms(farm_id) ON DELETE CASCADE
);

-- 7. resources table
CREATE TABLE resources (
    resource_id INT AUTO_INCREMENT PRIMARY KEY,
    resource_name VARCHAR(100) NOT NULL,
    category ENUM('Seedlings', 'Tool', 'Equipment', 'Material') NOT NULL,
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0)
);

-- 8. distributions table
CREATE TABLE distributions (
    distribution_id INT AUTO_INCREMENT PRIMARY KEY,
    farm_id INT NOT NULL,
    official_id INT NOT NULL,
    resource_id INT NOT NULL,
    quantity_distributed INT NOT NULL CHECK (quantity_distributed > 0),
    distribution_date DATE NOT NULL,
    FOREIGN KEY (farm_id) REFERENCES farms(farm_id) ON DELETE CASCADE,
    FOREIGN KEY (official_id) REFERENCES ministry_officials(official_id) ON DELETE CASCADE,
    FOREIGN KEY (resource_id) REFERENCES resources(resource_id) ON DELETE CASCADE
);

-- 9. advice_sessions table
CREATE TABLE advice_sessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    farmer_id INT NOT NULL,
    worker_id INT NOT NULL,
    session_date DATE NOT NULL,
    notes_topics TEXT,
    FOREIGN KEY (farmer_id) REFERENCES farmers(farmer_id) ON DELETE CASCADE,
    FOREIGN KEY (worker_id) REFERENCES extension_workers(worker_id) ON DELETE CASCADE
);

-- ==========================================================
-- DATA POPULATION
-- ==========================================================

-- Insert users
INSERT INTO users (first_name, last_name, gender, contact) VALUES
('John', 'Doe', 'Male', '0700111222'),
('Jane', 'Smith', 'Female', '0700333444'),
('Robert', 'Mugabe', 'Male', '0700555666'),
('Sarah', 'Wanjiku', 'Female', '0700777888'),
('Peter', 'Kamau', 'Male', '0700999000'),
('Alice', 'Zanda', 'Female', '0711111222'),
('Bob', 'Okelo', 'Male', '0711222333'),
('Charlie', 'Mutua', 'Male', '0711333444'),
('David', 'Lwanga', 'Male', '0711444555'),
('Eve', 'Atieno', 'Female', '0711555666'),
('Frank', 'Githua', 'Male', '0711666777'),
('Grace', 'Namono', 'Female', '0711777888'),
('Henry', 'Okori', 'Male', '0711888999'),
('Irene', 'Naisula', 'Female', '0711999000'),
('Jack', 'Ma', 'Male', '0711000111'),
('Kevin', 'Kiprotich', 'Male', '0722000001'),
('Lydia', 'Cherono', 'Female', '0722000002'),
('Mike', 'Ondiek', 'Male', '0722000003'),
('Nancy', 'Akoth', 'Female', '0722000004'),
('Oscar', 'Wamalwa', 'Male', '0722000005'),
('Pamela', 'Anyango', 'Female', '0722000006'),
('Quincy', 'Jones', 'Male', '0722000007'),
('Rose', 'Chebet', 'Female', '0722000008'),
('Sam', 'Otieno', 'Male', '0722000009'),
('Teresa', 'May', 'Female', '0722000010'),
('Ulysses', 'Grant', 'Male', '0722000011'),
('Victoria', 'Beckham', 'Female', '0722000012'),
('William', 'Ruto', 'Male', '0722000013'),
('Xavier', 'Hernandez', 'Male', '0722000014'),
('Yvonne', 'Chaka', 'Female', '0722000015'),
('Zack', 'Snyder', 'Male', '0722000016'),
('Arthur', 'Morgan', 'Male', '0722000017'),
('Beatrice', 'Kuria', 'Female', '0722000018'),
('Catherine', 'Nduta', 'Female', '0722000019'),
('Daniel', 'Wanyama', 'Male', '0722000020');

-- Insert locations
INSERT INTO locations (district, region) VALUES
('Mukono', 'Central'), 
('Wakiso', 'Central'), 
('Kampala', 'Central'),
('Murang', 'Central Uganda'),
('Nyeri', 'Central Uganda'),
('Kiambu', 'Central Uganda'),
('Bungoma', 'Western Uganda'),
('Kakamega', 'Western Uganda'),
('Nakuru', 'Rift Valley'),
('Kericho', 'Rift Valley'),
('Uasin Gishu', 'Rift Valley'),
('Machakos', 'Eastern Uganda'),
('Embu', 'Eastern Uganda'),
('Kisumu', 'Nyanza'),
('Siaya', 'Nyanza'),
('Kilifi', 'Coast'),
('Kwale', 'Coast'),
('Meru', 'Eastern Uganda'),
('Kirinyaga', 'Central Uganda'),
('Bomet', 'Rift Valley'),
('Trans Nzoia', 'Rift Valley'),
('Taita Taveta', 'Coast'),
('Busia', 'Western Uganda'),
('Thika', 'Central Uganda'),
('Turbo', 'Rift Valley'),
('Maua', 'Eastern Uganda'),
('Cherangany', 'Rift Valley'),
('Malaba', 'Western Uganda');

-- Insert ministry_officials
INSERT INTO ministry_officials (official_id, role) VALUES
(1, 'Director of Agriculture'),
(2, 'Chief Extension Liaison'),
(3, 'Operations Manager'),
(4, 'Supply Chain Coordinator'),
(5, 'Financial Auditor');

-- Insert extension_workers
INSERT INTO extension_workers (worker_id, supervisor_id, field_area) VALUES
(6, 1, 'Central Region'),
(7, 1, 'Western Region'),
(8, 2, 'Rift Valley'),
(9, 2, 'Eastern Region'),
(10, 3, 'Nyanza Region'),
(11, 3, 'Coast Region'),
(12, 4, 'North Eastern'),
(13, 4, 'Upper Central'),
(14, 5, 'Lower Eastern'),
(15, 5, 'Lake Basin');

-- Insert farmers
INSERT INTO farmers (farmer_id, location_id) VALUES
(16, 4), (17, 5), (18, 6), (19, 7), (20, 8),
(21, 9), (22, 10), (23, 11), (24, 12), (25, 13),
(26, 14), (27, 15), (28, 16), (29, 17), (30, 18),
(31, 19), (32, 20), (33, 21), (34, 22), (35, 23);

-- Insert farms
INSERT INTO farms (farmer_id, farm_name, size_hectares, location_id) VALUES
(16, 'Abundace Farm', 5.5, 4), (17, 'Hillside View', 3.2, 5), (17, 'River Bank Estate', 1.5, 5),
(18, 'Coffee Haven', 7.0, 6), (19, 'Golden Harvest', 4.5, 7), (20, 'Western Pride', 6.2, 8),
(21, 'Rift Valley Gem', 10.0, 9), (22, 'Tea & Coffee Mix', 12.5, 10), (23, 'Uasin Gold', 8.5, 11),
(24, 'Machakos Sun', 3.0, 12), (25, 'Mount Uganda Roots', 4.0, 13), (26, 'Lakeside Bliss', 2.0, 14),
(27, 'Siaya Sunrise', 5.0, 15), (28, 'Coastal Breeze', 3.5, 16), (29, 'Kwale Tropics', 4.2, 17),
(30, 'Meru Peaks', 9.0, 18), (20, 'Central Hub', 2.5, 2), (31, 'Kirinyaga Greens', 6.5, 19),
(32, 'Bomet Pastures', 7.5, 20), (33, 'Grain & Bean', 11.0, 21), (34, 'Southern Crest', 2.5, 22),
(35, 'Border Fields', 4.8, 23), (16, 'South Hub', 3.3, 4), (18, 'Thika Road Garden', 0.8, 24),
(23, 'Wheat & Coffee', 5.5, 25), (30, 'Upper Meru Plot', 2.2, 26), (21, 'Langa Plot', 1.0, 9),
(22, 'Hilltop Farm', 3.0, 10), (25, 'Riverside Farm', 2.5, 13), (33, 'Cherangany Plot', 6.0, 27),
(19, 'Malaba Field', 1.2, 28);

-- Insert resources
INSERT INTO resources (resource_name, category, stock_quantity) VALUES
('Arabica SL28 Seedlings', 'Seedlings', 5000),
('Ruiru 11 Seedlings', 'Seedlings', 8000),
('Batian Seedlings', 'Seedlings', 3000),
('Pruning Saws', 'Tool', 150),
('Knapsack Sprayers', 'Equipment', 100),
('Solar Dryers', 'Equipment', 20),
('NPK Fertilizer', 'Material', 500),
('Compost Starter', 'Material', 200),
('Protective Gear Sets', 'Equipment', 300),
('Hessian Coffee Bags', 'Material', 2000),
('Grading Tables', 'Equipment', 50),
('Secateurs', 'Tool', 400),
('Hose Pipes', 'Tool', 80),
('Organic Pesticides', 'Material', 150),
('Seedling Trays', 'Material', 1000);

-- Insert distributions
INSERT INTO distributions (farm_id, official_id, resource_id, quantity_distributed, distribution_date) VALUES
(1, 1, 1, 200, '2025-10-01'),
(2, 1, 1, 150, '2025-10-02'),
(3, 2, 2, 100, '2025-10-03'),
(4, 2, 2, 500, '2025-10-04'),
(5, 3, 3, 300, '2025-10-05'),
(6, 3, 3, 400, '2025-10-06'),
(7, 4, 1, 1000, '2025-10-07'),
(8, 4, 1, 1200, '2025-10-08'),
(9, 5, 2, 600, '2025-10-09'),
(10, 5, 2, 200, '2025-10-10'),
(11, 1, 4, 5, '2025-11-01'),
(12, 1, 4, 2, '2025-11-02'),
(13, 2, 5, 3, '2025-11-03'),
(14, 2, 5, 2, '2025-11-04'),
(15, 3, 6, 1, '2025-11-05'),
(16, 3, 6, 4, '2025-11-06'),
(17, 4, 7, 20, '2025-11-07'),
(18, 4, 7, 15, '2025-11-08'),
(19, 5, 8, 10, '2025-11-09'),
(20, 5, 8, 5, '2025-11-10'),
(21, 1, 9, 2, '2026-01-01'),
(22, 1, 9, 3, '2026-01-02'),
(23, 2, 10, 100, '2026-01-03'),
(24, 2, 10, 50, '2026-01-04'),
(25, 3, 11, 2, '2026-01-05'),
(26, 3, 11, 1, '2026-01-06'),
(27, 4, 12, 10, '2026-01-07'),
(28, 4, 12, 8, '2026-01-08'),
(29, 5, 13, 1, '2026-01-09'),
(30, 5, 13, 2, '2026-01-10'),
(1, 1, 7, 10, '2026-02-01'),
(4, 2, 7, 25, '2026-02-02'),
(7, 3, 7, 30, '2026-02-03'),
(8, 4, 7, 40, '2026-02-04'),
(16, 5, 1, 500, '2026-02-05'),
(19, 1, 2, 800, '2026-02-06'),
(21, 2, 4, 5, '2026-02-07'),
(23, 3, 5, 2, '2026-02-08'),
(30, 4, 14, 10, '2026-02-09'),
(31, 5, 15, 50, '2026-02-10');

-- Insert productions
INSERT INTO productions (farm_id, coffee_type, quantity_kg, quality_grade, harvest_date) VALUES
(1, 'Arabica', 1200.50, 'AA', '2025-11-10'), (2, 'Robusta', 850.00, 'AB', '2025-11-15'), 
(3, 'Liberica', 400.00, 'PB', '2025-11-20'), (4, 'Arabica', 2500.00, 'AA', '2025-12-01'), 
(5, 'Robusta', 1100.00, 'C', '2025-12-05'), (6, 'Liberica', 1500.00, 'AB', '2025-12-10');

-- Insert advice_sessions
INSERT INTO advice_sessions (farm_id, worker_id, session_date, notes_topics) VALUES
(1, 6, '2026-04-10', 'Training on organic fertilizer preparation and soil health.'),
(2, 7, '2026-04-11', 'Discussion on integrated pest management for Robusta coffee.'),
(3, 8, '2026-04-12', 'Advice on water conservation and irrigation systems.'),
(4, 9, '2026-04-13', 'Hands-on demonstration of pruning best practices for higher yields.');
