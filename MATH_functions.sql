-- MATH Functions
USE date_test_db;

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- Insert sample data into the 'products' table
INSERT INTO products (product_name, price, stock_quantity) VALUES
('Laptop', 999.99, 150),
('Smartphone', 499.50, 233),
('Headphones', 75.75, 450),
('Keyboard', 125.10, 80),
('Mouse', 25.80, 101);

-- ROUND(),FLOOR(),CEIL()
SELECT
    product_name, price AS original_price,
    ROUND(price) AS rounded,
    ROUND(price,1) AS rounded_to_one_dec,
    FLOOR(price) AS floored,
    CEIL(price) AS ceiled
FROM products;

SELECT ROUND(123.4567 , 2);

-- MOD()
SELECT
    product_name,
    stock_quantity,
    MOD(stock_quantity, 2) AS is_odd
FROM products
WHERE MOD(stock_quantity, 2) = 1;