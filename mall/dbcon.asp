<%

    Dim dbConnect, db '변수 선언'
    ' DB 연결 접속 정보 변수 저장
    dbConnect = "Provider=SQLOLEDB; Data Source=CJH-PC;Initial Catalog=braverokmc; User id=braverokmc;password=1111"
    ' 연결 객체 생성
    Set db = server.createObject("ADODB.Connection")
    ' 데이터베이스 접속
    db.open dbConnect


%>
