select department_id,count(*) from hr.employees group by department_id ;
select department_id,sum(salary) from hr.employees group by department_id ;
select department_id,avg(salary) from hr.employees group by department_id ;
select department_id,min(salary) from hr.employees group by department_id ;
select department_id,max(salary) from hr.employees group by department_id ;
select job_id,count(*) from hr.employees group by job_id ;
select job_id,sum(salary) from hr.employees group by job_id ;
select job_id,avg(salary) from hr.employees group by job_id ;
select department_id,avg(salary) from hr.employees group by department_id having avg(salary)>50000;
select department_id,count(*) from hr.employees group by department_id having count(*)>5;
select department_id,sum(salary) from hr.employees group by department_id having sum(salary)>100000;
select department_id,max(salary) from hr.employees group by department_id having max(salary)>80000 ;
select department_id,min(salary) from hr.employees group by department_id having min(salary)<30000;
select department_id,count(*) from hr.employees group by department_id having count(*) between 5 and 10;
select department_id,variance(salary) from hr.employees group by department_id having variance(salary)>500000;
select department_id,stddev(salary) from hr.employees group by department_id having STDDEV(salary)>5000;
select employee_id,first_name,salary from hr.employees order by salary desc;
select department_id,employee_id,first_name,salary from hr.employees order by salary desc,department_id;
select employee_id,first_name,last_name from hr.employees order by last_name asc;
select employee_id,first_name,hire_date from hr.employees order by hire_date asc;
select employee_id,first_name,commission_pct from hr.employees order by commission_pct nulls last;
select employee_id,first_name,commission_pct from hr.employees order by commission_pct nulls first;
select employee_id,first_name from hr.employees order by length(first_name) asc;
select employee_id,first_name,last_name from hr.employees order by substr(last_name,-2) asc;
select employee_id,upper(first_name) as fun from hr.employees order by fun asc;
select employee_id,first_name,last_name,salary from hr.employees order by (salary+500) desc;
select employee_id,first_name,last_name,salary,job_id from hr.employees order by job_id asc,last_name;
select employee_id,department_id,first_name,last_name,salary from hr.employees order by department_id asc,first_name asc;
select employee_id,first_name,job_id from hr.employees order by case when job_id='IT_PROG' then 1 else 2 end;
select employee_id,first_name,last_name,salary from hr.employees order by case when salary >5000 then 1 else 2 end ,salary desc;
select department_id,sum(salary) from hr.employees group by department_id having sum(salary) between 50000 and 200000;
select department_id,max(salary),min(salary) from hr.employees group by department_id having max(salary)>= 2*min(salary);
select department_id,employee_id,first_name from hr.employees order by case when department_id = 50 then 1 else 2 end ,department_id asc;
select employee_id,max(salary)/avg(salary) fun from hr.employees group by employee_id order by fun asc;
select employee_id,job_id,salary,first_name from hr.employees order by job_id asc,salary desc;
select employee_id,first_name,commission_pct from hr.employees order by commission_pct desc nulls last;
select employee_id,first_name,salary,commission_pct from hr.employees order by case when commission_pct is null then 1 else 2 end ,salary desc;
select employee_id,first_name,salary,department_id from hr.employees order by department_id asc,salary desc;
SELECT job_id, count(case when salary > 60000 then 1 end) * 1.0 / count(*) from hr.employees GROUP BY job_id HAVING COUNT(CASE WHEN salary > 60000 THEN 1 END) > COUNT(*) / 2;
SELECT department_id, sum(case when job_id IN ('IT_PROG', 'HR_REP') THEN salary ELSE 0 END) AS it_hr_salary FROM hr.employees GROUP BY department_id having sum(case when job_id IN ('IT_PROG', 'HR_REP') then salary else 0 end) >= 80000;
 
 
--  basic aggregate functions

select count(*) from hr.employees;
select count(distinct job_id) from hr.employees;
select sum(salary) from hr.employees;
select avg(salary) from hr.employees;
select min(salary) from hr.employees;
select max(salary) from hr.employees;
select median(salary) from hr.employees;
select variance(salary)from hr.employees;
select stddev(salary) from hr.employees;



-- aggregate function with group by

select department_id,count(*) from hr.employees group by department_id;
select department_id,sum(salary ) from hr.employees group by department_id;
select department_id,avg(salary ) from hr.employees group by department_id;
select department_id,min(salary ) from hr.employees group by department_id;
select department_id,max(salary ) from hr.employees group by department_id;
select job_id,count(*) from hr.employees group by job_id;
select department_id,sum(salary ) from hr.employees group by department_id having sum(salary)>100000;
select department_id,avg(salary ) from hr.employees group by department_id having avg(salary)>50000;
select department_id,count(*) from hr.employees group by department_id having count(*)>5;
select job_id,count(*) from hr.employees group by job_id having count(*)>10;

-- analytical function

select employee_id,salary,row_number() over (order by salary desc) from hr.employees ;
select employee_id,salary,rank() over (order by salary desc) from hr.employees ;
select employee_id,salary,dense_rank() over (order by salary desc) from hr.employees ;
select employee_id,salary,lag() over (order by salary) from hr.employees ;
select employee_id,salary,lead() over (order by salary) from hr.employees ;
select employee_id,salary,NTILE(4) over (order by salary desc) from hr.employees ;
select employee_id,salary,first_value() over (order by salary) from hr.employees ;
select employee_id,salary,last_value() over (order by salary rows between unbounded preceding and unbounded following) from hr.employees ;
select employee_id,cume_dist() over (order by salary ) from hr.employees ;
select employee_id,percent_rank() over (order by salary ) from hr.employees ;


-- order by with aggregate and analytical 
select employee_id,salary,first_name from hr.employees order by salary desc;
select employee_id,salary,department_id,first_name from hr.employees order by department_id asc,salary desc;
select employee_id,salary,last_name from hr.employees order by last_name asc;
select employee_id,salary,hire_date from hr.employees order by hire_date asc;
select employee_id,salary,first_name from hr.employees order by length(first_name) asc;
select employee_id,first_name,last_name from hr.employees order by substr(last_name,-2) asc;
select employee_id,salary,first_name,job_id from hr.employees order by case when job_id='IT_PROG' then 1 else 2 end;
select department_id,max(salary)/avg(salary) as fun from hr.employees group by department_id having max(salary)/avg(salary)>1.5 order by fun desc;
select employee_id,commission_pct,first_name from hr.employees order by commission_pct desc nulls last;
select employee_id,commission_pct,first_name,salary from hr.employees order by case when commission_pct is null then 2 else 1 end ,salary desc nulls last;