UPDATE  RESOURCE SET Years_Of_Exp=10 WHERE ID=6;

DELETE FROM RESOURCE WHERE ID = 9;

ALTER TABLE RESOURCE ADD LOCATION VARCHAR(20);

ALTER TABLE RESOURCE ADD PRIMARY KEY (ID);

ALTER TABLE RESOURCE DROP Years_Of_Exp;

ALTER TABLE RESOURCE MODIFY COLUMN ID BIGINT;

SELECT * FROM RESOURCE;

SELECT * FROM RESOURCE ORDER BY date_Of_Joining DESC;

SELECT * FROM RESOURCE ORDER BY date_Of_Joining;