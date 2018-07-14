SELECT `address`.`id`,
    `address`.`label`,
    `address`.`name`,
    `address`.`line1`,
    `address`.`line2`,
    `address`.`zip`,
    `address`.`city`
FROM `ocp6`.`address`;

SELECT `basket`.`id`,
    `basket`.`employee_id`,
    `basket`.`client_id`,
    `basket`.`restaurant_id`,
    `basket`.`invoice_num`,
    `basket`.`date`,
    `basket`.`status`
FROM `ocp6`.`basket`;

SELECT `client`.`id`,
    `client`.`billing_address_id`,
    `client`.`delivery_address_id`,
    `client`.`phone_id`,
    `client`.`1st_name`,
    `client`.`name`,
    `client`.`login`,
    `client`.`password`
FROM `ocp6`.`client`;

SELECT `composition`.`pizza_id`,
    `composition`.`ingredient_id`,
    `composition`.`quantity`
FROM `ocp6`.`composition`;

SELECT `employee`.`id`,
    `employee`.`address_id`,
    `employee`.`phone_id`,
    `employee`.`1st_name`,
    `employee`.`name`
FROM `ocp6`.`employee`;

SELECT `ingredient`.`id`,
    `ingredient`.`label`,
    `ingredient`.`unit`
FROM `ocp6`.`ingredient`;

SELECT `line_basket`.`id`,
    `line_basket`.`basket_id`,
    `line_basket`.`pizza_id`,
    `line_basket`.`date`,
    `line_basket`.`quantity`,
    `line_basket`.`tax_rate100`,
    `line_basket`.`unit_price_ex_tax`
FROM `ocp6`.`line_basket`;

SELECT `payment_history`.`payment_solution_id`,
    `payment_history`.`basket_id`,
    `payment_history`.`amount`,
    `payment_history`.`date`
FROM `ocp6`.`payment_history`;

SELECT `payment_solution`.`id`,
    `payment_solution`.`label`
FROM `ocp6`.`payment_solution`;

SELECT `phone`.`id`,
    `phone`.`number`
FROM `ocp6`.`phone`;

SELECT `pizza`.`id`,
    `pizza`.`name`,
    `pizza`.`unit_price_ex_tax`,
    `pizza`.`tax_rate100`
FROM `ocp6`.`pizza`;

SELECT `restaurant`.`id`,
    `restaurant`.`address_id`,
    `restaurant`.`name`,
    `restaurant`.`phone_id`
FROM `ocp6`.`restaurant`;

SELECT `stock`.`ingredient_id`,
    `stock`.`restaurant_id`,
    `stock`.`quantity`
FROM `ocp6`.`stock`;
