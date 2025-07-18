-- MySQL Database Schema for VB6 Application
-- Create Database
CREATE DATABASE IF NOT EXISTS vb6_masters_db;
USE vb6_masters_db;

-- State Master Table
CREATE TABLE IF NOT EXISTS state_master (
    StateId INT AUTO_INCREMENT PRIMARY KEY,
    StateName VARCHAR(25) NOT NULL,
    ShortCode VARCHAR(5) NOT NULL,
    IsActive BOOLEAN DEFAULT TRUE,
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ModifiedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- City Master Table
CREATE TABLE IF NOT EXISTS city_master (
    CityId INT AUTO_INCREMENT PRIMARY KEY,
    CityName VARCHAR(50) NOT NULL,
    ShortCode VARCHAR(5) NOT NULL,
    IsActive BOOLEAN DEFAULT TRUE,
    StateId INT NOT NULL,
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ModifiedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (StateId) REFERENCES state_master(StateId)
);

-- User Master Table
CREATE TABLE IF NOT EXISTS user_master (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(25) NOT NULL UNIQUE,
    Password VARCHAR(15) NOT NULL,
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ModifiedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Bank Master Table
CREATE TABLE IF NOT EXISTS bank_master (
    BankId INT AUTO_INCREMENT PRIMARY KEY,
    BankName VARCHAR(50) NOT NULL,
    IsActive BOOLEAN DEFAULT TRUE,
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ModifiedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Reference Master Table
CREATE TABLE IF NOT EXISTS reference_master (
    ReferenceId INT AUTO_INCREMENT PRIMARY KEY,
    ReferenceName VARCHAR(50) NOT NULL,
    Address TEXT,
    MobileNo VARCHAR(15),
    EmailId VARCHAR(50),
    CityId INT,
    StateId INT,
    IsActive BOOLEAN DEFAULT TRUE,
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ModifiedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (CityId) REFERENCES city_master(CityId),
    FOREIGN KEY (StateId) REFERENCES state_master(StateId)
);

-- Customer Master Table
CREATE TABLE IF NOT EXISTS customer_master (
    CustomerId INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL,
    Address TEXT,
    MobileNo VARCHAR(15),
    EmailId VARCHAR(50),
    CityId INT,
    StateId INT,
    ReferenceId INT,
    IsActive BOOLEAN DEFAULT TRUE,
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ModifiedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (CityId) REFERENCES city_master(CityId),
    FOREIGN KEY (StateId) REFERENCES state_master(StateId),
    FOREIGN KEY (ReferenceId) REFERENCES reference_master(ReferenceId)
);

-- Insert sample data
INSERT INTO state_master (StateName, ShortCode) VALUES 
('Maharashtra', 'MH'),
('Gujarat', 'GJ'),
('Karnataka', 'KA'),
('Tamil Nadu', 'TN');

INSERT INTO city_master (CityName, ShortCode, StateId) VALUES 
('Mumbai', 'MUM', 1),
('Pune', 'PUN', 1),
('Ahmedabad', 'AMD', 2),
('Surat', 'SUR', 2),
('Bangalore', 'BLR', 3),
('Chennai', 'CHN', 4);

INSERT INTO user_master (UserName, Password) VALUES 
('admin', 'admin123'),
('user1', 'user123');

INSERT INTO bank_master (BankName) VALUES 
('State Bank of India'),
('HDFC Bank'),
('ICICI Bank'),
('Axis Bank');