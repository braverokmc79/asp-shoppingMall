7.16 파일 조작법
파일 시스템을 사용하기 위해서는 FileSystemObject 객체를 사용한다. 이 객체를 사용하려면
웹 상에서 동적으로 디렉토리의 생성과 삭제, 텍스트 파일의 생성과 삭제, 편집 등을 손쉽게
처리할 수 있다. 특히, 이런 파일의 조작은 클라이언트에서 작동할 수 있는 것이 아니라,
서버에서 작동할 수 있는 것이라는 점에 주의해야 한다.

FileSystemObject 객체를 사용하기 위해서는 Server 객체의 CreateOBject 메서드를
사용해서 FileSystemObject 객체의 인스턴스를 만든 다음 적절한 메서드를 사용해야 한다.
형식은 다음과 같다.

Set objFSO =CreateOBject("Scripting.FileSystemObject")  -- 객체 인스턴스 생성
Set t objTest =objFSO.CreateTextFile("C:\test.txt") -- 메서드 사용

[1] 파일 정보 얻기(File 객체)
File 객체와 Files 콜렉션을 이용하면 지정한 파일의 객체를 얻어와서 그 파일의 여러 가지 정보
(파일 이름, 파일의 현재 디렉토리명, 이름 파일 크기, 수정 날짜 등) 를 가져올 수 있다.

config.sys 파일의 크기(size) 와 타입(type), 위치(path)를 정보를 얻어와서 출력한다.

CreateObject 메소드를 통해 FileSystemObject 객체의 인스턴스를 생성하고 그 객체의 GetFile
메소드를 통해 지정된 파일의 핸들을 가져온다.

<!--#include virtual="./braverokmc/include/header.asp" -->
<%
  Set fs =Server.CreateObject("Scripting.FileSystemObject")
  Set confile =fs.GETFile("C:\rc4.log")
%>

</head>
<body>

<h2>파일 정보 얻기</h2>

Config.sys 파일의 정보 <p>


file size : <%= confile.size %> bytes <br />
file type : <%= confile.type %> bytes <br />
file path : <%= confile.path %>

</body>
</html>


출력 =>
파일 정보 얻기
Config.sys 파일의 정보
file size : 2061 bytes
file type : 텍스트 문서 bytes
file path : C:\rc4.log



[2] 파일 생성하기
CreateTextFile 이라는 메소드를 사용하여 텍스트 파일을 만들 수 있다. 이 메소드는 방문자 카운트 등을
만드는 경우 텍스트 파일에 그 내용을 저장하고자 할 때 자주 사용한다.

CreateTextFile 메소드 형식은 다음과 같다.
<%
  FSObject.CreateTextFile("파일이름", overwrite, unicode)
%>


CreateTextFile은 세 개의 인자를 갖는다. 첫 번째 인자는 어느 경로에 어떤 이름의 텍스트 파일을 만들
것인지 그 전체 경로를 기입하는 곳이다.

두 번째 인자는 같은 이름의 파일이 이미 존재할 경우 그 파일을 덮어쓸 것인지, 그렇지 못하게 할 것인지를
지정하는 것이다. true 이면 덮어쓸 수가 있는 것이고, false 이면 덮어쓰기가
안된다.(overwrite = true | false)

세 번째 인자는 파일이 만들어질 때 유니 코드나 ASCll 파일로 생성할 것인가를 결정하는 것이다.
ture 이면 유니 코드로, false 이면 ASCll 코드로 생성된다. (unicode =default ASCll |-1)


<!--#include virtual="./braverokmc/include/header.asp" -->
</head>
<body>
<h2>파일 생성하기</h2>
<%
  Set fs =Server.CreateObject("Scripting.FileSystemObject")
  Set objFile=fs.CreateTextFile("C:\inetpub\wwwroot\braverokmc\test.txt", true, false)
%>


<%

 if fs.FileExists("C:\inetpub\wwwroot\braverokmc\test.txt") then
   Response.write "결과 : test.txt 파일이 만들어 졌습니다."
 else
   Response.write "결과 : test.txt 파일이 만들어지지 못했습니다. "
end if

%>

</body>
</html>



[3] 파일 읽기
텍스트 파일을 불러와서 화면에 출력하기 위해 CreateTextFile 메소드, OpenTextFile 메소드,
TextStream 메소드를 사용해야 한다. OpenTextFile 메소드를 사용하여 열린 파일의 내용을
TextStream 메서드를 사용하여 출력할 수 있다.


OpenTextFile 메소드 형식은 다음과 같다.

FSObject.OpenTextFile("파일이름", iomode, create, format)
인자 값의 내용의 다음과 같다.

iomode = 1 | 2 | 8 ( 1:read, 2:write, 3:append default 1)
create = true | false ( true 인 경우 파일이 없으면 생성한다.)
format = default ASCll | -1 (unicode)


test.txt 라는 파일을 열어서 OpenTextFile 메서드를 사용하여 브라우저로 출력하는 간단한 예이다.
소스 코드 중 OpenTextFile 부분에서 두 번째 인자가 "1" 로 세팅되어 있다.

이것은 파일을 읽는 경우이므로 읽기 전용인 1로 세팅하는 것이다. 만일 이 인자를 읽고 쓰기 모드인
8로 세팅하게 되면 에러가 발생할 것이다. 이유는 몇몇 속성과 메소들은 읽기 전용 모드에서만 동작하기
때문이다.


TextStream 의 속성 중에 하나인 AtEndOfStream 은 파일의 끝에 이르면 true를, 파일의 끝에 이르지
못했으면 false 를 리턴하게 되므로, DoWhile 문을 사용하여 파일의 끝을 만날 때까지 출력문을
수행한다.


ReadLine 메소드 다음에 나오는 <br /> 태그는 문장을 출력할 때 한 줄씩 나누어 출력하는 역할을 한다.
DoWhile 문장을 다음과 같이 코딩해도 같은 결과를 보여준다.


content =objFile.readall
str =replace(content, char(13) & chr(10), "<br />")
Response.write str



예) create5.asp
