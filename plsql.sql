-- Simple SELECT INTO Statement
DECLARE
    emp_name varchar2(50);
BEGIN
    select first_name into emp_name from hr.employees where employee_id=101;
    dbms_output.put_line('EMployee_name :'|| emp_name);
end;
--  SELECT Multiple Columns INTO Variables
DECLARE
    emp_name varchar2(50);
    emp_salary number;
BEGIN
    select first_name,salary into emp_name,emp_salary from hr.employees where employee_id=101;
    dbms_output.put_line('EMployee_name :'|| emp_name  || ',employee_salary :' || emp_salary);
end;
--  Handling No Data Found Exception
DECLARE
    emp_salary number;
BEGIN
    BEGIN
        select salary into emp_salary from hr.employees where employee_id=999;
        dbms_output.put_line('salary'||emp_salary);
    Exception
         when no_data_found then dbms_output.put_line('employee is not found with this id');
    end;
end;
--  Using SELECT with CASE Statement
DECLARE
    emp_status varchar2(20);
BEGIN
    select case when salary>50000 then 'high salary' else 'low salary' end into emp_status from hr.employees where employee_id=102;
    dbms_output.put_line('salary status ,'||emp_status);
end;
-- Using COUNT() with SELECT INTO
DECLARE
    total_employees number;
BEGIN
    select count(*) into total_employees from hr.employees;
    dbms_output.put_line('total employees,'||total_employees);
END;
-- Fetching MAX Salary
DECLARE
    highest_salary number;
BEGIN
    select max(salary) into highest_salary from hr.employees;
    dbms_output.put_line('highest salary'||highest_salary);
END;
--  Fetching MIN Salary
DECLARE
    lowest_salary number;
BEGIN
    select min(salary) into lowest_salary from hr.employees;
    dbms_output.put_line('lowest salary'||lowest_salary);
END;
-- Fetching AVG Salary
DECLARE
    avg_salary number;
BEGIN
    select avg(salary) into avg_salary from hr.employees;
    dbms_output.put_line('avgerage salary '||avg_salary);
END;
--  Fetching Employee Name Using Subquery
DECLARE
    emp_name varchar2(50);
BEGIN
    select first_name into emp_name from hr.employees where salary=(select min(salary) from hr.employees);
    dbms_output.put_line('EMployee_name :'|| emp_name);
end;
-- Fetching Data Using EXISTS
DECLARE
    emp_exists varchar2(10);
BEGIN
    select case when exists (select 1 from hr.employees where employee_id=101) then 'yes' else 'no' end into emp_exists from dual;
    dbms_output.put_line('employee exists'|| emp_exists);
end;
-- Selecting Employee with Highest Salary
DECLARE
    emp_name varchar2(50);
BEGIN
    select first_name into emp_name from hr.employees where salary=(select max(salary) from hr.employees);
    dbms_output.put_line('EMployee_name :'|| emp_name);
end;
-- Fetching Department Name
DECLARE
    depart_name varchar2(50);
BEGIN
    select department_name into depart_name from hr.departments where department_id=90;
    dbms_output.put_line('department name: '|| depart_name);
END;
-- Fetching Employee Count in a Department
DECLARE
    employees number;
BEGIN
    select count(*) into employees from hr.employees where department_id=90;
    dbms_output.put_line('employees count :'|| employees);
END;
-- Fetching Sum of All Salaries
DECLARE
    total_salary number;
BEGIN
    select sum(salary) into total_salary from hr.employees;
    dbms_output.put_line('total salary :'|| total_salary);
END;
-- Fetching Employee Joining Date
DECLARE
    hiredate date;
BEGIN
    select hire_date into hiredate from hr.employees where employee_id=107;
    dbms_output.put_line('hire date: '|| hiredate);
END;
-- Selecting Second Highest Salary
DECLARE
    secondhighest number;
BEGIN
    select distinct salary into secondhighest from hr.employees where salary<(select max(salary) from hr.employees) order by salary fetch first 1 row only;
    dbms_output.put_line('second highest :'||secondhighest);
END;
-- Selecting Employees with Same Salary as John
DECLARE
    emp_count number;
BEGIN
    select count(*) into emp_count from hr.employees where salary =(select salary from hr.employees where first_name='JOHN');
    dbms_output.put_line('employee count '|| emp_count);
END;
-- Fetching Manager Name of an Employee (department name there is no manager name)
DECLARE
    department_name varchar2(50);
BEGIN
    select d.department_name into department_name from hr.employees e join hr.departments d on d.department_id=e.department_id where employee_id=101;
    dbms_output.put_line('department name'||department_name);
END;
--  Fetching Number of Employees Who Earn Above Average Salary
DECLARE
    count_above_avg number;
BEGIN
    select count(*) into count_above_avg from hr.employees where salary > (select avg(salary) from hr.employees);
    dbms_output.put_line('Employees Above Average: ' || count_above_avg);
END;
-- Fetching Employee Name and Role
DECLARE 
    emp_name varchar2(40);
    job_role varchar2(40);
BEGIN
    select e.first_name,j.job_title into emp_name,job_role from hr.employees e join hr.jobs j on j.job_id=e.job_id where e.employee_id=101;
    dbms_output.put_line('emp name'||emp_name ||' job role'|| job_role);
END;
