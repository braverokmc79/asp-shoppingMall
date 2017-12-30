7.11 원화 표시법(화폐 단위의 표현)

여기에서는 숫자를 일정한 형식으로 출력하는 방법을 설명한다. 때로는 숫자 형식의
화폐용 데이터를 페이지에 나타내야 할 필요가 있다. 이런 화폐 단위로 출력할 수
있는 함수로는 FormatNumber 함수와 FormatCurrency 함수가 있다.

[1] 방법 1 - FormatNumber 함수 이용
FormatNumber 함수는 숫자 변수를 입력 인자로 받아서 특정한 형식을 가진 숫자를
리턴하는 함수이다.

FormatNumber(식, NumDigitsAfterDecimal, [IncludeLeadingDigit,
UseParentsForNegativeNumbers, [GroupDigits]]]])

참고 : 중괄호[] 부분의 인자는 생략이 가능하며 생략한 경우 디폴트값을 사용한다.

각 인자에 대한 설명은 다음과 같다.


Expression(식) : 인수 혹은 숫자
NumDigitsAfterDecima : 소수점 이하 자리수
IncludeLeadingDigit : 소수점 이하의 유효 숫자 앞에 0을 표시할지 여부(0: False,
-1:True, -2 :국가별 설정값)

UseParentsForNegativeNumbers : 음수 값을 괄호 안에 넣을지 여부 ( 0 : False, -1
: True , -2 : 국가별 설정값)
GroupDigits : [제어판] 에 설정된 그룹 구분 기호를 사용하여 숫자를 구분할지
여부(0 : False , -1 : True, -2 :국가별 설정값)


 * 예제
 FormatNumber 함수를 사용하여 숫자를 다양한 형식으로 출력한다.


formatn.asp 파일 소스 코드  참조
<!-- ---



  -->
[2]방법 2  - FormatCurrency 함수 이용
FormatCurrency 함수는 컴퓨터의 [제어판] 에 정의된 통화를 기준으로 통화 값으로 형식화된 값을
반환하는 함수이다. 이 함수를 이용해서 숫자를 금액 형태로 나타낼 수 있다.

형식은 다음과 같다.

FormatCurrency(식, NumDigitsAfterDecima, IncludeLeadingDigit, UseParentsForNegativeNumbers, GroupDigits)


각 인자에 대한 내용은 FormatNumber 와 동일한다.

* 예제
FormatCurrency 함수를 사용하여 앞자리에 금액 표시와 천단위 구분을 해준다.
