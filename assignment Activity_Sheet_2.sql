#database
CREATE DATABASE resources;

 

#Resource

CREATE TABLE resource( id INT PRIMARY KEY, NAME VARCHAR(500), date_of_joining DATE, year_of_experience INT ,yash_employee_id INT, location_id INT);
   

INSERT INTO `resources`.`resource`
            (`id`,
             `name`,
             `date_of_joining`,
             `year_of_experience`,
             `yash_employee_id`,
             `location_id`)
VALUES (1,"Amol Nilkanth Bagal", "2014-01-20",1,1002899,1
);

INSERT INTO `resources`.`resource`
            (`id`,
             `name`,
             `date_of_joining`,
             `year_of_experience`,
             `yash_employee_id`,
             `location_id`)
VALUES (2,"Manohar Singh","2012-09-10",8,1003927,1
);

INSERT INTO `resources`.`resource`
            (`id`,
             `name`,
             `date_of_joining`,
             `year_of_experience`,
             `yash_employee_id`,
             `location_id`)
VALUES (3,"Nitish Aggarwal","2008-03-28",8,1001553,2
);

INSERT INTO `resources`.`resource`
            (`id`,
             `name`,
             `date_of_joining`,
             `year_of_experience`,
             `yash_employee_id`,
             `location_id`)
VALUES (4,"Sonali Uttam Mane","2015-03-09",2,1000193,3

);

INSERT INTO `resources`.`resource`
            (`id`,
             `name`,
             `date_of_joining`,
             `year_of_experience`,
             `yash_employee_id`,
             `location_id`)
VALUES (5,"Ruchi Soni","2015-03-26",3,1003719,1
);


INSERT INTO `resources`.`resource`
            (`id`,
             `name`,
             `date_of_joining`,
             `year_of_experience`,
             `yash_employee_id`,
             `location_id`)
VALUES (6,"Kartik Dharmendra Jalgaonkar","2014-12-01",8,1003813,2
);



INSERT INTO `resources`.`resource`
            (`id`,
             `name`,
             `date_of_joining`,
             `year_of_experience`,
             `yash_employee_id`,
             `location_id`)
VALUES (7,"Charu Dubey","2014-03-13",8,1003549,1
);

INSERT INTO `resources`.`resource`
            (`id`,
             `name`,
             `date_of_joining`,
             `year_of_experience`,
             `yash_employee_id`,
             `location_id`)
VALUES (8,"Nikhil Bhagwantrao Raut","2014-05-19",8,1003054,2
);



INSERT INTO `resources`.`resource`
            (`id`,
             `name`,
             `date_of_joining`,
             `year_of_experience`,
             `yash_employee_id`,
             `location_id`)
VALUES (9,"Vishal Khandu Kumkar","2012-05-25",7,1003177,1
);

INSERT INTO `resources`.`resource`
            (`id`,
             `name`,
             `date_of_joining`,
             `year_of_experience`,
             `yash_employee_id`,
             `location_id`)
VALUES (10,"Isha Tiwari","2015-04-27",2,1003927,3
);


INSERT INTO resource VALUES (11,"Dharmendra Biswal", "2015-04-30",5
 ,1003999,2
);






#location
SELECT * FROM LOCATION;
CREATE TABLE location(location_id INT PRIMARY KEY, location_name VARCHAR(200));



INSERT INTO `location`
            (`location_id`,
             `location_name`)
VALUES (1,
        "Indore");
        
INSERT INTO `location`
            (`location_id`,
             `location_name`)
VALUES (2,
        "Pune");
        

INSERT INTO `location`
            (`location_id`,
             `location_name`)
VALUES (3,
        "Banglore");
        INSERT INTO `location`
            (`location_id`,
             `location_name`)
VALUES (4,
        "Mumbai");
        


#resource_hours
SELECT * FROM RESOURCE_HOURS;

CREATE TABLE resource_hours(resource_hrs_id INT PRIMARY KEY, resource_id BIGINT , hours INT, week_end_date DATE, 
FOREIGN KEY(resource_id) REFERENCES resource(ID));




INSERT INTO `resource_hours`
            (`resource_hrs_id`,
             `resource_id`,
             `hours`,
             `week_end_date`)
VALUES (1, 1, 8, "2014-12-26");

INSERT INTO `resource_hours`
            (`resource_hrs_id`,
             `resource_id`,
             `hours`,
             `week_end_date`)
VALUES (2, 2, 9, "2014-12-26");

INSERT INTO `resource_hours`
            (`resource_hrs_id`,
             `resource_id`,
             `hours`,
             `week_end_date`)
VALUES (3,3,2,"2014-12-26");

INSERT INTO `resource_hours`
            (`resource_hrs_id`,
             `resource_id`,
             `hours`,
             `week_end_date`)
VALUES (4,4,3,"2014-12-26");

INSERT INTO `resource_hours`
            (`resource_hrs_id`,
             `resource_id`,
             `hours`,
             `week_end_date`)
VALUES (5,5,5,"2015-06-26");

INSERT INTO `resource_hours`
            (`resource_hrs_id`,
             `resource_id`,
             `hours`,
             `week_end_date`)
VALUES (6,2,8,"2015-06-26");

INSERT INTO `resource_hours`
            (`resource_hrs_id`,
             `resource_id`,
             `hours`,
             `week_end_date`)
VALUES (7,1,7,"2015-06-26");


#project

CREATE TABLE project(project_id INT PRIMARY KEY, project_name VARCHAR(200), location_id INT, FOREIGN KEY fk_location_id(location_id) REFERENCES location(location_id) );



INSERT INTO `project`
            (`project_id`,
             `project_name`,
             `location_id`)
VALUES (1, "project1",	1);

INSERT INTO `project`
            (`project_id`,
             `project_name`,
             `location_id`)
VALUES (2, "project2",1);

INSERT INTO `project`
            (`project_id`,
             `project_name`,
             `location_id`)
             
VALUES (3,"project3",3);


INSERT INTO `project`
            (`project_id`,
             `project_name`,
             `location_id`)
             
VALUES (4, "project4",4);



-- List out resource name ,date_of_joining,location of resources whose years_of_exp is more than 2 years
SELECT r.NAME, r.date_of_joining, l.location_name 
FROM resource r INNER JOIN location l 
ON r.location_id = l.location_id 
AND r.year_of_experience > 2;

-- Find the employee which have maximum experience
SELECT * 
FROM resource 
WHERE year_of_experience = (SELECT MAX(year_of_experience) AS experience FROM resource);

-- Find the resource with Indore location 
SELECT r.* 
FROM resource r INNER JOIN location l 
ON r.location_id = l.location_id AND l.location_name = 'Indore';

-- Find the resource name,hours ,location ,week_end_date
SELECT r.NAME, rh.hours, rh.week_end_date, l.location_name
FROM resource r 
INNER JOIN resource_hours rh ON r.id = rh.resource_id 
INNER JOIN location l ON r.location_id = l.location_id;

-- Delete record from location table with location name as Mumbai
SET FOREIGN_KEY_CHECKS = 1;						
DELETE FROM location WHERE location_name = "Mumbai";
SELECT * FROM locatION;

-- Make listing of all the records from all the tables using inner join 
SELECT r.*, l.*, p.*, rh.* 
FROM resource r 
INNER JOIN location l ON r.location_id = l.location_id
INNER JOIN project p ON p.location_id = l.location_id
INNER JOIN resource_hours rh ON rh.resource_id = r.id;

-- Drop primary key  and foreign key constraint from project table (Drop constraint not the columns)	
ALTER TABLE project DROP FOREIGN KEY  `project_ibfk_1` ;
ALTER TABLE project CHANGE `project_id` `project_id` INT(11) NOT NULL,DROP PRIMARY KEY;
				







