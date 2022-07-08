select * from users;
drop table users;



create table users (
id varchar2(50) not null primary key,
password varchar2(50) not null,
name varchar2(30) not null,
regdate date default sysdate,
address varchar2(100) not null,
phone varchar2(30) not null,
email varchar2(30),
birth varchar2(30) not null,
gender varchar2(30) not null,
groupid varchar2(30)
);