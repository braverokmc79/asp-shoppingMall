<!--#include file=./include/header.asp  -->
<script>
function checkInput(theForm){

    if(theForm.name.value.length==0){
      alert("이름을 입력하세요.");
      theForm.name.focus();
      return false;
    }

    if(theForm.sex.value.length==0){
      alert("성별을 입력하세요. ");
      theForm.sex.foucus();
      return false;
    }

    return true;

}

</script>
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
<p class="text-center"><font size="5"><b>등록정보 수정하기</b></font></p>
<div class="rows">
  <div class="col-xs-12 col-sm-12">
      <div class="col-xs-3 col-sm-3"></div>
      <div class="col-xs-6 col-sm-6">
        <p>
          <a href="basiclist.asp">목록보기 일반</a>  &nbsp;&nbsp;&nbsp;  <a href="search.asp">목록보기 검색</a>
          &nbsp;&nbsp;&nbsp;   <a href="page.asp">목록보기 페이징 처리 검색</a>
        </p>
        <form method="post" action="edit.asp" onsubmit="return checkInput" class="form">
          <table class="table">
                  <tr>
                    <th>이름</th>
                    <td>
                      <input type="text" name="name" class="form-control"  value="<%= rs1("name") %>" />
                    </td>
                  </tr>

                  <tr>
                    <th>성별</th>
                    <td>
                      <input type="text" name="sex" class="form-control"  value="<%= rs1("sex") %>" />
                    </td>
                  </tr>
                  <tr>
                     <th>메모</th>
                    <td>
                        <textarea name="memo" class="form-control" cols="10" rows="10" ><%= rs1("memo") %></textarea>
                    </td>
                  </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                              <input type="hidden"  value="<%= id %>" name="id" />
                              <input type="hidden" value="<%= curpage %>"  name="curpage" />
                              <input type="hidden" value="<%= startpage %>" name="startpage"/>
                              <input type="submit" value="수정하기"  class="btn-success" />
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
