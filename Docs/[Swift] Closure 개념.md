# [Swift] Closure 개념



스위프트 언어는 함수형 프로그래밍 지향언어로, 정말 중요한 개념 중에 하나가 클로저이다!! 실제로 iOS개발을 하면서 클로저는 개념을 잘 모르더라도 정말 많이 쓰이고 있었다. Alamofire 라이브러리를 사용할 때 completion handler로 escaping Closure를 이용, 비동기 처리를 할 때 이용, 화면 전환을 할 때 completion 전달 인수로도 이용 등 여러 상황에서 사용된다. 사용하면서 개념을 정확히 알지도 못하고 사용하는 것 같아서 야곰님의 스위프트 책을 보고 Swift 애플 공식 문서를 보면서 정리해보았다.





## Closure 정의

Closure를 한 마디로 정리하자면 결국은 함수이다!!! 근데 함수는 클로저지만 클로저는 함수는 아니다. 클로저가 함수보다 더 큰 개념이다. 클로저는 익명함수로 자주 쓰인다. 

```swift
let closure: () -> Void = {
  print("My Closure")
}
```

위 형태가 기본 클로저다. 

```swift
{ (parameters) -> return type in 
	statements 
}
```

이렇게 자주 쓰이는데, 여러 설명들이 있었지만 그 말들을 내 기준으로 정리하면, 클로저는 **전달인자로 함수를 쓸 수 있도록 만든 문법이다.**   

## Closure 축약

```swift
names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 < s2 })
```

위의 클로저 형태를 줄여보자 

- Type생략

  타입은 추론이 가능하다. 이미 알려져 있다면 클로저에서 굳이 타입을 입력하지 않아도 된다. 아래의 경우는 `sorted(by:)` 라는 메소드는 이미 String값을 전달 인자로 받고 Bool 값을 return 하는 함수를 전달인자로 가진다고 알려져 있다

```swift
names.sorted(by: { (s1, s2) in return s1 < s2})
```

- Return생략

  한 줄로 값을 리턴할 경우엔 return을 생략 가능하다.

```swift
names.sorted(by: { (s1, s2) in s1 < s2 })
```

- 인자 -> $0, $1

  클로저 내부로 들어오는 인자들은 이름을 정의하지 않아도 `$0` 부터 시작해서 `$1` `$2` ... 로 사용할 수 있다.

```swift
names.sorted(by: { $0 < $1 })
```

- Operator Method 축약

  값의 크기를 비교하는 경우엔 operator를 이용해서 비교 가능하다ㅏ.

```swift
names.sorted(by: <)
```

## 함수 전달인자로 클로저 전달하기

위 sorted(by:)의 경우에도 전달인자를 사용해서 클로저를 전달하였다. 이 메소드를 직접 만들어 보면 아래와 같다.

```swift
func runClosure(name closure: () -> Void) {
  closure()
}

runClosure(name: { print("hello!!!") })
```

전달인자가 한 개인 경우에는 후행 클로저 방식을 사용할 수 있다. 이건 정말 헤갈린다.... 이 모습에 익숙해져야 될 거 같다.

```swift
runClosure() {
  print("Hello!!!")
}
// 인자가 클로저밖에 경우엔 ()도 생략 가능하다. 이 모습이 정말 헷갈렸음
runClosure {
  print("Hello!!!")
}
```

자주 쓰이는 배열을 다루는 메소드들 중에는 `map` 과 `filter`가 있다.

```swift
var numbers: [1,2,3,4,5,6,7]

// 1값을 더한 배열
numbers = numbers.map { (value) -> Int in 
   var newVal = value + 1
   return newVal
}

// 짝수만 골라낸 배열
numbers = numbers.filter { (value) -> Bool in
   if value % 2 == 0 {
     return true
   } else {
     return false
   }
}
```

## Escaping Closure

탈출 클로저!!! 진짜 이 개념이 뭐라고 이떄까지 무서워서 공부를 안하고 있었는 지 모른다... Escaping Clousre는 비동기처리를 위해 존재한다! 이게 무슨 말이냐..! `@escaping`으로 전달된 인자는 그 함수가 끝난 후에 작동된다! 애플에서 제시해주는 예시가 눈에 보기 편해 가지고 와보았다.

```swift
var completionhandlers: [() -> Void] = []

func withEscaping(completion: @escaping () -> Void) {
  completionHandlers.append(completion)
}

func withoutEscaping(completion: () -> Void) {
  completion()
}

class MyClass {
  var x = 10
  func callFunc() {
    withEscaping { self.x = 100 }
    withoutEscaping { x = 200 }
  }
}

let mycall = MyClass()
mycall.callFunc()
print(mycall.x) // 200
completionHandlers.first?()
print(mycall.x) // 100
```

이 예시를 해석해보자.

MyClass 인스턴스 mycall을 생성 후에 callFunc 함수를 호출하였다. 그럼 차례대로 두개의 함수가 실행는데 탈출 클로저를 인자로 가지고 있는 함수는 클로저를 외부 배열에 저장을 하였고, 비탈출 클로저를 인자로 가진 함수는 그대로 실행되었다. 따라서 x는 처음엔 200이지만 후에 외부 배열에 저장한 클로저를 실행하면 x는 100이 된다. 여기서 탈출 클로저에 왜 self를 써주냐!! 탈출 클로저이므로 나중에 실행이 될 수 있다. 이럴 경우, x는 어느 인스턴스프로퍼티인지 모르기 때문에 항상 명시해주어야 한다!

## WithoutActuallyEscaping함수

이건 실제로 사용해본 경험이 없기 떄문에 여기선 넘어가도록 하겠다.

## 자동 클로저

자동 클로저는 타입을 자동으로 클로저를 바꿔주는 문법을 말한다. 키워드는 `@autoclosure`인데 자주 쓰이지 않으니.. 이것도 넘어가자. 한가지 기억할 것은 자동클로저는 비탈출클로저 속성을 가지고 있으므로 자동클로저로 선언해준 인자들이 탈출 클로저로 사용하려면 @escaping 키워드를 넣어주어야 한다.