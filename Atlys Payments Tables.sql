INSERT INTO users (user_id, name, email) VALUES
(1, 'Aarav Sharma', 'aarav@example.com'),
(2, 'Priya Singh', 'priya@example.com'),
(3, 'Rohan Verma', 'rohan@example.com'),
(4, 'Ishita Mehra', 'ishita@example.com'),
(5, 'Kabir Jain', 'kabir@example.com'),
(6, 'Ananya Gupta', 'ananya@example.com'),
(7, 'Dev Khanna', 'dev@example.com'),
(8, 'Meera Kapoor', 'meera@example.com'),
(9, 'Aditya Nair', 'aditya@example.com'),
(10, 'Sanya Malhotra', 'sanya@example.com');

INSERT INTO employees (employee_id, employee_name, role) VALUES
(1, 'Rahul Bansal', 'Visa Officer'),
(2, 'Sneha Iyer', 'Visa Officer'),
(3, 'Vikram Patel', 'Senior Visa Officer'),
(4, 'Neha Sinha', 'Visa Officer'),
(5, 'Amit Desai', 'Refund Specialist'),
(6, 'Karan Malhotra', 'Refund Specialist'),
(7, 'Pooja Reddy', 'Visa Officer'),
(8, 'Siddharth Saxena', 'Refund Specialist');

INSERT INTO orders (order_id, user_id, employee_id, country, visa_type, amount, order_date) VALUES
(1, 1, 1, 'US', 'Business Express', 20000, '2025-09-01'),
(2, 2, 2, 'US', 'Tourist Express', 18000, '2025-09-01'),
(3, 3, 3, 'US', 'Business', 16000, '2025-09-02'),
(4, 4, 4, 'US', 'Tourist', 14000, '2025-09-02'),

(5, 5, 5, 'UK', 'Business Express', 18000, '2025-09-03'),
(6, 6, 6, 'UK', 'Tourist Express', 16000, '2025-09-03'),
(7, 7, 7, 'UK', 'Business', 14000, '2025-09-04'),
(8, 8, 8, 'UK', 'Tourist', 12000, '2025-09-04'),

(9, 9, 1, 'Canada', 'Business Express', 17000, '2025-09-05'),
(10, 10, 2, 'Canada', 'Tourist Express', 15000, '2025-09-05'),
(11, 1, 3, 'Canada', 'Business', 13000, '2025-09-06'),
(12, 2, 4, 'Canada', 'Tourist', 11000, '2025-09-06'),

(13, 3, 5, 'Australia', 'Business Express', 16000, '2025-09-07'),
(14, 4, 6, 'Australia', 'Tourist Express', 14000, '2025-09-07'),
(15, 5, 7, 'Australia', 'Business', 12000, '2025-09-08'),
(16, 6, 8, 'Australia', 'Tourist', 10000, '2025-09-08'),

(17, 7, 1, 'Japan', 'Business Express', 15000, '2025-09-09'),
(18, 8, 2, 'Japan', 'Tourist Express', 13000, '2025-09-09'),
(19, 9, 3, 'Japan', 'Business', 11000, '2025-09-10'),
(20, 10, 4, 'Japan', 'Tourist', 9000, '2025-09-10'),

(21, 1, 5, 'Germany', 'Business Express', 14000, '2025-09-11'),
(22, 2, 6, 'Germany', 'Tourist Express', 12000, '2025-09-11'),
(23, 3, 7, 'Germany', 'Business', 10000, '2025-09-12'),
(24, 4, 8, 'Germany', 'Tourist', 8000, '2025-09-12'),

(25, 5, 1, 'Vietnam', 'Business Express', 8000, '2025-09-13'),
(26, 6, 2, 'Vietnam', 'Tourist Express', 6000, '2025-09-13'),
(27, 7, 3, 'Vietnam', 'Business', 4000, '2025-09-14'),
(28, 8, 4, 'Vietnam', 'Tourist', 2000, '2025-09-14'),

(29, 9, 5, 'Sri Lanka', 'Business Express', 500, '2025-09-15'),
(30, 10, 6, 'Sri Lanka', 'Tourist Express', 300, '2025-09-15'),
(31, 1, 7, 'Sri Lanka', 'Business', 199, '2025-09-16'),
(32, 2, 8, 'Sri Lanka', 'Tourist', 99, '2025-09-16');

INSERT INTO payments (payment_id, order_id, payment_date, status) VALUES
(1, 1, '2025-09-01', 'SUCCESS'),
(2, 2, '2025-09-01', 'FAILED'),
(3, 3, '2025-09-02', 'SUCCESS'),
(4, 4, '2025-09-02', 'FAILED'),
(5, 5, '2025-09-03', 'SUCCESS'),
(6, 6, '2025-09-03', 'SUCCESS'),
(7, 7, '2025-09-04', 'FAILED'),
(8, 8, '2025-09-04', 'SUCCESS');

INSERT INTO refunds (refund_id, payment_id, refund_date, refund_amount) VALUES
(1, 2, '2025-09-05', 18000),
(2, 4, '2025-09-06', 14000),
(3, 7, '2025-09-07', 14000);

select * from users;
select * from employees;
select * from orders;
select * from payments;
select * from refunds;
