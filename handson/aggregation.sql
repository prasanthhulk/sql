select department_id,count(*) from hr.EMPLOYEES group by department_id;
-- count the department_id using count 
select department_id,sum(salary) from hr.EMPLOYEES group by department_id;
-- total the department_id with salary using sum
select department_id,max(salary),min(salary) from hr.EMPLOYEES group by department_id;
-- highest and lowest department_id with salary using max,min
select department_id,avg(salary) from hr.employees group by department_id;
-- average salary the department_id with salary using average
select job_id,count(*) from hr.employees group by job_id;
-- count the job_id using count
select job_id,avg(salary) from hr.employees group by job_id;
-- average salary the job_id with salary using average
select job_id,sum(salary) from hr.employees group by job_id;
-- tatal the job_id with salary using count
select job_id,min(salary) from hr.employees group by job_id;
-- lowest salary the job_id with salary using min
select job_id,max(salary) from hr.employees group by job_id;
-- highest the job_id with salary using max
select extract(year from hire_date) fun,count(*) from hr.employees group by fun order by fun;
select d.location_id,sum(e.salary) from hr.employees e 
join hr.departments d on e.department_id=d.department_id group by d.location_id;
-- location_id is not in employee table we have to join department table and the common column is department_id 
-- aggregate salary related to location
 

select manager_id,count(*) from hr.employees where manager_id is not null group by manager_id;

select manager_id,max(salary) from hr.employees where manager_id is not null group by manager_id;

select manager_id,avg(salary) from hr.employees where manager_id is not null group by manager_id;
 
select extract(month from hire_date) fun,count(*) from hr.employees group by fun order by fun;

SELECT department_id,sum(salary) from hr.employees group by department_id order by sum(salary) desc fetch first 1 row only;

SELECT job_id,avg(salary) from hr.employees group by job_id order by sum(salary) desc fetch first 1 row only;
  
select l.city,count(*) from hr.employees e join hr.departments d on e.department_id=d.department_id join hr.locations l on d.location_id=l.location_id group by l.city;
-- employees_id,department_id in employee table
-- department_id,location_id in department table
-- city,location_id in location table
-- we need to find employees in city .there is no matching column to employee and location table thus why we use another department table . we have department_id in employee and departments table then we join them first 
-- again we have location_id in locations and departments table then we join them .
SELECT department_id, COUNT(*) AS employees_with_commission FROM hr.employees WHERE commission_pct IS NOT NULL GROUP BY department_id;

select department_id,sum(salary) from hr.employees where commission_pct is not null group by department_id;
