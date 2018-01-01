<!--#include file=./include/header.asp  -->
</head>
<body>
<!--#include file=dbcon.asp -->
<%
  id=request("id")
  name=request("name")

  curpage=request("curpage")
  startpage=request("startpage")


sql1="select * from usert where id = '"& id & "' and name='"& name &"'"
Set rs1=db.Execute(sql1)


%>


<p>&nbsp;</p>
<p class="text-center"><font size="5"><b>등록정보 삭제하기</b></font></p>
<div class="rows">
  <div class="col-xs-12 col-sm-12">
      <div class="col-xs-3 col-sm-3"></div>
      <div class="col-xs-6 col-sm-6">
        <p>
          <a href="basiclist.asp">목록보기 일반</a>  &nbsp;&nbsp;&nbsp;  <a href="search.asp">목록보기 검색</a>
          &nbsp;&nbsp;&nbsp;   <a href="page.asp">목록보기 페이징 처리 검색</a>
        </p>
        <h3 class="text-center"><%= name %> 님을 삭제 합니다.</h3>
        <form method="post" action="del.asp"  class="form">
          <table class="table">
                  <tr>
                    <th>이름</th>
                    <td>
                      <%= rs1("name") %>
                    </td>
                  </tr>

                  <tr>
                    <th>성별</th>
                    <td>
                    <%= rs1("sex") %>
                    </td>
                  </tr>
                  <tr>
                     <th>메모</th>
                    <td>
                      <%= rs1("memo") %>
                    </td>
                  </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                              <input type="hidden"  value="<%= name %>" name="name" />
                              <input type="hidden"  value="<%= id %>" name="id" />
                              <input type="hidden" value="<%= curpage %>"  name="curpage" />
                              <input type="hidden" value="<%= startpage %>" name="startpage"/>
                              <input type="submit" value="삭제하기"  class="btn-success" />
                              <a href="page.asp"  class="btn" >이전화면으로 </a>
                        </td>
                    </tr>
          <table>
        </form>

      </div>

  </div>
</div>


</body>
</html>
