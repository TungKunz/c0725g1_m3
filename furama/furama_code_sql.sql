use furama;
-- cau 2:
select *
from nhan_vien
where (ho_va_ten like 'H%' or ho_va_ten like 'T%' or ho_va_ten like 'K%')
  and length(ho_va_ten) < 20;

-- cau 3
select *
from khach_hang
where year(CURDATE()) - year(ngay_sinh) > 18
  and (dia_chi like '% Đà Nẵng' or dia_chi like '% Quảng Trị');

-- cau 4
select count(hd.ma_khach_hang) as so_lan_dat_phong, kh.*
from khach_hang kh
         join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
         join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where kh.ma_loai_khach = 1
GROUP BY kh.ma_khach_hang
order by count(hd.ma_khach_hang);

-- cau 5 
select kh.ma_khach_hang
     , kh.ho_ten
     , lk.ten_loai_khach
     , hd.ma_hop_dong
     , dv.ten_dich_vu
     , hd.ngay_lam_hop_dong
     , hd.ngay_ket_thuc
     , sum((dv.chi_phi_thue + coalesce(ct.so_luong, 0) * coalesce(dvdk.gia, 0))) AS tong_tien
from khach_hang kh
         join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
         join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
         left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
         left join hop_dong_chi_tiet ct on ct.ma_hop_dong = hd.ma_hop_dong
         left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = ct.ma_dich_vu_di_kem
group by kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong,
         hd.ngay_ket_thuc
order by kh.ma_khach_hang, hd.ma_hop_dong;

-- cau 6
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
         left join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
         left join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu and year(hd.ngay_lam_hop_dong) = 2021 and
                                  month(hd.ngay_lam_hop_dong) between 1 and 3
where hd.ma_hop_dong is null
ORDER BY dv.ma_dich_vu;

-- cau 7
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue
from dich_vu_di_kem dvdk
         join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
         join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
         join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
where year(ngay_lam_hop_dong) = 2020
  and dv.ma_dich_vu not in (select dv.ma_dich_vu
                            from dich_vu_di_kem dvdk
                                     join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
                                     join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
                                     join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
                            where year(ngay_lam_hop_dong) = 2021)
group by dv.ma_dich_vu;

-- cau 8
select distinct ho_ten
from khach_hang;

-- cau 9 
SELECT MONTH(hd.ngay_lam_hop_dong) AS thang,
       COUNT(hd.ma_khach_hang)     AS so_khach_dat_phong
FROM hop_dong hd
WHERE YEAR(hd.ngay_lam_hop_dong) = 2021
GROUP BY MONTH(hd.ngay_lam_hop_dong)
ORDER BY thang;

-- cau 10
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, sum(so_luong) as sum
from hop_dong hd
         left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
         left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
order by hd.ma_hop_dong asc;

-- cau 11	
select dvdk.*, kh.ma_khach_hang, kh.ho_ten, kh.dia_chi
from khach_hang kh
         join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
         join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
         join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
         join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where lk.ten_loai_khach = 'Diamond'
  and (kh.dia_chi like '% Vinh' or kh.dia_chi like '% Quảng Ngãi');

-- cau 12
select hd.ma_hop_dong, ho_va_ten, ho_ten, kh.so_dien_thoai, ten_dich_vu, ifnull(sum(so_luong), 0) as so_luong
from khach_hang kh
         join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
         join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
         left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
         join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
where (year(ngay_lam_hop_dong) = 2020 and month(ngay_lam_hop_dong) between 10 and 12)
  and hd.ma_hop_dong not in
      (select hd.ma_hop_dong
       from khach_hang kh
                join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
                join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
                left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
                join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
       where (year(ngay_lam_hop_dong) = 2021 and month(ngay_lam_hop_dong) between 1 and 6))


group by hd.ma_hop_dong, ho_va_ten, ho_ten, kh.so_dien_thoai, ten_dich_vu;
-- cau 13
select dvdk.ma_dich_vu_di_kem, ten_dich_vu_di_kem, sum(so_luong) as max
from dich_vu_di_kem dvdk
         join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
         join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
         join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
group by dvdk.ma_dich_vu_di_kem, ten_dich_vu_di_kem
having sum(hdct.so_luong) = (select max(t.so_luong)
                             from (select sum(hdct2.so_luong) as so_luong
                                   from dich_vu_di_kem dvdk2
                                            join hop_dong_chi_tiet hdct2
                                                 on dvdk2.ma_dich_vu_di_kem = hdct2.ma_dich_vu_di_kem
                                   group by dvdk2.ma_dich_vu_di_kem) t);
-- cau 14
select hdct.ma_hop_dong,
       ldv.ten_loai_dich_vu,
       dvdk.ten_dich_vu_di_kem,
       count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung
from loai_dich_vu ldv
         join dich_vu dv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
         join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
         join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
         join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where hdct.ma_dich_vu_di_kem in (select ma_dich_vu_di_kem
                                 from hop_dong_chi_tiet
                                 group by ma_dich_vu_di_kem
                                 having COUNT(*) = 1)
group by hdct.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem
order by hdct.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem;

-- cau 15 
select nv.ma_nhan_vien, ho_va_ten, so_dien_thoai, dia_chi, coalesce(count(hd.ma_nhan_vien), 0) as so_luong
from nhan_vien nv
         left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where (year(ngay_lam_hop_dong) between 2020 and 2021)
group by nv.ma_nhan_vien, ho_va_ten, so_dien_thoai, dia_chi
having count(hd.ma_nhan_vien) <= 3;

-- cau 16
-- thay select bằng delete
select nv.ma_nhan_vien
from nhan_vien nv
         left join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where hd.ma_hop_dong is null;

-- cau 17 
update khach_hang
set ma_loai_khach = 1
where ma_khach_hang in (select *
                        from (select kh.ma_khach_hang
                              from loai_khach lk
                                       join khach_hang kh on lk.ma_loai_khach = kh.ma_loai_khach
                                       join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
                                       join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
                                       join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
                                       join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
                              where lk.ten_loai_khach like 'Platinium'
                              group by kh.ma_khach_hang
                              having sum(ifnull(chi_phi_thue, 0) + ifnull(so_luong, 0) * ifnull(gia, 0)) > 10000000) t);
-- cau 18
SET SQL_SAFE_UPDATES = 0;
delete khach_hang
from khach_hang
where khach_hang.ma_khach_hang in (select temp.ma_khach_hang
                                   from (select kh.ma_khach_hang
                                         from khach_hang kh
                                                  join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
                                         where year(hd.ngay_lam_hop_dong) < 2021)
                                            as temp);
SET SQL_SAFE_UPDATES = 1;
-- cau 19
select dvdk.ma_dich_vu_di_kem, ten_dich_vu_di_kem, sum(hdct.so_luong), gia
from dich_vu_di_kem dvdk
         left join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem, ten_dich_vu_di_kem, gia;
SET SQL_SAFE_UPDATES = 0;
update dich_vu_di_kem as dvdk
set dvdk.gia = dvdk.gia * 2
where dvdk.ma_dich_vu_di_kem in (select ma_dich_vu_di_kem
                                 from (select ma_dich_vu_di_kem, sum(hdct.so_luong)
                                       from hop_dong_chi_tiet hdct
                                       group by ma_dich_vu_di_kem
                                       having sum(hdct.so_luong) > 10) as t);
SET SQL_SAFE_UPDATES = 1;
-- cau 20
select ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang
union all
select ma_nhan_vien, nhan_vien.ho_va_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien;