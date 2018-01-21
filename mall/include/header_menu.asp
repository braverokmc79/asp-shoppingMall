<div class="navbar-wrapper">
      <div class="container">
        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container" id="header_menu">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Macaronics</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>

            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a  href="/asp-shoppingMall/mall/">ASP mall</a></li>
                <li class="active"><a href="/asp-shoppingMall/mall/adduser.asp">회원 등록</a></li>
                <li><a href="/asp-shoppingMall/mall/prodlist.asp">상품목록</a></li>
                <%
                  if session("id1") ="" then
                %>
                  <li><a href="/asp-shoppingMall/mall/login.asp">로그인</a></li>
                <%
                  else
                %>

                        <li><a href="/asp-shoppingMall/mall/memberList.asp">회원록록</a></li>

                        <li><a href="/asp-shoppingMall/mall/logout.asp">로그아웃</a></li>
                        <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%= session("id1")  %>님 환영합니다.
                            <span class="caret"></span></a>
                          <ul class="dropdown-menu" role="menu">
                            <li><a href="/asp-shoppingMall/mall/regedit.asp">회원정보 수정</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li class="divider"></li>
                            <li class="dropdown-header">Nav header</li>
                            <li><a href="#">Separated link</a></li>
                            <li><a href="#">One more separated link</a></li>
                          </ul>
                        </li>

                <%
                  end if
                %>

                </ul>


            </div>
          </div>
        </nav>
      </div>
    </div>
