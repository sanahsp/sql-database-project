LOAD DATA LOCAL INFILE 'sql-database-project/Employee.csv'
INTO TABLE Employee
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ESSN, Salary, Name);
