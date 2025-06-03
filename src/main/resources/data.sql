-- Insert Users
INSERT INTO users (id, email, password) VALUES
(1, 'admin@bank.com', '$2a$10$XURPShlN1q2ZdbWvh4hL6e3Wj1oFzX1q8w9XbX8XzX8XzX8XzX8z'), -- Password: admin123
(2, 'manager@bank.com', '$2a$10$YURPShlN1q2ZdbWvh4hL6e3Wj1oFzX1q8w9XbX9XzX9XzX9XzX9z'), -- Password: manager123
(3, 'staff@bank.com', '$2a$10$ZURPShlN1q2ZdbWvh4hL6e3Wj1oFzX1q8w9XbX0XzX0XzX0XzX0z'); -- Password: staff123
SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));

-- Insert User Roles
INSERT INTO user_roles (user_id, role) VALUES
(1, 'sys_admin'),
(2, 'bank_manager'),
(3, 'bank_staff');

-- Insert Customers
INSERT INTO customers (id, name, email, account_number) VALUES
(1, 'John Doe', 'john@customer.com', 'ACC001'),
(2, 'Jane Smith', 'jane@customer.com', 'ACC002'),
(3, 'Bob Johnson', 'bob@customer.com', 'ACC003');
SELECT setval('customers_id_seq', (SELECT MAX(id) FROM customers));

-- Insert Transactions
INSERT INTO transactions (id, transaction_ref, account_number, amount, status, transaction_time, narration) VALUES
(1, 'TXN001', 'ACC001', 1000.00, 'COMPLETED', '2025-06-01 10:00:00', 'deposit'),
(2, 'TXN002', 'ACC002', 500.00, 'PENDING', '2025-06-02 12:00:00', 'withdrawal'),
(3, 'TXN003', 'ACC001', 750.00, 'FAILED', '2025-06-02 15:30:00', 'deposit'),
(4, 'TXN004', 'ACC003', 2000.00, 'COMPLETED', '2025-06-03 09:00:00', 'withdrawal');
SELECT setval('transactions_id_seq', (SELECT MAX(id) FROM transactions));