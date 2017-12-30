<!--#include virtual="./braverokmc/include/header.asp"  -->
<% response.buffer =true %>
</head>
<body>
p.179
[4] 페이지 버퍼링하기(Buffer 프로퍼티)
Response.Buffer 프로퍼티를 사용하면 페이지를 버퍼링할 수 있다. 페이지 버퍼링이란
생성한 페이지를 곧바로 클라이언트에게 전달하는 것이 아니라 서버에 보관한 다음 명령에 따라 보내거나 보재지 않게 하는 것이다.
버퍼링을 통해 클라이언트에게 전달하는 페이지를 제어할 수 있다.
<% Respose.Buffer = True 혹은 False %>

True 로 지정하면 페이지 내용을 바로 보내지 않고 버퍼링을 한다. 이 내용을 HTML 페이지 상단에 명시하면 된다.
이 버퍼링된 페이지를 제어하기 위해서는 Flush, Clear, End 메서드를 사용한다.
버퍼링된 페이지는 End 나 Flush 메서드의 명령을 받기 전까지 버퍼링에 그대로 남아있다.

Response.Flush 메서도  - Buffer에 있는 결과를 즉시 보냄. Response.Write 메서드를 사용한 출력 내용도 처리 가능
Response.Clear 메서드 - Buffer에 있는 모든 HTML 결과를 지움
Response.End 메서드 - ASP 파일 처리를 멈추고 현재 결과 값을 보냄


7.7  Application 객체 사용하기
ASP 에서 말하는 애플리케이션은 윈도우에서 사용하는 응용 프로그램과 다르다. 웹 애플리케이션은 하나의 가상 디렉토리를 지칭한다.
가상 디렉토리는 ASP 파일, HTML 파일 등의 스크립트와 그 하위 디렉토리로 구성되어 있다.

애플리케이션 객체는 여러 개의 세션을 가질 수 있으며, 하나의 애플리케이션에 대한 정보를 관리하고, 세션 객체는 애플리케이션을 사용하는
클라이언트 정보를 관리한다.

[1] Application 객체의 구성 요소
콜렉션
Contents - Application 객체에 포함된 모든 내용을 보여줌
StaticObjects - <OBJECT> 태그의 session 에 추가된 모든 개체를 포함함
메서드 Lock - 다른 client 에 의한 Application 속성 수정 불허
       Unlock - 다른 client 의한 Application 속성 수정 허용
이벤트 Application_OnEnd
       Application_OnStart  global.asa 파일 내부에 선언

[2]  Global.asa 파일 사용하기(애플리케이션의 시작과 종료의 처리)
global.asa는 이름에서 알 수 있듯이 모든 페이지에서 사용할 수 있는 루틴과 변수를 가지고 있다.
하나의 애플리케이션은 하나의 Global.asa를 가질 수 있다. 이 파일의 위치는 웹 루트 디렉토리이며, 그 하위
디렉토리에서도 global.asa 을 사용할 수 있다.

애플리케이션의 경우 시작과 종료가 명확하지 않기 때문에 시작과 종료 시점에 이벤트를 발생시켜 처리하게 된다.
이 시작과 종료 이벤트를 처리하는 것이 Golbal.asa 파일이다. 여기에서 말하는 이벤트란 Application_OnStart 와
Application_OnEnd, Session_OnStart 와  Session_OnEnd 를 말한다. Global.asa 파일의 작성 형식은 다음과 같다.

<!-- 시작  -->
<SCRIPT LANGUAGE="VBScript" RUNAT="Server">
Sub Application_OnStart
 애플리케이션이 시작하는 시점에서 사용할 코드 부분
End Sub

Sub Application_OnEnd
 애플리케이션이 끝나는 시점에 사용할 코드 부분
End sub

Sub Session_OnStart
세션이 시작하는 시점에서 사용할 코드 부분
End Sub

Sub Session_OnEnd
세션이 끝나는 시점에서 사용할 코드 부분
End Sub
</SCRIPT>
<!-- 끝 -->

RUNAT="Server" 라는 것은 스크립트가 서버에서 실행된다는 의미이다.

Application_OnStart : 첫 사용자가 가상 디렉토리로부터 웹 페이지를 처음 요청했을 때 오직 한번 발생한다.
서버가 구동되기 시작하고 첫 사용자가 들어오면 그 순간 한 번 실행되고 다시 실행되지 않는다.

Application_OnEnd : 애플리케이션이 종료하는 경우는 2가지 경우가 있다. 웹서버의 서비스가 정지할 때와
가상 디렉토리에서 모든 사용자의 세션이 끝났을 때이다. 이때 Application_OnEnd 가 한 번 실행된다.

Session_OnStart : 각 사용자가 들어올 때마다 세션이 시작되고 매번 Session_OnStart 가 발생한다.
가상 디렉토리 밑의 어느 페이지로 들어와도 자동으로 작동한다.

Session_OnEnd : 각 사용자가 페이지에 접속한 후 20분(세션 타임아웃의 기본 값) 동안 반응이 없으면 세션이
종료되면서 Session_OnEnd가 발생한다. 세션 타임아웃은 서버에서 조정할 수 있다.



------------ 사용하는 방법은 다음과 같다.
1. Global.asa 에 애플리케이션과 세션에 대한 시작과 종료 이벤트를 처리하는 코드를 작성한다.
2. Global.asa 파일은 웹 루트 디렉토리에 위치시킨다. 만약 가상 디렉토리를 사용한다면 그 가상 디렉토리의 루트
디렉토리에 사용할 Global.asa 파일을 위치시켜야 한다.
Global.asa는 defualt.asp 에 의해서 로드 되므로 보통 홈페이지의 첫 페이지는 파일 이름을 default.asp 로 정한다.


********* ------ Lock 과 Unlock **********
루트 디렉토리에 default.asp 파일과 global.asa 파일을 만들어 간단한 방문자 카운트를 만든 예이다.
앞에서 설명한 이벤트들을 Global.asa 파일에서 사용하였다. 이 예제에서 여러 명의 클라이언트가 동시에
이 애플리케이션을 사용한다면 Application 변수도 동시에 사용하는 것이 될 것이다.

이렇게 되면 Application("Count") 변수에 들어갈 값은 의도하지 않은 값으로 바뀔 수가 있다.
이와 같은 경우 대비해 애플리케이션 객체에서는 Lock, Unlock 메서드를 제공한다.
Lock 메서드를 사용하면 다른 클라이언트는 현재 사용하는 Application 변수를 사용할 수 없으며, Unlock 메서드를 사용하여
다음 클라이언트가 Application 변수를 사용할 수 있도록 설정한다.

애플리케이션이 완전히 중단되는 경우에는 Application 변수에 저장되어 있던 값이 사라진다. 이 예제이서는 방문
회수이다. 그러나 웹사이트 서비스가 중단되어도 이 변수 값은 남아있다.

예를 들어, 윈도우 서버의 경우 인터넷 서비스 관리자를 사용하여 디폴트 웹사이트를 중단해도 이 값은 남아 있지만, 관리
도그의 서비스에서 WWW 서비스를 중단해서 서비스를 다시 시작하거나, 컴퓨터를 재부팅하게 되면 Application 변수에 저장되어
있던 값은 없어지고 초기화 된다.

*** 주의
<!--

 만약 파일을 사용하는 예제 소스를 원래 존재하는 가상 디렉토리에서 사용할 경우 주의를 요한다. 카운트 수
 출력 페이지에서 에러가 발생한다면, 원래 존재하는 가상 디렉토리의 루트 디렉토리에 기존에 있던 Golbal.asa 파일을
 확인해야 한다. 파일이 존재한다면 기존의 Golbal.asa 파일의 영향을 받기 때문이다. 따라서, 새 가상 디렉토리를 생성하여
 그 루트 디렉토리에 Golbal.asa 예제 파일을 위치시키면 된다.

[3] Lock 과 Unlock 메소드
Lock 과 Unlock 메소드를 사용하는 형식은 다음과 같다.


<%
Application.Lock
Application 변수를 사용한 스크립트
Application.Unlock
%>

LOCK 메서드는 수정하고자 하는 변수만 잠그는 것이 아니라 모든 Application 객체를 잠그기 때문에
변수 값을 변경하자마자 반드시 UNLOCK 으로 객체를 풀어야 한다.

참고 : 아래 소스의 root1 디렉토리는 웹서버에서 일반 디렉토리가 아닌 가상 디렉토리로 설정되어 있어야
효과가 발생한다.


-->

global.asa 파일 소스 코드

<SCRIPT LANGUAGE="VBScript" RUNAT="Server">
Sub Application_OnStart
   Application("count")=0
End Sub


Sub Application_OnEnd

End Sub

Sub Session_OnStart


End Sub


</SCRIPT>



[4] Application 변수 사용하기
Global.asa 사용 예에서도 알 수 있듯이 Application 변수는 전역 변수(Gloabl variables)로 사용된다.
즉, 모든 클라이언트가 공통으로 이 변수 값을 사용할 수 있기 때문에 데이터베이스에 연결해 필요한 정보를
사용하고자 할 때 많이 사용하는 변수 있다.

이런 장점이 있는 반면 Application 변수는 여러 클라이언트가 사용하는 변수이므로 변수를 여러 사람이 호출할
경우에 발생하는 문제점을 보완하기 위해 Lock 과 UnLock 메서드를 사용한 잠금 기능(Lock) 을 사용하여
동시 호출을 제어할 수 있다.

사용 형식은 다음과 같다.

Sub Application_OnStart
    Application(Application 변수명) = 변수값
End Sub

Application 변수값을 호출하는 방식은 다음과 같다.

<%= Application(애플리케이션 변수) %>


예제

app1.asp 파일 소스


[5] Contents 와 StaticObjects 컬렉션 사용하기
Contents 와 StaticObjects 컬렉션은 현재 어떤 애플리케이션 변수를 사용하고
있으며 값이 무엇인지 알고 싶을 때 사용한다.
Contents 콜렉션은 애플리케이션 범위에서 사용하는 변수의 정보를
갖고 있으며, StaticObjects 콜렉션은 사용 객체의 정보를
가지고 있다.













</body>
</html>
