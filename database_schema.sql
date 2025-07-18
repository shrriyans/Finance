-- Create Database for Customer Management System
CREATE DATABASE IF NOT EXISTS CustomerManagement;
USE CustomerManagement;

-- Create State Master Table
CREATE TABLE IF NOT EXISTS StateMaster (
    StateId INT(2) AUTO_INCREMENT PRIMARY KEY,
    StateName VARCHAR(100) NOT NULL,
    StateCode VARCHAR(10) NOT NULL,
    IsActive BOOLEAN DEFAULT TRUE,
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create City Master Table
CREATE TABLE IF NOT EXISTS CityMaster (
    CityId INT(4) AUTO_INCREMENT PRIMARY KEY,
    CityName VARCHAR(50) NOT NULL,
    ShortCode VARCHAR(5) NOT NULL,
    StateId INT(2) NOT NULL,
    IsActive BOOLEAN DEFAULT TRUE,
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (StateId) REFERENCES StateMaster(StateId)
);

-- Create Reference Master Table
CREATE TABLE IF NOT EXISTS ReferenceMaster (
    ReferenceId INT(5) AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Address VARCHAR(255),
    CityId INT(4),
    StateId INT(2),
    MobileNo1 VARCHAR(10),
    MobileNo2 VARCHAR(10),
    EmailId VARCHAR(50),
    ReferredById INT(5),
    ReferenceName VARCHAR(255),
    IsActive BOOLEAN DEFAULT TRUE,
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (CityId) REFERENCES CityMaster(CityId),
    FOREIGN KEY (StateId) REFERENCES StateMaster(StateId),
    FOREIGN KEY (ReferredById) REFERENCES ReferenceMaster(ReferenceId)
);

-- Create Customer Master Table
CREATE TABLE IF NOT EXISTS CustomerMaster (
    CustomerId INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Address VARCHAR(255),
    CityId INT(4),
    StateId INT(2),
    MobileNo1 VARCHAR(10),
    MobileNo2 VARCHAR(10),
    EmailId VARCHAR(50),
    ReferredById INT(5),
    ReferenceName VARCHAR(255),
    IsActive BOOLEAN DEFAULT TRUE,
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (CityId) REFERENCES CityMaster(CityId),
    FOREIGN KEY (StateId) REFERENCES StateMaster(StateId),
    FOREIGN KEY (ReferredById) REFERENCES ReferenceMaster(ReferenceId)
);

-- Create Users Table for Login
CREATE TABLE IF NOT EXISTS Users (
    UserId INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    FullName VARCHAR(100),
    IsActive BOOLEAN DEFAULT TRUE,
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert Sample Data
INSERT INTO StateMaster (StateName, StateCode) VALUES 
('Maharashtra', 'MH'),
('Gujarat', 'GJ'),
('Karnataka', 'KA'),
('Tamil Nadu', 'TN'),
('Delhi', 'DL');

INSERT INTO CityMaster (CityName, ShortCode, StateId) VALUES 
('Mumbai', 'MUM', 1),
('Pune', 'PUN', 1),
('Ahmedabad', 'AMD', 2),
('Bangalore', 'BLR', 3),
('Chennai', 'CHN', 4),
('New Delhi', 'NDL', 5);

INSERT INTO Users (UserName, Password, FullName) VALUES 
('admin', 'admin123', 'System Administrator'),
('user1', 'user123', 'Test User One'),
('manager', 'manager123', 'System Manager');

-- Sample Reference Data
INSERT INTO ReferenceMaster (Name, Address, CityId, StateId, MobileNo1, EmailId) VALUES 
('John Doe', '123 Main Street, Andheri', 1, 1, '9876543210', 'john.doe@example.com'),
('Jane Smith', '456 Oak Avenue, Koregaon Park', 2, 1, '9876543211', 'jane.smith@example.com'),
('Robert Johnson', '789 Pine Road, Satellite', 3, 2, '9876543212', 'robert.johnson@example.com');

-- Sample Customer Data
INSERT INTO CustomerMaster (Name, Address, CityId, StateId, MobileNo1, MobileNo2, EmailId, ReferredById) VALUES 
('ABC Corporation', '101 Business Center, Bandra Kurla Complex', 1, 1, '9876543220', '9876543221', 'contact@abc.com', 1),
('XYZ Enterprises', '202 Tech Park, Hinjewadi', 2, 1, '9876543222', '9876543223', 'info@xyz.com', 2),
('PQR Industries', '303 Industrial Area, Bopal', 3, 2, '9876543224', '9876543225', 'sales@pqr.com', 3);