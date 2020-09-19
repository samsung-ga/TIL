# Forking Workflow & Code Review 

프로젝트를 fork 해와서 pr을 보내는 협업 방식에 대해 처음도 아니었지만 헤갈리는게 많았다! 그래서 이번 기회에 정리해보았다. github에는 아직 모르는 숨은 기능이 정말 많은 거 같다... Gist에 대해서도 알아보고 싶은데.. 언제쯤 다 알 수 있을까 

- Forking Workflow
- Code Review

----

Git은 작업물의 버전을 관리할 때 유용하게 쓰이는 버전관리도구이다. Git을 사용하는 이유는 여러 사람들과의 협업이 용이하게 하기 때문이다. 이 때, Git이 프로그램이라면 Github은 파일의 버전 관리를 다른 사람들이 볼 수 있게 정보 교환이 이루어지는 일종의 홈페이지라고 볼 수 있다. Github을 사용하여 협업을 하고, 다른 사람들이 개발한 코드를 볼 수 있고, 리뷰도 남길 수 있으며, 이슈나 프로젝트 관리 등 다양한 작업을 할 수 있다. 

Git과 Github을 이용하여 정말 다양하게 협업을 할 수 있다. 어떻게 Git을 사용할 것인지에 대해선 표준화된 것이 없지만 그 많은 방법 중에서 몇가지 권장되는 협업 방식이 있다. 그 중 하나가 **Forking Workflow**라는 방식이다. 

(이 외 **Feature Branch Workflow**, **Gitflow Workflow** 등이 있다)

----

## Forking Workflow

먼저, **Forking Workflow**에 대해 간단하게 알아보았다. 

- 자신의 프로젝트가 아닌, 누군가 공개해 둔 프로젝트를 가져와 작업하고 싶을 때 사용하는 방식이다.
- 프로젝트를 자신의 원격 저장소로 가져온 후, 자신의 원격 저장소로 모든 변경사항을 푸시하고, 해당 프로젝트로 PR을 보낸다.
- 해당 프로젝트의 관리자만이 변경사항을 관리할 수 있다.
- 보통 오픈 소스 프로젝트에 주로 쓰이는 워크플로우이다.
- 방식은 아래와 같다.

### Fork해오기

작업하고 싶은 해당 프로젝트의 오른쪽 상단에 Fork 버튼을 눌러 내 원격 저장소로 가져온다.

<img src="https://user-images.githubusercontent.com/56102421/93655559-1c308380-fa5f-11ea-9584-b9016e6efb25.png" width="50%" /> 

### 작업하기

우리가 원래 알던 방식대로, 내 원격 저장소를 clone해온 후 브랜치를 만들고 작업을 하면 된다.

```bash
git clone 깃주소

git checkout -b jaeyong
# git branch jaeyong
# git chekcout jaeyong

# 코드 변경

git commit -a -m "무엇 변경합니다" 
# git add .
# git commit -m ""

git push origin jaeyong
# 원격 저장소에 jaeyong 브랜치를 생성하며 푸쉬한다.
```

### Pull Request(PR) 보내기

**PR 생성**

변경사항이 반영된 파일을 Github에 푸쉬했을 경우, 내 원격 저장소에는 Pull Request를 보내라는 알림이 뜬다. 안 떴을 경우, 상단 바에서 두번 째 메뉴인  `Pull Requests`를 누르고 초록색인 `New pull request`를 누른다.

<img src="https://user-images.githubusercontent.com/56102421/93659923-ff0eab80-fa84-11ea-83e1-7dafdf601b2b.png" width="100%" />  

**PR보내기**

변경사항이 있어 보내는 브랜치와 해당 프로젝트의 받는 브랜치를 선택한 후, 초록색 `pull request` 버튼을 눌러준다.

<img src="https://user-images.githubusercontent.com/56102421/93659950-31b8a400-fa85-11ea-8559-582e47b31425.png" />  

Fork한 원격저장소에서 해당 프로젝트 원격저장소로 PR을 날릴 경우엔 오른쪽 탭이 없다. 

----

cf> ***참고사항***❗️하지만 자신의 원격 저장소에서 dev브랜치를 master브랜치로 PR을 보내어 병합하는 상황같은 경우엔 오른쪽 탭에 여러가지 옵션들이 생긴다. Reviewers, Assignes, Labels, Projects, Milestone, Linked issues 등이 있고 Github 문서를 보면서 알아보았다.

**Reviewers**

말그대로 코드를 리뷰해줄 사람을 선택한다. 같은 저장소에서 작업하고 있는 사람들의 아이디가 제안되고, 또한 내가 원하는 팀, 사람들을 지정해서 Reviewers를 설정할 수 있다. 지정한 사람의 리뷰가 끝난 후, 그 리뷰사항들을 모두 고친 후, 새로고침버튼을 누르면 re-review를 요청할 수 있다.

<img width="302" alt="image" src="https://user-images.githubusercontent.com/56102421/93659659-b0601200-fa82-11ea-9201-9713ff1a2198.png"> 

**Assignees**

> Assignees clarify who is working on specific issues and pull requests.

Github 문서에 나와있듯이 Assignees를 통해 Pull Request 와 issues의 담담자를 지정할 수 있다. 

<img width="307" alt="image" src="https://user-images.githubusercontent.com/56102421/93659688-0cc33180-fa83-11ea-9fa2-900e964319ee.png" /> 

**Labels**

> Labels on GitHub help you organize and prioritize your work. You can apply labels to issues and pull requests to signify priority, category, or any other information you find useful.

Labels를 통해 해당 Pull Request와 issues의 정보들을 더 명확히 해줄 수 있다. 우선순위, 카테고리 등을 지정할 수 있고, 사용자가 Labels를 만들어 부여할 수도 있다. 기본적으로 제공하는 Labels는 bug, documentation, duplicate, enhancement, good first issue, help wanted, invalid, question, wontfix가 있다. 

<img width="310" alt="image" src="https://user-images.githubusercontent.com/56102421/93659767-dcc85e00-fa83-11ea-97a9-28ffd82a699d.png"> 

👉 [더 자세히](https://docs.github.com/en/github/managing-your-work-on-github/about-labels)

**Projects**

이 Projects는 Pull Request와 issues를 특정 프로젝트에 부여하여 자동으로 연동될 수 있게 해준다. 특정 프로젝트란 이슈 칸반 보드를 예로 들 수 있는데 이건 나중에 알아보자!! 이슈 칸반 보드는 제대로 활용하면 팀프로젝트에서 무지 유용할 수 있다.

<img width="310" alt="image" src="https://user-images.githubusercontent.com/56102421/93659763-d2a65f80-fa83-11ea-84e2-150ea89d61de.png"> 

**Milestone**

마일스톤도 Reviewers와 같이 말그대로의 뜻이다. 프로젝트의 Pull Request와 issue들을 그룹화하여 묶어놓을 수 있다! 

**Linked issues**

특정 issue를 해결하여 PR을 보냈을 경우, 해당 issue에 연결할 수 있는 옵션이다. 무사히 머지가 됐을 경우, 해당 issue는 자동으로 닫히게 된다. 

<img width="303" alt="image" src="https://user-images.githubusercontent.com/56102421/93659863-a93a0380-fa84-11ea-95a1-424d5e47c169.png"> 



----

## PR 코멘트 달기 (Code Review)

이제 Pull Request는 보내졌다! 그렇다면 코드 리뷰를 달고 그 코드 리뷰를 답하는 것에 대해 알아보자. 

<img src="https://user-images.githubusercontent.com/56102421/93660067-40ec2180-fa86-11ea-82b1-a356c6fa7634.png" />

**Conversation** 탭을 통해 나의 PR 내용과 Reviewer가 달아준 코멘트를 간단하게 볼 수 있다.  

**Commits** 탭에 들어가면 Commit별로 수정된 사항을 볼 수 있고, **Files changed**에 들어가면 변경된 모든 파일들을 볼 수 있다. (이 탭으로 코드 리뷰를 하는 것이 한 눈에 코드를 볼 수 있어 편한 것 같다)

**Checks** 탭에 들어가면, Github Actions에 대해 알아보라고 쓰여 있는데 이건 코드리뷰와 크게 상관있지 않은 내용이므로 나중에 알아보자.. 코드리뷰에서 더 나아가 파일의 상태를 추적하는 Extension기능 같다....ㄷ ㄷ

### Review 작성하기

1️⃣ 내가 보고자 하는 PR을 들어가 상단에 **File Changed**를 클릭한다. 마우스를 코드 위에 올려보면 `+`표시가 뜨는데 이를 클릭하면 다음과 같은 리뷰창이 나온다. 

<img width="823" alt="image" src="https://user-images.githubusercontent.com/56102421/93660240-9b39b200-fa87-11ea-804a-0c1a6a7d26f1.png"> 

2️⃣ 여기서 위 옵션들을 자세히 보면, 더 나은 코드를 제시할 수 있는 기능도 있고, 마크다운 언어와 같이 리뷰를 더 강조할 수 잇게 커스텀 기능도 있다. 

<img width="685" alt="image" src="https://user-images.githubusercontent.com/56102421/93660317-7db91800-fa88-11ea-8cc9-aacf652e0c6f.png">

3️⃣ 리뷰글을 쓰고 `Start a review` 버튼을 누른다. 이미 리뷰가 시작되었다면 `Add review comment` 버튼으로 되어 있을 것이다! 리뷰를 제출하기 전까지 코드마다 작성한 리뷰들은 대기상태가 되고 나에게만 보인다.  

<img width="616" alt="image" src="https://user-images.githubusercontent.com/56102421/93660346-d8527400-fa88-11ea-84ca-d3504740875e.png">

### Review한 파일 Viewed로 표시하기

1️⃣ `Files changed` 탭을 클릭한다.

2️⃣ Reviewing을 끝낸 파일 오른쪽 상단에 Viewed라는 체크박스를 누른다.

### Review 제출하기

1️⃣ `Files changed` 탭을 클릭한다.

2️⃣ 오른쪽 상단에 `Reviews changes` 버튼을 누른다!

<img width="1760" alt="image" src="https://user-images.githubusercontent.com/56102421/93660467-392e7c00-fa8a-11ea-8720-227ee80dff75.png"> 

3️⃣ 작성한 코드리뷰에 대한 내용과 피드백 등을 달고 리뷰의 타입도 선택한다!

- Comment: 코드에 대해 리뷰만 하고 바꿀 것이 없을 경우
- Approve: 피드백에 대해 고쳤을 경우 또는 완벽해서 PR을 승인한다는 경우
- Request Changes: PR을 병합하기 전에 코드를 고쳐야 하는 경우

<img width="735" alt="image" src="https://user-images.githubusercontent.com/56102421/93660485-6549fd00-fa8a-11ea-87d3-4c5ab2595cbd.png">

👉 본문: [Reviewing proposed changes in a pull request](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/reviewing-proposed-changes-in-a-pull-request#submitting-your-review)





## 공부 자료

- https://github.com/features/code-review/

- https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/commenting-on-a-pull-request

- https://dataitgirls2.github.io/tutorial/Tutorial_180629_Git_with_constitution.html

  
