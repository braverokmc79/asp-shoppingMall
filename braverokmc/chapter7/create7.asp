<!--#include virtual=./braverokmc/include/header.asp  -->
</head>
<body>
<%
     Set fs =Server.CreateObject("Scripting.FileSystemObject")
     Set Cdrive=fs.GetDrive("c:")

%>

<h2>드라이브 정보 얻기 1</h2>
<hr />

<h3>C 드라이브의 남은 공간 : <%= Cdrive.freespace %> 바이트</h3>


</body>
</html>
