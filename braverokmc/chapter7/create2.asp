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
