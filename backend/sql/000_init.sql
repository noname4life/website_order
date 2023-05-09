--https://www.postgresqltutorial.com/postgresql-indexes/postgresql-create-index/

CREATE SCHEMA business;

CREATE TABLE IF NOT EXISTS business.branch (
	pk SERIAL PRIMARY KEY,
	name VARCHAR(100) UNIQUE NOT NULL,
	address VARCHAR(255) UNIQUE NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
	deleted_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS business.product (
	pk SERIAL PRIMARY KEY,
	category_id INTEGER NOT NULL,
	name VARCHAR(100) UNIQUE NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
	deleted_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS business.product_category (
	pk SERIAL PRIMARY KEY,
	category VARCHAR(100) UNIQUE NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
	deleted_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS business.product_value (
	pk bigserial PRIMARY KEY,
	product_id INTEGER NOT NULL,
	value DECIMAL(12,2) NOT NULL,
	date_applied TIMESTAMP NOT NULL DEFAULT NOW(),
	is_latest BOOL NOT NULL DEFAULT TRUE,
	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
	deleted_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS business.customer (
	pk SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	mobile_number VARCHAR(100) NOT NULL,
	address VARCHAR(100) NOT NULL,
	email_address VARCHAR(100) UNIQUE NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
	deleted_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS business.sales_status (
	pk SERIAL PRIMARY KEY,
	status VARCHAR(100) UNIQUE NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
	deleted_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS business.invoice_status (
	pk SERIAL PRIMARY KEY,
	status VARCHAR(100) UNIQUE NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
	deleted_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS business.sales (
	pk bigserial PRIMARY KEY,
	date DATE NOT NULL,
	branch_id INTEGER NOT NULL,
	code VARCHAR(255) UNIQUE NOT NULL,
	customer_id INTEGER NOT NULL,
	status_id INTEGER NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
	deleted_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS business.sales_items (
	pk bigserial PRIMARY KEY,
	sales_id INTEGER NOT NULL,
	quantity INTEGER NOT NULL,
	product_id INTEGER NOT NULL,
	value_id INTEGER NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
	deleted_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS business.invoice (
	pk bigserial PRIMARY KEY,
	date DATE NOT NULL,
	sales_id INTEGER NOT NULL,
	code VARCHAR(50) UNIQUE NOT NULL,
	status_id INTEGER NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
	deleted_at TIMESTAMP
);

ALTER TABLE business.product_value
	ADD CONSTRAINT product_id_product_value_fk FOREIGN KEY (product_id) REFERENCES business.product (pk);

ALTER TABLE business.product
	ADD CONSTRAINT category_product_fk FOREIGN KEY (category_id) REFERENCES business.product_category (pk);

ALTER TABLE business.sales
	ADD CONSTRAINT branch_sales_fk FOREIGN KEY (branch_id) REFERENCES business.branch (pk);

ALTER TABLE business.sales
	ADD CONSTRAINT customer_sales_fk FOREIGN KEY (customer_id) REFERENCES business.customer (pk);

ALTER TABLE business.sales
	ADD CONSTRAINT status_sales_fk FOREIGN KEY (status_id) REFERENCES business.sales_status (pk);

ALTER TABLE business.sales_items
	ADD CONSTRAINT sales_id_sales_items_fk FOREIGN KEY (sales_id) REFERENCES business.sales (pk);

ALTER TABLE business.sales_items
	ADD CONSTRAINT product_sales_items_fk FOREIGN KEY (product_id) REFERENCES business.product (pk);

ALTER TABLE business.sales_items
	ADD CONSTRAINT product_value_sales_items_fk FOREIGN KEY (value_id) REFERENCES business.product_value (pk);

ALTER TABLE business.invoice
	ADD CONSTRAINT sales_invoice_fk FOREIGN KEY (sales_id) REFERENCES business.sales (pk);

ALTER TABLE business.invoice
	ADD CONSTRAINT status_invoice_fk FOREIGN KEY (status_id) REFERENCES business.invoice_status (pk);

ALTER TABLE business.product_value
	ADD CONSTRAINT unique_product_value_date UNIQUE(product_id, date_applied);

ALTER TABLE business.sales_items
	ADD CONSTRAINT unique_sales_items UNIQUE(sales_id, product_id);

ALTER TABLE business.sales_items
	ADD CONSTRAINT sales_items_quantity_greater_than_0 check (quantity > 0);

CREATE INDEX IF NOT EXISTS product_category_id_key ON business.product (category_id);

CREATE INDEX IF NOT EXISTS sales_branch_id_key ON business.sales (branch_id);

CREATE INDEX IF NOT EXISTS sales_customer_id_key ON business.sales (customer_id);

CREATE INDEX IF NOT EXISTS sales_status_id_key ON business.sales (status_id);

CREATE INDEX IF NOT EXISTS sales_items_sales_id_key ON business.sales_items (sales_id);

CREATE INDEX IF NOT EXISTS sales_items_product_id_key ON business.sales_items (product_id);

CREATE INDEX IF NOT EXISTS sales_items_value_id_key ON business.sales_items (value_id);

CREATE INDEX IF NOT EXISTS invoice_sales_id_key ON business.invoice (sales_id);

CREATE INDEX IF NOT EXISTS invoice_status_id_key ON business.invoice (status_id);
