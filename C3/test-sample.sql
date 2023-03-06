CALL AutoShopDB.get_filtered_cars(2012, 10000000, "Atlas");
CALL AutoShopDB.get_reviews(1);
CALL AutoShopDB.add_comment("What an amazing selllerrrr", 4.9, 1, 1);
CALL AutoShopDB.show_sellers_within(100, 1);
--this is to be run after the database in C2 has been constructed