<!--#include file=include/header.asp -->
<%
  Session.Abandon
%>
<script>
    alert("로그 아웃 되었습니다.");
    location.href="/asp-shoppingMall/mall";
</script>
