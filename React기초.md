# React 기초

- Virtual DOM
- JSX 문법 알아보기
- Props와 state
- LifeCycle API
- Create React App 사용하기
- Event 처리하기
- React에서의 리스트 처리

## Virtual DOM

[Virtual DOM 원리](https://www.youtube.com/watch?v=BYbgopx44vo) 이 동영상 보면 이해되는듯

## JSX 문법 알아보기

JSX는 React Component를 작성할 때 사용하는 문법이다. HTML이랑 굉장히!! 비슷하지만 지켜야할 규칙이 몇가지 있다. 

- 태그는 항상 닫혀있어야 한다.

  ```jsx
  <div>
  	<input type="text" />
  </div>
  ```

- 두 개 이상의 엘리먼트는 항상 하나의 엘리먼트로 감싸져 있어야 한다.

  ```jsx
  <div>
  	<div>Hi</div>
    <div>Hello!!!</div>
  </div>
  ```

  추가적인 엘리먼트를 항상 만들어준다는게 귀찮아서 `Fragment` 라는 기능이 도입된다. 이럴 경우, HTML로 분석할 경우, 불필요한 값은 생략할 수 있다. 아래와 같은 경우엔 감싸고 있는 `<div>`가 생략된다.

  ```jsx
  <Fragment> 
  	<div>Hi</div>
    <div>Hello</div>
  </Fragment>
  ```

- JSX안에서 JavaScript 값 사용하기

  ```jsx
  const name = 'jaeyong';
  return (
  	<div>
    	hello {name}!
    </div>
  );
  ```


- 조건부 렌더링

  참신한 문법 && 연산자

  ```jsx
  name === 'jaeyong' && <div>우와!!</div>
  ```

  삼항 연산자

  ```jsx
  return (
  <div>
  	The user is <b>{isLoggined ? 'currently' : 'not'}</b> logged in.
  </div>
  )
  ```

  컴포넌트가 렌더링되는 것을 막아 줄 수도 있다. 

  ```jsx
  if (!props.warn) return null; // 이 코드를 컴포넌트 클래스 가장 상단에 두면 된다.
  ```

- CSS 클래스이름 설정 

  css에서 대쉬를 사용해주었다면 jsx문법에선 lowerCamelCase를 사용한다.

  ```jsx
  const style= {
    backgroundColor: 'black',
    padding: '16px',
    color: 'white',
    fontSize: '36px'
  };
  
  return <div style={style}>안녕하세요</div>
  ```

  또한 클래스를 지정해주고 싶다면 `class`가 아닌 `className`로 써줘야 한다! 현재는 `class`로 입력해도 오류는 나지 않지만 올바른 컨벤션은 `className`이다.

- 주석

  ```jsx
  // JS에서 일반적으로 주석을 작성하는 방법에서 주석을 {}로 감싸주어야한다.
  { /**/ }
  <h1 className="" //dsafsadfsdfsa
  ></h1>
  ```

참고 👉 [JSX](https://react-anyone.vlpt.us/03.html) 

## Props와 State

### Props ⭐️⭐️⭐️

부모 컴포넌트가 자식 컴포넌트한테 값을 전달할 때 사용되는 것. 아래와 같이 사용한다.

```jsx
// MyName.js 파일
import React, { Component } from 'react';
class MyName extends Component {

  // 불러오는 곳에서 값을 빼먹었을 때 static값을 선언해준다.
  static defaultProps = {
    name: '기본이름'
  }

  render() {
    return (
    	<div>
      	안녕하세요! 제 이름은 <b>{this.props.name}</b>입니다.
      </div>
    )
  }
}

// 다른 방법!! 하지만 위에 방법이 더 최신이다.
MyName.defaultProps = {
  name: '재용'
};

export default MyName;
```

```jsx
// App.js 파일
import React, { Component } from 'react';
import MyName from './MyName'

class App extends Component {
  render() {
    return <MyName name="리액트" />
  }
}

export default App;
```

컴포넌트를 만들 때 위의 방법처럼 class를 선언해서 만들지만 또 다른 방법으론 함수형 컴포넌트를 만들 수도 있다. 함수형 컴포넌트는 딱히 아무 기능이 없이 값(props)을 받아와서 주로 보여주기만 하는 상황에 사용한다. 함수형 컴포넌트는 초기 마운트 속도가 빠르고, 불필요한 기능도 없기 때문에 메모리 자원도 덜 사용하기 때문이다. (속도 최적화에 좋음)

```jsx
// 함수형 컴포넌트일 경우 Component 를 받아올 필요는 없지만, jsx 언어를 사용하기 때문에 react는 유지시켜주어야 한다.
import React from 'react';

const MyName = ({ name }) => {
  return (
  	<div>
    	안녕하세요! 제 이름은 {name} 입니다.
    </div>
  )
}

MyName.defaultProps = {
  name: '재용'
};

export default MyName;
```

cf> [구조 분해 할당](https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment) 문법을 쓸 때 중요한 점은 변수명을 잘 정해주어야 한다. 계속 같은 변수명을 넘겨주니까.

### State 

부모가 자식한테 주는 값이 아닌, 처음부터 들고 있는 것. 내부에서 변경할 수 있고, 값이 바뀔 때마다 컴포넌트는 Re-Rendering이 된다. 변경할 땐 언제나 `setState`라는 함수를 사용한다. 절대❗️직접 State를 수정하면 안된다. 직접 지정할 수 있는 유일한 공간은 constructor 뿐이다!

```jsx
// Counter.js 파일
import React, { Component } from 'react';

class Counter extends Component {
	// 무조건 객체여야 함
  state = {
  	 number: 1
  }

handleIncrease = () => {
	this.setState({
    number: this.state.number + 1
  })  
}

handleDecrease = () => {
  	this.setState({
    number: this.state.number - 1
  })
}

  render() {
    return (
    	<div>
      	<h1>카운터</h1>
        <div>값: 0</div>
        <button onclick=(this.handleIncrease)>+</button>
        <button onclick=(this.handleDecrease)>-</button>
      </div>
    )
  }
}
```

```jsx
// App.js 파일
import React, { Component } from 'react';
import Counter from './Counter'

class App extends Component {
  render() {
    return <Counter />;
  }
}

export default App;
```

여기서 주의할 점은 `handleIncrease`와 `handleDecrease` 함수를 화살표 함수로 선언해준 것이다. 화살표 함수로 선언해주지 않는다면 내부의 **this**가 무엇을 가리키는지 모르게 된다. 만약 그냥 함수로 선언하고 싶다면 아래 코드를 추가해야한다.

```jsx
constructor(props) { // Component 생성 시 항상 실행되는 것
  super(props) // 원래 이 함수가 가지고 있던 코드들 실행(현재 덮어쓰는 것이기 때문?)
  this.handleIncrease = this.handleIncrease.bind(this);
  this.handleDecrease = this.handleDecrease.bind(this);
}
```

⭕️ 컴포넌트는 자신의 자신의 state를 자식 컴포넌트에 props로 전달 가능하다.



## LifeCycle API

생명주기!! 컴포넌트가 브라우저 상에서 **나타날 때(mounting)**, **업데이트 될 때(updating)**, **사라질 때(unmounting)** 작업을 하고 싶다! 이럴 때 사용한다. 

<img src="https://user-images.githubusercontent.com/56102421/93742887-e12e7b80-fc29-11ea-8000-2dc63ee13471.jpeg" />

- constructor(props)

  생성자. Component가 만들어지는 과정에서 미리 해야하는 작업을 처리

- componentDidMount()

  Component가 브라우저에 나타난 시점에 하고 싶은 작업 처리 . 

  외부 라이브러리 사용 / 네트워크 요청 처리 / DOM에 관련된 작업 (listener 추가, 스크롤 설정, 크기 읽어오기) 

- getDerivedStateFromProps(nextProps, prevState)

  props로 받은 값을 state에 동기화하고 싶은 경우

  ```jsx
  import React, { Component } from 'react';
  
  class MyComponent extends Component {
    state = {
      value = 0;
    }
  
  	static getDerivedStateFromProps(nextProps, prevState) {
      if (prevState.value !== nextProps.value) {
        return {
          value: nextProps.value
        }
      }
      return null;
    }
    render() {
      return (
      	<div>
  				<p>props: {this.props.value}</p>
  				<p>state: {this.state.value}</p>
        </div>
      )
    }
  }
  
  export default MyComponent;
  ```

  ```jsx
  import React, { Component } from 'react';
  import MyComponent from './MyComponent';
  
  class App extends Component {
    state = {
      counter: 1
    }
    constructor(props) {
      super(props)
      console.log('constuctor');
    }
    
    componentDidMount() {
      console.log('componentDidMount');
    }
    
  	handleClick = () => {
      this.setState({
        counter: this.state.counter + 1
      })
    }
    
    render() {
      return (
      	<div>
          <MyComponent value="5"/>
          <button onclick=(this.handleClick)>Click Me</button>
        </div>  
      )
    }
  }
  
  export default App;
  
  // constructor
  // componentDidMount
  // componentWillUnMount
  ```

- shouldComponentUpdate()

  component가 업데이트되는 성능을 최적화할 때 사용. (⭐️⭐️⭐️) 부모가 수정되면 자식도 전부 수정되게 되는 것이 일반적인데 이를 막을 때 사용. **true와 false를 return** (👉 특정 조건에 따라 업데이트되는것을 막아주는 함수라고 일단 알아두자)

  cf> react에서 특징은 Virtual DOM을 통해 업데이트된 컴포넌트만 rendering하는 것인데, 모든 뷰가 먼저 Virtual DOM에 render되는 과정이 먼저 존재한다. 그 후, Virtual DOM이 수정된 부분을 찾아내 브라우저에 수정된 부분만 render하게 하는 것이다. 이 때, Virtual DOM에 render하는 작업도 하지 않게 하기 위한 함수이다. 

- getSnapshotBeforeUpdate(prevProps, prevState) -> 이전Props와 이전상태

  브라우저에 반영되기 바로 직전에, 즉 DOM 업데이트가 일어나기 직전 호출되는 함수

  스크롤의 위치, 해당 DOM의 크기를 가져오고 싶을 때 사용

- componentDidUpdate(prevProps, prevState, snapshot) 

  브라우저에 반영되고 난 후 호출되는 함수. 

  이 시점에선 this.props와 this.state가 바뀌어있고, 이전 값들을 get할 수 있다. 또한 세번째 값으로 getSnapshotBeforeUpdate 에서 반환한 값을 가져올 수 있다.

  snapshot은 getSnap

- componentWillUnmount()

  componentDidMount에서 단 listener들을 없애주는 작업할 때 사용

- componentDidCatch(error, info)

  render할 때, 오류나는 것 잡기

  주의점: 부모 컴포넌트에서 구현해주어야 한다.

  **사용법**

  ```jsx
  state = {
    error: false
  }
  componentDidCatch(error, info) {
    this.setState({
      error: true,
    });
    // 서버에 오류 날리기
  }
  render() {
    if (this.state.error) {
      return (
      	<div></div>
      )
    }
  }
  ```

참고 👉 [LifeCycle API](https://react-anyone.vlpt.us/05.html)

## Create React App 사용하기

### 사전준비 

node와 npm은 필수로 깔려 있어야한다. node를 직접 사용하진 않지만, react를 다룰 때 필요한 도구들이 node를 사용하기 때문에 필요하다. npm은 node모듈관리자로 node를 설치하면 자동으로 설치된다. yarn도 npm과 같은 기능이지만 속도가 더 빨라 yarn을 사용하는 것도 편하다. (한국에선 그다지 차이가 없다고 함)

<img width="133" alt="image" src="https://user-images.githubusercontent.com/56102421/93748577-75511080-fc33-11ea-82f2-ef64337ba3c7.png"> 

### 끝

아래와 같은 코드 치면 끝!

```bash
# react templete 생성
npx create-react-app 폴더명

# local로 시작하기
yarn start
npm start 
```



## Event 처리하기

DOM에서 event처리방식과 비슷하지만 조금 다르다.

- React에서 event는 소문자대신 **camelCase**를 사용한다.
- JSX를 사용하여 문자열이 아닌 함수로 이벤트 핸들러를 전달한다.  {}

```jsx
<button onClick={activateLasers}></button>
```

이벤트를 달 때 중요한 점은 **바인딩**이다.

```jsx
 handleCreate(data) {
    this.setState({
      information: this.state.information.concat({
        ...data,
        id: this.id++
      })
    });
 }
<PhoneForm onCreate={this.handleCreate} />
```

위와 경우는 에러다. 왜냐면 handleCreate()함수 내의 this가 무엇을 가리키는 모르기 때문이다. PhoneForm 컴포넌트가 onCreate props를 받아와서 handleCreate를 실행시킨다면 이는 콜백함수로 작동한다. 하지만 콜백에서 `this`가 작동하기 위해선 binding이 필요하다. 위의 상황을 해결할 수 있는 방법은 아래와 같다.

1. constructor에서 바인딩해주기

   ```jsx
   constructor(props) {
     super(props);
     this.handleCreate = this.handeCreate.bind(this);
   }
   ```

2. render() 안에서 바인딩해주기

   ```jsx
   <div onClick={this.handleCreate.bind(this)}></div>
   ```

3. 화살표함수 사용하기

   ```jsx
   handleCreate = () => {
     this.setState({
       //어쩌구저쩌구
     })
   }
   ```



## React에서의 리스트 처리

React에선 리스트, 즉 배열에서 각 항목에 key를 넣어주어야 한다. **key**는 엘리먼트 리스트를 만들 때 포함해야 하는 특수한 문자열 어트리뷰트이다! **key**는 React가 어떤 항목을 변경, 추가 또는 삭제할지 식별하는 것을 돕는다. 각 엘리먼트에 안정적인 고유성을 부여하기 위해 배열 내부의 엘리먼트에 지정해야 한다.

```jsx
const numbers = [1,2,3,4,5]
const listItmes = numbers.map((number) => {
  <li key={number.toString()}>
  	{number}
  </li>
})
return (
	<ul>{listItems}</ul>
)
```

위의 예시의 경우엔 **key**를 number그대로 사용해주었지만, 대부분의 경우, 배열내의 고유 ID를 key로 사용한다.



## 공부자료

- [밸로퍼트의 공부자료](https://react-anyone.vlpt.us/03.html)
- [React Site](https://ko.reactjs.org/docs/hello-world.html)

