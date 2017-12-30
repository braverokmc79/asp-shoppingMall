


CREATE table tblEmployees
(
  ID int primary key identity,
  FirstName nvarchar(50),
  LastName nvarchar(50),
  Gender nvarchar(20),
  JobTitle nvarchar(20),
  regDate dateTime not null DEFAULT GETDATE()
)






Insert into tblEmployees  values('홍', '길동', 'Male', 'Developer', );
Insert into tblEmployees  values('이', '민준', 'Female', 'Developer');
Insert into tblEmployees  values('김', '서준', 'Male', 'Sr. Developer');
Insert into tblEmployees  values('최', '주원', 'Male', 'Developer');
Insert into tblEmployees  values('박', '예준', 'FMale', 'Developer');
Insert into tblEmployees  values('정', '시우', 'Male', 'Developer');
Insert into tblEmployees  values('한', '준서', 'Female', 'Developer');
Insert into tblEmployees  values('명', '도윤', 'Male', 'Developer');
Insert into tblEmployees  values('이', '현우', 'Male', 'Sr . Developer');
Insert into tblEmployees  values('홍', '길동', 'Male', 'Developer');
Insert into tblEmployees  values('이', '민준', 'Female', 'Developer');

Insert into tblEmployees  values('김', '서연', 'Male', 'Sr. Developer');
Insert into tblEmployees  values('최', '서윤', 'Male', 'Developer');
Insert into tblEmployees  values('박', '민서', 'FMale', 'Developer');
Insert into tblEmployees  values('정', '지우', 'Male', 'Developer');
Insert into tblEmployees  values('한', '채원', 'Female', 'Developer');
Insert into tblEmployees  values('명', '은서', 'Male', 'Developer');
Insert into tblEmployees  values('이', '민서', 'Male', 'Sr . Developer');
Insert into tblEmployees  values('홍', '다은', 'Male', 'Developer');
Insert into tblEmployees  values('이', '지아', 'Female', 'Developer');
Insert into tblEmployees  values('김', '지유', 'Male', 'Sr. Developer');
Insert into tblEmployees  values('최', '주원', 'Male', 'Developer');
Insert into tblEmployees  values('박', '수아', 'FMale', 'Developer');
Insert into tblEmployees  values('정', '서현', 'Male', 'Developer');
Insert into tblEmployees  values('한', '하린', 'Female', 'Developer');
Insert into tblEmployees  values('명', '도영', 'Male', 'Developer');
Insert into tblEmployees  values('이', '연아아', 'Male', 'Sr . Developer');








declare  @num int

set @num = 0

while @num < 10

begin

 Insert into tblEmployees  values('홍'+ Cast(@num As char(10))	, '길동', 'Male', 'Developer', dateadd(day, @num+1,getDate()) )
 Insert into tblEmployees  values('이'+  Cast(@num As char(10)), '민준', 'Female', 'Developer', dateadd(day, @num+1,getDate()) )
 Insert into tblEmployees  values('김'+  Cast(@num As char(10)), '서준', 'Male', 'Sr. Developer', dateadd(day, @num+1,getDate()) )
 Insert into tblEmployees  values('최'+  Cast(@num As char(10)), '주원', 'Male', 'Developer', dateadd(day, @num+1,getDate()) )
 Insert into tblEmployees  values('박'+  Cast(@num As char(10)), '예준', 'FMale', 'Developer', dateadd(day, @num+1,getDate()) )
 Insert into tblEmployees  values('정'+  Cast(@num As char(10)), '시우', 'Male', 'Developer', dateadd(day, @num+1,getDate()) )
 Insert into tblEmployees  values('한'+  Cast(@num As char(10)), '준서', 'Female', 'Developer', dateadd(day, @num+1,getDate()) )
 Insert into tblEmployees  values('명'+  Cast(@num As char(10)), '도윤', 'Male', 'Developer', dateadd(day, @num+1,getDate()) )
 Insert into tblEmployees  values('이'+  Cast(@num As char(10)), '현우', 'Male', 'Sr . Developer', dateadd(day, @num+1,getDate()) )
 Insert into tblEmployees  values('홍'+  Cast(@num As char(10)), '길동', 'Male', 'Developer', dateadd(day, @num+1,getDate()) )
 Insert into tblEmployees  values('이'+  Cast(@num As char(10)), '민준', 'Female', 'Developer', dateadd(day, @num+1,getDate()) )

 Insert into tblEmployees  values('김'+  Cast(@num As char(10)), '서연', 'Male', 'Sr. Developer', dateadd(day, @num+1,getDate()) )
 Insert into tblEmployees  values('최'+  Cast(@num As char(10)), '서윤', 'Male', 'Developer', dateadd(day, @num+1,getDate()) )
 Insert into tblEmployees  values('박'+  Cast(@num As char(10)), '민서', 'FMale', 'Developer', dateadd(day, @num+1,getDate()) )
 Insert into tblEmployees  values('정'+  Cast(@num As char(10)), '지우', 'Male', 'Developer', dateadd(day, @num+1,getDate()) )
Insert into tblEmployees  values('한'+  Cast(@num As char(10)), '채원', 'Female', 'Developer', dateadd(day, @num+1,getDate()) )
Insert into tblEmployees  values('명'+  Cast(@num As char(10)), '은서', 'Male', 'Developer', dateadd(day, @num+1,getDate()) )
Insert into tblEmployees  values('이'+  Cast(@num As char(10)), '민서', 'Male', 'Sr . Developer', dateadd(day, @num+1,getDate()) )
Insert into tblEmployees  values('홍'+  Cast(@num As char(10)), '다은', 'Male', 'Developer', dateadd(day, @num+1,getDate()) )
Insert into tblEmployees  values('이'+  Cast(@num As char(10)), '지아', 'Female', 'Developer', dateadd(day, @num+1,getDate()) )
Insert into tblEmployees  values('김'+  Cast(@num As char(10)), '지유', 'Male', 'Sr. Developer', dateadd(day, @num+1,getDate()) )
Insert into tblEmployees  values('최'+  Cast(@num As char(10)), '주원', 'Male', 'Developer', dateadd(day, @num+1,getDate()) )
Insert into tblEmployees  values('박'+  Cast(@num As char(10)), '수아', 'FMale', 'Developer', dateadd(day, @num+1,getDate()) )
Insert into tblEmployees  values('정'+  Cast(@num As char(10)), '서현', 'Male', 'Developer', dateadd(day, @num+1,getDate()) )
Insert into tblEmployees  values('한'+  Cast(@num As char(10)), '하린', 'Female', 'Developer', dateadd(day, @num+1,getDate()) )
Insert into tblEmployees  values('명'+  Cast(@num As char(10)), '도영', 'Male', 'Developer', dateadd(day, @num+1,getDate()) )
Insert into tblEmployees  values('이'+ Cast(@num As char(10)), '연아아', 'Male', 'Sr . Developer', dateadd(day, @num+1,getDate()) )



   set @num = @num + 1

end



print '끝'


select * from tblEmployees;




create proc spGetEmployees
 @DisplayLength int,
 @DisplayStart int,
 @SortCol int,
 @SortDir nvarchar(10),
 @Search  nvarchar(255) =null
 as
 begin
		Declare @FirstRec int, @LastRec int
		Set @FirstRec =@DisplayStart;
		Set @LastRec = @DisplayStart + @DisplayLength;

		With CTE_Employees as
    (
			 Select ROW_NUMBER() over ( order by

					case when (@SortCol=0 and @SortDir='asc')
							 then Id
					end asc,
					case when (@SortCol=0 and @SortDir='desc')
							 then Id
					end desc,

          case when (@SortCol  = 1 and @SortDir ='asc')
			          then FirstName
					end asc,
					case when(@SortCol =1 and @SortDir='desc')
								then FirstName
					end desc,

					case when (@SortCol =2 and @SortDir='asc')
								then LastName
					end asc,
					case when (@SortCol =2 and @SortDir='desc')
								then LastName
					end desc,


					case when (@SortCol =3 and @SortDir='asc')
								then Gender
					end asc,
					case when (@SortCol=3 and @SortDir='asc')
								then Gender
					end desc,

					case when (@SortCol=4 and @SortDir='asc')
								then JobTitle
					end asc,
					case when (@SortCol =4 and @SortDir='desc')
								then JobTitle
					end desc

				)
				as RowNum,
				COUNT(*) over() as TotalCount,
				Id,
				FirstName,
				LastName,
				Gender,
				JobTitle
				from tblEmployees
				where ( @Search IS NULL
							Or Id like '%' + @Search + '%'
							Or FirstName like '%' + @Search + '%'
							Or LastName like '%' + @Search + '%'
							Or Gender like '%' + @Search + '%'
							Or JobTitle like '%' + @Search + '%' )
			)
				Select *
				from CTE_Employees
				where RowNum > @FirstRec and RowNum <= @LastRec

end







spGetEmployees 12, 0, 1, 'asc', '' ;
