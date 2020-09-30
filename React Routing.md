# React 라우팅 



- react-router-dom 이용
- 코드 스플리팅
- 서버사이드 렌더링

## react-router-dom 

리액트는 SPA, single page application으로 유명한 프레임워크이다. 페이지 하나로 이루어진 웹사이트라는 말이다. 이를 가능하게 해주는 것이 react-router 이다! routing을 통하여 다른 페이지로 넘어가도 페이지가 새로고침이 되지 않고 HTML만 교체해주게끔 해준다. 기본적인 개념은 사용해보면서 더 이해가 되었다. 

react-router-dom 내부엔 여러가지 컴포넌트들이 존재한다. 하나씩 알아보자.

- Route, Switch

  ```jsx
  export default function App() {
    return (
      <div>
        <Menu />
        <Route exact path="/" component={Home} />
        <Switch>
          <Route path="/about/:name" component={About} />
          <Route path="/about" component={About} />
        </Switch>
        <Route path="/posts" component={Posts} />
      </div>
    );
  }
  ```

  Route는 URL에 의해서 어느 페이지로 갈 것인지 알려주는? 이어주는? 컴포넌트이다. 라우팅을 공부하면서 가장 궁금증이 들었던 것은 "라우팅해주는 페이지들은 대체 어디에 생기는 거지? css를 줘서 커스텀해줘야하는데..." 이 부분이었다. 이 궁금증에 대한 답은 바로 이 Route 컴포넌트이다. 이 컴포넌트는 단지 무슨 URL인지 알아내고 어느 컴포넌트로 이어줄지에 대해 작성하는 것뿐만 아니라, DIV라고 보아 Route가 있는 위치에 해당 컴포넌트가 생긴다! 그러므로 이 Route의 위치도 중요하다! 여기서 `exact` 속성은 url이 `path`와 정확히 일치할 때 해당 컴포넌트로 라우팅된다는 의미이다. 주어진 경로와 정확히 맞아 떨어져야만 설정한 컴포넌트를 보여준다.

  Switch는 `exact`속성과 비슷한 역할을 한다. 이 컴포넌트로 감싸면 매칭되는 첫번째 라우트만 보여주고 나머지는 보여주지 않는다. 

- Params, Query

  ```jsx
  import React from 'react';
  
  export default function About({match}) {
      return (
          <div>
              <h2>About {match.params.name}</h2>
          </div>
      );
  };
  ```

  이 개념은 정말 중요한 것 같다. ⭐️⭐️⭐️ 

  params는 url에서 :3000/about/:name 이런식으로 `:`을 통해 넘겨지는 값이고, query는 `?`을 통해 전해지는 값이다. 이들은 Route컴포넌트에서 props를 통해 넘겨지는데 해당 props는 아래와 같이 세가지가 있다.

  - history: 이 객체를 통해 `push`, `replace`를 통해 다른 경로로 이동하거나 앞 뒤 페이지로 전환 가능
  - location: 현재 경로에 대한 정보를 가지고 있고, 쿼리 정보 소유 
  - match: 어떤 라우팅에 매칭이 되었는지에 대한 정보를 가지고 있고, params 정보 소유

- Link 

  ```jsx
  import React from 'react';
  import { Link } from 'react-router-dom';
  
  export default function Menu() {
      return (
          <div>
              <ul>
                  <li><Link to="/">Home</Link></li>
                  <li><Link to="/about">About</Link></li>
                  <li><Link to="/about/foo">About Foo</Link></li>
              </ul>
              <hr/>
          </div>
      );
  };
  ```

  Link는 HTML a태그와 비슷한 역할이다. 여기서 주목할 점은 Link 컴포넌트를 이용하면 새로고침이 되지 않는다!!

- NavLink

  ```jsx
  return ( 
    <div>
        <ul>
             <li><NavLink exact to="/" activeStyle={activeStyle}>Home</NavLink></li>
             <li><NavLink exact to="/about" activeStyle={activeStyle}>About</NavLink></li>
             <li><NavLink to="/about/foo" activeStyle={activeStyle}>About Foo</NavLink></li>
        </ul>
        <hr/>
   </div>
  );
  ```

  `activeStyle`을 이용하고 싶다면 NavLink컴포넌트를 사용하면 된다.

- Route속의 Route

  props를 이용하여 이어준다. `match.url` 