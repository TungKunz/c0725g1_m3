create database if not exists ss5_bai_tap;
use ss5_bai_tap;
CREATE TABLE products ( 
id INT PRIMARY KEY AUTO_INCREMENT, 
product_code VARCHAR(50) , 
product_name VARCHAR(100) , 
product_price DECIMAL(10,2) ,
product_amount INT, 
product_description TEXT, 
product_status VARCHAR(20) );


INSERT INTO Products ( product_code, product_name, product_price, product_amount, product_description, product_status) 
VALUES ('P001', 'Laptop Dell Inspiron 15', 18500.00, 10, 'Laptop Dell 15 inch, Intel i5, RAM 8GB, SSD 512GB', 'Available'), 
('P002', 'iPhone 15 Pro', 28999.00, 5, 'Điện thoại Apple iPhone 15 Pro 128GB', 'Available'),
('P003', 'Samsung Galaxy S24', 25999.00, 8, 'Điện thoại Samsung Galaxy S24 256GB', 'Available'), 
('P004', 'Tai nghe Sony WH-1000XM5', 7990.00, 15, 'Tai nghe chống ồn cao cấp Bluetooth', 'Out of Stock'), 
('P005', 'Bàn phím cơ Keychron K6', 2490.00, 20, 'Bàn phím cơ không dây Keychron K6 RGB', 'Available'); 



