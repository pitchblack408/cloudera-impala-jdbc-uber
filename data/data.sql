-- noinspection SqlNoDataSourceInspectionForFile

create database school;

create table school.students ( student_no string, surname string, forename string);
create table school.modules ( module_code string, module_name string);
create table school.marks ( student_no string, module_code string, mark integer);

insert into school.students values ('20060101','Dickens','Charles');
insert into school.students values ('20060102','ApGwilym','Dafydd');
insert into school.students values ('20060103','Zola','Emile');
insert into school.students values ('20060104','Mann','Thomas');
insert into school.students values ('20060105','Stevenson','Robert');
insert into school.modules values ('CM0001', 'Databases');
insert into school.modules values ('CM0002', 'Programming Languages');
insert into school.modules values ('CM0003', 'Operating Systems');
insert into school.modules values ('CM0004', 'Graphics');
insert into school.marks values ('20060101', 'CM0001', 80);
insert into school.marks values ('20060101', 'CM0002', 65);
insert into school.marks values ('20060101', 'CM0003', 50);
insert into school.marks values ('20060102', 'CM0001', 75);
insert into school.marks values ('20060102', 'CM0003', 45);
insert into school.marks values ('20060102', 'CM0004', 70);
insert into school.marks values ('20060103', 'CM0001', 60);
insert into school.marks values ('20060103', 'CM0002', 75);
insert into school.marks values ('20060103', 'CM0004', 60);
