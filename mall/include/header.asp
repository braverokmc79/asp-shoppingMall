<%@Language="VBScript" CODEPAGE="65001" %>
<%
    ' 한글깨짐 방지 처리
   Response.CharSet="utf-8"
   Session.codepage="65001"
   Response.codepage="65001"
   Response.ContentType="text/html;charset=utf-8"

%>
<% response.buffer=true  %>
<!-- Buffer 프로퍼티를 이용한 페이지 버퍼링하기
Response.Buffer 프로퍼티를 사용하면 페이지를 버퍼링할 수 있다. 버퍼링이란 생성한 페이지를 바로
클라이언트로 전달하는 것이 아니라 서버에 보관한 다음 명령에 따라 보내거나 보내지 않게 하는 것이다.
버퍼링을 통해서 클라이언트에 보낼 페이지를 제어할 수 있다.
Response.Buffer = True 혹은 False
True 로 지정하면 페이지 내용을 바로 보내지 않고 버퍼링을 한다. 이 내용은 HTML 페이지 상단에 명시한다.
이 버퍼링된 페이지를 제어하기 위해서는 Flush,  Clear , End 메소드를 사용한다. 버퍼링된 페이지는 End 나
Flush 메소드의 명령을 받기 전까지는 페이지를 버퍼에 그대로 가지고 있다.

Response.Flush : Buffer 에 있는 결과를 즉시 보낸다. Response.Write 메소드를 사용한
출력 내용도 처리가 가능하다.

Respose.Clear : Buffer 에 있는 모든 HTML 결과를 지운다.
Response.End : ASP  파일 처리를 멈추고 현재 결과값을 보내다. -->

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
   <!-- Bootstrap core JavaScript
   ================================================== -->
   <!-- Placed at the end of the document so the pages load faster -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


<style>
#header_menu, #navbar, .navbar navbar-inverse navbar-static-top{
background:#EE7785;
color: white;
}
#header_menu .navbar-header{
  color: white;
}
.navbar-inverse .navbar-brand{
  background:#EE7785;
}

.navbar-inverse .navbar-nav>li>a{
  color:white;
}
.navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.open>a{
  background:#337AB7;
}

#navbar .navbar-nav>li>a:hover, #navbar  .navbar-nav>li>a:hover{
  background:#337AB7;
}


#footer {
   position:fixed;
   left:0px;
   bottom:0px;
   height:60px;
   width:100%;
   background:#EE7785;
   color: white;

}
#footer  p {

   text-align: center;
   vertical-align: middle;
}
</style>
