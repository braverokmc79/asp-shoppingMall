<!--#include file=./include/header.asp  -->
</head>
<body>
<!--#include file=dbcon.asp -->
<%
  id=request("id")
  name=request("name")
  curpage=request("page")
  startpage=request("startpage")
%>
<%
  sql2="delete from usert where id= '"&id &"'"
  db.execute(sql2)
%>

<div class="rows">
  <div class="col-xs-12">
      <br/></br/></br/>
      <div class="text-center">
      <h2>삭제 결과 보기</h2>
      <h4><%= name %> 님은 회원 목록에서 삭제되었습니다.</h4>
      <p><a href="page.asp">목록보기 페이징 처리 검색</a></p>
     </div>
  </div>
</div>




</body>
</html>
