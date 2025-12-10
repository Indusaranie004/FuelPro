-- =====================================================
-- Fuel Station Management System Database Setup Script
-- =====================================================
-- Run this script in MySQL Workbench to create the database and all required tables
-- =====================================================

-- Drop database if exists (use with caution in production)
DROP DATABASE IF EXISTS online_vehicle_fuelstation_management_system;

-- Create the database
CREATE DATABASE online_vehicle_fuelstation_management_system;

-- Use the database
USE online_vehicle_fuelstation_management_system;

-- =====================================================
-- Table: user
-- Description: Stores user registration and login information
-- =====================================================
CREATE TABLE user (
    userId INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    mobile VARCHAR(20) NOT NULL,
    status INT DEFAULT 1,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- Table: admin
-- Description: Stores admin login credentials
-- =====================================================
CREATE TABLE admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- Table: service
-- Description: Stores vehicle service booking information
-- =====================================================
CREATE TABLE service (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vehiclenumber VARCHAR(50) NOT NULL,
    servicetype VARCHAR(100) NOT NULL,
    servicestation VARCHAR(255) NOT NULL,
    date VARCHAR(50) NOT NULL,
    time VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- Table: refill
-- Description: Stores fuel refill requests
-- =====================================================
CREATE TABLE refill (
    id INT AUTO_INCREMENT PRIMARY KEY,
    FuelStation VARCHAR(255) NOT NULL,
    FuelType VARCHAR(100) NOT NULL,
    Amount INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- Table: fueltype
-- Description: Stores fuel types and their unit prices
-- =====================================================
CREATE TABLE fueltype (
    id INT AUTO_INCREMENT PRIMARY KEY,
    FuelTypeName VARCHAR(100) NOT NULL UNIQUE,
    UnitPr DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- Table: card
-- Description: Stores payment card information
-- =====================================================
CREATE TABLE card (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cardtype VARCHAR(50) NOT NULL,
    cardholdername VARCHAR(255) NOT NULL,
    cardnumber BIGINT NOT NULL,
    expmonth VARCHAR(20) NOT NULL,
    expyear VARCHAR(20) NOT NULL,
    cvn INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- Insert Sample Data
-- =====================================================

-- Insert sample admin user
INSERT INTO admin (username, password) VALUES 
('admin', 'admin123');

-- Insert sample fuel types with prices
INSERT INTO fueltype (FuelTypeName, UnitPr) VALUES 
('Petrol', 350.00),
('Diesel', 320.00),
('Super Petrol', 380.00),
('Kerosene', 280.00);

-- Insert sample user (optional - for testing)
-- Password: test123 (in production, use hashed passwords)
INSERT INTO user (firstName, lastName, email, mobile, status, password) VALUES 
('John', 'Doe', 'john.doe@example.com', '0771234567', 1, 'test123');

-- =====================================================
-- Verification Queries (Optional - uncomment to verify)
-- =====================================================

-- SELECT * FROM user;
-- SELECT * FROM admin;
-- SELECT * FROM service;
-- SELECT * FROM refill;
-- SELECT * FROM fueltype;
-- SELECT * FROM card;

-- =====================================================
-- End of Script
-- =====================================================

