create table product
(
	idx int IDENTITY(1,1) primary key,
  pid nvarchar(50) ,
	pname nvarchar(50),
  price int,
  pstate nvarchar(10),
  regdate datetime default GETDATE()

)


insert into product ( pid , pname, price, pstate ) values( 'm_010101', '서류가방' , 30000, '구매');

insert into product ( pid , pname, price, pstate ) values( 'm_010102', '2단우산' , 40000, '구매');
