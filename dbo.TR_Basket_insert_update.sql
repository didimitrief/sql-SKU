create trigger TR_Basket_insert_update
on Basket after insert 
as update Basket
set Basket.DiscountValue = Basket.Value * 0.05
from inserted
where Basket.ID = inserted.ID;