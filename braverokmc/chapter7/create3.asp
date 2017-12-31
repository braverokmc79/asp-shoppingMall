<%@Language="VBScript" CODEPAGE="65001" %>
<% Response.CharSet="utf-8"
   Session.codepage="65001"
   Response.codepage="65001"
   Response.ContentType="text/html;charset=utf-8"
%>
<html lang="ko">
<head>
<title>macaronics</title>
   <meta http-equiv="content-type" content="text/html"; charset="utf-8" >
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
   <title>macaronics</title>
   <!-- 부트스트랩 -->
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

</head>
<body>

<%
  Set fs =Server.CreateObject("Scripting.FileSystemObject")
  Set objFile =fs.OpenTextFile("C:\inetpub\wwwroot\asp-shoppingMall\ex\test2.txt", 8, true)
%>
<h2>FSO 텍스트 파일에 쓰기를 완료하였습니다.</h2>


<%

   objFile.WriteLine("이 텍스트 파일 작성 테스트이다.")
   objFile.WriteLine("이 텍스트 파일 OpenTextFile 메소드 사용하였다.")
   objFile.WriteLine("성공적으로 글쓰기가 완료되었습니다.")
   objFile.close

%>


</body>
</html>
