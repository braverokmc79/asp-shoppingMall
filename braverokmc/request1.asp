<!--#include file=./include/header.asp  -->
<% response.buffer =true %>
<meta http-equiv="refresh" content="2" />
<%
  if Response.Cookies("UCheck").Haskeys then
    Ldate=Request.Cookies("UCheck")("Ldate")
    Response.Cookies("UCheck")("NVisit")=Request.Cookies("UCheck")("NVisit")+1
  else
    Ldate="..오늘이 첫 방문"
    Response.Cookies("UCheck")("Ldate")=now
    Response.Cookies("UCheck")("NVisit")=1
  end if
%>
</head>
<body>
<p>
  <h2 align="center">어서오세요.</h2>
</p>
<center><br />
지금까지

<%=  Request.Cookies("UCheck")("NVisit")%>

회 방문 하셨습니다.

<hr />
</body>
</HTML>
