-- -----------------------------------------------------
-- Schema HR_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema HR_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `HR_DB` DEFAULT CHARACTER SET utf8 ;
USE `HR_DB` ;

-- -----------------------------------------------------
-- Table `HR_DB`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HR_DB`.`cities` (
  `city_id` INT NOT NULL AUTO_INCREMENT,
  `city_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`city_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HR_DB`.`countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HR_DB`.`countries` (
  `country_id` INT NOT NULL AUTO_INCREMENT,
  `country_name` VARCHAR(50) NOT NULL,
  `city_id` INT NOT NULL,
  PRIMARY KEY (`country_id`),
  CONSTRAINT `rrgion_id`
    FOREIGN KEY (`city_id`)
    REFERENCES `HR_DB`.`cities` (`city_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HR_DB`.`locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HR_DB`.`locations` (
  `location_id` INT NOT NULL,
  `street_adress` VARCHAR(60) NOT NULL,
  `postal_code` INT NOT NULL,
  `country_id` INT NOT NULL,
  PRIMARY KEY (`location_id`),
  CONSTRAINT `country_id`
    FOREIGN KEY (`country_id`)
    REFERENCES `HR_DB`.`countries` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HR_DB`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HR_DB`.`departments` (
  `department_id` INT NOT NULL,
  `department_name` VARCHAR(45) NOT NULL,
  `manager_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`department_id`),
  CONSTRAINT `location_id`
    FOREIGN KEY (`location_id`)
    REFERENCES `HR_DB`.`locations` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HR_DB`.`jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HR_DB`.`jobs` (
  `job_id` VARCHAR(30) NOT NULL,
  `job_title` VARCHAR(50) NOT NULL,
  `min_salary` INT NOT NULL,
  `max_salary` INT NOT NULL,
  PRIMARY KEY (`job_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HR_DB`.`job_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HR_DB`.`job_history` (
  `emp_id` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_dat` DATE NOT NULL,
  `job_id` VARCHAR(30) NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`emp_id`),
  CONSTRAINT `job_id`
    FOREIGN KEY (`job_id`)
    REFERENCES `HR_DB`.`jobs` (`job_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `department_id`
    FOREIGN KEY (`department_id`)
    REFERENCES `HR_DB`.`departments` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HR_DB`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HR_DB`.`employees` (
  `emp_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `emaill` VARCHAR(70)  NULL,
  `phon_number` VARCHAR(50) NOT NULL,
  `hire_date` DATE NOT NULL,
  `job_id` VARCHAR(30) NOT NULL,
  `salary` INT NOT NULL,
  `manager_id` INT NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`emp_id`),
    FOREIGN KEY (`department_id`)
    REFERENCES `HR_DB`.`departments` (`department_id`),
    FOREIGN KEY (`job_id`)
    REFERENCES `HR_DB`.`jobs` (`job_id`),
    FOREIGN KEY (`emp_id`)
    REFERENCES `HR_DB`.`job_history` (`emp_id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- insert data into cities table
-- -----------------------------------------------------

INSERT INTO cities
   (city_name)
   VALUES
    ("Amman"),
    ("Cairo"),
    ("Jeddah");
-- -----------------------------------------------------
-- insert data into countries table
-- -----------------------------------------------------
INSERT INTO countries
(country_name,city_id)
VALUES
 ("Egypt",2),
 ("Jordan",1),
 ("KSA",3);
-- -----------------------------------------------------
-- insert data into locations table
-- -----------------------------------------------------
INSERT INTO locations
(location_id,street_adress,postal_code,country_id)
VALUES
(5,"222-Arar Street",962,2),
(10,"174-Nile Street",247,1),
(15,"863-Jaddah-Street",810,3);
-- -----------------------------------------------------
-- insert data into departments table
-- -----------------------------------------------------

INSERT INTO departments
(department_id,department_name,manager_id,location_id)
VALUES
(10,"Markting",124,10),
(20,"Game designer",204,15),
(30,"Artist",107,10),
(40,"Programmer",100,5),
(50,"Sales",123,5);
-- -----------------------------------------------------
-- insert data into jobs table
-- -----------------------------------------------------
INSERT INTO jobs
(job_id,job_title,min_salary,max_salary)
VALUES
("MAR_R","Markting representative",500,1500),
("SAL_R","Sales representative",500,1500),
("T_PRO","Tool programmer",500,2000),
("E_PRO","Engine Programmer",500,2000),
("CON_ART","Concept Artist",700,2500),
("CHR_ART","Character artist",700,2500),
("DEZ_EXP","Design expert",700,2000),
("VIS_DEZ","Visual designers",500,2000),
("SAL_M","Sales manager",1000,1500),
("MAR_M","Markting manager",1000,1500);
-- -----------------------------------------------------
-- insert data into job_history table
-- -----------------------------------------------------
INSERT INTO job_history
(emp_id,start_date,end_dat,job_id,department_id)
VALUES
(103,"2020-05-27","2023-05-27","VIS_DEZ",20),
(104,"2021-07-28","2024-07-28","SAL_R",50),
(105,"2020-02-28","2023-02-28","MAR_R",10),
(106,"2020-05-03","2025-05-03","E_PRO",40),
(107,"2021-05-31","2024-05-31","E_PRO",40),
(108,"2020-06-22","2023-06-22","DEZ_EXP",20),
(109,"2021-06-02","2024-06-02","CON_ART",30),
(110,"2020-11-03","2024-11-03","T_PRO",40),
(111,"2020-06-04","2023-06-04","SAL_R",50),
(112,"2020-09-05","2025-09-05","MAR_R",10),
(113,"2021-06-06","2024-06-06","CHR_ART",30),
(114,"2022-01-07","2025-01-07","VIS_DEZ",20),
(115,"2020-03-08","2023-03-08","VIS_DEZ",20),
(116,"2020-06-09","2025-06-09","CON_ART",30),
(117,"2020-06-10","2023-06-10","SAL_R",50),
(118,"2020-07-11","2023-07-11","T_PRO",40),
(119,"2022-04-12","2024-04-12","CON_ART",30),
(120,"2020-06-13","2023-06-13","T_PRO",40),
(121,"2022-02-14","2025-02-14","MAR_R",10),
(122,"2020-01-15","2023-01-15","E_PRO",40),
(123,"2021-12-16","2022-12-16","SAL_M",50),
(124,"2020-02-11","2020-02-11","MAR_M",10);
-- -----------------------------------------------------
-- insert data into employees table 
-- -----------------------------------------------------

INSERT INTO employees
(emp_id,first_name,last_name,phon_number,hire_date,job_id,salary,manager_id,department_id)
VALUES
(103,"Sara","Ali","395-502-4971","2020-05-27","VIS_DEZ",800,204,20),
(104,"Rawa","Hassan","552-378-8771","2021-07-28","SAL_R",600,123,50),
(105,"Ahmad","Yaseen","228-571-1550","2020-02-28","MAR_R",700,124,10),
(106,"Yumna","Sbri","488-350-5436","2020-05-03","E_PRO",800,100,40),
(107,"Maha","Khaled","214-598-0316","2021-05-31","E_PRO",1000,100,40),
(108,"Rami","Ahmad","898 -287-6215","2020-06-22","DEZ_EXP",1200,204,20),
(109,"Enas","Qasem","858-998-6718","2021-06-02","CON_ART",900,107,30),
(110,"Omar","Sanad","805-699-1694","2020-11-03","T_PRO",750,100,40),
(111,"Mohamed","Fawzi","494-444-6825","2020-06-04","SAL_R",900,123,50),
(112,"Lara","Hamdi","431-459-6151","2020-09-05","MAR_R",800,124,10),
(113,"Sama","Abdo","838-663-4792","2021-06-06","CHR_ART",1000,107,30),
(114,"Noor","Dabour","265-996-7580","2022-01-07","VIS_DEZ",1500,204,20),
(115,"Sami","Sameer","543-681-7815","2020-03-08","VIS_DEZ",1700,204,20),
(116,"Qasem","Hadad","824-278-9033","2020-06-09","CON_ART",800,104,30),
(117,"Anas","Lotfi","356-613-8537","2020-06-10","SAL_R",1000,123,50),
(118,"Lama","Rami","346-615-8216","2020-07-11","T_PRO",1200,100,40),
(119,"Odai","Ranan","548-236-5533","2020-04-12","CON_ART",1000,107,30),
(120,"Mazn","Hadad","814- 336-9108","2020-06-13","T_PRO",900,100,40),
(121,"Fahed","Rateb","911-264-8604","2022-02-14","MAR_R",900,124,10),
(122,"Saad","Rami","510-448-5086","2020-01-15","E_PRO",1000,100,40),
(123,"Dana","Fahmi","925-252-4238","2020-12-16","SAL_M",1500,1,50),
(124,"Tarq","Rasmi","103-821-4186","2020-02-11","MAR_M",1500,1,10);


-- -----------------------------------------------------
-- Write the email for each employ 
-- -----------------------------------------------------
SET SQL_SAFE_UPDATES = 0;

update employees
set emaill = concat(first_name,last_name," @gmail.com");

-- -----------------------------------------------------
-- Query to find the the two highest salary in each department
-- -----------------------------------------------------
with a as (select *,
rank () over (partition by  department_id order by salary desc ) as rnk
from employees )

select emp_id , first_name,last_name ,job_id,salary,rnk ,d.department_name
from a
join departments as d  on d.department_id=a.department_id
 where rnk < 3 ;
 
-- -----------------------------------------------------
-- Creat procedure to find all information about any emoloy 
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE full_employ_info (in fir_name varchar (45),in scd_name  varchar (45))
BEGIN
select emp.emp_id,first_name,last_name,job_title,department_name,salary,start_date,end_dat
from employees emp
join departments dep
on emp.department_id=dep.department_id
join jobs jo
on jo.job_id=emp.job_id
join job_history joh
on emp.emp_id=joh.emp_id
where first_name = fir_name AND last_name=scd_name;
END //
DELIMITER ;

call full_employ_info ('Sara',"Ali");

-- -----------------------------------------------------
-- Creat view to show jobs summary in the company 
-- -----------------------------------------------------

create view Jobs_summary
as 
SELECT e.job_id,job_title, COUNT(*) as num_of_emp, SUM(salary), 
	MAX(salary)-MIN(salary) AS salary_dif_bet_highest_and_lowest_salry
		FROM employees e
        join jobs j on e.job_id=j.job_id
			GROUP BY e.job_id;
