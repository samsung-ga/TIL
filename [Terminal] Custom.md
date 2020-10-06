## Terminal Custom



이전에 동민이형이 공유했던 자료와 사이트를 보면서 터미널을 커스텀했었다. 하지만 그 때 제대로 따라하지 못해 itemr2를 사용하는 대신,  mac 기본 터미널의 색상을 하나하나 바꿔가면서 커스텀하였고 카탈리나 OS에 사용되는 zsh 기본 쉘에 대해 제대로 알아보지 못했다. 이번엔 iterm2를 사용해보고 oh-my-zsh, zsh를 이용하여 Terminal도 더 이쁘고 유용하게 꾸며보겠다. (iterm2는 설정파일도 전부 영어로 되어있어 내키지 않지만.. ㅎㅎ) iterm2에 내재된 기능과, oh-my-zsh, zsh에 존재하는 여러가지 플로그인들을 알아보자!

👉 [동민이형 자료](https://github.com/dongminyoon/TIL/blob/master/Mac/Terminal%20Custom.md)

----

동민이형 자료를 보면 iterm2, zsh, oh-my-zsh 설치법과 사용법이 자세히 나와있당.. 그 자료롤 참고하여도 되고 알아가는 겸, 다시 써보았다.

## 사전준비

### brew 설치

- Homebrew는 macOS 용 패키지 관리자이다. 유용함!!!
- 터미널에 복붙한다.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

- [홈페이지](https://brew.sh/index_ko)에서 더 자세하게 설치 방법을 알 수 있다.

### iterm2 설치

- [홈페이지](https://www.iterm2.com/index.html)에 들어가서 다운받을 수 있다.



## iTerm2 테마 설치하기

0️⃣ [iTerm2-Color-Schma](https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/schemes)에 접속한다.

1️⃣ **git clone**이나 **download**를 통해 파일을 받는다.

2️⃣ iTerm2에 들어가서 `cmd + ,` (또는 상단 바의 `iTerm2 + Preference`)를 누른 후, Profiles -> Colors로 들어간다.

<img width="1040" alt="image" src="https://user-images.githubusercontent.com/56102421/93695143-6b091680-fb4e-11ea-8b86-7c37ebd1ce9f.png"> 

3️⃣ 오른쪽 하단에 **Color Presets**를 선택하고, **import Presets**를 눌러 다운받은 파일 중 **Schemes** 폴더 내의 원하는 테마를 import한다. 

cf> 거의 모든 Presets를 봤는데 가장 나은 것은 3024 Night 랑 Algonaut였는데.. 이것도 맘에 안 들어서 색상을 보면서 하나하나 맞춰가면서 나만의 Preset을 만들어주어야겠다 ㅎㅎ,,



## Terminal에서 유용한 플러그인

### 사전준비

**ZSH** : bash 쉘의 확장판

**Oh my ZSH** :  ZSH를 더 쉽게 사융하게 만들어주는 플러그인

```bash
# zsh 설치
brew install zsh

# Oh my ZSH 설치
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```



### 👉 agnoster 테마 설치

<img width="500" alt="image" src="https://user-images.githubusercontent.com/56102421/93709575-33b05f00-fb7a-11ea-9c28-57fcf94ff357.png"> 

위와 같이 Git관리를 할 때 내가 현재 어느 브랜치인지 알 수 있습니다!! 커밋을 까먹고 master에 해버리는 불상사를 막을 수 있습니다. 방법은 아래와 같다.

1️⃣ 터미널에 `vi ~/.zshrc` 입력한다.

2️⃣ 5~15번째 줄에서 `ZSH_THEME="robyussell"` 찾아서 agnoster로 변경한다.

3️⃣ :wq를 통해 저장하고 나온 후 `source ~/.zshrc` 명령어를 입력하여 zshrc파일을 적용시킨다.

 이럼 폰트가 깨지는데 D2 Coding 폰트로 적용하면 깨지지 않는다. 또한 앞에 MacBook-Pro 어쩌구 이런 쓸데없는 내용을 지울 수도 있다. 아까와 같은 파일에 들어가서 파일 하단에 밑에 명령을 추가해주면 된다.

```bash
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}
```

❗️ 참고: 아무리 봐도 agnoster테마가 가장 이쁘지만 [다른 여러가지 테마들](https://github.com/ohmyzsh/ohmyzsh/wiki/themes)도 있다! 

위 이미 zsh에서 제공하는 테마들도 있지만 개발자들이 직접 만든 테마들도 있다. 여러개를 찾아보았고, 그 중에서 정말 이쁜 걸 찾아냈다! 바로 **Poewerlevel9k** 테마다. 설치 방법은 아래와 같다.

1️⃣ 터미널에 아래와 같이 친다!

```bash
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

2️⃣ 위 테마 설정했을 때와 같이 1~3방법을 반복한다.

3️⃣ [여기](https://github.com/Powerlevel9k/powerlevel9k#prompt-customization) 들어가서 커스텀을 직접 하면 된다.



### 👉 New Line 적용

1️⃣ 위 agnoster테마를 적용했을 때를 기준으로 하여 `vi ~/.oh-my-zsh/themes/agnoster.zsh-theme` 명령어를 쳐 theme파일을 열어준다.

2️⃣ 하단에 `build_promt`를 찾아 prompt_end 위에 `prompt_newLine`을 추가 후, 아래 코드는 추가한다.

```bash
prompt_newline() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR
%{%k%F{blue}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi

  echo -n "%{%f%}"
  CURRENT_BG=''
}
```

### 👉 Syntax Hightlight 적용 

사용할 수 없는 명령어라면 초록색으로 하이라이팅되지 않는 플러그인이다. 아래 명령을 따라친다.

<img width="138" alt="image" src="https://user-images.githubusercontent.com/56102421/93709768-12507280-fb7c-11ea-9766-f7c264a0d616.png"> 

```bash
# 플러그인 설치
brew install zsh-syntax-hightlighting

# 플러그인 적용
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

### 👉 autosuggestions 적용

명령어와 미리보기 등을 구분하기 쉽게 하이타리팅 해주는 플러그인이다. 아래 명령을 따라한다.

```bash
# 플러그인 설치
brew install zsh-autosuggestions

# 플러그인 적용
vi ~/.zshrc
plugins=(
	git
	zhs-autosuggestions
)
```

### 👉 autojump 적용

파일위치가 너무 깊은 dir에 있을 경우 `j` 명령을 통해서 한번에 이동할 수 있는 플러그인이다. 아래 명령을 따라한다.

<img width="548" alt="image" src="https://user-images.githubusercontent.com/56102421/93711131-b6d7b200-fb86-11ea-900b-84c9f1f840df.png"> 

```bash
# 플러그인 설치
brew install autojump

# 플러그인 적용
# 위와 같은 방법
```

