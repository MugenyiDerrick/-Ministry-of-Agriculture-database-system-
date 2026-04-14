DROP TRIGGER tr_UpdateResourceStock;
CREATE DEFINER=`root`@`localhost` TRIGGER `tr_UpdateResourceStock` AFTER INSERT ON `distributions` FOR EACH ROW BEGIN
    UPDATE resources
    SET stock_quantity = stock_quantity - NEW.quantity_distributed
    WHERE resource_id = NEW.resource_id;
END;