<!--#include virtual=./braverokmc/include/header.asp  -->
</head>
<body>
함수

<%
mynumber=1234567
response.write "1. 처음 숫자 -> " & mynumber & "<p>"
response.write "2. 소숫점이하 3자리 지정 ->"& FormatNumber(mynumber,3,0,0,0) & "<p>"
response.write "3. 소수점 앞에 0을 표시 ->" & FormatNumber(.1234567, 3, -1,0,0) & "<p>"
response.write "4. 음수값을 괄호로 표시 -> " & FormatNumber(-1234567, 3,-1,-1, 0) & "<p>"
response.write "5. 단위 (그룹 구분 기호) 표시 -> "& FormatNumber(mynumber, 3, -1, -1, -1) & "<p>"
response.write "6. 디폴트로 표시  -> " & FormatNumber(mynumber, , -2,-2, -2) & "<p>"
response.write "7. 6과 동일 ->" & FormatNumber(mynumber) & "<p>"
response.write "8. 원화 표시법의 단순화 ->" & FormatNumber(mynumber, 0, -1) & "<p>"



%>

<!-- 출력 결과

함수 1. 처음 숫자 -> 1234567
2. 소숫점이하 3자리 지정 ->1234567.000

3. 소수점 앞에 0을 표시 ->0.123

4. 음수값을 괄호로 표시 -> (1234567.000)

5. 단위 (그룹 구분 기호) 표시 -> 1,234,567.000

6. 디폴트로 표시 -> 1,234,567.00

7. 6과 동일 ->1,234,567.00

8. 원화 표시법의 단순화 ->1,234,567


-->


</body>
</html>
