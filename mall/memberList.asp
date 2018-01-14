<!--#include  virtual=./asp-shoppingMall/mall/include/header.asp -->
</header>
<body>
<!--#include virtual="./asp-shoppingMall/mall/include/header_menu.asp" -->
<!--#include file="dbcon.asp" -->
<div class="rows">
  <div class="container">
    <div class="col-xs-12 col-sm-12">
      <div class="col-xs-2 col-sm-2"></div>
      <div class="col-xs-9 col-sm-9">
       <h2 class="text-center">회원 목록</h2>

        <div>
          <%
             sql1="select count(*) as totCount from usert"
             Set rs1=db.Execute(sql1)
             dim totalCount
             totalCount =rs1("totCount")
          %>
          <h3 class="label label-danger">회원수 <%= totalCount %></h3>
          <br/></br/>
          <table class="table">
            <tr>
              <th>회원 ID</th>
              <th>비밀번호</th>
              <th>이름</th>
              <th>Email</th>
              <th>연락처</th>
              <th>현주소</th>
              <th>나이</th>
              <th> 성별</th>
            </tr>
             <%
               sql2 =" select * from usert "
               Set rs2=db.Execute(sql2)

               For i=1 to totalCount
             %>
              <tr>
                <td><%= rs2("id1")%></td>
                <td><%= rs2("passwd")%></td>
                <td><%= rs2("username")%></td>
                <td><%= rs2("email")%></td>
                <td><%= rs2("tel")%></td>
                <td><%= rs2("address")%></td>
                <td><%= rs2("age")%></td>
                <td><%= rs2("sex")%></td>
              </tr>
              <%
                rs2.MoveNext
                Next
              %>


          </table>
        </div>


      </div>
    </div>
  </div>
</div>


<!--#include  virtual=./asp-shoppingMall/mall/include/footer.asp -->
