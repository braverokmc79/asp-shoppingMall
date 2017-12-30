<%
Function ReForm (sString , nMaxLen , isNum )
'// Request 로 들어온 변수를 처리한다.
'// sString : 넘겨받는 변수 (string)
'// nMaxLen : 최대 길이 (number)  (최대길이를 검사하지 않은경우 0)
'// isNum  : 숫자인지 아닌지 (1 : only number , 0 : 숫자판별 안함)
	Dim temp
	Dim nErr
	temp = Trim (sString ) & ""



	if isNum = 1 then	'숫자판별
		if isNumeric (temp) = False then
			response.write ( temp & " is Not Number " )
			response.End
		End if
	end if



	if nMaxLen > 0 then	'최대길이 판별
		if len(temp) > nMaxLen then
			response.write ( temp & " is over Maxlength " & nMaxLen  )
			response.end
		end if
	end if



	'// injection 관련 키워드 제거(항목 추가 가능)
	temp = Replace ( temp , "'" , "" )
	temp = Replace ( temp , "--" , "" )
	temp = Replace ( temp , "--, #" , " " )
	temp = Replace ( temp , "/* */" , " " )
	temp = Replace ( temp , "' or 1=1--" , " " )
	temp = Replace ( temp , "union" , " " )
	temp = Replace ( temp , "select" , " " )
	temp = Replace ( temp , "delete" , " " )
	temp = Replace ( temp , "insert" , " " )
	temp = Replace ( temp , "update" , " " )
	temp = Replace ( temp , "drop" , " " )
	temp = Replace ( temp , "on error resume" , " " )
	temp = Replace ( temp , "execute" , " " )
	temp = Replace ( temp , "windows" , " " )
	temp = Replace ( temp , "boot" , " " )
	temp = Replace ( temp , "-1 or" , " " )
	temp = Replace ( temp , "-1' or" , " " )
	temp = Replace ( temp , "../" , " " )
	temp = Replace ( temp , "unexisting" , " " )
	temp = Replace ( temp , "win.ini" , " " )
	ReForm = temp

End Function

Function Check_sql(str)
   Dim result_str
   SQL_Val = str
   SQL_Val = Replace(SQL_Val, ";", " ")
   SQL_Val = Replace(SQL_Val, "@variable", " ")
   SQL_Val = Replace(SQL_Val, "@@variable", " ")
   SQL_Val = Replace(SQL_Val, "+", " ")
   SQL_Val = Replace(SQL_Val, "print", " ")
   SQL_Val = Replace(SQL_Val, "set", " ")
   SQL_Val = Replace(SQL_Val, "%", " ")
   SQL_Val = Replace(SQL_Val, "<script>", " ")
   SQL_Val = Replace(SQL_Val, "<SCRIPT>", " ")
   SQL_Val = Replace(SQL_Val, "script", " ")
   SQL_Val = Replace(SQL_Val, "SCRIPT", " ")
   SQL_Val = Replace(SQL_Val, "or", " ")
   SQL_Val = Replace(SQL_Val, "union", " ")
   SQL_Val = Replace(SQL_Val, "and", " ")
   SQL_Val = Replace(SQL_Val, "insert", " ")
   SQL_Val = Replace(SQL_Val, "openrowset", " ")
   SQL_Val = Replace(SQL_Val, "xp_", " ")
   SQL_Val = Replace(SQL_Val, "decare", " ")
   SQL_Val = Replace(SQL_Val, "select", " ")
   SQL_Val = Replace(SQL_Val, "update", " ")
   SQL_Val = Replace(SQL_Val, "delete", " ")
   SQL_Val = Replace(SQL_Val, "shutdown", " ")
   SQL_Val = Replace(SQL_Val, "drop", " ")
   SQL_Val = Replace(SQL_Val, "--", " ")
   SQL_Val = Replace(SQL_Val, "/*", " ")
   SQL_Val = Replace(SQL_Val, "*/", " ")
   SQL_Val = Replace(SQL_Val, "XP_", " ")
   SQL_Val = Replace(SQL_Val, "DECLARE", " ")
   SQL_Val = Replace(SQL_Val, "SELECT", " ")
   SQL_Val = Replace(SQL_Val, "UPDATE", " ")
   SQL_Val = Replace(SQL_Val, "DELETE", " ")
   SQL_Val = Replace(SQL_Val, "INSERT", " ")
   SQL_Val = Replace(SQL_Val, "SHUTDOWN", " ")
   SQL_Val = Replace(SQL_Val, "DROP", " ")

   result_str = removeXSS(SQL_Val)
   Check_sql = result_str
End Function

Function removeXSS(get_String)
   get_String = Replace(get_String, "&", "&amp;")
   get_String = Replace(get_String, "<xmp", "<x-xmo", 1, -1, 1)
   get_String = Replace(get_String, "javascript", "<x-javascript", 1, -1, 1)
   get_String = Replace(get_String, "script", "<x-script", 1, -1, 1)
   get_String = Replace(get_String, "iframe", "<x-iframe", 1, -1, 1)
   get_String = Replace(get_String, "document", "<x-document", 1, -1, 1)
   get_String = Replace(get_String, "vbscript", "<x-vbscript", 1, -1, 1)
   get_String = Replace(get_String, "applet", "<x-applet", 1, -1, 1)
   get_String = Replace(get_String, "embed", "<x-embed", 1, -1, 1)
   get_String = Replace(get_String, "object", "<x-object", 1, -1, 1)
   get_String = Replace(get_String, "frame", "<x-frame", 1, -1, 1)
   get_String = Replace(get_String, "grameset", "<x-grameset", 1, -1, 1)
   get_String = Replace(get_String, "layer", "<x-layer", 1, -1, 1)
   get_String = Replace(get_String, "bgsound", "<x-bgsound", 1, -1, 1)
   get_String = Replace(get_String, "alert", "<x-alert", 1, -1, 1)
   get_String = Replace(get_String, "onblur", "<x-onblur", 1, -1, 1)
   get_String = Replace(get_String, "onchange", "<x-onchange", 1, -1, 1)
   get_String = Replace(get_String, "onclick", "<x-onclick", 1, -1, 1)
   get_String = Replace(get_String, "ondblclick","<x-ondblclick",  1, -1, 1)
   get_String = Replace(get_String, "enerror", "<x-enerror", 1, -1, 1)
   get_String = Replace(get_String, "onfocus", "<x-onfocus", 1, -1, 1)
   get_String = Replace(get_String, "onload", "<x-onload", 1, -1, 1)
   get_String = Replace(get_String, "onmouse", "<x-onmouse", 1, -1, 1)
   get_String = Replace(get_String, "onscroll", "<x-onscroll", 1, -1, 1)
   get_String = Replace(get_String, "onsubmit", "<x-onsubmit", 1, -1, 1)
   get_String = Replace(get_String, "onunload", "<x-onunload", 1, -1, 1)
   get_String = Replace(get_String, "<", "&lt;")
   get_String = Replace(get_String, ">", "&gt;")
   removeXSS = get_String
End Function

Function mSecurity(get_String)
    Dim result1, result2
    result1=removeXSS(get_String)
    result2=Check_sql(result1)
    mSecurity=result2
End Function

%>
<!--
SQL Injection 방어 함수 적용
(ReForm 함수 사용)
<%
	param1 = ReForm(request.Form("param1"),0,0)
%>
-->
