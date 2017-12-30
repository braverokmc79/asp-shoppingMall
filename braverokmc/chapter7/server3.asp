<!--#include virtual="./braverokmc/include/header.asp" -->
</head>
<body>

<div class="rows">
 <h2 class="text-center">MapPath 메서드를 이용한 경로 구하기</h2>
<br />
<div class="text-center">


<%
    path1 =Server.MapPath("/ex")
    path2 =Server.MapPath(".")
    path3= Server.MapPath("root1")

    Response.Write "<p> / ex 가상 디렉토리 실제 경로" :
    Response.Write path1
    Response.Write "<p>현재 디렉토리 : "
    Response.Write path2
    Response.Write "<p>상대 경로 디렉토리"
    Response.write path3

%>

<!-- =>출력

MapPath 메서드를 이용한 경로 구하기

/ ex 가상 디렉토리 실제 경로C:\inetpub\wwwroot\ex

현재 디렉토리 : C:\inetpub\wwwroot\braverokmc\chapter7

상대 경로 디렉토리C:\inetpub\wwwroot\braverokmc\chapter7\root1


-->


</div>
</div>

</body>
</html>
