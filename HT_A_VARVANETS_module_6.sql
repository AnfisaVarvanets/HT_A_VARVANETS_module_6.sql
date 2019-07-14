use education
go
select productid, name, city,
ROW_Number () over (order by city,productid asc) as 'Порядковий номер' 
from Products
go


select productid, name, city,
ROW_NUMBER() OVER(PARTITION BY city order by city asc,name asc) as 'Порядковий номер в межах міста'
from Products
go


select productid, name, city,[Порядковий номер в межах міста]
from(
select productid, name, city,
ROW_NUMBER() OVER(PARTITION BY city order by city asc,name asc) as [Порядковий номер в межах міста]
from Products) as cte_city
where [Порядковий номер в межах міста] = 1
go


select productid, detailid, quantity,
sum (quantity) over (Partition by productid) as all_quantity_per_prod, 
sum (quantity) over (Partition by detailid) as all_quantity_per_det 
from supplies


select *
from(
Select 
supplierid,detailid,productid,quantity,
ROW_Number () over (order by supplierid)  as rn,
Count  (supplierid) over () as tot
from supplies) as cte
where rn between 10 and 15


Select *
From(
Select 
supplierid,detailid,productid,quantity,
avg (quantity) over ( )  as avg_qty
from supplies) as cte
where quantity<avg_qty
order by supplierid asc
