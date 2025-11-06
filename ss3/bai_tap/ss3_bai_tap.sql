drop database if exists ss3_bai_tap;
create database if not exists ss3_bai_tap;
use ss3_bai_tap;
create table class(
	class_id int primary key auto_increment,
    class_name varchar(50),
    start_date date,
    status int
);

create table student(
	student_id int primary key auto_increment,
    student_name varchar(50),
    address varchar(50),
    phone varchar(50),
    status int,
    class_id int,
    foreign key(class_id) references class(class_id)
);

create table subject(
	sub_id int primary key auto_increment,
    sub_name varchar(50),
    credit int,
    status int
);

create table mark(
	mark_id int primary key auto_increment,
    sub_id int,
    student_id int,
    mark int,
    examtimes int,
    foreign key(sub_id) references subject(sub_id),
    foreign key(student_id) references student(student_id)
);

-- insert data
INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', current_date, 0);

INSERT INTO student (student_name, address, phone, status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_name, address, status, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (student_name, address, phone, status, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 
INSERT INTO mark (sub_id, student_id, mark, examtimes)
VALUES (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);
 
 -- truy van du lieu
 -- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
 select *
 from student
 where student_name like 'h%';
 
 -- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
 select * 
 from class 
 where month(start_date)>=12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * 
from subject
where credit between 3 and 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET SQL_SAFE_UPDATES = 0;
update student
set class_id =2
where student_name='Hung';
SET SQL_SAFE_UPDATES = 1;


-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select student_name,sub_name,mark
from student s left join mark m on s.student_id = m.student_id
				left join subject sj on sj.sub_id=m.sub_id
order by mark desc,student_name asc
