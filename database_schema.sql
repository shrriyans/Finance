-- MySQL Database Schema for Employee Management System
-- Run this script in MySQL to create the database and table

-- Create database
CREATE DATABASE IF NOT EXISTS employee_db;
USE employee_db;

-- Create employees table
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO employees (first_name, last_name, email, department, salary) VALUES
('John', 'Doe', 'john.doe@company.com', 'IT', 55000.00),
('Jane', 'Smith', 'jane.smith@company.com', 'HR', 48000.00),
('Mike', 'Johnson', 'mike.johnson@company.com', 'Sales', 52000.00),
('Sarah', 'Williams', 'sarah.williams@company.com', 'Marketing', 49000.00),
('David', 'Brown', 'david.brown@company.com', 'Finance', 58000.00);

-- Create index for better performance
CREATE INDEX idx_employee_name ON employees(first_name, last_name);
CREATE INDEX idx_employee_department ON employees(department);
CREATE INDEX idx_employee_email ON employees(email);

-- Display sample data
SELECT * FROM employees;