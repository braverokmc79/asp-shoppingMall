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



<%
  .....

   생략

    DbConn.BeginTrans
    objRs.("name") ="홍길동"

    objRs.update
    If Dbconn.ErrobjRs = 0 Then
            DbConn.CommiTrans
    Else
            DbConn.RollBackTrans
    Endif

%>



<%

      Set Dbconn  =Server.CreateObject("ADODB.Connection")
      Set DbCmd =Server.CreateObject("ADODB.Command")
      DbCmd.ActiveConnection =DbConn

%>


<%

    Set DbCmd =Server.CreateObject("ADODB.Command")
    DbCmd.ActiveConnection="DSN명"

%>




  <%

     Set DbCmd =Server.CreateObject("ADODB.Command")
     DbCmd.ActiveConnection ="macaronics"
     DbCmd.CommandText="drop table product"
     Dbcmd.CommandType=adCmdText
     DbCmd.Prepared =true
     DbCmd.Execute
     Set DbCmd.ActiveConnection=Nothing

  %>







</body>
</html>
