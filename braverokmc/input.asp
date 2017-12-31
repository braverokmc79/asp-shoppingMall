<!--#include file=./include/header.asp  -->
<!-- SQL Injection 공격 방어 함수 -->
<!--#include file=./include/Injection.asp -->
</head>
<body>
<%
 name=mSecurity(request("name"))
 sex=mSecurity(request("sex"))
 memo=mSecurity(request("memo"))
%>
<!--#include virtual=./asp-shoppingMall/braverokmc/dbcon.asp -->
<%
    sql1="insert into  usert(name, sex, memo) values('"&name & "','"& sex & "' , '" & memo & "')"
    Set rs1=db.Execute(sql1)

%>
<p>&nbsp;</p>
<p class="text-center">등록결과</p>

<div class="rows">
  <div class="col-xs-12 col-sm-12">
      <div class="col-xs-3 col-sm-3"></div>
      <div class="col-xs-6 col-sm-6">
          <p class="text-center">다음과 같이 등록되었습니다.</p>
          <%
             sql2="select * from usert where name='"& name &"'"
             Set rs2 =db.Execute(sql2)

          %>
          <table class="table">
              <tr>
                <td>이름 :</td>
                 <td><%= rs2("name") %></td>
              </tr>

              <tr>
                <td>성별 :</td>
                <td><%= rs2("sex") %></td>
              </tr>
              <tr>
                <td>메모 : </td>
                <td>
                <%= rs2("memo")%>
                </td>
              </tr>
              <tr>
                <td colspan="2">
                   <a href="inputform.asp">이전화면으로</a>
                    &nbsp;&nbsp;&nbsp;
                    <a href="search.asp" class="btn-warning">검색 목록 화면</a>
                </td>
              </tr>
          </table>

      </div>

  </div>

</div>



</body>
</html>
