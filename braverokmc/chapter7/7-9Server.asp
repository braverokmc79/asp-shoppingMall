7.9 Server 객체 사용하기

Server 객체는 서버에서 실행되는 객체를 생성할 때 사용하는 것으로 ASP 에서 제공하지
못하는 기능을 확장하기 위해서 사용한다.

객체를 생성하기 위해서는 Server.CreateObject 메서드를 사용하여 컴포넌트나 컨트롤을
생성하고 이것을 서버에서 사용할 수 있다. 앞에서 설명한 주요 4가지 객체는 ASP 에서
기본적으로 제공하는 객체들을 사용한 것이며, Server 객체에서는 이러한 4가지 객체
이외에 필요한 객체를 사용자가 제작할 수 있는 기능을 제공한다.



[1] Server 객체의 구성 요소

ScriptTimeout : Script 의 실행 시간을 지정함. Database 질의 등 오랜 시간이 걸리는
경우 지정함.
CreateObject: Server 구성 요소의 객체를 지정함.
HTMLEncode : 지정된 문자열에 HTML Encoding 을 적용함.
MapPath : 가상 경로를 실제 경로로 mapping 함
URLEncode : ESCAPE 문자를 포함하여 URL 부호화 규칙을 문자열에 적용함.

[2] 객체 생성하기 (Server.CreateObject 메서드)
Server 객체가 가진 메서드 중에서 가장 중요한 메서드는 CreateOBject 메서드이다.
CreateObject 메서드는 ASP 의 기증 중에서 가장 필요한 기능을 확장할 수 있게
한다. 여기에서 말하는 기능이란 컴포넌트의 사용을 말한다.

필요한 서버 콤포넌트를 작성하고 나서, CreateObject 메서드를 사용하여
서버 콤포넌트의 인스턴스를 생성한다. 서버에 설치된 모든 컴포넌트는 ProID(Class ID)
를 가지고 있으며, CreateObject 메서드는 이 ProID를 인자로 받아들이고
객체의 인스턴스를 반환한다.

ASP 에서 컴포넌트(*.dll 파일)를 사용하려면 CreateObject 메서드를 사용하여
객체를 생성해야 한다. 다시 말해 객체의 인스턴스를 생성하고, 그 다음에 생성된다
객체가 가진 메소드와 프로퍼티를 이용하면 된다.

인스턴스의 생성 형식은 다음과 같다.
<%
    Set 객체 변수 = Server.CreateObject("ProgID명")
%>

* 예
ASP 에서 제공하는 기본적인 서버 컴포넌트 중에서 많이 사용하는
ADD (Active Data Object) 라는 Database Access 컴포넌트를 사용하는 예이다.


- 참고
객체 생성의 성공 여부를 알 수 있는 방법은 IsObject 함수를 사용하려면
된다. 객체를 만드는데 성공하였다면 IsObject 함수는 부울값으로
True(참) 값을 리턴한다.

<%

' 커넥션 객체 생성
Set objCon =Server.CreateObject("ADODB.Connection")

'test1 이라는 DSN 이름을 가지 ODBC 데이터 소스에 커넥션 설정
objCon.Open "test1"

'레코드 셋 객체 생성
Set objRs=Server.CreateObject("ADODB.Recordset")

%>

기본적으로 ASP 에서 제공하는 서버 컴포넌트들로 해결할
수 없은 경우, 필요한 컴포넌트를 생성하여 사용해야 한다.
이런 경우에는 컴포넌트를 생성하여 사용할 수 있도록
비주얼베이직에서는 Active DLL 생성을 제공한다.

이 방식을 통해 서버 컴포넌트를 제작하고, 만든 컴포넌트를
CreateObject 메서드를 사용하여 객체로 생성하여 웹
페이지에서 이용할 수 있다.


[3] 디렉토리 경로 구하기 (Server.MapPath 메서드)
MapPath 메서드는 가상 디렉토리를 이용하여 실제 물리적 디렉토리를
구할 수 있는 방법을 제공한다. 이런 디렉토리 정보가 필요한
이유는 디렉토리 내에 존재하는 파일을 읽거나 쓰기 위해서는 먼저
그 파일의 위치에 대한 정보가 필요하기 때문이다. 사용하고자
하는 파일의 디렉토리 정보가 있으면 FileSystemObject
객체나 TextStream 객체를 사용하여 파일을 조작할 수 있다.

형식은 다음과 같다.

<%
  path =Server.MapPath("가상디렉토리 명")

%>

*예제
현재 디렉토리인 경우에는 path=Server.MapPath(".")를
사용하여 구할 수 있으며 상대경로를 적을 때는 \를 생략한다.


[4] 인코딩 메서드 이용하기(HTMLEncode 메서드와  URLEncode 메서드)
HTMLEncode 메서드는 주어진 문자열을 HTML 문자열로 바꿔주고, URLEncode 메서드는
쿼리 스트링에서 사용하는  인코딩 형태 (URL 주소창에 들어가는 문자열 형태)
로 바꿔 준다.

HTMLEncode -->html 형태로 표시됨 (<b>여기는</b> macaronics <i>연구소</i> 입니다)
URLEncode
--->
김민종 & 최준호 & 임수정

%EA%B9%80%EB%AF%BC%EC%A2%85+%26+%EC%B5%9C%EC%A4%80%ED%98%B8+%26+%EC%9E%84%EC%88%98%EC%A0%95
