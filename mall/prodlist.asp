<!--#include  virtual=./asp-shoppingMall/mall/include/header.asp -->
</header>
<body>
<!--#include virtual="./asp-shoppingMall/mall/include/header_menu.asp" -->
<!--#include file="dbcon.asp" -->

<%

'  Dim totalCount
'  sqlTotalCount =" select count(*) as totalcount from prodt"

'  Set rsTotalCount=db.execute(sqlTotalCount)
'  totalCount=rsTotalCount("totalcount")

Dim keyfield, key, page, startpage, ipp, ten, curPage, totalCount, totpage

keyfield=request("keyfield")
key=request("key")

if Request("page") ="" Then
curPage=1
Else
curPage=CInt(Request("page"))
end if

if Request("startpage")="" Then
startpage=1
Else
startpage=cint(Request("startpage"))
end if

ipp=10  '페이지마다 출력할 레코드의 개수를 나타낸다.
ten=10  '출력할 페이지의 개수를 나타낸다.

 if key="" then
    sql ="select count(*) as totalCount from prodt"
 else
    sql ="select count(*) as totalCount from prodt where "&keyfield &" like '%"& key &"%'"
 end if
'Response.write sql
 Set rs =db.Execute(sql)
totalCount=rs("totalCount")

%>

<div class="rows">
  <div class="container">

    <div class="col-xs-12 col-sm-12">
      <div class="col-xs-2 col-sm-2"></div>
      <div class="col-xs-8 col-sm-8">
        <div>

          <form action="prodlist.asp" method="post">
          <div class="col-xs-12 col-sm-12">
            <div class="col-xs-3 col-sm-3">
                레코드 총수 : 총 <%= totalCount %>개
             </div>
            <div class="col-xs-3 col-sm-3">
              <select class="form-control" name="keyfield">
                <option value="prodname" <% if keyfield="prodname" then %>selected <% end if %> >제품명</option>
                <option value="prodcode" <% if keyfield="prodcode" then %>selected <% end if %> >제품코드</option>
                <option value="sortcode" <% if keyfield="sortcode" then %>selected <% end if %> >분류코드</option>
              </select>
            </div>
          <div class="col-xs-3 col-sm-3">
            <input type="text" class="form-control" name ="key" value="<%= key %>"/>
           </div>
           <div class="col-xs-3 col-sm-3">
            <input type="submit" value="검색" class="btn"  />
          </div>
          </div>
          </form>

          <br/></br/><br/></br/>
        </div>
        <div class="row placeholders">
          <!--
          number int identity(1,1) primary key, -- 고유번호
        	prodcode nvarchar(100) not null ,  -- 제품코드
        	prodname nvarchar(100) not null,  -- 제품이름
        	prodinfo1 nvarchar(3000) null,     -- 상세설명1
        	prodinfo2 nvarchar(3000) null,   	  -- 상세설명2
        	prodpic   nvarchar(100) null,   		-- 이미지 경로
        	sortcode nvarchar(100) null , 		-- 분류코드
        	stwon 	int not null, 					-- 정규가격
        	won 		int not null, 					-- 할인가격
        	proddate  datetime default GETDATE(), -- 등록일
        	stcount  int, 								-- 총수량
        	realcount int, 								-- 실수량
        	nowcount  int 								-- 현재수량
         -->
<%
   ' 내림차순 오름차순이 반대이다 . asc, desc
    Set DbRec=Server.CreateObject("ADODB.Recordset")
    DbRec.CursorType=1
    if key="" Then
      DbRec.Open "select * from prodt order by number asc ", db
    else
      DbRec.Open "select * from prodt where " & keyfield & " like '%"&key &"%' order by number asc", db
    end if

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

<div class="col-xs-12 col-sm-6 placeholder" style="margin-top:30px;">
  <div class="col-xs-6 col-sm-6">
    <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzBEOEZEQiIvPjxnPjx0ZXh0IHg9Ijc0LjA1NDY4NzUiIHk9IjEwMCIgc3R5bGU9ImZpbGw6I0ZGRkZGRjtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0O2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjIwMHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg==" data-holder-rendered="true">
  </div>

  <div class="col-xs-6 col-sm-6">
    <p>
      번호 :  <%= DbRec("number") %>
    </p>
    <p><b>분류명:</b> <%= DbRec("sortcode") %> </p>
    <p><b>정규가격:</b>  <%= FormatNumber(DbRec("stwon"), 0, -1)%> 원</p>
    <p><b>재고수량:</b>  <%=FormatNumber(DbRec("nowcount"), 0, -1) %>개</p>
  </div>

  <div class="col-xs-12">
    <h4>  <p><b>제품명:</b>  <%=DbRec("prodname") %>(<%= DbRec("prodcode")%>)</p></h4>
    <span class="text-muted" ><p><b>할인가격:</b>
    <%= FormatNumber(DbRec("won"),0 ,-1) %>원
    (할인률 : <%= CInt(((DbRec("won")/DbRec("stwon"))*100) )%>%)</p>
    </span>
  </div>

</div>
        <%
          DbRec.MovePrevious
          NEXT

        end if
        %>
      </div>   <!--  End  row placeholders -->


</div> <!--  RS 및 페이지네이션 끝 -->


      </div>

   </div>
</div>


<div class="text-center">

  <nav aria-label="Page navigation">
    <ul class="pagination">

    <% if totpage < ten then %>
        <%    if startpage=1  then %>
        <li class="page-item">
          <a class="page-link" href="prodlist.asp?page=1&startpage=<%=startpage%>&keyfield=<%= keyfield%>&key=<%=key%>" aria-label="Previous">
            <span aria-hidden="true">처음</span>
            <span class="sr-only">첫페이지</span>
          </a>
        </li>
           <% else %>
           <li class="page-item">
             <a class="page-link" href="prodlist.asp?page=<%=cint(Request("page"))-1 %>&startpage=<%=cint(Request("page") )-ten%>&keyfield=<%= keyfield%>&key=<%=key%>" aria-label="Previous">
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
                  <li class='page-item' ><a href='prodlist.asp?page=<%= a %>&startpage=<%=startpage %>&keyfield=<%= keyfield %>&key=<%=key%>' class='page-link'><%=a%></a></li>
                  <%
                  end if
              end if
            Next

          if((startpage\ten)=(totpage\ten)) Then
%>
<li class="page-item">
<a class="page-link" href="prodlist.asp?page=<%= totpage %>&startpage=<%=startpage %>&keyfield=<%= keyfield %>&key=<%=key%>" aria-label="Next">
<span aria-hidden="true">끝</span>
<span class="sr-only">Next</span>
</a>
</li>

<%
          else
          %>
          <li class="page-item">
            <a class="page-link" href="prodlist.asp?page=<%= a %>&startpage=<%= a%>&keyfield=<%= keyfield%>&key=<%=key%>" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
              <span class="sr-only">Next</span>
            </a>
          </li>
          <%
          end if

     Else
    '' Response.write "탑 else"
     For a=startpage to totpage

      if  a=curpage Then
          Response.write "<li class='active'>"
          Response.Write  "<a class='page-link' href='prodlist.asp' >"&a&"</a>"
          Response.Write "</li>"
       end if
          'Response.Write "라"
     next
      %>

  <% end if %>
</ul>
</nav>
</div>

<!--

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
</nav> -->


<div style="margin-bottom:200px;">

</div>






<!--#include  virtual=./asp-shoppingMall/mall/include/footer.asp -->
