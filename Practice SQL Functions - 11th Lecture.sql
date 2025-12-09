CREATE DATABASE function_exercise;

USE function_exercise;

-- Table 1: students
CREATE TABLE students (
 student_id INT PRIMARY KEY,
 full_name VARCHAR(50),
 gender VARCHAR(10),
 dob DATE,
 marks INT
);

INSERT INTO students VALUES
(1, 'Amit Sharma', 'Male', '2000-04-12', 78),
(2, 'Neha Singh', 'Female', '2001-07-19', 92),
(3, 'Rohan Verma', 'Male', '1999-11-05', 65),
(4, 'Priya Patel', 'Female', '2000-01-23', 84),
(5, 'Vikas Kumar', 'Male', '2002-02-08', 55);

-- Table 2: sales
CREATE TABLE sales (
 sale_id INT PRIMARY KEY,
 product VARCHAR(50),
 price DECIMAL(10,2),
 quantity INT,
 sale_date DATE
);

INSERT INTO sales VALUES
(1, 'Mobile', 15000, 2, '2024-01-10'),
(2, 'Laptop', 55000, 1, '2024-01-15'),
(3, 'Tablet', 20000, 3, '2024-02-02'),
(4, 'Camera', 30000, 1, '2024-02-11'),
(5, 'Mobile', 14000, 4, '2024-02-19');

-- Exercise Questions (Functions Only)
-- Use String, Numeric, Date, Aggregate, and Conditional (IF / CASE) functions.

------------ String Function Questions

# 1. Display student names in uppercase.
SELECT UPPER(full_name) from students;

# 2. Show the first 3 letters of each student name.
SELECT UPPER(SUBSTRING(full_name, 1, 3)) from Students;

#3. Display student names with spaces removed.
SELECT trim(full_name) from students;
SELECT REPLACE(full_name,' ', '') from students;

# 4. Show student name length in characters.
SELECT full_name, Length(full_name) AS Length
from students;

# 5. Extract last name from full_name column.
SELECT substring_index(full_name, ' ', -1) from students;

# Numeric Function Questions
-- 6. Calculate the square root of marks for each student.
SELECT marks, sqrt(marks) from students;

# 7. Round the price of all products to nearest 100.
SELECT price, ROUND(price, -2) from sales;

# 8. Display total selling amount using price × quantity.
SELECT price, quantity, price*quantity AS Total_selling_amount from sales;

# 9. Convert price into thousands (price / 1000) with 2 decimals.
SELECT price, ROUND(price/1000, 2) from sales;

# 10. Find absolute difference between marks and 70.
SELECT marks, ABS(marks-70) from students;

----------------- Date Function Questions

# 11. Show age of each student in years.
SELECT full_name, dob, timestampdiff(YEAR, dob, CURDATE()) AS Age from students;

# 12. Display month name of each sale date.
SELECT sale_date, monthname(sale_date) AS Month from sales;

# 13. Extract year from students' date of birth.
SELECT dob, year(dob) AS YEAR from students;

# 14. Display sale_date in format DD-Mon-YYYY.
SELECT sale_date, date_format(sale_date, '%d-%b-%Y') AS formatted_date from sales;

# 15. Find number of days between today and sale_date.
SELECT sale_date, datediff(CURDATE(), sale_date) AS No_of_days from sales;

# Aggregate Function Questions
-- 16. Find highest marks scored.
SELECT max(marks) from students;

# 17. Count total products sold.
SELECT count(product) AS Total_product_sold from sales
WHERE product_states = 'sold';

# 18. Find sum of all sales revenue.
SELECT SUM(price) AS Sales_revenue from sales;

# 19. Find average marks of male and female students.
SELECT gender, avg(marks) AS Average_marks
from students
GROUP BY gender;

# 20. Count how many students have marks greater than 80.
SELECT count(student_id) AS No_of_students
from students
WHERE marks > 80;

# Conditional Function Questions (IF / CASE)

# 21. Display student result as "Pass" if marks ≥ 60 else "Fail".
SELECT full_name ,
CASE  
     WHEN marks >= 60 THEN 'PASS'
     ELSE 'fail'
     END AS Result
     from students
     ;
     
# 22. Categorize students based on marks:
# 90+ = Excellent, 70–89 = Good, Below 70 = Average
SELECT full_name, marks,
CASE
     WHEN marks > 90 THEN 'Excellent'
     WHEN marks BETWEEN 70 AND 89 THEN 'GOOD'
     WHEN marks < 70 THEN 'Average'
     ELSE 'WORK_HARD'
     END AS Remarks
     from students;
          
# 23. Mark products as "Expensive" if price > 30000 else "Affordable".
select product,
CASE 
      WHEN Price > 30000 THEN 'Expensive'
      ELSE 'Affordable'
      END AS Affordability
      from sales;
      
# 24. Display sale_date as "Weekend" or "Weekday".
SELECT sale_date,
CASE
      WHEN dayofweek(sale_date) IN (1,7) THEN 'Weekend'
      ELSE 'Weekday'
      END AS Weekend_or_Weekday
      from sales;
      
# 25. Label products as:
# Mobile / Laptop / Others using CASE
SELECT product,
CASE 
      WHEN product LIKE '%Mob%' THEN 'MOBILE'
      WHEN product LIKE '%Lap%' THEN 'LAPTOP'
      ELSE 'others'
END AS Product_type
from sales;