# Loading View

> 데이터가 로드되기 전까지 시간이 걸립니다. 뷰를 전환할 때 깜박이거나 나중에 데이터가 바뀐다거나 하는 경우들이 너무 신경쓰여서 로딩뷰라는 것을 공부합니다.

UIKit에 내장되어있는 UIActivityIndicatorView를 사용합니다.

### Storbaord 이용하여 만들기

```swift
@IBOutlet var spinner: UIActivityIndicatorView!
```

위와 같이 선언해줍니다. 스피너를 돌리고 숨기고 멈추는 등 여러 기능이 있습니다.

```swift
spinner.hidesWhenStopped = true
spinner.startAnimating()
spinner.stopAnimating()
```

스피너에는 구글에 iOS spinner, HUD 라고 검색해보면 여러 종류가 있습니당

### 코드로 만들기

```swift
lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        activityIndicator.color = .black
			  activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        return activityIndicator
}()
```

view에 추가해주어서 사용하자

