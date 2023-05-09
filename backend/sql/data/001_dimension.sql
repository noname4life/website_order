INSERT INTO business.branch (name, address) VALUES
    ('Glorietta 4', 'Makati, Luzon'),
    ('Gaisano Ilo-ilo', 'Ilo-ilo, Visayas'),
    ('J & R Zamboanga', 'Zamboanga, Mindanao');

INSERT INTO business.product_category (category) VALUES
    ('Food'),
    ('Drinks');

INSERT INTO business.product (name, category_id) VALUES
    ('Hamburger', 1),
    ('Chicken', 1),
    ('Siomai', 1),
    ('Shark''s Fin', 1),
    ('Steak', 1),
    ('Bangus', 1),
    ('Pepsi', 2),
    ('Sprite', 2),
    ('Bottled Water', 2);

INSERT INTO business.product_value(product_id, value) VALUES
    (1, 100.00),
    (2, 120.00),
    (3, 25.00),
    (4, 25.00),
    (5, 250.00),
    (6, 110.00),
    (7, 20.00),
    (8, 20.00),
    (9, 15.00);

INSERT INTO business.sales_status (status) VALUES
    ('Ordered'),
    ('Processing'),
    ('Done'),
    ('Cancelled');

INSERT INTO business.invoice_status (status) VALUES
    ('Pending'),
    ('Done'),
    ('Cancelled');
