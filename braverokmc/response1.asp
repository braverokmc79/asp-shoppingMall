<!--#include file=./include/header.asp  -->
</head>
<body>
<%
  when=now()
  tommorow=dateadd("d", 1, when)
  twoweekslater=dateAdd("ww", 2,  when)
  fourteenweekdayslater=dateadd("w", 14, when)
  monthlater=dateadd("m", 1, when)

  sixminuteslater=dateadd("n", 6, when)
  sixhourslater=dateadd("h", 6, when)
  fortysecslater=dateadd("s", 40, when)

  response.write "오늘의 현재 날짜/시간 : <b>" & when & "</b><br />"
  response.write "내일의 현재 날짜/시간 : <b>" & tommorow &"</b><br/>"
  response.write "2주후의 현재 날짜/시간 : <b>" & twoweekslater & "</b><br/>"
  response.write "14일후의 현재 날짜/시간 : <b>" & fourteenweekdayslater & "</b><br />"
  response.write "1달후의 현재 날짜/시간 : <b>" & monthlater & "</b></br>"


%>

6분후의 현재 날짜/시간 : <b><%= sixminuteslater %></b><br />
6시간후의 현재 날짜/시간 : <b><%= sixhourslater %></b><br />
40분 후 : <b> <%= fortysecslater %></b>



</body>
</html>
