CREATE TABLE Customer (
    cId int NOT NULL PRIMARY KEY,
    cName varchar(20),
    cAddress varchar(30),
    cPhone varchar(11) 
);

INSERT INTO Customer VALUES 
    (2, 'Akhil', 'Noida sector 52', '7329473942'),
    (3, 'Ajit', 'Noida sector 73', '8423942374'),
    (4, 'Tushar', 'Noida sector 51', '9479474143'),
    (5, 'Manish', 'Noida nsez', '9979744372'),
    (6, 'Sant', 'New Delhi', '7394398473'),
    (7, 'Ayush', 'New Delhi', '8398482322');

SELECT * FROM Customer WHERE cid IN('3','6','7');
SELECT * FROM Customer WHERE cid IN('3','6','7') ORDER BY cName ASC;
SELECT * FROM Customer LIMIT 4;

CREATE INDEX name/id ON Customer(cId, cName);

CREATE TABLE orders (
    id int NOT NULL,
    numberOfItems int,
    billingAddress varchar(40) NOT NULL,
    shippingAddress varchar(40) NOT NULL,
    orderDate DATE,
    cId int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (cId) REFERENCES Customer(cId)
);

INSERT INTO orders VALUES 
    (12, 2, 'New Delhi', 'Noida', '2023-04-05', 7),
    (13, 2, 'Paschim viahr, New Delhi', 'Kirti nagar, New Delhi', '2022-02-01', 6),
    (14, 5, 'Mumbai', 'Noida', '2023-01-01', 4),
    (15, 1, 'Gorakhpur', 'New Delhi', '2023-03-05', 3),
    (16, 2, 'New Delhi', 'Noida', '2021-04-05', 2),
    (17, 7, 'kanpur', 'Delhi', '2021-01-05', 5);

SELECT * FROM orders;

SELECT Customer.cName, orders.id, orders.orderDate FROM orders JOIN Customer ON orders.cid = Customer.cid;
SELECT Customer.cName AS Customer_name, orders.id AS Order_Id, orders.orderDate  FROM orders JOIN Customer ON orders.cid = Customer.cid;
select cid,cname from customer where cname like 'A%';
select * from orders where numberofitems > 1;

----------------------------------------------------------------------------------------------------------------------------------------------

create table employee(
    empid int primary key,
    empname varchar(100),
    department varchar(50),
    contactno bigint, 
    emaildid varchar(100), 
    empheadid int
    )

insert into employee values 
    (101, 'Isha', 'E-101', 1234567890, 'isha@gmail.com', 105),
    (102, 'Priya', 'E-104', 1234567890, '	priya@yahoo.com', 103),
    (103, 'Neha', 'E-101', 1234567890, 'neha@gmail.com', 101),
    (104, 'Rahul', 'E-102', 1234567890, 'rahul@gmail.com', 105),
    (105, 'Abhishek', 'E-101', 1234567890, 'abhishek@gmail.com', 102);

create table empdept(
    deptid varchar(50) primary key,
    deptname varchar(100), 
    dept_off varchar(100), 
    depthead int,
    foreign key(depthead) references employee(empid)
    );  

insert into empdept values 
    ('E-101', 'HR', 'Maonday', 105),
    ('E-102', 'Development', 'Tuesday', 101),
    ('E-103', 'Hous Keeping', 'Saturday', 103),
    ('E-104', 'Sales', 'Sunday', 104),
    ('E-105', 'Purchage', 'Tuesday', 104);

create table empsalary(
    empid int,
    salary bigint,
    ispermanent varchar(3),
    foreign key(empid) references employee(empid) 
    );

insert into empsalary values 
    (101, 2000, 'Yes'),
    (102, 10000, 'Yes'),
    (103, 5000, 'No'),
    (104, 1900, 'Yes'),
    (105, 2300, 'Yes');


create table project(
    projectid varchar(50) primary key,
    duration int
);


insert into project values 
    ('p-1', 23),
    ('p-2', 15),
    ('p-3', 45),
    ('p-4', 2),
    ('p-5', 30);

create table country(
    cid varchar(50) primary key,
    cname varchar(100)
);

insert into country values 
    ('c-1', 'India'),
    ('c-2', 'USA'),
    ('c-3', 'China'),
    ('c-4', 'Pakistan'),
    ('c-5', 'Russia');


create table clienttable(
    clientid varchar(50) primary key, 
    clientname varchar(100), 
    cid varchar(50),
    foreign key(cid) references country(cid)
    );

insert into clienttable values 
    ('cl-1', 'ABC Group', 'c-1'),
    ('cl-2', 'PQR', 'c-2'),
    ('cl-3', 'XYZ','c-3'),
    ('cl-4', 'Tech altum','c-4'),
    ('cl-5', 'mnp', 'c-5');

create table empproject(
    empid int,
    projectid varchar(50), 
    clientid varchar(50),
    startyear int, 
    endyear int,
    foreign key(empid) references employee(empid), 
    foreign key(projectid) references project(projectid),
    foreign key(clientid) references clienttable(clientid)
    );


(103, 'p-3', 'cl-3', 2013, 2010),
insert into empproject values 
    (101, 'p-1', 'cl-1', 2010, 2010),
    (102, 'p-2', 'cl-2', 2010, 2012),
    (104, 'p-4', 'cl-1', 2014, 2015);

insert into empproject (empid, projectid, clientid, startyear) values
    (103, 'p-1', 'cl-3', 2013),
    (105, 'p-4', 'cl-5', 2015),


--------------------------------------------------------------------------------------------

SELECT * FROM employee where empname like "P%" OR empname like 'p%';

SELECT count(empid) from empsalary where salary > 5000 AND ispermanent = 'Yes';

select * from employee where emaildid like '%@gmail.com';

