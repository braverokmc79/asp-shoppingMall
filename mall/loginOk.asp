<!--#include  virtual=./mall/include/header.asp -->
</header>
<body>
<!--#include file=dbcon.asp   -->
<%
  id1 =request("id1")
  passwd=request("passwd")
  submode=request("submode")

  redirectUrl="/mall/login.asp"

'아이디 값을 입력하지 않았을 경우
if id1 ="" then
Response.write "<script>alert('로그인 ID 를 입력하세요.'); location.href='"&redirectUrl&"';</script>"
end if

'패스워드 값을 입력하지 않았을 경우
if passwd="" then
Response.write "<script>alert('패스워드를 입력하세요.'); location.href='"&redirectUrl&"';</script>"
end if


'아이디외 비밀번호가 일치하는 계정이 있는지 조사
sql ="select * from usert where id1='"&id1&"' and passwd='"&passwd&"'"
response.write sql
Set rs =db.execute(sql)

'일치하는 아이디와 비밀번호와 일치하는 계정이 없으면 로그인 폼으로 되돌린다.
if rs.EOF then
  Response.write "<script>alert('아이디외 비밀번호가 일치하지 않습니다.'); location.href='"&redirectUrl&"';</script>"
else
 ' 세션 데이터 저장
 session("id1")=rs("id1")
 response.redirect("/mall")
end if


%>
</body>
</html>
