use furama;
-- cau 2:
select * 
from nhan_vien
where (ho_va_ten like 'H%' or ho_va_ten like 'T%' or ho_va_ten like 'K%') and length(ho_va_ten)<20;

-- cau 3
select *
from khach_hang
where year(CURDATE())- year(ngay_sinh) > 18 and (dia_chi like '% Đà Nẵng' or dia_chi like '% Quảng Trị');

-- cau 4
select count(hd.ma_khach_hang) as so_lan_dat_phong, kh.*
from khach_hang kh join hop_dong hd on kh.ma_khach_hang= hd.ma_khach_hang
					join loai_khach lk on lk.ma_loai_khach= kh.ma_loai_khach
where kh.ma_loai_khach=1
GROUP BY kh.ma_khach_hang
order by count(hd.ma_khach_hang);

-- cau 5 
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,
    coalesce(dv.chi_phi_thue, 0) + coalesce(SUM(ct.so_luong * dvdk.gia), 0) as tong_tien
from khach_hang kh left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
					left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
					left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu 
                    left join hop_dong_chi_tiet ct on ct.ma_hop_dong = hd.ma_hop_dong
                    left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = ct.ma_dich_vu_di_kem
group by kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc
order by kh.ma_khach_hang, hd.ma_hop_dong;

-- cau 6
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv left join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu 
left join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu and year(hd.ngay_lam_hop_dong) = 2021 and month(hd.ngay_lam_hop_dong) between 1 and 3
where  hd.ma_hop_dong is null 
ORDER BY dv.ma_dich_vu;
