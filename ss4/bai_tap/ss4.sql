use ss3_bai_tap;
select * from subject;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * 
from subject
where subject.credit = (select max(credit) from subject);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select * 
from mark
where mark = (select max(mark) from mark);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.student_id, student_name, avg(mark) as avg
from student s join mark m on s.student_id = m.student_id
group by s.student_id, student_name
order by s.student_id, student_name asc;
