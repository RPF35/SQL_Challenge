--create tables					 
CREATE TABLE IF NOT EXISTS employees(
	emp_no INT PRIMARY KEY NOT NULL, 
	emp_title_id VARCHAR(10) NOT NULL,
	birth_date VARCHAR(25) NOT NULL,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT  NULL,
	sex VARCHAR(25) NOT NULL,
	hire_date DATE NOT NULL);


CREATE TABLE IF NOT EXISTS dept_emp(
	emp_no INT NOT NULL, 
	dept_no VARCHAR(10) NOT NULL,
	PRIMARY KEY (emp_no,dept_no));

	
CREATE TABLE IF NOT EXISTS dept(
	dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(200) NOT NULL);
	
CREATE TABLE IF NOT EXISTS dept_manager(
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (emp_no));	
	
CREATE TABLE IF NOT EXISTS salaries(
	salary_id INT PRIMARY KEY NOT NULL,
	emp_no INT NOT NULL,
	salary INT NOT NULL);

		
CREATE TABLE IF NOT EXISTS titles(
	emp_title_id VARCHAR(10) PRIMARY KEY NOT NULL,
	title VARCHAR(200) NOT NULL);

ALTER TABLE titles
	ALTER COLUMN emp_title_id TYPE VARCHAR(25);
	
--adding foreign key contraints
ALTER TABLE employees
    ADD FOREIGN KEY (emp_title_id) REFERENCES Titles(emp_title_id);

ALTER TABLE dept_emp
	ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_emp
	ADD CONSTRAINT unique_dept_emp_key UNIQUE (emp_no, dept_no);

ALTER TABLE dept_emp DROP CONSTRAINT unique_dept_emp_key;

ALTER TABLE dept
	ADD CONSTRAINT unique_dept_emp_key UNIQUE (dept_no, dept_name);

ALTER TABLE dept
	ADD FOREIGN KEY (dept_no) REFERENCES dept_emp(dept_no);

ALTER TABLE dept_manager
	ADD FOREIGN KEY (dept_no) REFERENCES dept(dept_no);

ALTER TABLE dept_manager
	ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
	
ALTER TABLE salaries	
	ADD FOREIGN KEY (emp_no) REFERENCES employees (emp_no);
	

