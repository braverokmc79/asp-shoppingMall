<%
    Set DbConn = Server.CreateObject("ADODB.Connection")
    DbConn.open "PROVIDER=SQLOLEDB;DATA SOURCE=localhost;UID=braverokmc;PWD=1111;DATABASE=braverokmc "
%>

<%


   Set DbConn = Server.CreateObject("ADODB.Connection")
   DbConn.open "PROVIDER=SQLOLEDB;DATA SOURCE=localhost;UID=braverokmc;PWD=1111;DATABASE=braverokmc "



   'DbConn.Open "Provider=SQLOLEDB;User ID=braverokmc;Password=1111;Initial Catalog=braverokmc;Data Source=localhost"
   SQL = "Select * from tblEmployees"
   Set objRs =DbConn.Execute(SQL)
   Do While (Not objRs.eof)

   Response.Write "<tr>"


   For Index=0 to (objRs.fields.count -1)
   Response.Write "<td>" & objRs(Index) & "</td>"
   Next

   Response.Write "</tr>"
    objRs.MoveNext
  Loop

  objRs.close
  DbConn.close


%>
