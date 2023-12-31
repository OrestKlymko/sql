CREATE TABLE worker(
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(1000) NOT NULL CHECK(LENGTH(NAME) BETWEEN 2 AND 1000),
  birthday date NOT NULL CHECK(YEAR(birthday)>1900),
  level VARCHAR(15) CHECK (LEVEL in ('Trainee','Junior','Middle','Senior')) NOT NULL,
  salary INT CHECK(salary BETWEEN 100 AND 100000)
)




CREATE TABLE client (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(1000) NOT NULL CHECK (LENGTH(name) BETWEEN 2 AND 1000)
);




CREATE TABLE project(
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  client_id BIGINT,
  start_date DATE,
  finish_date DATE,
  FOREIGN KEY (client_id) REFERENCES client(id)
)



CREATE TABLE project_worker (
    PROJECT_ID INT,
    WORKER_ID INT,
    PRIMARY KEY (PROJECT_ID, WORKER_ID),
    FOREIGN KEY (PROJECT_ID) REFERENCES project(ID),
    FOREIGN KEY (WORKER_ID) REFERENCES worker(ID)
);

