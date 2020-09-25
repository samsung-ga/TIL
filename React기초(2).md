# React 시작하기(2)

- Form(폼)





## Form

React에서 Form을 다루는 방식 중 하나는 **제어 컴포넌트(Controlled Component)**다. 사용자의 입력을 기반으로 관리되는 `<input>` `<textarea>` `<select>` 같은 경우 setState()에 의하여 컴포넌트의 state속성을 업데이트한다. 이처럼 리액트가 상태를 직접 제어한다는 점에서 제어 컴포넌트라고 불리운다. 여기서 다시 한번 까먹지 말아야 할 것은!!! props는 읽기전용! state는 컴포넌트 내에 있는 값이고! props로 건내줄 수 있으면 setState() 메소드를 이용해서 업데이트 가능한 값이라는 것!!

또 리액트에서 Form을 다룰 때 신기했던 점은 사용자가 입력을 할 때마다 `onChange`속성을 통해 값이 업데이트된다는 점이다.

```jsx
<input text="text" value={this.state.value} onChange={this.handleChange} />
```

### textarea 태그

리액트에서 textarea는 `value` 속성을 통해 텍스트 값을 준다. 위 input text와 차이점은 일부 값을 가지고 시작한다는 점이다.

```jsx
<textarea value={this.state.value} onChange={this.handleChange} /> 
```

### select 태그

아래처럼 `select`태그 내 value 속성을 사용해 컴포넌트를 제어합니다.

```jsx
constructor(props) {
  super(props);
  this.state = {
    value: 'coconut'
  };
}

handeChange(event) {
  this.setState({
    value: event.target.value
  })
}
render() {
  return (
		<select value={this.state.value} onChange={this.handleChange}>
			<option value="grapefruit">Grapefruit</option>
 		  <option value="lime">Lime</option>
		  <option value="coconut">Coconut</option>
		  <option value="mango">Mango</option>
		</select>  
  )
}

```

### file input 태그

값이 읽기 전용이기 때문에 **비제어** 컴포넌트다.

### 다중 입력 제어

여러 input 을 다룰 때, 각 엘리먼트에 `name` 속성을 추가하고 `event.target.name`값을 통해 핸들러가 어떤 작업을 할 지 선택할 수 있다. 여기서 주의할 점이 문법인데 이 문법은 처음 보는 거여서 좀 더 알아보았다.

```jsx
this.setState({
  [name]: value
})
```

위와 같이 객체내에서 값에 []를 사용하는 문법은 **computed property name**이다. 이는 객체의 key값을 표현식을 통해 지정하는 것이다. 대괄호 안에 들어오는 표현식은 변수, 함수, 계산식 등이 들어올 수 있다.

```javascript
var i = 0;
var a = {
  ["foo" + ++i]: i,
  ["foo" + ++i]: i,
  ["foo" + ++i]: i
}
```

여기서 또 `setState`에 대해서 한번 집고가자!! `setState()`는 현재 state에 일부 state를 병합하기 때문에 바뀐 부분에 대해서만 업데이트하면 된다.

