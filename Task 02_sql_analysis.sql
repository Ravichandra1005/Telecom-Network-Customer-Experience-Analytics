-- Creating a new database for the telecom analysis project
CREATE DATABASE task2SQL_Analysis;

-- Selecting the database to use
USE task2SQL_Analysis;

-- Creating customers table containing customer details.
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_type VARCHAR(50),
    age INT,
    city VARCHAR(50),
    signup_date DATE,
    signup_month VARCHAR(20),
    signup_year INT
);

-- Creating network_usage table (stores usage data linked to customers)
CREATE TABLE network_usage (
    usage_id INT PRIMARY KEY,
    customer_id INT,
    usage_date DATE,
    usage_month VARCHAR(20),
    usage_year INT,
    data_used_gb FLOAT,
    call_minutes INT,
    usage_category VARCHAR(50),
    network_type VARCHAR(20),

    -- Foreign key to maintain relationship with customers table
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- Creating network_issues table (stores complaint/issue data)
CREATE TABLE network_issues (
    issue_id INT PRIMARY KEY,
    customer_id INT,
    issue_date DATE,
    issue_month VARCHAR(20),
    issue_year INT,
    issue_type VARCHAR(50),
    resolution_time INT,
    resolved VARCHAR(10),
    city VARCHAR(50),

    -- Foreign key to link issues with customers
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- Creating billing table (stores billing and payment information)
CREATE TABLE billing (
    billing_id INT PRIMARY KEY,
    customer_id INT,
    bill_date DATE,
    billing_month VARCHAR(20),
    billing_year INT,
    bill_amount FLOAT,
    payment_status VARCHAR(20),

    -- Foreign key to link billing with customers
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- after creating table now to import data we need to click on schemas -> task2sql_analysis ->  tables -> billing ->right click and select tabl data import data wizard

-- Verifing data import by viewing first 5 rows from each table
SELECT * FROM customers LIMIT 5;
SELECT * FROM billing LIMIT 5;
SELECT * FROM network_issues LIMIT 5;
SELECT * FROM network_usage LIMIT 5;


-- Join all datasets to view combined information
-- This combines customer, usage, issues, and billing data into one view

SELECT 
    c.customer_id,
    c.city,
    n.data_used_gb,
    i.issue_type,
    b.bill_amount
FROM customers c
JOIN network_usage n 
    ON c.customer_id = n.customer_id
JOIN network_issues i 
    ON c.customer_id = i.customer_id
JOIN billing b 
    ON c.customer_id = b.customer_id;
    
    
-- Calculate complaint rate per customer
-- This calculates complaints divided by usage using proper aggregation

SELECT 
    u.customer_id,
    u.total_usage,
    IFNULL(i.total_complaints, 0) AS total_complaints,
    IFNULL(i.total_complaints, 0) * 1.0 / u.total_usage AS complaint_rate
FROM 
    (
        SELECT 
            customer_id,
            COUNT(*) AS total_usage
        FROM network_usage
        GROUP BY customer_id
    ) u
LEFT JOIN 
    (
        SELECT 
            customer_id,
            COUNT(*) AS total_complaints
        FROM network_issues
        GROUP BY customer_id
    ) i
ON u.customer_id = i.customer_id;


-- Monthly trend analysis using window function
-- This shows monthly complaints and cumulative trend over time

SELECT 
    issue_year,
    issue_month,
    COUNT(*) AS total_complaints,
    
    SUM(COUNT(*)) OVER (
        ORDER BY issue_year, 
        FIELD(issue_month, 
            'January','February','March','April','May','June',
            'July','August','September','October','November','December')
    ) AS cumulative_complaints

FROM network_issues
GROUP BY issue_year, issue_month
ORDER BY issue_year, 
    FIELD(issue_month, 
        'January','February','March','April','May','June',
        'July','August','September','October','November','December');
