CREATE DOMAIN SSN_TYPE AS CHAR(10)
CHECK ( 
  VALUE ~ '^\d{3}-\d{2}-\d{4}$'
);

-- Employee Table
CREATE TABLE Employee (
  ESSN SSN_TYPE NOT NULL DEFAULT '000-000-0000',
  Salary INT DEFAULT NULL,
  NAME VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (ESSN)
);

-- Apartment Complex Table 
CREATE TABLE Apartment_Complex (
  Complex_Number INT NOT NULL DEFAULT 000,
  Street VARCHAR(155) DEFAULT NULL,
  City VARCHAR(100) DEFAULT NULL,
  State VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (Complex_Number),
  FOREIGN KEY (Manager) REFERENCES Employee(ESSN) 
  ON DELETE SET DEFAULT 
);

-- Apartment Table
CREATE TABLE Apartment (
  Complex_Number INT NOT NULL DEFAULT 000,
  Room_Number INT NOT NULL DEFAULT 0000,
  Floor_Plan VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (Room_NUmber, Complex_Number),
  FOREIGN KEY (Complex_Number) REFERENCES Apartment_Complex(Complex_Number) 
  ON DELETE SET DEFAULT 
);

-- Renters Table 
CREATE TABLE Renters (
  RSSN SSN_TYPE NOT NULL DEFAULT '000-000-0000',
  Credit_Score INT DEFAULT NULL,
  Name VARCHAR(255) NOT NULL DEFAULT NULL,
  Complex_Number INT NOT NULL DEFAULT 000,
  Room_Number INT NOT NULL DEFAULT 0000,
  PRIMARY KEY (RSSN),
  FOREIGN KEY (Complex_Number, Room_Number) REFERENCES Apartment(Complex_Number, Room_Number) 
  ON DELETE SET DEFAULT
);

-- Lease Table
CREATE TABLE Lease (
  Contract_ID INT NOT NULL DEFAULT 0000000,
  Payment_Amount INT DEFAULT 0,
  Type INT DEFAULT NULL,
  PRIMARY KEY (Contract_ID)
);

-- Contractors Table 
CREATE TABLE Contractors (
  Company_Name VARCHAR(255) NOT NULL DEFAULT 'Not Provided',
  PRIMARY KEY (Company_Name)
);

-- Commissions Table
CREATE TABLE Commissions (
  Complex_Number INT NOT NULL DEFAULT 000,
  Company_Name VARCHAR(255) NOT NULL DEFAULT 'Not Provided',
  Project_ID INT NOT NULL DEFAULT 00000,
  Budget INT DEFAULT 0,
  Num_Hrs INT DEFAULT 0,
  FOREIGN KEY (Complex_Number) REFERENCES Apartment_Complex(Complex_Number) ON DELETE SET DEFAULT,
  FOREIGN KEY (Company_Name) REFERENCES Contractors(Company_Name) ON DELETE SET DEFAULT,
  FOREIGN KEY (Project_ID) REFERENCES Work_Order(Project_ID) ON DELETE NO ACTION
);

-- Development Projects Table 

-- Employees working at Apartment Complex Tavle 

-- Renters signing Leases Table 

-- Employees fixing Residential Issues Table 

-- Renters Reporting Residential Issues Table 

-- Residential Property Issues Table 

