-- Create Database
CREATE DATABASE IF NOT EXISTS CustomerManagement;
USE CustomerManagement;

-- Create State Master Table (assuming you need states for CityId reference)
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

-- Create Reference Master Table (same as Customer Master)
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
('Tamil Nadu', 'TN');

INSERT INTO CityMaster (CityName, ShortCode, StateId) VALUES 
('Mumbai', 'MUM', 1),
('Pune', 'PUN', 1),
('Ahmedabad', 'AMD', 2),
('Bangalore', 'BLR', 3),
('Chennai', 'CHN', 4);

INSERT INTO Users (UserName, Password, FullName) VALUES 
('admin', 'admin123', 'Administrator'),
('user1', 'user123', 'Test User');

-- Sample Reference Data
INSERT INTO ReferenceMaster (Name, Address, CityId, StateId, MobileNo1, EmailId) VALUES 
('John Doe', '123 Main St', 1, 1, '9876543210', 'john@example.com'),
('Jane Smith', '456 Oak Ave', 2, 1, '9876543211', 'jane@example.com');