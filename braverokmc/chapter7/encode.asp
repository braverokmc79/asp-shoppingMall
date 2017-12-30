<!--#include virtual=./braverokmc/include/header.asp -->
</head>
<body>
<%
  response.write "<h3>HTMLEncode 를 사용한 경우 </h3><hr />"
  response.write "<b>여기는</b> macaronics <i>연구소</i> 입니다."
  response.write "<p>"
  response.write server.HTMLEncode("<b>여기는</b> macaronics <i>연구소</i> 입니다")
  response.write "<hr /><p>"
  response.write "김민종 & 최준호 & 임수정"
  response.write "<p>"
  response.write server.URLEncode("김민종 & 최준호 & 임수정")



%>

</body>
</html>
