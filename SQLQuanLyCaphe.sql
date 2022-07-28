create database QuanLyCaphe
go

USE QuanLyCaphe
GO

-- DEFAULT: Tính ràng buộc chặc chẽ 
/*Ràng buộc DEFAULT được sử dụng để thiết lập một giá trị mặc định cho một cột.
1.food
2.table
3.foodcategory
4.account
5.bill
6.billinfo 

Giá trị mặc định (DEFAULT) sẽ được thêm vào tất cả các bản ghi mới, nếu không có giá trị khác được chỉ đinh.*/
--
CREATE TABLE TableFood
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Table was unnamed',
	status Nvarchar(100) NOT NULL DEFAULT N'Empty'	--Trong || Co nguoi--  Empty: Trống rỗng--

)
GO
DELETE FROM dbo.TableFood
go
CREATE TABLE Account
(
	
	UserName NVARCHAR(100) PRIMARY KEY,
	DisplayName NVARCHAR(100) NOT NULL DEFAULT N'Cafer',--DisplayName: tên hiện thị --
	PassWord NVARCHAR(100)NOT NULL DEFAULT 0,
	Type INT NOT NULL DEFAULT 0 --1 admin " 0 staff/
	)
GO
DELETE  dbo.Account
go 

CREATE TABLE FoodCategory
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100)NOT NULL DEFAULT N'Chưa đặt tên'
)
GO
DELETE FROM dbo.FoodCategory


go
CREATE TABLE Food
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'was unnamed',
	idCategory INT NOT NULL, -- Category: loại --
	price FLOAT	NOT NULL DEFAULT 0,--price: giá bán --
	
	FOREIGN KEY (idCategory) REFERENCES dbo.FoodCategory(id)	
)
GO
DELETE FROM dbo.Food
go

CREATE TABLE Bill
(
	id INT IDENTITY PRIMARY KEY,
	Datacheckin DATETIME NOT NULL DEFAULT GETDATE(),
	Datacheckout DATETIME,
	idTable INT NOT NULL,
	status int NOT NULL	DEFAULT 0	--1:paid money || 0: unpaid monney (1: da thanh toan || 0: chua thanh toan)--    
	
	FOREIGN KEY (idTable) REFERENCES dbo.TableFood(id)
)
GO

CREATE TABLE BillInfo
(
	id INT IDENTITY PRIMARY KEY,
	idBill INT NOT NULL,
	idFood INT NOT NULL,
	count INT NOT NULL DEFAULT 0
	
	FOREIGN KEY (idBill) REFERENCES dbo.Bill(id),
	FOREIGN KEY (idFood) REFERENCES dbo.Food(id)
)
----------------------------------------------------------------------------------------------
INSERT INTO dbo.Account
(
    UserName,
    DisplayName,
    PassWord,
    Type
)
VALUES
(   N'K0',     -- UserName - nvarchar(100)
    N'K0', -- DisplayName - nvarchar(100)
    N'1',     -- PassWord - nvarchar(100)
    0        -- Type - int
    )

INSERT INTO dbo.Account
(
    UserName,
    DisplayName,
    PassWord,
    Type
)
VALUES
(   N'C2',     -- UserName - nvarchar(100)
    N'C2', -- DisplayName - nvarchar(100)
    N'1',     -- PassWord - nvarchar(100)
    1        -- Type - int
    )

INSERT INTO dbo.Account
(
    UserName,
    DisplayName,
    PassWord,
    Type
)
VALUES
(   N'C2',     -- UserName - nvarchar(100)
    N'C2', -- DisplayName - nvarchar(100)
    N'1',     -- PassWord - nvarchar(100)
    1        -- Type - int
    )
---------------------------------------------------------------------------------------------------
INSERT INTO dbo.FoodCategory
	(
		name
	)
VALUES
	(
		N'Phở Bất Ổn' -- name - nvarchar(100)
    )
--1
INSERT INTO dbo.FoodCategory
	(
		name
	)
VALUES
	(
		N'Phở Tạm Ổn' -- name - nvarchar(100)
    )
--2	
INSERT INTO dbo.FoodCategory
(
    name
)
VALUES
	(
		N'Phở Bất Bình' -- name - nvarchar(100)
    )
--3
INSERT INTO dbo.FoodCategory
(
    name
)
VALUES
	(
		N'Phở Phê Phán' -- name - nvarchar(100)
    )
--4
INSERT INTO dbo.FoodCategory
(
    name
)
VALUES
	(
		N'Phở Mắc Nghẹn' -- name - nvarchar(100)
    )
--5-------------------------------------------------------------------
	SELECT * FROM dbo.FoodCategory
	SELECT * FROM dbo.Food
	SELECT * FROM dbo.Account
	DELETE FROM dbo.Account WHERE UserName = N'C2'

CREATE PROC USP_GetAccountByUserName
@userName nvarchar (100)
AS
BEGIN
    SELECT * FROM dbo.Account WHERE UserName = @userName
END
GO

EXEC USP_GetAccountByUserName @userName = N'C2'


SELECT * FROM dbo.Account WHERE	UserName = N'' OR 1=1--

create proc USP_Login
@userName nvarchar (100), @passWord nvarchar (100)
as
begin
	select * from dbo.Account where UserName = @userName and PassWord = @passWord
end
go
------------------------------------------------------------TABle------------------------------------------------------

Declare @i int = 0 
while @i <= 10 
Begin
	insert dbo.TableFood(name) value (N'Bàn ' + cast (@i as nvarchar (100)))
	set @i = @i + 1
end
go

----------------------------------------------------------------------
--insert dbo.TableFood
--		(name, status )
--value (N'Bàn 1')

--insert dbo.TableFood
--		(name, status )
--value (N'Bàn 2')
-------------------Thêm category--------------------------
insert dbo.FoodCategory
		(name )
values (N'Hải sản')

insert dbo.FoodCategory
		(name)
values (N'Nông sản')

insert dbo.FoodCategory
		(name)
values (N'Lâm sản')

insert dbo.FoodCategory
		(name)

values (N'Nước giải khát')
-------------Thêm món--------------------
go
insert Food
	(name, idCategory, price)
values ('Mực một nắng sate',--name
		1,--idC
		120000)   

insert Food
	(name, idCategory, price)
values ('Nghêu hấp xả',--name
		2,--idC
		75000)  

insert Food
	(name, idCategory, price)
values ('Dú dê nướng sữa',--name
		3,--idC
		12000)  

insert Food
	(name, idCategory, price)
values ('Heo tẩm ớt',--name
		4,--idC
		12000)  

insert Food
	(name, idCategory, price)
values ('Bò cay',--name
		5 ,--idC
		12000)  

insert Food
	(name, idCategory, price)
values ('7up',--name
		6,--idC
		12000)  

insert Food
	(name, idCategory, price)
values ('Coca',--name
		7,--idC
		12000)  

insert Food
	(name, idCategory, price)
values ('Sting',--name
		8,--idC
		12000)  


insert Food
	(name, idCategory, price)
values ('RedBull',--name
		9,--idC
		20000)  

insert Food
	(name, idCategory, price)
values ('Cafe đen đá',--name
		10,--idC
		18000)  

insert Food
	(name, idCategory, price)
values ('Cafe sữa đá',--name
		11,--idC
		18000)  
		
insert Food
	(name, idCategory, price)
values ('Bạc xỉu',--name
		12,--idC
		22000)   
----------Add bill-------------------
go
insert Bill(Datacheckin, Datacheckout, idTable, status)
values (GETDATE(), Null,1,0 )
insert Bill(Datacheckin, Datacheckout, idTable, status)
values (GETDATE(), Null,2,0 )
insert Bill (Datacheckin, Datacheckout, idTable, status)
values (GETDATE(), GETDATE(),2,1 )

-------------------------Thêm bill info-----------------------------------------------
insert BillInfo (idBill, idFood, count)
values (1,1,2)
insert BillInfo (idBill, idFood, count)
values (1,3,4)
insert BillInfo (idBill,idFood, count)
values (1,5,1)
insert BillInfo (idBill,idFood, count)
values (2,1,2)
insert BillInfo (idBill,idFood, count)
values (3,5,2)

------------------------------------------------------------------------------------
go
select * from dbo.Bill
select * from dbo.BillInfo
select * from dbo.Food
select * from dbo.FoodCategory
