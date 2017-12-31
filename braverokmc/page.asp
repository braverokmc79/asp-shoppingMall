<!--#include file=./include/header.asp  -->
<script>

function add(){

  location.href="inputform.asp"  ;
}
</script>
</head>
<body>
<!--#include file=dbcon.asp -->

<%

  id=request("id")
  name=request("name")
  sex=request("sex")
  keyfield=request("keyfield")
  key=request("key")

' page , startpage , ipp, ten 추가
if Request("page") ="" Then
curpage=1
Else
curpage=cint(Request("page"))
end if

if Request("startpage")="" Then
startpage=1
Else
startpage=cint(Request("startpage"))
end if

ipp=10 ' 페이지마다 출력할 레코드의 개수를 나타낸다.
ten=10   '출력할 페이지의 개수를 나타낸다.




 if key ="" then
   sql ="SELECT count(*) as totalcount FROM usert"
 else
   sql="select count(*) as totalcount from usert where " & keyfield & " like '%" & key & "%'"
 end if

 Set rs=db.Execute(sql)

%>
<p>
  &nbsp;
</p>
<div class="rows" >
 <div class="col-xs-12 col-sm-12" >
    <h3 class="text-center">목록 보기</h3>
    <p>
      &nbsp;
    </p>
   <div class="col-xs-3 col-som-3"></div>

   <div class="col-xs-6 col-som-6">
     <div class="text-center">
        <p>
          <button onclick="add()" class="btn-primary">추가하기</button>
        </p>
        <p class="text-left">
          레코드 총 수 :  총 <%= rs("totalcount") %>개<br/>
        </p>
       <form class="form" action="page.asp" method="post">
         <div class="col-sm-2">
             <select name="keyfield" class="form-control">
               <option value="name">이름</option>
               <option value="sex">성별</option>
             </select>
         </div>
         <div class="col-sm-2">
           <input type="text" name="key"  class="form-control" />
         </div>
         <div class="col-sm-2">
            <input type="submit" value="Search" name="submit"  class="form-control btn-success"/>
         </div>
       </form>
       <p><br />&nbsp;</p>
        <table class="table">
            <tr>
               <th>번호</th>
               <th>이름</th>
               <th>성별</th>
               <th>메모</th>
            </tr>
           <%
               Set DbRec=Server.CreateObject("ADODB.Recordset")
               DbRec.CursorType=1
               if key="" Then
                  DbRec.Open "Select * From usert ORDER by id asc ", db
               else
                  DbRec.Open " Select * From usert where " & keyfield & " like '%" & key & "%' Order by id asc ", db

               end if


               '변경된 부분
            %>



            <%

              if  DbRec.EOF then   'DbRec 가 없다면 그냥 넘어가기 한다.

              else     ' 검색된 결과갑이 있다면 레코드의 수를 계산하고 각 페이지 값을 계산한다.

              DbRec.MoveLast
              postcount =DbRec.Recordcount

              totpage =int(postcount/ipp)
              totpage=cint(totpage)

              if (totpage * ipp) <> postcount then totpage=totpage+1

              For a=1 to (curpage-1) * ipp
              DbRec.MovePrevious
              Next

            %>
            <%
              For i=1 to ipp
                if totpage= curpage then
                  value =postcount Mod ipp

                  if i > value and value <> 0 then
                  Exit For
                  end if

               end if
            %>
            <!-- 검색된 레코들 출력한다 -->
            <tr>
                <td><%= DbRec("id")%></td>
                <td><%= DbRec("name") %></td>
                <td><%= DbRec("sex") %></td>
                <td><%= DbRec("memo") %></td>
            </tr>

            <%
              DbRec.MovePrevious
              NEXT

            end if
            %>

        </table>


        <div class="text-center">

          <nav aria-label="Page navigation example">
            <ul class="pagination">

            <% if totpage > ten then %>
                <%    if startpage=1  then %>
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">처음</span>
                    <span class="sr-only">첫페이지</span>
                  </a>
                </li>
                   <% else %>
                   <li class="page-item">
                     <a class="page-link" href="page.asp?page=<%=cint(Request("page"))-1 %>&startpage=<%=cint(Request("page") )-ten%>&keyfield=<%= keyfield%>&key=<%=key%>" aria-label="Previous">
                       <span aria-hidden="true">&laquo;</span>
                       <span class="sr-only">이전</span>
                     </a>
                   </li>
                   <%  end if %>

                  <%
                    For  a=startpage to startpage+ten-1
                      if a>totpage then
                      exit for
                      else
                          if a=curpage then
                          Response.Write "<li class='active' ><a class='page-link' href='#'>" &a&"</a></li>"
                          else
                          %>
                          <li class='page-item' ><a href='page.asp?page=<%= a %>&startpage=<%=startpage %>&keyfield=<%= keyfield %>&key=<%=key%>' class='page-link'><%=a%></a></li>
                          <%
                          end if
                      end if
                    Next

                  if((startpage\ten)=(totpage\ten)) Then
%>
<li class="page-item">
  <a class="page-link" href="#" aria-label="Next">
    <span aria-hidden="true">끝</span>
    <span class="sr-only">Next</span>
  </a>
</li>

<%
                  else
                  %>
                  <li class="page-item">
                    <a class="page-link" href="page.asp?page=<%= a %>&startpage=<%= a%>&keyfield=<%= keyfield%>&key=<%=key%>" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                      <span class="sr-only">Next</span>
                    </a>
                  </li>
                  <%
                  end if

             Else
             Response.write "탑 else"
             For a=startpage to totpage

              if  a=curpage Then
                  Response.Write  "<a href='' >"&a&"</a>"
               end if
                  Response.Write "라"
             next
              %>

          <% end if %>
        </ul>
      </nav
        </div>


        <br/></br/></br/></br/></br/>
     </div>


   </div>


 </div>
</div>


<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
  </ul>
</nav>


</body>
</html>
