# WalmartsalesAnalysisi_SQL
-- which branch sold more products than average product sold?--

select Branch,
sum(Quantity)
from salesdata1
group by Branch
having sum(quantity)> (select avg(quantity) from salesdata1);
