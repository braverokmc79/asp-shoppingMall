
-- usert 테이블 생성

create table usert(

	  number int identity(1,1) primary key,  -- 고유번호
		username nvarchar(100)  null  , -- 사용자 이름
		age int null,  -- 나이
	  sex nvarchar(5) null, --성별
    id1 nvarchar(50) , -- 아이디
    passwd nvarchar(50), -- 비밀번호
		email nvarchar(50), -- 이메일
		tel nvarchar(50), -- 전화번호
		address nvarchar(100), -- 주소
		date1 datetime  default GETDATE(),  -- 가입날짜
		visited int , -- 방문횟수
    point int -- 포인트


)
