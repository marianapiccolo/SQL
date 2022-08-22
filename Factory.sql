CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  foreign key (department) references Departments(Code) 
);

INSERT INTO Departments(Code,Name,Budget) VALUES(11,'IT',35000);
INSERT INTO Departments(Code,Name,Budget) VALUES(34,'Accounting',25000);
INSERT INTO Departments(Code,Name,Budget) VALUES(45,'Human Resources',320000);
INSERT INTO Departments(Code,Name,Budget) VALUES(86,'Research',65000);

INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Bruno','Rogers',11);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Luiz','Manikutty',11);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Rizzo',34);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Maria','Stevens',34);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',11);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','Silva',86);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','Claudi','Doe',45);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',86);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Amanda','Costa',45);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',45);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Marta','Doe',11);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Alessio','Swamy',11);

-- Select the last name of all employees.
select LastName from Employees;

-- Select the last name of all employees, without duplicates.
select distinct LastName from employees;

-- Select all the data of employees whose last name is "Smith".
select * from employees where lastname = 'Smith';

-- Select all the data of employees whose last name is "Smith" or "Doe".
select * from Employees where lastname in ('Smith', 'Doe');
select * from Employees where lastname = 'Smith' or lastname = 'Doe';

-- Select all the data of employees that work in department 11.
select * from Employees where department = 11;

-- Select all the data of employees that work in department  or department .
select * from employees where department = 45 or department = 86;
select * from employees where department in (45, 86);

-- Select all the data of employees whose last name begins with an "S".
select * from employees where LastName like 'S%';

-- Select the sum of all the departments' budgets.
select sum(budget) from Departments;

select Name, sum(Budget) from Departments group by Name;

-- Select the number of employees in each department (you only need to show the department code and the number of employees).
select Department, count(*) from employees group by department;

SELECT Department, COUNT(*)
  FROM Employees
  GROUP BY Department;

-- Select all the data of employees, including each employee's department's data.
select a.*, b.* from employees a join departments b on a.department = b.code;

SELECT SSN, E.Name AS Name_E, LastName, D.Name AS Name_D, Department, Code, Budget
 FROM Employees E INNER JOIN Departments D
 ON E.Department = D.Code;

-- Select the name and last name of each employee, along with the name and budget of the employee's department.
select a.name, a.lastname, b.name Department_name, b.Budget
from employees a join departments b
on a.department = b.code;

/* Without labels */
SELECT Employees.Name, LastName, Departments.Name AS DepartmentsName, Budget
  FROM Employees INNER JOIN Departments
  ON Employees.Department = Departments.Code;

/* With labels */
SELECT E.Name, LastName, D.Name AS DepartmentsName, Budget
  FROM Employees E INNER JOIN Departments D
  ON E.Department = D.Code;

-- Select the name and last name of employees working for departments with a budget greater than $60,000.
select name, lastname
from employees 
where department in (
select code from departments where Budget>60000
);

/* Without subquery */
SELECT Employees.Name, LastName
  FROM Employees INNER JOIN Departments
  ON Employees.Department = Departments.Code
    AND Departments.Budget > 60000;

/* With subquery */
SELECT Name, LastName FROM Employees
  WHERE Department IN
  (SELECT Code FROM Departments WHERE Budget > 60000);

-- Select the departments with a budget larger than the average budget of all the departments.
select *
from departments 
where budget > (
select avg(budget) from departments
);

SELECT *
  FROM Departments
  WHERE Budget >
  (
    SELECT AVG(Budget)
    FROM Departments
  );
 
-- Select the names of departments with more than two employees.
select b.name 
from departments b
where code in (
select department
from employees
group by department
having count(*)>2
);

/* With subquery */
SELECT Name FROM Departments
  WHERE Code IN
  (
    SELECT Department
      FROM Employees
      GROUP BY Department
      HAVING COUNT(*) > 2
  );

/* With UNION. This assumes that no two departments have the same name */
SELECT Departments.Name
  FROM Employees INNER JOIN Departments
  ON Department = Code
  GROUP BY Departments.Name
  HAVING COUNT(*) > 2;
  
-- Very Important! Select the name and last name of employees working for departments with second lowest budget.

select name, lastname
from employees
where department =(
select temp.code 
from (select * from departments order by budget limit 2) temp
order by temp.budget desc limit 1
);

/* With subquery */
SELECT e.Name, e.LastName
FROM Employees e 
WHERE e.Department = (
       SELECT sub.Code 
       FROM (SELECT * FROM Departments d ORDER BY d.budget LIMIT 2) sub 
       ORDER BY budget DESC LIMIT 1);
       
-- Add a new department called "Quality Assurance", with a budget of $70,000 and departmental code 13. 
-- Add an employee called "Fernanda Moore" in that department, with SSN 847-21-9811.
insert into departments values(13, 'Quality Assurance', 70000);
insert into employees values(847219811, 'Fernanda', 'Moore', 13);

-- Reduce the budget of all departments by 10%.
update departments 
set budget = 0.9 * budget;

-- Reassign all employees from the Research department (code 86) to the IT department (code 11).
update employees
set department = 11
where department = 86;

-- Delete from the table all employees in the IT department (code 14).
delete from employees
where department = 14;

-- Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
delete from employees
where department in (
select code 
from departments
where budget>=60000
);

-- Delete from the table all employees.
delete from employees;

