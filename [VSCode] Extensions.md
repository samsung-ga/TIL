# VSCode Editor 확장 기능(Extensions)



- Beautify
- Bracket Pair Colorizer
- Code Spell Checker
- indent-rainbow
- Material Icon Theme
- 폰트 지정?! D2 Coding



## Beautify

>  Beautify는 코드를 깔끔하게 정리해주는 기능을 해주는 확장 프로그램이다.

**기본 사용 방법**

0️⃣ Beautify 를 검색하고 install을 클릭한다.

1️⃣ Show Command Palette(window: Ctrl + Shift + p, Mac: Command + Shift + p)에 beautify를 검색한다.

2️⃣ 검색 결과에서 Beautify file과 Beautify Selection이 나오는 것을 확인할 수 있다. 상황에 맞춰서 한가지를 선택하면 된다.

**Format Selection 지정**

Format Selection으로 지정하면 한 번의 단축키로 정렬을 할 수 있다.

1️⃣ Show Command Palette()에서 Open Settings(JSON)을 선택한다.

2️⃣ 아래의 내용을 추가한다

```json
{
  "[javascript]": {
    "editor.defaultFormatter": "HookyQR.beautify"
  }
}
```

3️⃣ 이렇게 설정하면 Ctrl(or Command) + K,F만으로 코드 자동 정렬을 할 수 있다.



## Bracket Pair Colorizer

> Bracket Pair Colorizer는 괄호에 색을 부여해서 괄호에 가시성을 부여해준다.



## Code Spell Checker

> Code Spell Checker는 오타가 있는 단어를 찾아주고 camelCase로 작성된 코드의 맞춤법을 검사해준다.



## Indent-rainbow

> tab에 색상을 부여해서 가시성을 부여해준다. 괄호에 가시성을 부여해주는 Bracket Pair Colorizer와 비슷한 기능이다.



## Material Icon Theme

> 탐색기 폴더에 아이콘 부여해준다!! 좀 더 IDE가 이뻐짐 

**icon Theme 지정**

1️⃣ Show Command Palette() 에서 Open Settings(JSON) 

```json
"workbench.iconTheme": "material-icon-theme"
```

2️⃣ icon Theme은 Extension에 다양한 버전이 있으니 설치하고 적용시키기만 하면 된다.



## ESLint

> ESLint는 Coding Convention을 체크해주는 확장 프로그램이다.
>
> 확장프로그램에서 독립적으로 돌아가는 것이 아니라 npm으로 Module을 설치를 해야 한다.
>
> ```bash
> sudo npm install -g eslint
> ```

**사용방법**

1️⃣ 프로젝트 경로로 이동

2️⃣ ShowCommandPalette에서 "ESLint: Create ESLint configuration" 클릭. (또는 터미널에서 eslint --init)

3️⃣ 설정 지정을 하면 .eslintrcjs 파일이 만들어진다.

4️⃣ eslint [PATH] 명령어를 입력하면 해당 코드에서 Convention을 검사해준다.



## Live Server

> 로컬에서 자신이 만들 것을 빠르게 시작할 수 있도록 도와주는 기능 

**사용 방법**

1️⃣ 프로젝트를 열고 오른쪽 아래에 있는 `Go Live` 를 클릭한다.

2️⃣ HTML file에서 오른쪽 클릭 후, `Open with Live Server` 를 클릭한다.

3️⃣ 끌 경우 mac의 경우 cmd + L, cmd + 0 을 누르면 된다. (근데 이거 안 먹음)



## HTML Wrap

> 약어로 감싸준다. 따로 설치하지 않아도 VSCode에서 이미 제공하고 있는 기능이다.

1️⃣ Wrapping할 코드 선택

2️⃣ Show Command Palette에서 ` Emmet: Wrap with Abbreviation(Emmet: 약어로 랩핑)` 검색하고 약어 입력

3️⃣ 완료



