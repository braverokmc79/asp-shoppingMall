<!--#include  virtual=./asp-shoppingMall/mall/include/header.asp -->
<%
  if session("id1") ="" or isNull(session("id1")) then
   '세션 값이 없으면 메인으로 이동
    response.redirect("/mall")
  end if

  if session("id1")="guest" then
    response.write "<script>alert('계정은 정규회원이 아니므로 회원정보를 수정할 수 없습니다. '); location.href='/mall';</script>"
  end if
%>

</header>
<body>
<!--#include virtual="./asp-shoppingMall/mall/include/header_menu.asp" -->
<!--#include file=dbcon.asp   -->
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

  'Response.write id1 & " : " &passwd & " : " & username& " : " & email & " : " & tel& " : " & address& " : "&age& " :" & sex

  sql ="update usert set passwd = '"&passwd&"' ,username='"&username&"' , email='"&email
  sql =sql&"', tel='"&tel&"' , address='"&address&"' , age ='"&age &"', sex='"&sex &"'  where id1='"&id1&"'"
  'Response.write sql
  Dim rs1
  Set rs1=db.execute(sql)

  db.close()
%>

<div class="rows">
  <div class="col-xs-12 col-sm-12">
      <div class="col-xs-2 col-sm-2"></div>
      <div class="col-xs-8 col-sm-8">

        <table class="table table-striped" >
          <caption class="text-center">
            <h3>업데이트 내용</h3>
          </caption>
           <tr>
             <th>회원 ID :</th>
             <td><%= id1 %></td>
           </tr>

           <tr>
             <th>비빌번호 :</th>
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

      </div>
  </div>


</div>






<!--#include  virtual=./asp-shoppingMall/mall/include/footer.asp -->
