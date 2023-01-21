-- Create a table which has the employee number, first name, last name
-- , title, from_date, to_date. Filter by people born between 1952 & 1955
-- order by employee number
SELECT e.emp_no, e.first_name, e.last_name,
	t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as t
ON e.emp_no = t.emp_no
WHERE e.birth_date
	BETWEEN '1952-01-01'
	AND '1955-12-31'
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- Create a table that has the number of each retiring job title
SELECT COUNT(title) AS retire_count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY retire_count DESC;