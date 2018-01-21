
-- 유저 테이블 생성
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


);


-- 상품 테이블
create table prodt(

	number int identity(1,1) primary key, -- 고유번호
	prodcode nvarchar(100) not null ,  -- 제품코드
	prodname nvarchar(100) not null,  -- 제품이름
	prodinfo1 nvarchar(3000) null,     -- 상세설명1
	prodinfo2 nvarchar(3000) null,   	  -- 상세설명2
	prodpic   nvarchar(100) null,   		-- 이미지 경로
	sortcode nvarchar(100) null , 		-- 분류코드
	stwon 	int not null, 					-- 정규가격
	won 		int not null, 					-- 할인가격
	proddate  datetime default GETDATE(), -- 등록일
	stcount  int, 								-- 총수량
	realcount int, 								-- 실수량
	nowcount  int 								-- 현재수량

);




-- 제품 분류 테이블
create table sortt (

	number int identity(1,1) primary key ,  -- 고유번호
	sortcode nvarchar(100) ,   -- 분류코드
	sortname nvarchar(100), 	-- 분류명
	sortdate nvarchar(50), 	-- 날짜

);
