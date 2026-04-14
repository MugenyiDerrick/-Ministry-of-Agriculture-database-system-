-- Create users
CREATE USER 'admin_user'@'%' IDENTIFIED BY 'AdminPass123';
CREATE USER 'farmer'@'%' IDENTIFIED BY 'farmerPass123';
CREATE USER 'extensionWorker'@'%' IDENTIFIED BY 'extensionWorkerPass123';
CREATE USER 'ministryOfficial'@'%' IDENTIFIED BY 'ministryOfficialPass123';

-- =========================
-- ADMIN USER (Full control)
-- =========================
GRANT ALL PRIVILEGES ON *.* TO 'admin_user'@'%' WITH GRANT OPTION;

-- =========================
-- FARMER
-- (Can only manage own data – basic CRUD on farmer-related tables)
-- =========================
GRANT SELECT, INSERT, UPDATE 
ON coffee_db.farmers TO 'farmer'@'%';

GRANT SELECT, INSERT, UPDATE 
ON coffee_db.production TO 'farmer'@'%';

-- =========================
-- MINISTRY OFFICIAL
-- Read-only: farmers & production
-- Read/Write: distribution
-- =========================
GRANT SELECT 
ON coffee_db.farmers TO 'ministryOfficial'@'%';

GRANT SELECT 
ON coffee_db.production TO 'ministryOfficial'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE 
ON coffee_db.distribution TO 'ministryOfficial'@'%';

-- =========================
-- EXTENSION WORKER
-- Can read farmer data and update farm visits / reports
-- =========================
GRANT SELECT 
ON coffee_db.farmers TO 'extensionWorker'@'%';

GRANT SELECT, INSERT, UPDATE 
ON coffee_db.farm_visits TO 'extensionWorker'@'%';

GRANT SELECT, INSERT, UPDATE 
ON coffee_db.reports TO 'extensionWorker'@'%';

-- Apply changes
FLUSH PRIVILEGES;