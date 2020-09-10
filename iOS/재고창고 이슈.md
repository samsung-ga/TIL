# 재고창고 이슈

> 재고창고 앱을 개발하며 발생한 이슈들이나 오류들을 모아 정리합니다.



## 서버 통신에서 발생한 Issues

- **url에 띄어쓰기가 들어간 배열이 있어 띄어쓰기를 지워야 하는 상황**

  url은 전부 string으로 string에서 " "을 ""으로 변환해주면 된다. 

  ```swift
  var string: String = "[1, 2, 3]"
  string.replacingOccurrences(of: " ", with: "")
  ```

- **서버에 post를 보내고 바로 그 데이터에 대해 get을 받아와야 하는 상황에서 DB에 반영되지 않은 상태에서 get을 받아오는 이슈**

  보내는 데이터의 용량이 클수록 post가 느리게 처리된다. 이는 로딩하면을 따로 만들거나, 혹은 post를 보낸 상태에서 1,2초동안 기다리게 한 후 다음 화면으로 넘어가 get을 받아오도록 해결하였다. NotificationCenter를 이용하여 화면 전환이 되기 전에 미리 알림을 주었다.

- 





## Xcode에서 발생한 Issues

- **UITextField를 Numpad 창으로 바꿀 경우** 

  ***2020-08-14 00:38:14.440394+0900 inventorybox_iOS[3998:850141] Can't find keyplane that supports type 4 for keyboard iPhone-PortraitChoco-NumberPad; using 25752_PortraitChoco_iPhone-Simple-Pad_Default***와 같은 경고가 나온다. 이는 Xcode 버그이다. [참고](https://stackoverflow.com/questions/32647090/cant-find-keyplane-that-supports-type-4-for-keyboard-iphone-portrait-numberpad/34126463)

