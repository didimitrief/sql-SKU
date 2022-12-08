create view vw_SKUPrice as 
	select * , dbo.udf_GetSKUPrice(ID) as Price from SKU;