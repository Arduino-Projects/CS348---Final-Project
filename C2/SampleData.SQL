INSERT INTO AutoShopDB.Manufacturer VALUES (NULL, "SpeedCars");
INSERT INTO AutoShopDB.Seller VALUES (NULL, "John Doe", "647 432 3213", "johndoe@gmail.com", "15.12521251, 19.1985215");
INSERT INTO AutoShopDB.Car VALUES (NULL, 'A FAST CAR', 'img.png', '$15.99', 100, 'not', 1, 1, 'Sienna', 2022);

INSERT INTO AutoShopDB.Manufacturer VALUES (NULL, "SlowCars");
INSERT INTO AutoShopDB.Seller VALUES (NULL, "Johnny Doe", "647 222 2121", "johndoe2@gmail.com", "72.48294124, 24.19491242");
INSERT INTO AutoShopDB.Car VALUES (NULL, 'slow :(', 'img.png', '$15.99', 100, 'yes', 1, 2, 'Atlas', 2012);

INSERT INTO AutoShopDB.Buyer VALUES (NULL, "Mark Johnny", "47.12831214, -12.12341231");
INSERT INTO AutoShopDB.Buyer VALUES (NULL, "John Johnny", "17.12831214, 42.12341231");

INSERT INTO AutoShopDB.Sale VALUES (NULL, date("2015-12-10"), 1, 2, 1);

INSERT INTO AutoShopDB.Reviews VALUES (NULL, "My favourite person in the world!", 5, date("2015-12-10"), 1, 1);
