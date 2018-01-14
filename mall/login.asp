<!--#include  virtual=./asp-shoppingMall/mall/include/header.asp -->
</header>
<body>
<!--#include virtual="./asp-shoppingMall/mall/include/header_menu.asp" -->

<div class="rows">
<div class="container">

   <div clss="col-xs-12 col-sm-12">
      <h1 class="bg-primary text-center" style="width:100%; padding-top:20px; padding-bottom:20px; text-align:center">사용자 인증</h1>
      <div class="col-xs-3 col-sm-3"></div>
      <div class="col-xs-6 col-sm-6">
        <br/></br/></br/></br/></br/>
        <form method="post" action="/asp-shoppingMall/mall/loginOk.asp">
          <table class="table table-striped">
              <tr>
                <th>회원 ID </th>
                <td><input type="text"  class="form-control"  name="id1"/></td>
              </tr>
              <tr>
                <th>회원 비밀번호 </th>
                <td><input type="password"  class="form-control" name="passwd"/></td>
              </tr>
              <tr>
                <td colspan="2" class="text-center"><button class="btn">로그인</button></td>
              </tr>
          </table>
        </form>
<br/></br/></br/></br/></br/>
     </div>
   </div>
</div>
</div>

<!--#include  virtual=./asp-shoppingMall/mall/include/footer.asp -->
