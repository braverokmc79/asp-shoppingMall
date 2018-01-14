<!--#include  virtual=./mall/include/header.asp -->
</header>
<body>
<!--#include virtual="./mall/include/header_menu.asp" -->

<div class="rows">
  <div class="container">
    <div class="col-xs-12 col-sm-12">
      <div class="col-xs-2 col-sm-2"></div>
      <div class="col-xs-9 col-sm-9">
       <h2 class="text-center">회원 목록</h2>

        <div>
          <table class="table">
            <tr>
              <th>등록할 회원 ID</th>
              <th>등록할 비밀번호</th>
              <th>이름</th>
              <th>Email</th>
              <th>연락처</th>
              <th>현주소</th>
              <th>나이</th>
              <th> 성별</th>
            </tr>
              <tr>

              </tr>
              <%
                 
                 sql1="select * from usert"

              %>


          </table>
        </div>



      </div>
    </div>
  </div>
</div>


<!--#include  virtual=./mall/include/footer.asp -->
