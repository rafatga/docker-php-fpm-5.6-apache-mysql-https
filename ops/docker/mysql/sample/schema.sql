CREATE DATABASE IF NOT EXISTS business;
USE business;

CREATE TABLE employees (
                           emp_no      INT             NOT NULL,
                           birth_date  DATE            NOT NULL,
                           first_name  VARCHAR(14)     NOT NULL,
                           last_name   VARCHAR(16)     NOT NULL,
                           gender      ENUM ('M','F')  NOT NULL,
                           hire_date   DATE            NOT NULL,
                           PRIMARY KEY (emp_no)
);

INSERT INTO `employees` (`emp_no`, `birth_date`, `first_name`, `last_name`, `gender`, `hire_date`) VALUES ('1', '1989-01-01', 'Rafa', 'Teran', 'M', '2023-12-18');
