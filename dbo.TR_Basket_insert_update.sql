create trigger TR_Basket_insert_update on Basket after insert 
as
begin
	declare @InsertedRows int
	select @InsertedRows = count(in1.ID)
	from inserted in1
		inner join inserted in2 on in1.ID_SKU = in2.ID_SKU
			and in1.ID <> in2.ID
	print @InsertedRows
	if @InsertedRows > 1
		update Basket
		set Basket.DiscountValue = Basket.Value * 0.05
		from inserted
		where Basket.ID = inserted.ID;
end;