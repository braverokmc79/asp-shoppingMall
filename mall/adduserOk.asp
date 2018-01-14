<!--#include  virtual=./mall/include/header.asp -->
</header>
<body>
<!--#include virtual="./mall/dbcon.asp" -->
<%
  Dim id1, passwd, username, email, tel, address, age, sex
  id1=request.form("id1")
  passwd=request.form("passwd")
  username=request.form("username")
  email=request.form("email")
  tel=request.form("tel")
  address=request.form("address")
  age=request.form("age")
  sex=request.form("sex")

  usert="usert"
  nowdate=now
  nowdate=left(nowdate, 19)
  visited=0
  point=0

%>
<form name="form2" action="adduser.asp" method="post">
<input type="hidden" name="id" value="error" />
<input type="hidden" name="username" value="<%= username %>" />
<input type="hidden" name="email" value="<%= email %>" />
<input type="hidden" name="tel" value="<%= tel %>" />
<input type="hidden" name="address" value="<%= address %>" />
<input type="hidden" name="age" value="<%= age %>" />
<input type="hidden" name="sex" value="<%= sex%>" />
</form>

<%
  'Response.Write " 결과 :  " &id1&" , "& passwd &" , "& username &" , "& email &" , "& tel &" , "& address &" , "& age &" , "& sex
%>
<%

  sql1="select * from " & usert & " where id1='"&id1&"'"
  Set rs1=db.Execute(sql1)

  if rs1.EOF then

    sql2 ="insert into "& usert
    sql2 =sql2 &" (id1, passwd, username, email, tel, address, age, sex,  visited, point) values ('"
    sql2 =sql2 & id1 &"', '"& passwd &"', '"& username &"', '"& email &"', '"& tel &"', '"&  address &"', '"&  age &"', '"&  sex &"', '"& visited &"', '"& point &"' )"
    'Response.write sql2
    Set rs2 =db.execute(sql2)

    'Response.write "등록되었습니다."
%>


<!--#include virtual="./mall/include/header_menu.asp" -->
<div class="rows">
<div class="container">

   <div clss="col-xs-12 col-sm-12">
      <h1 class="bg-primary text-center" style="width:100%; padding-top:20px; padding-bottom:20px; text-align:center">가입을 축하합니다.</h1>
      <div class="col-xs-3 col-sm-3"></div>
     <div class="col-xs-6 col-sm-6">

<table class="table table-striped" >
  <caption class="text-center">
    <h3>등록 내용</h3>
  </caption>
   <tr>
     <th>등록할 회원 ID :</th>
     <td><%= id1 %></td>
   </tr>

   <tr>
     <th>등록할 비빌번호 :</th>
     <td><%= passwd %></td>
   </tr>

   <tr>
     <th>이름 :</th>
     <td><%= username %></td>
   </tr>

   <tr>
     <th>Email : </th>
     <td><%= email %> </td>
   </tr>

   <tr>
     <th>연락처 :</th>
     <td><%= tel %> </td>
   </tr>


   <tr>
     <th>현주소 :</th>
     <td><%= address %></td>
   </tr>

   <tr>
     <th>나이  :</th>
     <td><%= age  %></td>
   </tr>


   <tr>
     <th>성별 :</th>
     <td> <%= sex %>
     </td>
   </tr>
</table>

<%
  else

    '"중복된 아이디 입니다."
%>
<script>
 document.form2.submit();
</script>

<%
     response.end
  end if
%>


    </div>
    </div>
</div>
</div>



</body>
</html>
