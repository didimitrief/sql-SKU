create procedure usp_MakeFamilyPurchase @FamilySurName varchar(255) as
begin
	declare @BasketSum int, @Result int
	select @BasketSum = sum(Value) from Basket
	update Family set BudgetValue -= @BasketSum
		where FamilySurName = @FamilySurName
	select @Result = count(*) from Family where FamilySurName = @FamilySurName
	if @Result = 0
		begin
			throw 51000, 'Family not founded', 1
		end
end;