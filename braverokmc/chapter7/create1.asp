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
