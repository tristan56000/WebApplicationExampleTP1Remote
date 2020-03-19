CREATE DATABASE IF NOT EXISTS GUERIN;

CREATE TABLE IF NOT EXISTS GUERIN.user (id INT NOT NULL AUTO_INCREMENT, name VARCHAR(20), password VARCHAR(30), salary BIGINT NOT NULL,age INT UNSIGNED NOT NULL, PRIMARY KEY(id));

INSERT INTO GUERIN.user(name,password,salary,age) VALUES ('user1','test',2500,21),('user2','test2',2400,27),('user3','test3',3900,18);

CREATE USER 'GUERIN'@'localhost';
GRANT all privileges on GUERIN.user to 'GUERIN'@'localhost';
FLUSH privileges;