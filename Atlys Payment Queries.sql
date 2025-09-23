-- Atlys Visa Refund SQL Project – 20 Questions Solution

-- 1. Show all users in the users table.
SELECT * FROM users;

-- 2. Show all orders where country = 'US'.
SELECT * FROM orders WHERE country = 'US';

-- 3. Display order_id, country, visa_type for orders where amount > 10000.
SELECT order_id, country, visa_type
FROM orders
WHERE amount > 10000;

-- 4. Display all failed payments (status = 'FAILED').
SELECT * FROM payments WHERE status = 'FAILED';

-- 5. List all unique visa types available.
SELECT DISTINCT visa_type FROM orders;

-- 6. Show all orders sorted by highest amount first.
SELECT * FROM orders ORDER BY amount DESC;

-- 7. Count number of orders per country.
SELECT country, COUNT(order_id) AS number_of_orders
FROM orders
GROUP BY country;

-- 8. Calculate total revenue per visa_type.
SELECT o.visa_type, SUM(o.amount) AS total_revenue
FROM orders o
JOIN payments p ON o.order_id = p.order_id
WHERE p.status = 'SUCCESS'
GROUP BY o.visa_type;

-- 9. Show country-wise average order amount.
SELECT country, AVG(amount) AS average_amount
FROM orders
GROUP BY country;

-- 10. Display order_id, user name, and payment status for all orders.
SELECT o.order_id, u.name AS user_name, p.status AS payment_status
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN payments p ON o.order_id = p.order_id;

-- 11. Display user name, country, and refund_amount for all refunded orders.
SELECT u.name AS user_name, o.country, r.refund_amount
FROM refunds r
JOIN payments p ON r.payment_id = p.payment_id
JOIN orders o ON p.order_id = o.order_id
JOIN users u ON o.user_id = u.user_id;

-- 12. Show employee name, user name, and amount for all failed payments.
SELECT e.employee_name, u.name AS user_name, o.amount
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN users u ON o.user_id = u.user_id
JOIN employees e ON o.employee_id = e.employee_id
WHERE p.status = 'FAILED';

-- 13. Show total refund amount processed by each employee.
SELECT e.employee_name, COALESCE(SUM(r.refund_amount), 0) AS total_refund_amount
FROM employees e
LEFT JOIN orders o ON e.employee_id = o.employee_id
LEFT JOIN payments p ON o.order_id = p.order_id
LEFT JOIN refunds r ON p.payment_id = r.payment_id
GROUP BY e.employee_name;

-- 14. Find all employees who processed more than 3 orders.
SELECT e.employee_name, COUNT(o.order_id) AS orders_processed
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
GROUP BY e.employee_name
HAVING COUNT(o.order_id) > 3;

-- 15. Find countries where total revenue > 30000.
SELECT o.country, SUM(o.amount) AS total_revenue
FROM orders o
JOIN payments p ON o.order_id = p.order_id
WHERE p.status = 'SUCCESS'
GROUP BY o.country
HAVING SUM(o.amount) > 30000;

-- 16. Find users whose total spending is higher than the average spending of all users.
-- This uses a subquery to first calculate the average spending across all users, then finds users who spent more than that average.
SELECT u.name, SUM(o.amount) AS user_total_spending
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN payments p ON o.order_id = p.order_id
WHERE p.status = 'SUCCESS'
GROUP BY u.user_id, u.name
HAVING SUM(o.amount) > (
    SELECT AVG(total_amount)
    FROM (
        SELECT SUM(o2.amount) AS total_amount
        FROM orders o2
        JOIN payments p2 ON o2.order_id = p2.order_id
        WHERE p2.status = 'SUCCESS'
        GROUP BY o2.user_id
    ) AS user_totals
);

-- 17. Find users who have never had a failed payment.
-- This query uses a subquery with NOT IN to exclude any user whose user_id appears in the set of users with failed payments.
SELECT name
FROM users
WHERE user_id NOT IN (
    SELECT o.user_id
    FROM orders o
    JOIN payments p ON o.order_id = p.order_id
    WHERE p.status = 'FAILED'
);

-- 18. For each employee, show total number of users they have served.
SELECT e.employee_name, COUNT(DISTINCT o.user_id) AS unique_users_served
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
GROUP BY e.employee_name;

-- 19. Show users who have both a SUCCESS and a FAILED payment.
-- This query groups by user and uses a HAVING clause to check that a user has records for both payment statuses.
SELECT u.name
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN payments p ON o.order_id = p.order_id
WHERE p.status IN ('SUCCESS', 'FAILED')
GROUP BY u.user_id, u.name
HAVING COUNT(DISTINCT p.status) = 2;

-- 20. FINAL TASK: Build an export-ready dataset for the refund bot.
-- This query selects necessary fields for failed payments that do not yet have a refund.
-- It joins the relevant tables and filters for FAILED payments where there is no matching record in the refunds table.
SELECT p.payment_id, u.name AS user_name, o.country, o.visa_type, o.amount,p.payment_date
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN users u ON o.user_id = u.user_id
LEFT JOIN refunds r ON p.payment_id = r.payment_id
WHERE p.status = 'FAILED'
  AND r.payment_id IS NULL  
ORDER BY p.payment_date ASC;

