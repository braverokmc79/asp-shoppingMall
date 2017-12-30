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
