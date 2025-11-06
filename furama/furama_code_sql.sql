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
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc
   , sum((dv.chi_phi_thue + coalesce(ct.so_luong,0) * coalesce(dvdk.gia,0))) AS tong_tien
from khach_hang kh join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
					join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
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

-- cau 7
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue
from dich_vu_di_kem dvdk join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem= hdct.ma_dich_vu_di_kem
						join hop_dong hd on hd.ma_hop_dong= hdct.ma_hop_dong
						join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
where year(ngay_lam_hop_dong)=2020 and dv.ma_dich_vu not in( select dv.ma_dich_vu
						from dich_vu_di_kem dvdk join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem= hdct.ma_dich_vu_di_kem
						join hop_dong hd on hd.ma_hop_dong= hdct.ma_hop_dong
						join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
						where year(ngay_lam_hop_dong)=2021)
group by dv.ma_dich_vu;

-- cau 8
select distinct ho_ten 
from khach_hang;

-- cau 9 
SELECT 
    MONTH(hd.ngay_lam_hop_dong) AS thang,
    COUNT(hd.ma_khach_hang) AS so_khach_dat_phong
FROM hop_dong hd
WHERE YEAR(hd.ngay_lam_hop_dong) = 2021
GROUP BY MONTH(hd.ngay_lam_hop_dong)
ORDER BY thang;

-- cau 10
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,hd.tien_dat_coc, sum(so_luong) as sum
from hop_dong hd left join hop_dong_chi_tiet hdct on hd.ma_hop_dong= hdct.ma_hop_dong
				 left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem= hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
order by hd.ma_hop_dong asc;

-- cau 11	
select dvdk.* , kh.ma_khach_hang, kh.ho_ten ,kh.dia_chi
from khach_hang kh join loai_khach lk on kh.ma_loai_khach= lk.ma_loai_khach
					join hop_dong hd on  kh.ma_khach_hang = hd.ma_khach_hang
					join hop_dong_chi_tiet hdct on hdct.ma_hop_dong= hd.ma_hop_dong
					join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where lk.ten_loai_khach= 'Diamond' and (kh.dia_chi like '% Vinh' or kh.dia_chi like '% Quảng Ngãi');

-- cau 12
-- cau 13
-- cau 14
select hd.ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung
from loai_dich_vu ldv left join dich_vu dv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
						join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
                        join hop_dong_chi_tiet hdct on hdct.ma_hop_dong= hd.ma_hop_dong
                        join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem