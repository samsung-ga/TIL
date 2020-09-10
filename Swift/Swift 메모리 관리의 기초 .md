# Swift 메모리 관리의 기초



**👉 [군옥수수수님의 블로그](https://baked-corn.tistory.com/30?category=718234)를 공부겸 정리하면서 따라 쓴 글입니다.**

1. How does memory management work in Swift? 
2. What is a retain cycle?
3. weak
4. unowned
5. Common scenarios for retain cycles: delegates
6. Common scenarios for retain cycles: closures
7. Detecting retain cycles by using log messages in deinit
8. References



## 1. How does memory management work in Swift? 

스위프트의 메모리 관리는 ARC (automatic reference counting)이 대부분 당신을 위해 해줍니다. 

원리는 매우 간단합니다. 기본적으로 클래스의 객체를 가리키는 각각의 reference는 **강한** 참조입니다. 최소한 하나의 강한참조가 있는 한 이 객체의 메모리는 해제되지 않을 것입니다. 만일 객체에 대한 강한 참조가 존재하지 않는다면 이는 메모리에서 해제될 것입니다. 이를 직접 눈으로 확인하기 위해 `init()` `deinit()` 안에 print()를 찍어보면 알 수 있습니다.

```swift
class TestClass {
    init() {
        print("init")
    }
    deinit {
        print("deinit")
    }
}
var testClass: TestClass? = TestClass()
testClass = nil

// init
// deinit
```

> 위 예제의 경우, var testClass로 TestClass 객체에 대해 강한 참조가 이루어졌습니다. 
>
> 후에, nil로 바꾸어줌으로 강한 참조가 사라져 결국, TestClass 객체는 메모리에서 사라지게 됩니다. 

## 2. What is a retain cycle?

ARC의 운리는 제대로 작동을 하고 대부분의 경우 메모리에 대해서 개발자가 생각할 필요가 없습니다. 그러나 이러한 ARC가 작동하지 않는 상황이 몇몇 있으며 저희는 그런 상황을 생각해야 합니다.

```swift
class TestClass {
  	var testClass: TestClass? = nil
    init() {
        print("init")
    }
    deinit {
        print("deinit")
    }
}
var testClass1: TestClass? = TestClass()
var testClass2: TestClass? = TestClass()

testClass1?.testClass = testClass2
testClass2?.testClass = testClass1

testClass1 = nil
testClass2 = nil

// init
// init
```

> TestClass 클래스의 객체를 두 개 생성하였고, 그 두 객체 내의 인스턴스가 서로를 가리키고 있는 상황입니다.
>
> 두 객체를 전부 nil로 보내어 각각의 객체는 강한 참조를 하나씩 잃었습니다. 하지만 내부적으로 한개씩으로 참조를 더 갖고 있습니다. 강한 참조가 하나 이상 이루어져있으면 메모리가 해제되지 않기 때문에 메모리가 해제되지 않을 것이고, 더 심각한 것은 우리의 코드에서 두 객체에 대한 참조가 존재하지 않기 때문에 더이상 메모리를 해제할 방법이 존재하지 않는다는 것입니다. 
>
> 이런 경우를 메모리 누수(Memory Leak)라고 합니다. iOS 앱에 이러한 메모리 누수가 많으면 메모리 사용량이 증가할 것이고, 결국엔 앱을 죽일 수 있습니다. 이것이 Retain Cycle을 잘 다뤄야 하는 이유입니다. 아래 weak 키워드로 피할 수 있습니다.

## 3. Weak

"강한" 참조보다 "약한" 참조를 통해 메모리 누수를 피할 수 있습니다. weak로 참조를 선언한다면 이것은 "강한" 참조가 되지 않습니다.

```swift
Class TestClass {
  	weak var testClass: TestClass? = nil // 약한 참조
    init() {
        print("init")
    }
    deinit {
        print("deinit")
    }
}
var testClass1: TestClass? = TestClass()
var testClass2: TestClass? = TestClass()

testClass1?.testClass = testClass2
testClass2?.testClass = testClass1

testClass1 = nil
testClass2 = nil

// init
// init
// deinit
// deinit
```

### 해결!

오직 약한 참조만이 남아있다면 객체들의 메모리는 해제될 것입니다. 즉, weak reference는 참조는 할 수 있지만 Reference Count가 되지 않습니다. 

### weak로 선언하기 위해선 optional 타입이어야한다!

객체의 메모리가 해제된 후 그에 대응하는 변수는 자동으로 nil이 될 것입니다. 객체의 참조가 약한 관계만 낮아 메모리가 해제되었다면, 약한 참조가 가리키는 변수는 이미 메모리가 해지된 객체의 영역을 가리키고 있다면 프로그램은 runtime exception을 발생시키기 때문입니다. optional타입만이 nil값이 될 수 있기 때문에 모든 weak 참조 변수는 반드시!!! optional 타입이어야 합니다.

## 4. Unowned

weak말고도 변수에 적용할 수 있는 unowned라는 옵션이 존재합니다. weak와 비슷하지만 한가지 다른 점이 있습니다. unowned로 선언한 변수는 nil값이 될 수 없습니다. 그러므로 unowned 변수는 옵셔널로 선언해서는 절대 안됩니다. 하지만 위에 메모리가 해제된 영역에 접근하려고 한다면 앱이 runtime exception을 발생시킬수 있다고 했습니다. 이 뜻은 unonwed는 메모리 영역에 접근하지 않는 확실한 경우에 사용해야한다는 뜻입니다

대부분 weak를 사용합시다!! 

## 5. Common scenarios for retain cycles: delegates

Retain Cycle이 흔하게 일어나는 시나리오 중 하나는 Delegate의 사용입니다. TableView와 Cell의 관계를 예시로 들어보면 TableView를 ParentVC, Cell을 ChildVC라고 해봅니다. ParentVC에선 ChildVC의 정보를 얻기 위해 스스로 본인을 자식 VC의 대리자로 설정할 것입니다.

```swift
class ParentViewController: UIViewController, ChildViewControllerProtocol {
  let childViewController = ChildViewController()
  childViewController.delegate = self
}

protocol ChildViweControllerProtocol {
  // 버튼 눌렸을 때의 정보 등
}
class ChildViewController: UIViewController {
  var delegate: ChildViewControllerProtocol?
}
```

> 만약 이런 방법으로 코드를 작성하게 된다면 ParentViewController가 pop된 이후에 발생하는 Retain Cycle로 인해 메모리 누수가 발생하게 됩니다.

<img src="https://user-images.githubusercontent.com/56102421/92690236-9d12bf80-f37b-11ea-88b0-fad7d3cab2b3.png" width=""> 

> 따라서 delegate 프로퍼티를 반드시 weak로 선언해야합니다. 

`weak var delegate: ChildViewControllerProtocol?`

<img src="https://user-images.githubusercontent.com/56102421/92690239-9dab5600-f37b-11ea-8c16-189afb51c2c2.png">

UITableView의 정의를 보게 된다면 delegate와 dataSource 프로퍼티가 weak로 선언된 것을 볼 수 있습니다.

❗️여기서 예전에 왜 UITableView를 보았을 때 weak 로 선언된 이것들이 무슨 역할을 하는 지 몰랐었는데 이제 해결되었다!!

## 6. Common scenarios for retain cycles: closures

Closure 또한 Retain Cycle이 빈번히 일어나는 시나리오 중 하나입니다.

```swift
class TestClass {
    var aBlock: (() -> ())? = nil
    let aConstant = 5
    
    init() {
        print("init")
        aBlock = {
            print(self.aConstant)
        }
    }
    deinit {
        print("deinit")
    }
}
var testClass: TestClass? = TestClass()
testClass = nil

// init
```

> 정상적으로 TestClass 객체의 메모리가 해제되지 않았음을 알 수 있습니다. TestClass 객체 내부에서 Closure로, Closure에서 TestClass객체로 강한 참조를 하고 있기 때문입니다.
>
> Closure 역시 Class와 마찬가지로 Reference Type 입니다.

이러한 문제를 [weak self]를 capture해줌으로써 해결할 수 있습니다.

```swift
class TestClass {
    var aBlock: (() -> ())? = nil
    let aConstant = 5
    
    init() {
        print("init")
        aBlock = { [weak self]
            print(self?.aConstant)
        }
    }
    deinit {
        print("deinit")
    }
}
var testClass: TestClass? = TestClass()
testClass = nil

// init
// deinit
```

하지만 Closure를 사용한다고 항상 Retain Cycle이 발생하는 것은 아닙니다. 예를 들어 만일 Closure 블록을 locally하게만 사용한다면 self를 weak하게 capture할 필요가 없습니다.

그 이유는 바로 Closure 블록에 대한 강한 참조가 존재하지 않기 때문입니다. 블록 자체는 블록 내부에서 self, 즉 TestClass객체를 강하게 참조하지만 Closure자체는 메소드 지역 안에 존재하기 때문에 메소드가 return 되면 메모리에서 해제됩니다. 이와 같은 에제는 UIView.animateWithDuration에서 찾아볼 수 있습니다. 만일 Closure 블록에 대한 강한 참조가 존재하지 않는다면 Retain Cycle에 대해 걱정할 필요가 없습니다.

```swift
class TestClass{
    let aConstant = 5
    
    init(){
        print("init")
    }
    deinit(){
        print("deinit")
    }
    func doSomething(){
        UIView.animate(withDuration: 5){
            let aConstant = self.aConstant
            
            // fancy animation ... .        
        }   
    }
}

var testClass: TestClass? = TestClass()
testClass?.doSomething()
testClass = nil
```

## 7. Detecting retain cycles by using log messages in deinit

Retain Cylce에 대해 배웠지만 이를 어떻게 감지하는지에 관해 알아야 합니다. deinit 메소드 안에 Log메세지를 출력하는 코드를 작성하는 방법이 있습니다. 이는 대단한 것 같아 보이지는 않지만 실제로 매우 효과적인 방법입니다.

```swift
deinit {
		print("deinit")
}
```

객체의 메모리가 해제되었을 것이라고 기대를 해도 콘솔창에 Log 메세지가 출력이 되지 않는다면 뭔가 잘못되었다는 것을 알 수 있습니다. 특히 View Controller 들을 다룰 때 매우 유용합니다. (❗️모든 VC에 이런 메소드를 작성해주자) 예를 들어 VC를 pop한다면 Log 메세지는 출력이 되어야 합니다. 만일 출력이 된다면 프로그램이 잘 돌아가고 있음을 알 수 있습니다.

## 8. Reference

- [다음 이글을 적은 것](https://baked-corn.tistory.com/30?category=718234)
- [Swift: weak and unowned](http://www.thomashanning.com/swift-weak-and-unowned/)
- [Building Memory Efficient Apps](http://www.thomashanning.com/building-memory-efficient-apps/)
- [The Swift Programming Language - Automatic Refernce Couting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html)

