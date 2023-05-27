-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/G3Uprl
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Dept" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "dept_name" VARCHAR(200)   NOT NULL,
    CONSTRAINT "pk_Dept" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_Dept_emp" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Dept_manager" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_Dept_manager" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(10)   NOT NULL,
    "birth_date" VARCHAR(25)   NOT NULL,
    "first_name" VARCHAR(25)   NOT NULL,
    "last_name" VARCHAR(25)   NOT NULL,
    "sex" VARCHAR(25)   NOT NULL,
    "hire_date" VARCHAR(25)   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "salary_id" INT   NOT NULL,
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "salary_id"
     )
);

CREATE TABLE "Titles" (
    "emp_title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR(200)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "emp_title_id"
     )
);

ALTER TABLE "Dept" ADD CONSTRAINT "fk_Dept_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Dept_emp" ("dept_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Dept" ("dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Salaries" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Employees" ("emp_title_id");

