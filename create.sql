CREATE DOMAIN SSN_TYPE AS CHAR(10)
CHECK ( 
  VALUE ~ '^\d{3}-\d{2}-\d{4}$'
);

-- Employee Table
CREATE TABLE Employee (
  ESSN SSN_TYPE NOT NULL DEFAULT '000-000-0000',
  Salary INT DEFAULT NULL,
  Name VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (ESSN)
);

-- Apartment Complex Table 
CREATE TABLE Apartment_Complex (
  Complex_Number INT NOT NULL DEFAULT 000,
  Street VARCHAR(155) DEFAULT NULL,
  City VARCHAR(100) DEFAULT NULL,
  L_State VARCHAR(50) DEFAULT NULL, -- i changed this to L_State because state is a keyword
  PRIMARY KEY (Complex_Number),
  FOREIGN KEY (Manager)
    REFERENCES Employee(ESSN) 
    ON DELETE SET DEFAULT 
);

-- Apartment Table
CREATE TABLE Apartment (
  Complex_Number INT NOT NULL DEFAULT 000,
  Room_Number INT NOT NULL DEFAULT 0000,
  Floor_Plan VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (Room_NUmber, Complex_Number),
  FOREIGN KEY (Complex_Number) 
    REFERENCES Apartment_Complex(Complex_Number) 
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
  FOREIGN KEY (Complex_Number, Room_Number) 
    REFERENCES Apartment(Complex_Number, Room_Number) 
    ON DELETE SET DEFAULT
);

-- Lease Table
CREATE TABLE Lease (
  Contract_ID INT NOT NULL DEFAULT 0000000,
  Payment_Amount DECIMAL(10,2) DEFAULT 0, -- changed to decimal because its a price
  Type INT DEFAULT NULL,
  PRIMARY KEY (Contract_ID)
);

-- Contractors Table 
CREATE TABLE Contractors (
  Company_Name VARCHAR(255) NOT NULL DEFAULT 'Not Provided',
  PRIMARY KEY (Company_Name)
);

-- Work Order Table
CREATE TABLE Work_Order (
  Project_ID INT NOT NULL DEFAULT 00000,
  Type VARCHAR(255) DEFAULT NULL,
  Complex_Number INT NOT NULL DEFAULT 000,
  -- TA said that work order should be a weak entity so composite key with project id and complex number
  PRIMARY KEY (ProjectID, Complex_Number)
  FOREIGN KEY (Complex_Number) 
    REFERENCES Apartment_Complex(Complex_Number)
    ON DELETE CASCADE
);
-- Commissions Table
CREATE TABLE Commissions (
  Complex_Number INT NOT NULL DEFAULT 000,
  Company_Name VARCHAR(255) NOT NULL DEFAULT 'Not Provided',
  Project_ID INT NOT NULL DEFAULT 00000, 
  -- removed budget because its referenced in development projects
  Num_Hrs INT DEFAULT 0,
  FOREIGN KEY (Complex_Number) 
    REFERENCES Apartment_Complex(Complex_Number) 
    ON DELETE SET DEFAULT,
  FOREIGN KEY (Company_Name) 
    REFERENCES Contractors(Company_Name) 
    ON DELETE SET DEFAULT,
  FOREIGN KEY (Project_ID) 
    REFERENCES Work_Order(Project_ID) 
    ON DELETE NO ACTION
);

-- Development Projects Table 
CREATE TABLE Development_Projects (
  Project_ID INT NOT NULL DEFAULT 00000,
  Complex_Number INT NOT NULL DEFAULT 000,
  Budget DECIMAL(10,2) DEFAULT 0, -- changed to decimal because its a price
  FOREIGN KEY (Project_ID) 
    REFERENCES Work_Order(Project_ID) 
    ON DELETE SET DEFAULT,
  FOREIGN KEY (Complex_Number) 
    REFERENCES Apartment_Complex(Complex_Number) 
    ON DELETE SET DEFAULT
);

-- Employees working at Apartment Complex Tavle 
CREATE TABLE Employee_At_Complex (
  ESSN SSN_TYPE NOT NULL DEFAULT '000-000-0000',
  Complex_Number INT NOT NULL DEFAULT 000,
  FOREIGN KEY (ESSN) 
    REFERENCES Employee(ESSN) 
    ON DELETE CASCADE,
  FOREIGN KEY (Complex_Number) 
    REFERENCES Apartment_Complex(Complex_Number) 
    ON DELETE SET DEFAULT
);

-- Renters signing Leases Table 
CREATE TABLE Renter_Sign_Lease (
  RSSN SSN_TYPE NOT NULL '000-000-0000',
  Contract_ID INT NOT NULL '000-0000',
  FOREIGN KEY (RSSN)
    REFERENCES Renters(RSSN)
    ON DELETE RESTRICT,
  FOREIGN KEY (Contract_ID)
    REFERENCES Leases(Contract_ID)
    ON DELETE RESTRICT
);

-- Employees fixing Residential Issues Table 
CREATE TABLE Employee_Fix_Issue (
  ESSN SSN_TYPE NOT NULL '000-000-0000',
  Project_ID INT NOT NULL DEFAULT 00000,
  FOREIGN KEY (ESSN) 
    REFERENCES Employee(ESSN) 
    ON DELETE SET DEFAULT,
  FOREIGN KEY (Project_ID) 
    REFERENCES Work_Order(Project_ID) 
    ON DELETE RESTRICT
};

-- Renters Reporting Residential Issues Table 
CREATE TABLE Renter_Report_Issue (
  RSSN SSN_TYPE NOT NULL '000-000-0000',
  Project_ID INT NOT NULL DEFAULT 00000,
  FOREIGN KEY (RSSN)
    REFERENCES Renters(RSSN)
    ON DELETE RESTRICT,
  FOREIGN KEY (Project_ID) 
    REFERENCES Work_Order(Project_ID) 
    ON DELETE RESTRICT
);

-- Residential Property Issues Table 
CREATE TABLE Property_Issues (
  Project_ID INT NOT NULL DEFAULT 00000, -- changed from issue_id to project_id b/c its useless otherwise
  RSSN SSN_TYPE NOT NULL '000-000-0000',
  Complex_Number INT NOT NULL DEFAULT 000,
  FOREIGN KEY (Project_ID) 
    REFERENCES Work_Order(Project_ID) 
    ON DELETE RESTRICT,
  FOREIGN KEY (RSSN)
    REFERENCES Renters(RSSN)
    ON DELETE RESTRICT,
  FOREIGN KEY (Complex_Number) 
    REFERENCES Apartment_Complex(Complex_Number) 
    ON DELETE SET DEFAULT
);
