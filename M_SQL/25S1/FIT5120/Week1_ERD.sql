CREATE DATABASE FIT5120;
USE FIT5120;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    budget DECIMAL(10,2) DEFAULT 60.00,
    skin_type VARCHAR(20),
    location VARCHAR(100)
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category ENUM('Sunscreen', 'Clothing', 'Hat', 'Glasses', 'Other') NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK(price >= 0), 
    stock_quantity INT DEFAULT 0
);

CREATE TABLE weather (
    weather_id INT AUTO_INCREMENT PRIMARY KEY,
    UV_index INT CHECK(UV_index BETWEEN 0 AND 15),
    temperature FLOAT,
    location VARCHAR(100)
);

CREATE TABLE user_option (
    behavior_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    weather_id INT,  
    purchase_date DATE,
    feedback TEXT,
    purchase_price DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE SET NULL,
    FOREIGN KEY (weather_id) REFERENCES Weather(weather_id) ON DELETE SET NULL
);

show databases;
desc user_option;
select * from users;