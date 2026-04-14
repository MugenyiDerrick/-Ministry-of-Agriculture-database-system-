
USE coffee_production;

-- 1. Test Views
-- ----------------------------------------------------------
SELECT 'Viewing Farm Inventory' AS Test;
SELECT * FROM vw_farm_inventory LIMIT 10;

SELECT 'Viewing Extension Activity' AS Test;
SELECT * FROM vw_extension_activity;

-- 2. Test Stored Procedures
-- ----------------------------------------------------------
SELECT 'Testing sp_UpdateProduction' AS Test;


-- Insert a test production record
INSERT INTO productions (farm_id, coffee_type, quantity_kg, quality_grade, harvest_date) 
VALUES (1, 'Arabica', 500, 'B', '2026-04-10');
SET @last_prod_id = LAST_INSERT_ID();

-- Update quantity using procedure
CALL sp_UpdateProduction(@last_prod_id, 750);

-- Verify update
SELECT * FROM productions WHERE production_id = @last_prod_id;

-- 3. Test Triggers and Stock Management
-- ----------------------------------------------------------
SELECT 'Testing Trigger tr_UpdateResourceStock' AS Test;
-- Check initial stock of Arabaica SL28 Seedlings (ID 1)
SELECT stock_quantity FROM resources WHERE resource_id = 1;

CALL sp_RecordDistribution(1, 1, 1, 100);

-- Verify stock was decremented automatically by trigger
SELECT stock_quantity FROM resources WHERE resource_id = 1;

-- Test insufficient stock (should fail)
-- SELECT 'Testing Insufficient Stock Error' AS Test;
-- CALL sp_RecordDistribution(1, 1, 1, 10000); 



-- 4. Test User Roles (Simulation/Check)
-- ----------------------------------------------------------
SELECT 'Checking Roles and Users' AS Test;
SELECT USER, HOST FROM mysql.user WHERE user IN ('admin_user', 'ministry_official', 'extensionWorker', 'farmer');
SHOW GRANTS FOR 'ministry_official'@'%';
SHOW GRANTS FOR 'admin_user'@'%';
SHOW GRANTS FOR 'farmer'@'%';
SHOW GRANTS FOR 'extensionWorker'@'%';


ALTER TABLE advice_sessions DROP FOREIGN KEY advice_sessions_ibfk_1;
ALTER TABLE advice_sessions CHANGE COLUMN farmer_id farm_id INT NOT NULL;
ALTER TABLE advice_sessions RENAME INDEX farmer_id TO farm_id;

-- 4. Add the new foreign key constraint referencing the farms table
ALTER TABLE advice_sessions ADD CONSTRAINT advice_sessions_ibfk_1 
    FOREIGN KEY (farm_id) REFERENCES farms(farm_id) 
    ON DELETE CASCADE;


SELECT 
    f.farmer_id,
    u.first_name,
    u.last_name,
    COUNT(fm.farm_id) AS total_farms
FROM farmers f
JOIN users u ON f.farmer_id = u.person_id
JOIN farms fm ON f.farmer_id = fm.farmer_id
GROUP BY f.farmer_id, u.first_name, u.last_name
HAVING COUNT(fm.farm_id) > 1;


CREATE TABLE advice_sessions (
  session_id int NOT NULL AUTO_INCREMENT,
  farm_id int NOT NULL,
  worker_id int NOT NULL,
  session_date date NOT NULL,
  notes_topics text,
  PRIMARY KEY (session_id),
  KEY farm_id (farm_id),
  KEY worker_id (worker_id),
  CONSTRAINT advice_sessions_ibfk_1 FOREIGN KEY (farm_id) REFERENCES farms (farm_id) ON DELETE CASCADE,
  CONSTRAINT advice_sessions_ibfk_2 FOREIGN KEY (worker_id) REFERENCES extension_workers (worker_id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SHOW DATABASES;


-- test the insufficient stock procedure Arabica SL28 Seedlings)
SELECT stock_quantity INTO @current_stock 
FROM resources 
WHERE resource_id = 1;

-- Attempt to distribute more than available 

CALL sp_RecordDistribution(1, 1, 1, @current_stock + 1);


SELECT stock_quantity 
FROM resources 
WHERE resource_id = 1;


DROP TABLE IF EXISTS audit_log;