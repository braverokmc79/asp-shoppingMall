<!--#include  virtual=./mall/include/header.asp -->
<script>
$(document).ready(function() {

    $("#btnRegist").click(function(e){
          var form =document.form1;

          if(form.id1.value.length==0){
            alert("ID를 입력하세요.");
            form.id1.focus();
            return false;
          }

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
<%
    Dim id1, passwd, username, email, tel, address, age, sex
    id1=request("id1")
    passwd=request("passwd")
    username=request("username")
    email=request("email")
    tel=request("tel")
    address=request("address")
    age=request("age")
    sex=request("sex")


    id=request("id")
    if id="error" then
%>
<script>alert("중복된 아이디 입니다.")</script>
<%
    end if
%>
<!--#include virtual="./mall/include/header_menu.asp" -->

<div class="rows">
<div class="container">

   <div clss="col-xs-12 col-sm-12">
      <h1 class="bg-primary text-center" style="width:100%; padding-top:20px; padding-bottom:20px; text-align:center">회원등록</h1>
      <div class="col-xs-3 col-sm-3"></div>
     <div class="col-xs-6 col-sm-6">

        <p>&nbsp;</p>
        <p class="text-center">
          <span style="color:red;">* 아래 항목을 빠짐 없이 입력해 주세요.</span>
        </p>
       <form method="post" action="adduserOk.asp" name="form1" >
         <table class="table table-striped" >
            <tr>
              <th>등록할 회원 ID </th>
              <td><input type="text" value=""  class="form-control"  name="id1"/></td>
            </tr>

            <tr>
              <th>등록할 비빌번호 </th>
              <td><input type="password" value=""  class="form-control" name="passwd" /></td>
            </tr>

            <tr>
              <th>이름 </th>
              <td><input type="text" value="<%=username %>"  class="form-control" name="username" /></td>
            </tr>

            <tr>
              <th>Email  </th>
              <td><input type="email" value="<%=email %>"  class="form-control" name="email" /></td>
            </tr>

            <tr>
              <th>연락처 </th>
              <td><input type="tel" value="<%=tel %>"  class="form-control" name="tel" /></td>
            </tr>


            <tr>
              <th>현주소 </th>
              <td><input type="text" value="<%=address %>"  class="form-control"  name="address" /></td>
            </tr>


            <tr>
              <th>나이 </th>
              <td><input type="number" max="100" min="1" class="form-control"  name="age" value="<%=age %>" /></td>
            </tr>


            <tr>
              <th>성별 </th>
              <td>
                  <select name="sex" class="form-control">
                      <option value="남" <% if sex="남" then response.write "selected" end if %> >남</option>
                      <option value="여"  <% if sex="여" then response.write "selected"  end if %> >여</option>
                  </select>
              </td>
            </tr>

            <tr class="text-center">
              <td colspan="2">
                <button type="button" class="btn-success" id="btnRegist">신규회원 등록 </button>
                <button type="button"  class="btn-primary">로그인 </button>
                <button type="button" class="btn-danger">닫기</button>
              </td>
            </tr>
         </table>
     </form>

     </div>
   </div>


</div>
</div>



<!--#include  virtual=./mall/include/footer.asp -->
