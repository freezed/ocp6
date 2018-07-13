-- create-db.sql

DROP DATABASE IF EXISTS ocp6;
CREATE DATABASE ocp6;
USE ocp6;

CREATE TABLE address(
    `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `label` VARCHAR(30) NOT NULL,
    `name` VARCHAR(30) NOT NULL,
    `line1` VARCHAR(30) NOT NULL,
    `line2` VARCHAR(30),
    `zip` VARCHAR(30) NOT NULL,
    `city` VARCHAR(30) NOT NULL
) ENGINE=INNODB;

CREATE TABLE ingredient(
    `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `label` VARCHAR(30) NOT NULL,
    `unit` VARCHAR(30) NOT NULL
) ENGINE=INNODB;

CREATE TABLE payment_solution(
    `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `label` VARCHAR(30) NOT NULL
) ENGINE=INNODB;

CREATE TABLE pizza(
    `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(30) NOT NULL,
    `unit_price_ex_tax` DECIMAL(6,2),
    `tax_rate100` DECIMAL(6,2)
) ENGINE=INNODB;

CREATE TABLE phone(
    `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `number` VARCHAR(30) NOT NULL
) ENGINE=INNODB;

CREATE TABLE client(
    `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `billing_address_id` SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `fk_client_billing_address`
        FOREIGN KEY(billing_address_id)
        REFERENCES address(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    `delivery_address_id` SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `fk_client_delivery_address`
        FOREIGN KEY(delivery_address_id)
        REFERENCES address(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    `phone_id` SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `fk_client_phone`
        FOREIGN KEY(phone_id)
        REFERENCES phone(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    `1st_name` VARCHAR(30) NOT NULL,
    `name` VARCHAR(30) NOT NULL,
    `login` VARCHAR(30) NOT NULL,
    `password` VARCHAR(30) NOT NULL
) ENGINE=INNODB;

CREATE TABLE composition(
    `pizza_id` SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `fk_composition_pizza`
        FOREIGN KEY (pizza_id)
        REFERENCES pizza(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    `ingredient_id` SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `fk_composition_ingredient`
        FOREIGN KEY(ingredient_id)
        REFERENCES ingredient(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    `quantity` DECIMAL(6,2)
) ENGINE=INNODB;

CREATE TABLE employee(
    `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `address_id` SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `fk_employee_address`
        FOREIGN KEY(address_id)
        REFERENCES address(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    `phone_id` SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `fk_phone_employee`
        FOREIGN KEY (phone_id)
        REFERENCES  phone(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    `1st_name` VARCHAR(30) NOT NULL,
    `name` VARCHAR(30) NOT NULL
) ENGINE=INNODB;

CREATE TABLE restaurant(
    `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `address_id` SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `fk_restaurant_address`
        FOREIGN KEY (address_id)
        REFERENCES  address(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    `name` VARCHAR(30) NOT NULL,
    `phone_id` SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `fk_restaurant_hone`
        FOREIGN KEY(phone_id)
        REFERENCES phone(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB;

CREATE TABLE basket(
    `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `employee_id` SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `fk_basket_employee`
        FOREIGN KEY(employee_id)
        REFERENCES employee(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    `client_id` SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `fk_basket_client`
        FOREIGN KEY(client_id)
        REFERENCES client(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    `restaurant_id` SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `fk_basket_restaurant`
        FOREIGN KEY(restaurant_id)
        REFERENCES restaurant(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    `invoice_num` VARCHAR(30) NOT NULL,
    `date` DATE,
    `status` VARCHAR(30) NOT NULL
) ENGINE=INNODB;

CREATE TABLE line_basket(
    `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `basket_id` SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `fk_line_basket_basket`
        FOREIGN KEY(basket_id)
        REFERENCES basket(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    `pizza_id` SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `fk_line_basket_pizza`
        FOREIGN KEY(pizza_id)
        REFERENCES pizza(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    `date` DATE,
    `quantity` INTEGER,
    `tax_rate100` DECIMAL(6,2),
    `unit_price_ex_tax` DECIMAL(6,2)
) ENGINE=INNODB;

CREATE TABLE payment_history(
    `payment_solution_id` SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `fk_payment_history_payment_solution`
        FOREIGN KEY(payment_solution_id)
        REFERENCES payment_solution(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    `basket_id` SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `fk_payment_history_basket`
        FOREIGN KEY(basket_id)
        REFERENCES basket(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    `amount` DECIMAL(6,2),
    `date` DATE
) ENGINE=INNODB;

CREATE TABLE stock(
    `ingredient_id` SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `fk_stock_ingredient`
        FOREIGN KEY(ingredient_id)
        REFERENCES ingredient(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    `restaurant_id` SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `fk_stock_restaurant`
        FOREIGN KEY(restaurant_id)
        REFERENCES restaurant(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    `quantity` DECIMAL(6,2)
) ENGINE=INNODB;
