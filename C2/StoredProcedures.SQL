USE `AutoShopDB`;
DROP procedure IF EXISTS `get_filtered_cars`;

DELIMITER $$
USE `AutoShopDB`$$
CREATE PROCEDURE `get_filtered_cars`(IN make_year int, IN odometer_max int, IN make_wanted varchar(45))
BEGIN
	SELECT * from AutoShopDB.Car WHERE (make_year = 0 OR year >= make_year) AND (odometer_max = 0 OR odometer <= odometer_max) AND (make_wanted = "" OR make = make_wanted);
END$$

DELIMITER ;
;



USE `AutoShopDB`;
DROP procedure IF EXISTS `get_reviews`;

DELIMITER $$
USE `AutoShopDB`$$
CREATE PROCEDURE `get_reviews` (IN car_id int)
BEGIN
SELECT * FROM Reviews WHERE sid = (SELECT sid FROM Car WHERE Car.cid = car_id);
END$$

DELIMITER ;



USE `AutoShopDB`;
DROP procedure IF EXISTS `add_comment`;

DELIMITER $$
USE `AutoShopDB`$$
CREATE PROCEDURE `add_comment` (IN review varchar(3000), IN rating decimal, IN buyer_id int, IN seller_id INT)
BEGIN
	INSERT INTO AutoShopDB.Reviews VALUES (NULL, review, rating, NOW(), buyer_id, seller_id);
END$$

DELIMITER ;





USE `AutoShopDB`;
DROP procedure IF EXISTS `show_sellers_within`;

DELIMITER $$
USE `AutoShopDB`$$
CREATE PROCEDURE `show_sellers_within` (IN distance int, IN buyer_id int)
BEGIN
	SELECT * FROM Car WHERE ABS((SELECT location FROM Buyer WHERE buyer_id = Buyer.bid) - (SELECT location FROM Seller WHERE Seller.sid = Car.sid)) <= distance;
END$$

DELIMITER ;


USE `AutoShopDB`;
DROP procedure IF EXISTS `modify_comment`;


DELIMITER $$
USE `AutoShopDB`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `modify_comment`(IN commentId int, IN commentStr varchar(3000))
BEGIN
	UPDATE AutoShopDB.Reviews
	SET review = commentStr
	WHERE rid = commentId; 
END$$

DELIMITER ;
;


USE `AutoShopDB`;
DROP procedure IF EXISTS `delete_comment`;

DELIMITER $$
USE `AutoShopDB`$$
CREATE PROCEDURE `delete_comment` (IN commentId int)
BEGIN
	DELETE FROM AutoShopDB.Reviews
    WHERE rid = commentId;
END$$

DELIMITER ;
