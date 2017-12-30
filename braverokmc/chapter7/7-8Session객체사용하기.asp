7.8 Session 객체 사용학
[1] 세션의 시작과 종료
세션이 시작되는 경우는 다음과 같은 경우이다.

1) 사용자가 처음 페이지를 요구했을 때. 사용자가 처음 페이지에 접속하면 접속한 사용자마다
세션이 생성된다.
2) global.asa 에 Session_OnStart 루틴이 있으면 자동적으로 클라이언트에 대해 세션이
시작된다.
3) 사용자가 페이지를 요구했을 때 세션이 없다고 하더라도 페이지에 있는 코드에서 Session
객체에 값을 저장할 수 있다. 저장하려는 시점에서 세션이 자동적으로 새성된다.

세션이 종료되는 경우는 다음과 같은 경우이다.

1. Session 객체의 Abandon 메서드를 부르면 세션을 바로 끊는다.
2. Session 객체를 가지고 있는 클라이언트가 일정 시간(기본값 20분) 동안 요청이 없으면
서버는 세션 객체를 소멸시키고 리소스를 없앤다.
3. 클라이언트 브라우저가 닫힐 때 세션이 종료된다.

[2] Session 객체의 구성 요소
Contents - Session에 추가된 항목을 보여줌
StaticObjects  -  <OBJECT> 태그와 지정된 session 영역으로 만들어진 객체 정보
CodePage  - 기호 mapping 에 사용
LCID  -  로케일 ID
SessionID - 사용자에 대한 session ID 를 반환함
Timeout - Session 상태의 시간 초과 기반(단위: 분)
Abandon -  Session 객체를 없애고 resource를 환원함
Session_OnStart - Session 시작될 때 수행되며 global.asa 에 지정
Session_OnEnd -  Session 이 종료될 때 수행되며 global.asa 에 지정

[3] Session 변수 사용하기
Session 변수는 Session 객체에 저장되는 값으로 하나의 클라이언트 내에서 전역 변수이지만
다른 클라이언트에서는 사용할 수 없는 변수이다. Session 변수는 한 클라이언트가
애플리케이션 안에 있는 페이지끼리 데이터를 공유하고자 할 때 이용한다.

- 예제
Session 변수를 사용하여 세션을 사용하는 클라이언트가 사용하고 있는 현재 페이지의
카운트를 알 수 있는 예이다.


<!--#include virtual=./braverokmc/include/header.asp  -->
</head>
<body>
<!--#include virtual=./braverokmc/dbcon.asp -->
<%
  Response.Expires =0
%>
<h3>Session 변수 이용한 예</h3>
<%
   if(Session("sCount")="") then
      Session("SCount") =0
   End if

   Session("SCount") =Session("SCount")+1
%>

<p>
  <b>이 세션을 사용하는 당신은</b>
  이 페이지를 <%=Session("SCount") %> 번 읽었습니다.
</p>
<hr />

</body>
</html>



[4] SessionID 와 Timeout 프로퍼티 사용하기
SessionID 프로퍼티는 세션을 가진 현재 클라이언트와 다른 클라이언트를 구별해주는
ID 값을 가진 것으로 클라이언트마다 다른 ID 값을 가진다.

SessionID는 사이트를 브라우징하는 동안 페이지에서 세션을 나타내는데 사용된다.
SessionID프로퍼티는 서버에서 할당되고, 읽기 전용 속성을 가진 쿠키로 저장되며,
클라이언트 브라우적가 닫힐 때 소멸된다.

Timeout 프로퍼티는 세션의 타임아웃 값을 가지고 있다. 클라이언트가 일정 시간 동안
요청이 없으면 서버는 자동으로 세션을 닫는다. 기본 값은 20분이지만 Timeout 프로퍼티에서
시간 값을 지정할 수 있다.


- 예제
브라우저에서 새로 고침(Reload)을 실행해도 SessionID 는 변함이 없고, 방문 횟수는 1씩\
증가하는 것을 확인할 수 있다. 즉, 브라우저가 새로 시작해 세션을 다시 시작하지 않으면
SessionID 값은 변하지 않는다. 또한 이 예에서는 현재 타임아웃 디폴트값을 페이지에서
출력하고 이 값을 변경했다.



<!--#include virtual=./braverokmc/include/header.asp  -->
</head>
<body>
<!--#include virtual=./braverokmc/dbcon.asp -->

<% Session.TimeOut=60 %>
<% Session("intVisit")=Session("intVisit")+1 %>

현재 나의 SesisonID : <%= Session.SessionID %><p><hr />
현재 설정된 세션의 타임아웃 시간 : <%= Session.TimeOut %> 분<p><hr />
<% Session.TimeOut=10 %>


새로 설정된 세션의 타임아웃 시간은 :  <%= Session.TimeOut %> 분 <p><hr/>
당신은 이 페이지에 <b><%= Session("intVisit") %></b>번 방문하였습니다. <hr />


</body>
</html>
