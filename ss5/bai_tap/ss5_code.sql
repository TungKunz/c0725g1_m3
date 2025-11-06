use ss5_bai_tap;

select * from products;

EXPLAIN SELECT id, product_code, product_name, product_price
FROM products
WHERE product_name LIKE 'iPhone %'
ORDER BY product_name, product_price;

EXPLAIN SELECT id, product_code, product_name, product_price
FROM products
WHERE product_name = 'Samsung Galaxy S24'
ORDER BY product_price;

CREATE UNIQUE INDEX i_product ON products(product_code);
CREATE INDEX idx_products_name_price ON products(product_name, product_price);

EXPLAIN SELECT id, product_code, product_name, product_price
FROM products
WHERE product_name LIKE 'iPhone %'
ORDER BY product_name, product_price;

EXPLAIN SELECT id, product_code, product_name, product_price
FROM products
WHERE product_name = 'Samsung Galaxy S24'
ORDER BY product_price;

CREATE OR REPLACE VIEW v_products_basic AS
SELECT
    product_code,
    product_name,
    product_price,
    product_status
FROM products;

ALTER VIEW v_products_basic AS
SELECT
    product_code,
    product_name,
    product_price,
    product_status,
    product_amount
FROM products;

select * from v_products_basic;

DELIMITER //
CREATE PROCEDURE sp_products_get_all()
BEGIN
    SELECT
        id, product_code, product_name, product_price,
        product_amount, product_description, product_status
    FROM products
    ORDER BY id;
END //
DELIMITER 

DELIMITER //
CREATE PROCEDURE insert_product()
BEGIN
    insert into products(product_code, product_name, product_price,
        product_amount, product_description, product_status)
    values('P006', 'HỒ VIẾT TÙNG', 99999.00, 99, 'Laptop Asus Tuf Gaming', 'provip');
END //
DELIMITER 

DELIMITER //
CREATE PROCEDURE delete_product_by_id(in p_id int)
BEGIN
    delete from products
    where id=p_id;
END //
DELIMITER 

-- Xoá theo id
CALL delete_product_by_id(4);
select * from products;
