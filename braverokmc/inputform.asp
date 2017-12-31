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

<p>&nbsp;</p>
<p class="text-center"><font size="5"><b>등록폼</b></font></p>
<div class="rows">
  <div class="col-xs-12 col-sm-12">
      <div class="col-xs-3 col-sm-3"></div>
      <div class="col-xs-6 col-sm-6">
        <p>
          <a href="basiclist.asp">목록보기 일반</a>  &nbsp;&nbsp;&nbsp;  <a href="search.asp">목록보기 검색</a>
        </p>
        <form method="post" action="input.asp" onsubmit="return checkInput" class="form">
          <table class="table">
                  <tr>
                    <th>이름</th>
                    <td>
                      <input type="text" name="name" class="form-control"  />
                    </td>
                  </tr>

                  <tr>
                    <th>성별</th>
                    <td>
                      <input type="text" name="sex" class="form-control"  />
                    </td>
                  </tr>
                  <tr>
                     <th>메모</th>
                    <td>
                        <textarea name="memo" class="form-control" cols="10" rows="10"></textarea>
                    </td>
                  </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                              <input type="submit" value="등록하기"  class="btn-success" />
                        </td>
                    </tr>
          <table>
        </form>

      </div>

  </div>
</div>


</body>
</html>
