<%@Language="VBScript" CODEPAGE="65001" %>
<% Response.CharSet="utf-8"
   Session.codepage="65001"
   Response.codepage="65001"
   Response.ContentType="text/html;charset=utf-8"
%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>Macaronics</title>

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

     <!-- jQuery UI CSS파일 -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
     <!-- jQuery 기본 js파일 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <!-- jQuery UI 라이브러리 js파일 -->
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <script src="./js/datepicker-ko.js"   charset="utf-8"></script>

<script>
$(function() {
  $( "#date1" ).datepicker({
      changeYear: true,
      showButtonPanel:true,
      dateFormat: 'yymmdd'

  });
  $("#date2").datepicker({
      changeYear:true,
      // changeMonth:true,
      showButtonPanel:true,
      dateFormat: 'yymmdd'
  });


});

</script>
  </head>
  <body>

<!--#include File="DBHelper.asp"-->
<!-- 페이징 처리 함수  -->


<%
 Dim date1, date2, displayLength, displayStart, sortCol, sortDir, search , curPage, totalCount


 displayLength=request.QueryString("displayLength") '한페이제에 출력할 목록 수
 displayStart=request.QueryString("displayStart") '첫번째 시작번호
 sortCol=request.QueryString("sortCol") ' 컬럼 값  검색에 필요한 컬럼  디폴트 값 id'
 sortDir=request.QueryString("sortDir")  ' 정렬 방법
 search =request.QueryString("search")  ' 검색
 date1 =request.QueryString("date1")
 date2 =request.QueryString("date2")

 curPage = Request.QueryString("curPage") ' ' 페이지 번호'

 if IsEmpty(displayLength)  Then
  displayLength=10  '기본 10  개씩
 end if

 if IsEmpty(displayStart) Then
   displayStart=0  '  0변 부터 출력
 end if

 if IsEmpty(sortCol) Then
   sortCol=0   '기본 아이디
 end if

 if IsEmpty(sortDir) Then
    sortDir="desc"
 end if

 if IsEmpty(curPage) Then
   curPage=1
 end if

 response.write "날짜1 : "  & date1 &"<br />"
 response.write "날짜2 : "  & date2 &"<br />"
 response.write "displayLength : "  & displayLength &"<br />"
 response.write "displayStart : "  & displayStart &"<br />"
 response.write "sortCol : "  & sortCol &"<br />"
 response.write "sortDir 정렬 : "  & sortDir &"<br />"
 response.write "검색  : "  & search &"<br />"
 response.write "date1 : " &date1 & "<br/>"
 response.write "date2 : " &date2 & "<br/>"

   ' displayStart=0   ' 페이지 번호 displayLength + displayStart = page 번호
  displayStart=displayLength*(curPage-1)

  Set DBHelper =new clsDBHelper

  '매개변수 배열 준비
  Dim paramInfo(6)

  'MacaroncisEmployees 2, 1, 2, 'asc', null   파라미터 값
  paramInfo(0) =DBHelper.MakeParam("@DisplayLength", adInteger, adParamInput, ,displayLength )
  paramInfo(1) =DBHelper.MakeParam("@DisplayStart", adInteger, adParamInput,  ,displayStart )
  paramInfo(2) =DBHelper.MakeParam("@SortCol", adInteger, adParamInput,  , sortCol)
  paramInfo(3) =DBHelper.MakeParam("@SortDir", adVarChar, adParamInput, 10,sortDir )
  paramInfo(4) =DBHelper.MakeParam("@Search", adVarChar, adParamInput, 255, search)
  paramInfo(5) =DBHelper.MakeParam("@Date1", adVarChar, adParamInput, 10, date1)
  paramInfo(6) =DBHelper.MakeParam("@Date2", adVarChar, adParamInput, 10, date2)
  Set RS  =DBHelper.ExecSPReturnRS("MacaroncisEmployees", paramInfo, Nothing)
%>

    <div  class="row">
      <div class="col-sm-12">
         <h2 class="text-center">회원 목록 출력</h2>

         <div class="col-sm-3">
         </div>

         <div class="col-sm-6">
             <p>&nbsp;</p>
           <div calss="text-center">
              <form method="get" action="/index.asp" >
                <input type="text" id="date1" name="date1" size="10%" value='<%= date1 %>' readonly> ~
                <input type="text" id="date2" name="date2" size="10%" value='<%= date2 %>' readonly >

                <select name="sortCol" id="sortCol" PSize="15%">
                  <option value="0"  <% if sortCol =0 Then response.write "selected" end if %> >아이디</option>
                  <option value="1" <% if sortCol =1 Then response.write "selected" end if %> >성</option>
                  <option value="2" <% if sortCol =2 Then response.write "selected" end if %> >이름</option>
                  <option value="3" <% if sortCol =3 Then response.write "selected" end if %> >성별</option>
                  <option value="4" <% if sortCol =4 Then response.write "selected" end if %> >직업</option>
                </select>
                 <select name="sortDir" PSize="15%" name="sortDir" >
                        <option value="desc" <% if sortDir ="desc" Then response.write "selected" end if %> >내림차순</option>
                        <option value="asc" <% if sortDir ="asc" Then response.write "selected" end if %> >오름차순</option>
                  </select>
                <input type="text" id="search"  name="search" size="10%"  value="<%= search %>" />

                <select name="displayLength">
                  <%
                     dim displayCount
                     for displayCount=10 to 200 step 10
                  %>
                    <option value="<%=displayCount%>" <% if displayCount=Cint(displayLength) Then response.write "selected"  end if %> ><%=displayCount%></option>
                  <%
                      next
                  %>

                </select>

                <input type="submit" value="조회"  />
              </form>
              <button type="button" onclick="javascript:location.href='/index.asp'" >초기화</button>
           </div>
            <p>&nbsp;</p>
             <table class="table table-hover">
                 <tr>
                   <th>번호</th>
                   <th>아이디</th>
                   <th>성</th>
                   <th>이름</th>
                   <th>성별</th>
                   <th>직업</th>
                   <th>등록일</th>
                 </tr>

                 <%
                    if RS.eof or RS.bof then  '실행결과가 없을 경우 (예외처리)'
                       response.write "<tr><td colspan='7' class='text-center'>실행 결과가 없습니다.</td></tr>"

                    else
                       do while RS.eof =false '레코드셋에 값이 있으면 계속 반복'
                       totalCount =RS(1)
%>

                 <tr>
                   <td><%= RS(0) %></td>
                   <td><%= RS(2) %></td>
                   <td><%= RS(3) %></td>
                   <td><%= RS(4) %></td>
                   <td><%= RS(5) %></td>
                   <td><%= RS(6) %></td>
                   <td><%= RS(7) %></td>
                 </tr>

<%
                          RS.moveNext
                       loop
                    end if


                    Response.write "검색 개수 : "  &  totalCount  & "<br/>"

                    RS.close
                    Set DBHelper =Nothing
                 %>
             </table>
             <!-- ' 페이지 이동 부분 뿌려준다. -->
<!--#include File="./lib/asp_page_function.asp" -->





     <%
        url="/index.asp?date1="&date1&"&date2="&date2&"&displayStart="&displayStart&"&sortCol="&sortCol&"&sortDir="&sortDir&"&search="&search
        pagination=calcPaging(curPage, totalCount,displayLength, url )
        Response.write pagination
'

     %>
         </div>

         <div class="col-sm-3">
         </div>
      </div>
    </div>

      <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
      <p>Macaronics</p>


  </body>
</html>



<!--
select * from products

﻿where convert(int, convert(char(8), registdate, 112)) between '20130301' and '20130304'

registdate 컬럼의 날짜를 convert 로 변경해서 앞에서 8자리(20130301) 로 변환을 시켜준뒤 between을 이용해서 검색하는 방식입니다.


-->
