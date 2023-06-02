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
	CONSTRAINT PK_de PRIMARY KEY (emp_no,dept_no));


CREATE TABLE IF NOT EXISTS dept(
	dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(200) NOT NULL);


CREATE TABLE IF NOT EXISTS dept_manager(
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
	CONSTRAINT PK_dm PRIMARY KEY (dept_no,emp_no));	


CREATE TABLE IF NOT EXISTS salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	CONSTRAINT PK_s PRIMARY KEY (emp_no,salary));

	
CREATE TABLE IF NOT EXISTS titles(
	emp_title_id VARCHAR(25) PRIMARY KEY NOT NULL,
	title VARCHAR(200) NOT NULL);

	
--adding foreign key contraints
ALTER TABLE employees
    ADD FOREIGN KEY (emp_title_id) REFERENCES Titles(emp_title_id);

ALTER TABLE dept_emp
	ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_manager
	ADD FOREIGN KEY (dept_no) REFERENCES dept(dept_no);

ALTER TABLE dept_manager
	ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
	
ALTER TABLE salaries	
	ADD FOREIGN KEY (emp_no) REFERENCES employees (emp_no);
	

