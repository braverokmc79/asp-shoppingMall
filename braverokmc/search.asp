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
       <form class="form" action="search.asp" method="post">
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
            %>

            <%
              For i =1  to rs("totalcount")
            %>
              <tr>
                  <td><%= DbRec("id")%></td>
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
</div>




</body>
</html>
