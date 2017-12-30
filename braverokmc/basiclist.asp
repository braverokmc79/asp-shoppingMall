<!--#include file=./include/header.asp  -->
</head>
<body>
<!--#include file=dbcon.asp -->
<p>&nbsp;</p>
<%
   id=request("id")
   name=request("name")
   sex=request("sex")
   memo=request("memo")

   ' 총 레코드 개수'
   sql="Select count(*) as totalcount from usert "
   Set rs=db.Execute(sql)

   ' 목록 불러오기
   sql2 =" select * from usert order by id asc "
   Set DbRec=db.Execute(sql2)
%>
<div class="rows">
  <div class="col-xs-12 col-sm-12">
      <p><h2 class="text-center">목록 보기</h2></p>

      <div class="col-xs-3 col-sm-3"></div>
      <div class="col-xs-6 col-sm-6">
          <p>레코드 수  : <%= rs("totalcount") %></p>

          <table class="table">
            <tr>
              <td>번호</td>
              <td>이름</td>
              <td>성별</td>
              <td>메모</td>
            </tr>

            <%
              For i =1 to rs("totalcount")
            %>
            <tr>
              <td><%= DbRec("id") %></td>
              <td><%= DbRec("name") %></td>
              <td><%= DbRec("sex") %></td>
              <td><%= DbRec("memo") %></td>
            </tr>
            <%

              DbRec.movenext
              Next
            %>

          </table>

      </div>

  </div>
</div>

</body>
</html>
