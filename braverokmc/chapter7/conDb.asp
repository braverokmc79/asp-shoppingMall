<!--#include virtual="./asp-shoppingMall/braverokmc/include/header.asp" -->
</head>
<body>
<%
    ' 데이터베이스 연결'

      Set DbConn =Server.CreateObject("ADODB.Connection")
      DbConn.Open "PROVIDER=SQLOLEDB;DATA SOURCE=localhost;UID=braverokmc;PWD=1111;DATABASE=braverokmc "
      Set objRs =DbConn.Execute("Select * from product")
%>

<div class="rows">
  <div class="col-xs-12 col-sm-12">
    <div class="col-xs-3 col-sm-3"></div>
    <div class="col-xs-6 col-sm-6">
        <p>&nbsp;</p><h3 class="text-center">상품 목록</h3><p>&nbsp;</p>
        <table class="table">
           <tr>
             <th>번호</th>
             <th>제품명</th>
             <th>제품코드</th>
             <th>가격</th>
             <th>구입 유무</th>
             <th>구입 일자</th>
           </tr>
           <%
              Do while (Not objRs.eof)
                Response.Write "<tr>"
                  For Index=0 to (objRs.fields.count -1)
                    Response.Write "<td>" & objRs(Index) & "</td>"
                  Next
                 Response.Write "</tr>"
                 objRs.MoveNext
              Loop
              objRs.close
              Dbconn.close
           %>
        </table>


    </div>

  </div>


</div>


</body>
</html>
