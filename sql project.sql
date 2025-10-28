CREATE DATABASE OnlineBookstore;
USE OnlineBookstore;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Customers (customer_id,name, email, phone, address)
VALUES
(1,'Alice Smith', 'alice.smith@example.com', '555-1010', '123 Maple St, Springfield'),
(2,'Bob Johnson', 'bob.johnson@example.com', '555-2020', '45 Oak Ave, Rivertown'),
(3,'Charlie Brown', 'charlie.brown@example.com', '555-3030', '78 Pine Rd, Hillview'),
(4,'Diana Prince', 'diana.prince@example.com', '555-4040', '99 Elm Blvd, Metropolis'),
(5,'Ethan Hunt', 'ethan.hunt@example.com', '555-5050', '12 Cedar Ln, Riverdale'),
(6,'Fiona Gallagher', 'fiona.g@example.com', '555-6060', '345 Birch St, Lakewood'),
(7,'George Miller', 'george.miller@example.com', '555-7070', '23 Willow Dr, Bayside'),
(8,'Hannah Lee', 'hannah.lee@example.com', '555-8080', '789 Cherry Ct, Brookfield'),
(9,'Ian Wright', 'ian.wright@example.com', '555-9090', '56 Magnolia Rd, Fairfield'),
(10,'Jasmine Patel', 'jasmine.patel@example.com', '555-1111', '210 Ash St, Crestview'),
(11,'Kevin Lopez', 'kevin.lopez@example.com', '555-1212', '67 Spruce Ave, Westfield'),
(12,'Laura Kim', 'laura.kim@example.com', '555-1313', '321 Palm St, Eastwood'),
(13,'Michael Davis', 'michael.davis@example.com', '555-1414', '19 Fir Rd, Lakeside'),
(14,'Nina Torres', 'nina.torres@example.com', '555-1515', '400 Poplar St, Hillcrest'),
(15,'Oliver Stone', 'oliver.stone@example.com', '555-1616', '86 Sycamore Ln, Greenwood'),
(16,'Paula Robinson', 'paula.robinson@example.com', '555-1717', '300 Oakwood Dr, Pleasantville'),
(17,'Quincy Adams', 'quincy.adams@example.com', '555-1818', '14 Cypress Blvd, Riverbend'),
(18,'Rachel Green', 'rachel.green@example.com', '555-1919', '120 Linden Ave, Sunnyside'),
(19,'Sam Wilson', 'sam.wilson@example.com', '555-2021', '500 Walnut Rd, Cedar Grove'),
(20,'Tina Chen', 'tina.chen@example.com', '555-2122', '220 Redwood St, Parkview');

CREATE TABLE Authors (
    author_id INT  PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    biography TEXT,
    country VARCHAR(50)
);

INSERT INTO Authors (author_id,name, biography, country)
VALUES
(1,'J.K. Rowling', 'British author of the Harry Potter series.', 'United Kingdom'),
(2,'George R.R. Martin', 'American novelist known for A Song of Ice and Fire.', 'United States'),
(3,'Stephen King', 'Prolific author of horror and supernatural fiction.', 'United States'),
(4,'Agatha Christie', 'Famous British writer known for detective novels.', 'United Kingdom'),
(5,'Paulo Coelho', 'Brazilian author of The Alchemist and many others.', 'Brazil'),
(6,'Suzanne Collins', 'Author of The Hunger Games trilogy.', 'United States'),
(7,'Dan Brown', 'Author known for The Da Vinci Code and thrillers.', 'United States'),
(8,'Haruki Murakami', 'Japanese author blending surrealism and realism.', 'Japan'),
(9,'Khaled Hosseini', 'Afghan-American novelist known for The Kite Runner.', 'Afghanistan'),
(10,'Margaret Atwood', 'Canadian author known for The Handmaid’s Tale.', 'Canada');

CREATE TABLE Categories (
    author_id int,
    category_id INT auto_increment PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);



INSERT INTO Categories (author_id,name)
VALUES
(1,'Fantasy'),
(2,'Thriller'),
(3,'Mystery'),
(4,'Science Fiction'),
(5,'Romance'),
(6,'Adventure'),
(7,'Drama'),
(8,'Horror'),
(9,'Historical Fiction'),
(10,'Philosophy');
select * from categories;

-- List all customers — Retrieve all columns from the Customers table.
SELECT * FROM Customers;

-- Get names and emails of all customers.
SELECT name, email FROM Customers;

-- Find all authors from the United Kingdom.
SELECT name FROM Authors WHERE country = 'United Kingdom';

-- Show all category names.

SELECT name FROM Categories;

-- Count how many customers are from each city (hint: use substring or pattern match).
SELECT SUBSTRING_INDEX(address, ',', -1) AS city, COUNT(*) AS total_customers
FROM Customers
GROUP BY city;

-- List authors from countries starting with the letter ‘U’.
SELECT * FROM Authors WHERE country LIKE 'U%';
 
-- Find customers whose names start with the letter ‘J’.
SELECT * FROM Customers WHERE name LIKE 'J%';
 
 -- Retrieve the newest customers (based on created_at).
 SELECT * FROM Customers ORDER BY created_at DESC LIMIT 5;



-- INNER JOIN — Find authors and the categories they typically write in
SELECT a.name as author_name, c.name as category_name
FROM Authors as a
INNER JOIN categories as c
ON a.author_id = c.author_id;

-- LEFT JOIN — Show all categories and any authors writing in them
SELECT c.name AS category_name, a.name AS author_name
FROM Categories c
LEFT JOIN Authors as a 
ON c.author_id = a.author_id;
