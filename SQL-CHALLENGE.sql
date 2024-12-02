-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE Titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    PRIMARY KEY (title_id)
);
	

CREATE TABLE Departments (
    Dept_no VARCHAR   NOT NULL,
    Dept_name VARCHAR   NOT NULL,
	PRIMARY KEY (Dept_no)     
);



CREATE TABLE Employees (
    emp_no INTEGER   NOT NULL,
    emp_title VARCHAR   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title) REFERENCES Titles(title_id)
);

CREATE TABLE Salaries (
    emp_no INTEGER   NOT NULL,
    salary INTEGER   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);

CREATE TABLE Dept_manager (
    Dept_no VARCHAR   NOT NULL,
    emp_no INTEGER   NOT NULL,
	FOREIGN KEY (Dept_no) REFERENCES Departments(Dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Dept_emp (
    emp_no INTEGER   NOT NULL,
    Dept_no VARCHAR   NOT NULL,
	FOREIGN KEY (Dept_no) REFERENCES Departments(Dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);


