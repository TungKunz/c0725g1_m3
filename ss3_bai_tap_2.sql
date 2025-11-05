
create database if not exists ss3_bai_tap;
use ss3_bai_tap;

create table customer(
	c_id int primary key auto_increment,
    c_name varchar(50),
    c_age int
);

create table orderr(
	o_id int primary key,
    c_id int,
    o_date date,
    o_totalprice double,
    foreign key(c_id) references customer(c_id)
);

create table product(
	p_id int primary key auto_increment,
    p_name varchar(50),
    p_price double
);

create table order_detail(
	o_id int,
    p_id int,
    od_QTY int,
    foreign key (o_id) references orderr(o_id),
    foreign key (p_id) references product(p_id)
);

insert into customer(c_name,c_age) value('Minh Quan',10);
insert into customer(c_name,c_age) value('Ngoc Oanh',20);
insert into customer(c_name,c_age) value('Hong Ha',50);

insert into orderr values(1,1,'2006-03-21',null),(2,2,'2006-03-23',null),(3,1,'2006-03-16',null);

insert into product value(1,"May giat",3);
insert into product value(2,"Tu lanh",3);
insert into product value(3,"Dieu hoa",3);
insert into product value(4,"Quat",3);
insert into product value(5,"Dep dien",3);

insert into order_detail value(1,1,3);
insert into order_detail value(1,3,7);
insert into order_detail value(1,4,2);
insert into order_detail value(2,1,1);
insert into order_detail value(3,1,8);
insert into order_detail value(2,5,4);
insert into order_detail value(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select * from orderr;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c_name,o_id
from customer c join orderr od on c.c_id=od.c_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c_name
from customer c left join orderr od on c.c_id=od.c_id
where od.c_id is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)
select od.o_id, o_date, sum(p.p_price * ode.od_QTY) as total_price
from orderr od join order_detail ode on od.o_id= ode.o_id
				join product p on p.p_id= ode.p_id
group by od.o_id;