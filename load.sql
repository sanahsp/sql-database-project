-- employee
LOAD DATA LOCAL INFILE 'sql-database-project/Employee.csv'
INTO TABLE Employee
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ESSN, Salary, Name);

-- apartment complex
LOAD DATA LOCAL INFILE 'sql-database-project/Apartment_Complex.csv'
INTO TABLE Apartment_Complex
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Complex_Number, Street, City, Addr_State, Manager);

-- apartment
LOAD DATA LOCAL INFILE 'sql-database-project/Apartment.csv'
INTO TABLE Apartment
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Complex_Number, Room_Number, Floor_Plan);

-- renters
LOAD DATA LOCAL INFILE 'sql-database-project/Renters.csv'
INTO TABLE Renters
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(RSSN, Credit_Score, Name, Complex_Number, Room_Number);

-- Lease_Type
LOAD DATA LOCAL INFILE 'sql-database-project/Lease_Type.csv'
INTO TABLE Lease_Type
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Type, Payment_Amount);

-- Lease
LOAD DATA LOCAL INFILE 'sql-database-project/Lease.csv'
INTO TABLE Lease
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Contract_ID, Type);

-- Contractors
LOAD DATA LOCAL INFILE 'sql-database-project/Contractors.csv'
INTO TABLE Contractors
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Company_Name);

-- Work_Order
LOAD DATA LOCAL INFILE 'sql-database-project/Work_Order.csv'
INTO TABLE Work_Order
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Project_ID, Type, Complex_Number);

-- Commissions
LOAD DATA LOCAL INFILE 'sql-database-project/Commissions.csv'
INTO TABLE Commissions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Complex_Number, Company_Name, Project_ID, Num_Hrs);

-- Development_Projects
LOAD DATA LOCAL INFILE 'sql-database-project/Development_Projects.csv'
INTO TABLE Development_Projects
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Project_ID, Budget, Complex_Number);

-- Employee_At_Complex
LOAD DATA LOCAL INFILE 'sql-database-project/Employee_At_Complex.csv'
INTO TABLE Employee_At_Complex
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ESSN, Complex_Number);

-- Renter_Sign_Lease
LOAD DATA LOCAL INFILE 'sql-database-project/Renter_Sign_Lease.csv'
INTO TABLE Renter_Sign_Lease
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(RSSN, Contract_ID);

-- Employee_Fix_Issue
LOAD DATA LOCAL INFILE 'sql-database-project/Employee_Fix_Issue.csv'
INTO TABLE Employee_Fix_Issue
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ESSN, Project_ID, Complex_Number);

-- Renter_Report_Issue
LOAD DATA LOCAL INFILE 'sql-database-project/Renter_Report_Issue.csv'
INTO TABLE Renter_Report_Issue
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(RSSN, Project_ID, Complex_Number);

-- Property_Issues
LOAD DATA LOCAL INFILE 'sql-database-project/Property_Issues.csv'
INTO TABLE Property_Issues
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Project_ID, Description, Complex_Number);
