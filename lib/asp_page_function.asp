<%

  ' page
  ' '하단 페이징  << 1 2 3 4 5 6 7 8 9 10 >>
  ' totalCount 전체 개수
  ' startPage // 시작 페이지
  ' endPage   // 끝페이지
  ' pagePrev  // 이전 여부
  ' pageNext  // 다음 여부


  public Function calcPaging(curPage,totalCount, displayLength, url)
    Dim  page, displayPageNum,perPageNum, pageNext, pagePrev
    'totalCount=100
    if curPage <=0 then
      page=1
    else
      page=curPage
    end if
    displayPageNum=10  ' 페이징
    perPageNum=displayLength' 페이지당 보여줄 리스트 목록

    ' 현재 페이지 번호 / 하단 페이지번호 수
    endPage = Cint(Ceil(page/Cdbl(displayPageNum))*displayPageNum)
    startPage=(endPage - displayPageNum) +1
    tempEndPage= Cint(Ceil(totalCount/Cdbl(perPageNum)))

     if endPage > tempEndPage Then
       endPage =tempEndPage
     end if

     if startPage=1 then
        pagePrev=false
     Else
        pagePrev=true
     end if


    if endPage* perPageNum >=totalCount then
       pageNext=false
    Else
       pageNext=true
    end if

    '''''''''''''''''''''''''''''''
    '''''''''''''''''''''''''''''''
    ''''''''''''''''''''html '''''''''''

    htmlString ="<ul class='pagination'>"

    url =url&"&displayLength="&displayLength&"&"

    if pagePrev  then
      htmlString = htmlString & "<li><a href='"&url&"curPage=1'>처음</a></li>"
    end if

    if  pagePrev then
       pageStart=startPage
       htmlString  =htmlString & "<li><a href='"&url&"curPage="&pageStart-1&"'>&laquo;</a></li>"
    end if


    Dim active, num
    active=""
    num=startPage
    For count=startPage To endPage Step 1
      if  Cint(page)=Cint(num) then
         active ="class=active"
      else
       active=""
      end if
        htmlString =htmlString & "<li " & active &  " > <a href='"&url&"curPage="&count&"'>" & count & "</a><li></li></li>"
      num=num+1
    Next



      if pageNext and  endPage  > 0   Then
        pageEnd=endPage
        htmlString =htmlString & "<li><a href='"&url&"curPage="&pageEnd+1&"'>&raquo;</a></li>"
      end if

      if pageNext and endPage  > 0  Then
       htmlString =htmlString  & "<li><a href='"&url&"curPage="&tempEndPage&"'>마지막</a></li>"
      end If

     htmlString =htmlString & "</ul>"

     calcPaging =htmlString
  End Function





  public Function Ceil(ByVal intParam)
    Ceil = -(Int(-(intParam)))

  End Function





%>
