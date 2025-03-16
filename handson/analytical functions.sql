-- 1. Find the total number of employees in each department.
select department_id,count(*) from hr.employees group by department_id;
-- 2. Calculate the average salary in each department.
select department_id,avg(salary) from hr.employees group by department_id order by avg(salary) desc;
-- 3. Find the department with the highest total salary.
select department_id,sum(salary) from hr.employees group by department_id order by 2 desc fetch first 1 row only;
-- 4. Determine the highest and lowest salaries for each job role.
select job_id,max(salary),min(salary) from hr.employees group by job_id order by 2 desc;
-- 5. Find the number of employees hired in each year.
select extract(year from hire_date),count(*) from hr.employees group by extract(year from hire_date);
-- 6. Assign a rank to employees based on their salary within each department.
select department_id,employee_id,salary,rank()over (partition by department_id order by salary) from hr.employees;
-- 7. Find the top 3 highest-paid employees in each department.
select department_id,employee_id,salary from (select department_id,employee_id,salary,dense_rank()over (partition by department_id order by salary desc) fun from hr.employees) where fun<=3 ;
-- 8. Identify the second highest salary in each department using DENSE_RANK().
select department_id,employee_id,salary from (select department_id,salary,employee_id ,dense_rank() over (partition by department_id order by salary desc)fun from hr.employees)where fun=2;
-- 9. Compute the cumulative total salary of employees ordered by hire date.
select employee_id,hire_date,salary,sum(salary) over (order by hire_date) from hr.employees ;
-- 10. Assign a row number to each employee in each department.
select department_id,employee_id,row_number() over (partition by department_id order by employee_id) from hr.employees;
-- 11. Find the salary difference between each employee and the next highest-paid employee.
select employee_id,salary,lead(salary) over (order by salary desc) ,salary -lead(salary) over (order by salary desc) from hr.employees order by salary desc;
-- 12. Calculate the previous month’s salary for each employee using LAG().
select salary,hire_date,employee_id,lag(salary) over (partition by employee_id order by hire_date) from hr.employees;
-- 13. Identify employees whose salaries increased over time.
select employee_id,salary,hire_date,lag(salary) over (partition by employee_id order by hire_date),case when salary >lag(salary) over (partition by employee_id order by hire_date) then 'increased' else 'decreased'end from hr.employees;
-- 14. Find the average salary of employees who joined in each year.
select extract(year from hire_date),avg(salary) from hr.employees group by extract(year from hire_date) order by 1;
-- 15. Count the number of employees in each job role.
select job_id,count(*) from hr.employees group by job_id;
-- 16. Find the total salary expenditure for each manager's team.
select manager_id,sum(salary) from hr.employees group by manager_id;
-- 17. Find the highest-paid employee in each department.
select department_id,employee_id,salary from (select department_id,employee_id,salary,rank() over (partition by department_id order by salary desc) fun from hr.employees)where fun=1;
-- 18. Calculate the running total of salaries for employees hired in each department.
select department_id,employee_id,hire_date,salary,sum(salary) over (partition by department_id order by hire_date) from hr.employees;
-- 19. Find the employees who earn above the average salary of their department.
select employee_id,salary from hr.employees e where salary > (select avg(salary) from hr.employees where department_id=e.department_id);
-- 20. Rank employees within their department based on experience.
select hire_date,department_id,employee_id,rank() over (partition by department_id order by hire_date) from hr.employees;
-- 21. Find the difference between each employee’s salary and the department average.
select department_id,employee_id,hire_date,salary,salary-avg(salary) over (partition by department_id ) from hr.employees;
-- 22. Find the department where the most employees have been hired.
select department_id,count(*) from hr.employees group by department_id order by count(*) desc fetch first 1 row only;
-- 23. Identify employees who were hired in the same month and year as someone else.
select employee_id,hire_date,count(*) over (partition by extract(month from hire_date) ,extract(year from hire_date)) from hr.employees;
-- 24. Calculate the moving average salary over the last 3 employees ordered by hire date.
select employee_id,hire_date,salary,avg(salary) over(order by hire_date rows between 2 preceding and current row) from hr.employees;
-- 25. Find employees whose salary is greater than that of the average of their manager’s team.
select manager_id,employee_id,salary from hr.employees e where salary>(select avg(salary) from hr.employees where manager_id=e.manager_id);



select * from hr.employees;
