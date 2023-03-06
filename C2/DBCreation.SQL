CREATE SCHEMA `AutoShopDB` ;

CREATE TABLE `AutoShopDB`.`Car` (
  `cid` INT NOT NULL AUTO_INCREMENT,
  `desc` VARCHAR(3000) NULL,
  `img_file` VARCHAR(100) NULL,
  `price` VARCHAR(15) NOT NULL,
  `odometer` INT NULL DEFAULT NULL,
  `sold` CHAR(3) NOT NULL,
  `sid` INT NOT NULL,
  `mid` INT NOT NULL,
  `make` VARCHAR(45) NOT NULL,
  `year` INT NOT NULL,
  PRIMARY KEY (`cid`));

CREATE TABLE `AutoShopDB`.`Manufacturer` (
  `mid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`mid`));

CREATE TABLE `AutoShopDB`.`Seller` (
  `sid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `number` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `location` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`sid`));

CREATE TABLE `AutoShopDB`.`Sale` (
  `said` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NULL,
  `bid` INT NULL,
  `cid` INT NULL,
  `sid` INT NULL,
  PRIMARY KEY (`said`));

CREATE TABLE `AutoShopDB`.`Buyer` (
  `bid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `location` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`bid`));

CREATE TABLE `AutoShopDB`.`Reviews` (
  `rid` INT NOT NULL AUTO_INCREMENT,
  `review` VARCHAR(3000) NULL,
  `rating` DECIMAL NOT NULL,
  `date` DATETIME NOT NULL,
  `bid` INT NOT NULL,
  `sid` INT NOT NULL,
  PRIMARY KEY (`rid`));


ALTER TABLE `AutoShopDB`.`Car` 
ADD INDEX `sid_idx` (`sid` ASC) VISIBLE;
ADD INDEX `mid_idx` (`mid` ASC) VISIBLE;
;
ALTER TABLE `AutoShopDB`.`Car` 
ADD CONSTRAINT `sid`
  FOREIGN KEY (`sid`)
  REFERENCES `AutoShopDB`.`Seller` (`sid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
ADD CONSTRAINT `mid`
  FOREIGN KEY (`mid`)
  REFERENCES `AutoShopDB`.`Manufacturer` (`mid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `AutoShopDB`.`Sale` 
ADD INDEX `bid_idx` (`bid` ASC) VISIBLE,
ADD INDEX `cid_idx` (`cid` ASC) VISIBLE,
ADD INDEX `sid_idx` (`sid` ASC) VISIBLE;
;
ALTER TABLE `AutoShopDB`.`Sale` 
ADD CONSTRAINT `bid`
  FOREIGN KEY (`bid`)
  REFERENCES `AutoShopDB`.`Buyer` (`bid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `cid`
  FOREIGN KEY (`cid`)
  REFERENCES `AutoShopDB`.`Car` (`cid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `sid_sale`
  FOREIGN KEY (`sid`)
  REFERENCES `AutoShopDB`.`Seller` (`sid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `AutoShopDB`.`Reviews` 
ADD INDEX `bid_idx` (`bid` ASC) VISIBLE,
ADD INDEX `sid_idx` (`sid` ASC) VISIBLE;
;
ALTER TABLE `AutoShopDB`.`Reviews` 
ADD CONSTRAINT `bid_rev`
  FOREIGN KEY (`bid`)
  REFERENCES `AutoShopDB`.`Buyer` (`bid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `sid_rev`
  FOREIGN KEY (`sid`)
  REFERENCES `AutoShopDB`.`Seller` (`sid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
