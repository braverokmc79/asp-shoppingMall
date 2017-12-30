<!--#include virtual=./braverokmc/include/header.asp -->
</head>
<body>

<%
  mynumber=1234567
  result =FormatCurrency(mynumber)
  response.write "화폐 단위로 표현 ->" & result & "<p>"


%>
<!-- 
출력 결과  :

화폐 단위로 표현 ->₩1,234,567
 -->


</body>
</html>
