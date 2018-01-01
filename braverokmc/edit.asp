<!--#include file=./include/header.asp  -->
</head>
<body>
<!--#include file=dbcon.asp -->
<%
  id=Request("id")
  name=Request("name")
  sex=Request("sex")
  memo=Request("memo")
  curpage=Request("curpage")
  startpage=Request("startpage")

  sql2="update usert set name='"&name&"' , sex='"&sex&"', memo='"&memo&"' where id='"& id&"'"
  Set rs2=db.execute(sql2)


  sql3="select * from usert where id='"&id &"'"
  Set rs3=db.execute(sql3)

%>


<div class="rows">
  <div class="col-xs-12 text-center">

    <br/></br/>
    <h3>등록정보 수정 결과</h3>
    <p></p>
    <h5>다음과 같이 등록정보가 수정 되었습니다.</h5>
    <div class="col-xs-3 col-sm-3"></div>
    <div class="col-xs-3 col-sm-6">
      <p></p>
    <table class="table">
      <tr>
        <th>이름  </th>
        <td><%= rs3("name") %></td>
      </tr>
      <tr>
        <th>성별</th>
        <td><%= rs3("sex") %></td>
      </tr>

      <tfoot class="text-center">
        <tr>
          <td colspan="2">
            <a href="page.asp?page=<%= curpage%>&startpage=<%= startpage%>">목록으로 </a>
          </td>
        </tr>
      </tfoot>
    </table>
</div>
  </div>

</div>




<%

Set rs2=Nothing
Set rs3=Nothing
db.close()


%>

</body>
</html>
