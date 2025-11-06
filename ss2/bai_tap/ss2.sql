-- Xóa database cũ nếu có
drop database if exists ss2;
create database if not exists ss2;
use ss2;

-- =======================
-- CÁC BẢNG VẬT TƯ
-- =======================

create table phieu_xuats (
    so_px int primary key,
    ngay_xuat date
);

create table vat_tus (
    ma_vat_tu int primary key,
    ten_vat_tu varchar(250)
);

create table phieu_xuat_vat_tu (
    so_px int,
    ma_vat_tu int,
    dg_xuat varchar(250),
    sl_xuat int,
    foreign key (so_px) references phieu_xuats(so_px),
    foreign key (ma_vat_tu) references vat_tus(ma_vat_tu)
);

create table phieu_nhaps (
    so_pn int primary key,
    ngay_nhap date 
);

create table phieu_nhap_vat_tu (
    so_pn int,
    ma_vat_tu int,
    dg_nhap varchar(250),
    sl_nhap int,
    foreign key (so_pn) references phieu_nhaps(so_pn),
    foreign key (ma_vat_tu) references vat_tus(ma_vat_tu)
);

create table don_dhs (
    so_dh int primary key,
    ngay_dh date,
    ma_ncc int
);

create table don_dh_vat_tu (
    so_dh int,
    ma_vat_tu int,
    ma_ncc int,
    foreign key (so_dh) references don_dhs(so_dh),
    foreign key (ma_vat_tu) references vat_tus(ma_vat_tu)
);

create table nha_ccs (
    ma_ncc int primary key,
    ten_ncc varchar(250),
    dia_chi varchar(250),
    id_sdt int
);

create table sdts (
    id_sdt int primary key,
    sdt varchar(250)
);

alter table don_dhs add constraint fk_don_dh_nha_cc foreign key (ma_ncc) references nha_ccs(ma_ncc);
alter table nha_ccs add constraint fk_nha_cc_sdt foreign key (id_sdt) references sdts(id_sdt);

-- =======================
-- CÁC BẢNG BÁN HÀNG
-- =======================

create table customers (
    c_id int primary key,
    c_name varchar(250),
    c_age int
);

create table orders (
    o_id int primary key,
    c_id int,
    o_date date,
    o_total_price float,
    foreign key (c_id) references customers(c_id)
);

create table products (
    p_id int primary key,
    p_name varchar(250),
    p_price float
);

create table order_details (
    o_id int,
    p_id int,
    od_qty float,
    primary key (o_id, p_id),
    foreign key (o_id) references orders(o_id),
    foreign key (p_id) references products(p_id)
);
