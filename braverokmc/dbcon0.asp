<%
  ' "ODBC 를 사용할 때"
  ' dsn="aspbasic1dsn"
  ' dsnid="aspbasic"
  ' dsnpasswd="aspbasic"

  ' Set db =Server.CreateObject("ADODB.Connection")
  ' db.Open("DSN="+dsn +";UID="+dsnid+";PWD="+dsnpasswd)

  ' ""DBQ를 사용할때
  ' ""dbcon.asp 파일을 자동으로 찾는 루틴이다. '''
  path1=request.ServerVariables("PATH_TRANSLTED")
  path2=Split(path1, "\")
  i=Unbound(path2)
  path3=replace(path1, path2(i), "")

  ' path3=replace(path3, path2(i-1)+"\,")
  ' if path2(i-1)="shop" then
  ' path3 =replace(path3, path2(i-2) + "\", "")
  ' ElseIf path2(i-1)="admin" then
  ' path3=replace(path3, path2(i-2),"\", "")
  ' end If

  db_path =path3 + "aspbasic.mdb"

  db_path ="c:\inetpub\wwwroot\aspbasic1\aspbasic.mdb"

  Set db =Sever.CreateObject("ADODB.Connection")
  db.Open("Driver={Microsoft Access Driver (*.mdb)}; DBQ="+db_path)

%>
