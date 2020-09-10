# CGClolor VS UIColor



[Zeddios님의 블로그](https://zeddios.tistory.com/239)를 읽고 간단한게 정리를 하자면,

cgcolor는 view, button, label의 layer에서 접근 가능하고, uicolor는 그 layer안의 color를 바꿔주는 것!!!

````swift
view.layer.color = UIColor.black.cgcolor
view.backgroundColor = UIColor.black
````



