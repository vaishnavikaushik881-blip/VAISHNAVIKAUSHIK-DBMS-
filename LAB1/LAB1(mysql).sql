CREATE DATABASE xyz;

USE xyz;

CREATE TABLE xyz1 (
    sapid INTEGER,
    Nam VARCHAR(15),
    Mobile VARCHAR(15),
    dept VARCHAR(20),
    emailid VARCHAR(20)
);

SELECT * FROM xyz1;

INSERT INTO xyz1 (sapid, Nam, Mobile, dept, emailid)
VALUES
(1254, 'deepak', '9869453218', 'EXTC', 'deepak@gmail.com');
