create table curator
(
    id  bigserial,
    fio varchar(30),
    primary key (id)
);

create table group_university
(
    id         bigserial,
    name       varchar(30) not null,
    id_curator bigserial,
    primary key (id),
    foreign key (id_curator) references curator (id)
);
create table student
(
    id       bigserial,
    fio      varchar(30) not null,
    sex      varchar(1)  not null,
    id_group bigserial,
    primary key (id),
    foreign key (id_group) references group_university (id)

);
insert into curator(fio)
VALUES ('Иванов Иван Иванович');

insert into curator(fio)
VALUES ('Петров Петр Петрович');

insert into curator(fio)
VALUES ('Иванов Иван Владимирович');

insert into group_university(name, id_curator)
values ('п-00', 3);

insert into group_university(name, id_curator)
values ('п-01', 1);

insert into group_university(name, id_curator)
values ('п-02', 2);

insert into student(fio, sex, id_group)
values ('Илья Муромов', 'м', 1);

insert into student(fio, sex, id_group)
values ('Пантифик Кириллович', 'м', 2);

insert into student(fio, sex, id_group)
values ('Савельева Софья Григорьевна', 'ж', 3);

select s.fio, c.fio, gu.name
from student s
         join group_university gu on gu.id = s.id_group
         join curator c on c.id = gu.id_curator;

select count(id)
from student;

select distinct fio, sex
from student
where sex = 'ж';

select *
from group_university;

update group_university
set id_curator = 1
where id = 3;

select *
from group_university
         join curator c on group_university.id_curator = c.id;

select * from student
where id_group in
(select id from group_university where name = 'п-02');
