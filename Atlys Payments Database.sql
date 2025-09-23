CREATE DATABASE IF NOT EXISTS atlys_refund;
USE atlys_refund;

-- USERS
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

-- EMPLOYEES
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    role VARCHAR(50)
);

-- ORDERS
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    employee_id INT,
    country VARCHAR(50),
    visa_type VARCHAR(50),
    amount INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- PAYMENTS
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    status ENUM('SUCCESS','FAILED'),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- REFUNDS
CREATE TABLE refunds (
    refund_id INT PRIMARY KEY,
    payment_id INT,
    refund_date DATE,
    refund_amount INT,
    FOREIGN KEY (payment_id) REFERENCES payments(payment_id)
);
