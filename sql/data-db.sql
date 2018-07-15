-- data-db.sql

INSERT INTO `ocp6`.`address`(`label`,`name`,`line1`,`line2`,`zip`,`city`)VALUES
("luke","lucky luke","grand rue","saloon",01000,"Bourg-en-Bresse"),
("cachette","tintin","51, rue de la discretion","chut",02000,"Laons"),
("moulinsart","Capitaine Haddock","Chateau","Moulinsart",03000,"Moulins"),
("maison","Largo Winch","1, boulevard de la bourse","bat. B",04000,"Dignes-les-bains"),
("hiver","Largo Winch","23, rue des Écrins","3ème étage",05000,"Gap"),
("bureau","Gaston Lagaffe","72, rue du Puit","",06000,"Nice"),
("village","Astérix","Centre village","",07000,"Privas"),
("domicile","jesse custer","3, rue des prés","",08000,"Charleville-Mézière"),
("domicile","claudia cristiani","51, place de la gare","",09000,"Foix"),
("domicile","litteul kevin","82, rue du pont","",10000,"Troyes"),
("domicile","bronsky proko","69, rue tabaga","",11000,"Carcassonne"),
("napoli","napoli","16, rue fondriest","",12000,"Rodez"),
("milano","milano","12, av, st jacques","",13000,"Marseille"),
("torino","torino","105, avenue de geole","",14000,"Caen"),
("roma","roma","65, bld de l'hôtel de ville","",15000,"Aurillac");

INSERT INTO `ocp6`.`ingredient`(`label`,`unit`)VALUES
("bœuf","g"),
("champigon","g"),
("emmental","g"),
("jambon","g"),
("mozzarella","g"),
("œuf","unité"),
("oignon","g"),
("parmesan","g"),
("olive","g"),
("origan","g"),
("pate","g"),
("poivrons","g"),
("tomate","g");

INSERT INTO `ocp6`.`payment_solution`(`label`)VALUES
("paypal");

INSERT INTO `ocp6`.`pizza`(`name`,`unit_price_ex_tax`,`tax_rate100`)VALUES
("calzone",6.50,5.50),
("caprese",7.00,5.50),
("margarita",7.50,5.50),
("pino",8.00,5.50),
("reine",8.50,5.50),
("sorrentina",8.00,5.50);

INSERT INTO `ocp6`.`phone`(`number`)VALUES
("0102030401"),
("0102030402"),
("0102030403"),
("0102030404"),
("0102030405"),
("0102030406"),
("0102030407"),
("0102030408"),
("0102030409"),
("0102030410"),
("0102030411"),
("0102030412");

INSERT INTO `ocp6`.`restaurant`(`address_id`,`name`,`phone_id`)VALUES
(12,"napoli",6),
(13,"milano",7),
(14,"torino",8);

INSERT INTO `ocp6`.`client`(`billing_address_id`,`delivery_address_id`,`phone_id`,`1st_name`,`name`,`login`,`password`)VALUES
(1,1,1,"lucky","luke","LuckyLuke","«j»xp'«'-« xz'"),
(2,3,2,"tin","tin","reporter","bé(@«b (@é)"),
(4,5,3,"largo","winch","superlargo","pkoèdqo@"),
(6,6,4,"gaston","lagaffe","menfin","uie,k yxsqc,"),
(7,7,5,"ast","érix","asterixlegaulois","b@ -ql(('");

INSERT INTO `ocp6`.`employee`(`address_id`,`phone_id`,`1st_name`,`name`)VALUES
(8,9,"jesse","custer"),
(9,10,"claudia","cristiani"),
(10,11,"litteul","kevin"),
(11,12,"bronsky","proko");

INSERT INTO `ocp6`.`composition`(`pizza_id`,`ingredient_id`,`quantity`)VALUES
(1,11,60),
(1,4,70),
(1,3,40),
(1,2,70),
(2,11,60),
(2,7,40),
(2,6,1),
(2,5,40),
(3,11,60),
(3,10,60),
(3,9,70),
(3,8,50),
(4,13,60),
(4,12,70),
(4,11,60),
(4,1,40),
(5,11,60),
(5,4,50),
(5,3,60),
(5,2,50),
(6,11,60),
(6,7,1),
(6,6,1),
(6,5,50);

INSERT INTO `ocp6`.`basket`(`employee_id`,`client_id`,`restaurant_id`,`invoice_num`,`date`,`status`)VALUES
(4,1,2,"18000001","2018-01-29 11:11:11","archive"),
(2,2,1,"18000002","2028-01-30 10:10:10","archive"),
(3,3,1,"18000003","2018-01-31 09:09:09","cancel"),
(4,1,2,"18000004","2018-02-01 05:05:05","deliver"),
(1,5,3,"18000005","2018-02-01 06:06:06","deliver"),
(2,4,1,"18000006","2018-02-01 08:08:08","draft");

INSERT INTO `ocp6`.`line_basket`(`basket_id`,`pizza_id`,`quantity`,`tax_rate100`,`unit_price_ex_tax`)VALUES
(1,5,2,5.5,8.50),
(1,6,2,5.5,8.00),
(2,5,1,5.5,8.50),
(3,1,3,5.5,6.50),
(4,2,1,5.5,7.00),
(5,4,2,5.5,8.00),
(5,3,2,5.5,7.50),
(6,2,1,5.5,7.00),
(6,5,3,5.5,8.50);

INSERT INTO `ocp6`.`payment_history`(`payment_solution_id`,`basket_id`,`amount`,`date`)VALUES
(1,1,33,"2018-01-29 11:11:11"),
(1,2,8.5,"2028-01-30 10:10:10"),
(1,3,19.5,"2018-01-31 09:09:09"),
(1,4,7,"2018-02-01 05:05:05"),
(1,5,31,"2018-02-01 06:06:06"),
(1,6,32.5,"2018-02-01 08:08:08");

INSERT INTO `ocp6`.`stock`(`ingredient_id`,`restaurant_id`,`quantity`)VALUES
(1,1,3200),
(2,1,2200),
(3,1,3100),
(4,1,2800),
(5,1,2900),
(6,1,24),
(7,1,3000),
(8,1,2800),
(9,1,2600),
(10,1,3300),
(11,1,3400),
(12,1,2900),
(13,1,3100),
(1,2,3200),
(2,2,0),
(3,2,3100),
(4,2,2800),
(5,2,2900),
(6,2,16),
(7,2,3000),
(8,2,2800),
(9,2,2600),
(10,2,3300),
(11,2,3400),
(12,2,2900),
(13,2,3100),
(1,3,3200),
(2,3,2200),
(3,3,3100),
(4,3,2800),
(5,3,2900),
(6,3,52),
(7,3,3000),
(8,3,2800),
(9,3,2600),
(10,3,3300),
(11,3,3400),
(12,3,2900),
(13,3,3100);
