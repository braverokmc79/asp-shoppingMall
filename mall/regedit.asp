<!--#include  virtual=./asp-shoppingMall/mall/include/header.asp -->
<%
  if session("id1") ="" or isNull(session("id1")) then
   '세션 값이 없으면 메인으로 이동
    response.redirect("/asp-shoppingMall/mall")
  end if

  if session("id1")="guest" then
    response.write "<script>alert('계정은 정규회원이 아니므로 회원정보를 수정할 수 없습니다. '); location.href='/asp-shoppingMall/mall';</script>"
  end if
%>

<script>
$(document).ready(function() {

    $("#btnRegist").click(function(e){
          var form =document.form1;


          if(form.passwd.value.length==0){
            alert("비밀번호를 입력하세요.");
            form.passwd.focus();
            return false;
          }

          if(form.username.value.length==0){
            alert("이름을 입력하세요.");
            form.username.focus();
            return false;
          }

          if(form.email.value.length==0){
            alert("이메일을 입력하세요.");
            form.email.focus();
            return false;
          }

          if(form.tel.value.length==0){
            alert("전화번호를 입력하세요.");
            form.tel.focus();
            return false;
          }

          if(form.address.value.length==0){
            alert("주소를 입력하세요.");
            form.address.focus();
            return false;
          }

          if(form.age.value.length==0){
            alert("나이를 입력하세요.");
            form.age.focus();
            return false;
          }

          if(form.sex.value.length==0){
            alert("성별을 입력하세요.");
            form.sex.focus();
            return false;
          }

          form.submit();
    });


});
</script>
</header>
<body>
<!--#include file=dbcon.asp   -->
<%
    sql1 ="select * from usert where  id1='"& session("id1") &"'"
    Set rs1=db.Execute(sql1)

%>


<!--#include virtual="./asp-shoppingMall/mall/include/header_menu.asp" -->

<div class="rows">
<div class="container">

   <div clss="col-xs-12 col-sm-12">
      <h1 class="bg-primary text-center" style="width:100%; padding-top:20px; padding-bottom:20px; text-align:center">회원 정보 수정</h1>
      <div class="col-xs-3 col-sm-3"></div>
     <div class="col-xs-6 col-sm-6">

        <p>&nbsp;</p>
        <p class="text-center">
          <span style="color:red;">* ID 를 제외한 모든 항목을 변경시킬 수 있습니다.</span>
        </p>
       <form method="post" action="regeditOk.asp" name="form1" >
         <table class="table table-striped" >
            <tr>
              <th>등록할 회원 ID </th>
              <td><%= rs1("id1") %></td>
            </tr>

            <tr>
              <th>등록할 비빌번호 </th>
              <td><input type="password" value=""  class="form-control" name="passwd" /></td>
            </tr>

            <tr>
              <th>이름 </th>
              <td><input type="text"  class="form-control" name="username"  value="<%= rs1("username") %>"/></td>
            </tr>

            <tr>
              <th>Email  </th>
              <td><input type="email"  class="form-control" name="email" value="<%= rs1("email") %>" /></td>
            </tr>

            <tr>
              <th>연락처 </th>
              <td><input type="tel"   class="form-control" name="tel" value="<%= rs1("tel") %>" /></td>
            </tr>


            <tr>
              <th>현주소 </th>
              <td><input type="text"  class="form-control"  name="address" value="<%= rs1("address") %>" /></td>
            </tr>


            <tr>
              <th>나이 </th>
              <td><input type="number" max="100" min="1" class="form-control"  name="age"  value="<%= rs1("age") %>" /></td>
            </tr>


            <tr>
              <th>성별 </th>
              <td>
                <select name="sex" class="form-control">
                    <option value="남" <% if rs1("sex")="남"  then response.write "selected" end if %> >남</option>
                    <option value="여"  <% if rs1("sex")="여" then response.write "selected"  end if %> >여</option>
                </select>
              </td>
            </tr>

            <tr class="text-center">
              <td colspan="2">
                <input type="hidden" name="id1" value="<%= rs1("id1")%>" >
                <button type="button" class="btn-success" id="btnRegist">정보변경하기</button>
              </td>
            </tr>
         </table>
     </form>

     </div>
   </div>


</div>
</div>



<!--#include  virtual=./asp-shoppingMall/mall/include/footer.asp -->
