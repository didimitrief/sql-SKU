create table dbo.SKU (
  ID int not null primary key,
  Code varchar(10) unique,
  Name varchar(255)
);

create table Basket (
  ID int not null primary key,
  ID_SKU int not null references SKU(ID),
  Quantity int check (Quantity >= 0),
  Value int check (Value >=0),
  PurchaseDate date default getdate(),
  DiscountValue int
);

create table Family (
	ID int not null primary key,
	FamilySurName varchar(255),
	BudgetValue int
);