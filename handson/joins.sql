-- 1. Retrieve employee names and their department names using INNER JOIN
select e.first_name,e.last_name,d.department_name from hr.employees e inner join hr.departments d on d.department_id=e.department_id;
-- 2. Retrieve all employees and their respective department names (including those without a department) using LEFT JOIN
select e.first_name,e.last_name,d.department_name from hr.employees e left join hr.departments d on d.department_id=e.department_id;
-- 3. Retrieve all departments and employees (including departments without employees) using RIGHT JOIN
select e.first_name,e.last_name,d.department_name from hr.employees e right join hr.departments d on d.department_id=e.department_id;
-- 4. Retrieve all employees and their department names using FULL OUTER JOIN
select e.first_name,e.last_name,d.department_name from hr.employees e full outer join hr.departments d on d.department_id=e.department_id;
-- 5. Retrieve employees who do not belong to any department using LEFT JOIN with NULL check
select e.first_name,e.last_name,e.employee_id from hr.employees e left join hr.departments d on d.department_id=e.department_id where d.department_id is null;
-- 6. Retrieve departments that have no employees using RIGHT JOIN with NULL check
select d.department_name ,d.department_id from hr.employees e right join hr.departments d on d.department_id=e.department_id where e.employee_id is null;
-- 7. Retrieve employees along with their manager names using SELF JOIN
select e.first_name,e.last_name from hr.employees e left join hr.departments d on d.manger_id=e.employee_id;
-- 8. Retrieve employees along with their job title using INNER JOIN
select e.employee_id,e.first_name,j.job_title from hr.employees e inner join hr.jobs j on j.job_id=e.job_id;
-- 9. Retrieve employees along with the location of their department using INNER JOIN
select e.employee_id,e.first_name,d.department_name,l.city from hr.employees e inner join hr.departments d on d.department_id=e.department_id inner join hr.locations l on l.location_id=d.location_id
