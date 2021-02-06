--Challenge

select emp_no, first_name, last_name from employees; 
select title, from_date, to_date from titles;


--Retiring titles table - titles and employees table 
select e.emp_no, 
	e.first_name, 
	e.last_name, 
		t.title,
		t.from_date,
		t.to_date
into retiring_titles
from employees as e
inner join titles as t 
on (e.emp_no = t.emp_no)
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by emp_no asc;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name, 
title
INTO unique_titles
FROM retiring_titles
ORDER BY emp_no, to_date DESC;
-- Create table for the employee count by title
select count (emp_no), title
into retirement_titles
from unique_titles
group by title
order by count desc;


-- Creating mentorship_eligibilty table
select distinct on (e.emp_no) e.emp_no, 
e.first_name, 
e.last_name, 
e.birth_Date, 
de.from_date, 
de.to_date, 
t.title
into mentorship_eligibility
from employees as e
inner join dept_emp as de on (e.emp_no = de.emp_no)
inner join titles as t on (e.emp_no = t.emp_no)
where (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
-- current employee
AND (de.to_date = '9999-01-01')
order by emp_no asc;




