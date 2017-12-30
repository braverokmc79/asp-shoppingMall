<!--#include virtual=./braverokmc/include/header.asp  -->
</head>
<body>
<!--#include virtual=./braverokmc/dbcon.asp -->


<%

  Application.Lock
  Application("Company") ="http://macaronics.net"
  Application.UnLock

  Response.Write "test." & "<hr />"
  Response.Write "URL 주소는 " & Application("Company") & " 입니다. "
%>


</body>
</html>
