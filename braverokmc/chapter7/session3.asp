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
