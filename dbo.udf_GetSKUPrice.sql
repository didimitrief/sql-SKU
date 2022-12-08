create function udf_GetSKUPrice (@ID_SKU int)
	returns decimal(18, 2)
	begin
		declare @Price decimal(18, 2), @Quantity decimal(18, 2), @Value decimal(18, 2)
		select @Quantity = Quantity, @Value = Value
		from Basket
		where  Basket.ID_SKU = @ID_SKU
		set @Price = @Value / @Quantity
		return @Price
	end;
