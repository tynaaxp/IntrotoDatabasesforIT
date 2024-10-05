-- q2
create database final_grades;
use final_grades;

create table grades (
  lname varchar(255),
  fname varchar(255),
  due_date date,
  submit_date date,
  unit_num int,
  assgn_type char(1),
  assgn_num int,
  grade int
);

insert into grades (lname, fname, due_date, submit_date, unit_num, assgn_type, assgn_num, grade) values
('Elena', 'Nancy', '2019-04-06', '2019-04-03', 1, 'h', 1, 110),
('Johnson', 'Barb', '2019-04-06', '2019-04-05', 1, 'h', 1, 96),
('Altoviti', 'Kaylee', '2019-04-06', '2019-04-06', 1, 'h', 1, 87),
('Romano', 'Reid', '2019-04-06', '2019-04-06', 1, 'h', 1, 83),
('Hartell', 'Sephora', '2019-04-06', '2019-04-08', 1, 'h', 1, 78),
('Altoviti', 'Kaylee', '2019-04-10', '2019-04-09', 2, 'd', 2, 110),
('Nosek', 'Aaron', '2019-04-06', '2019-04-09', 1, 'h', 2, 52),
('Hartell', 'Sephora', '2019-04-10', '2019-04-10', 2, 'd', 1, 92),
('Nosek', 'Aaron', '2019-04-10', '2019-04-10', 2, 'd', 1, 98),
('Johnson', 'Barb', '2019-04-13', '2019-04-13', 2, 'h', 3, 82),
('Rye', 'Jacob', '2019-04-13', '2019-04-13', 2, 'h', 2, 97),
('Rye', 'Alina', '2019-04-13', '2019-04-15', 2, 'h', 3, 77),
('Rye', 'Alina', '2019-04-20', '2019-04-18', 3, 'd', 1, 110),
('Elena', 'Nancy', '2019-04-20', '2019-04-19', 3, 'd', 1, 110),
('Rye', 'Jacob', '2019-04-20', '2019-04-21', 3, 'd', 1, 63),
('Romano', 'Reid', '2019-04-20', '2019-04-22', 3, 'd', 1, 71);


-- q3
select * from grades where grade < 70;

-- q4
alter table grades add id int not null auto_increment primary key first;

-- q5
select distinct lname, fname
from grades 
order by lname, fname;

-- q6
select concat(fname, ' ', lname) as name, avg(grade) as avg 
from grades 
group by lname, fname 
order by avg desc;

-- q7
select lname, fname,  unit_num, assgn_type, assgn_num, datediff(submit_date , due_date) as days_late from grades 
where submit_date > due_date;

-- q8
select concat(fname, ' ', lname) as name, due_date, (submit_date - due_date) as days_late 
from grades 
where submit_date > due_date and due_date = (
    select max(due_date) from grades
);
