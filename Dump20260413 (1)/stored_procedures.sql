DROP PROCEDURE sp_RecordDistribution;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RecordDistribution`(
    IN p_farm_id INT,
    IN p_official_id INT,
    IN p_resource_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE v_current_stock INT;
    
    -- Check current stock level
    SELECT stock_quantity INTO v_current_stock 
    FROM resources 
    WHERE resource_id = p_resource_id;
    
    IF v_current_stock >= p_quantity THEN
        INSERT INTO distributions (farm_id, official_id, resource_id, quantity_distributed, distribution_date)
        VALUES (p_farm_id, p_official_id, p_resource_id, p_quantity, CURDATE());
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient stock for distribution';
    END IF;
END

DROP PROCEDURE sp_UpdateProduction;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdateProduction`(
    IN p_production_id INT,
    IN p_new_quantity DECIMAL(10,2)
)
BEGIN
    UPDATE productions
    SET quantity_kg = p_new_quantity
    WHERE production_id = p_production_id;
END