### CSS Font 지정

``` css
font-style: 기울기 등의 스타일 지정
font-weight: 글자 두께
font-variant: 글꼴 변형
font-size: 글자 크기
line-height: 줄 간격
font-familty: 글꼴
```

- **font-style 값**

  normal : 기본

  italic : 기울기

- **font-weight 값**



- font-size 단위

  px, em, rem

  px는 절대적인 단위로, 반응형 웹사이트를 만들 땐 추천되지 않은다.

  em은 부모 태그의 영향을 받는 상대적인 단위로, 부모의 사이즈를 기준으로 하기 때문에 유동적이고 파악하기 어려울  수 있다. 

  rem은 가장 최상위 요소인 html 요소에 비례하여 크기를 가지는 상대적인 단위. 이걸 가장 추천.

  

  1rem은 html 기준 글자사이즈이다.

  1rem =  16px;

  즉, html { font-size: 10px; }

  1rem = 10px;

  1.2rem = 12px;

  이렇게 바꿔놓고 많이 사용한다.









## 참고 사이트

- https://developer.mozilla.org/ko/docs/Web/CSS/font
- https://velog.io/@bungouk6829/CSS-%EC%9E%90%EC%A3%BC-%EC%82%AC%EC%9A%A9%EB%90%98%EB%8A%94-%EC%86%8D%EC%84%B1
- https://yeoninim.tistory.com/38
