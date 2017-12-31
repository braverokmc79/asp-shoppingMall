7-10 라이브러리 활용법(include)

include 명령어는 자주 또는 공통으로 사용하는 코드나 함수 등을 만들어 다른 곳에서도 참조할
수 있도록 파일을 포함시키는 것이다. include 명령어를 사용하면 파일 작성시 같은 작업의
반복을 피하고, 차후 수정 작업을 쉽게 할 수 있다.

반복되는 코드나 함수를 헤더 파일로 저장한 다음 원하는 부분에서 이 헤더 파일을 불러서
(including)사용하기 때문에 ASP 내부에 포함되어 있는 것이 아니라, 캐쉬 영역에 저장되었다가
웹브라우저의 실행 시 참조된다.

특히, ADO 객체에서 ADO 상수를 사용하고자 할 때는 상수를 정의한 Adodb.inc 파일을
include 명령어를 사용하여 읽어 들어야 한다. 다음은 adCmdText, adCmdStoreProc 등의
ADO 상수를 페이지에서 사용할 경우 해당 페이지 include 명령어를 사용하여 파일을
포함시킨 예이다.

<!-- #include file="Adovbs.inc" -->

주의할 점은 include 문을  <% ~  %> 내에서 사용해서는 안되며, include 안에는 변수를
적용한 문장을 쓸 수 없다.

형식은 다음과 같다.

실제 경로를 사용 : <!-- #include file="C:\test\test.inc" -->
가상 경로를 사용 : <!-- #include virtual="\test\test.inc" -->


- 예

Case 문을 사용하여 각 조건에 맞는 include 파일을 사용한 경우이다. 위와 같이 소스 코드를
정의해 주면 어떤 ASP 코드보다 먼저 위의 문장을 실행하게 된다. 예에서는 include 를
다이내믹하게 표현한 것이다.

<%
  SELECT CASE
  CASE 1 %>
  <!-- #include virtual="whatever1.asp" -->
<% CASE 2 %>
  <!-- #include virtual="whatever2.asp" -->
<% CASE 3 %>
  <!-- #include virtual="whatever3.asp" -->
  <% END Select %>
