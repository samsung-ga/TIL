### PIP 설치하기

PIP는 Python으로 작성된 패키지 라이브러리를 관리해주는 시스템이다. openCV, numpy 등 여러가지 라이브러리를 설치할 수 있게끔 해준다.

````bash
// get-pip.py 파일 다운로드
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

// 위 파일 설치하기
python3 get-pip.py

// mac의 경우 아래 명령어 입력
sudo easy_install pip


// 이제부턴 제대로 설치되었는지 혹은 업데이트 하는 법에 대한 명령어입니다.

// 제대로 설치되었는지 확인하기, 버전 체크
pip --version

// 업데이트하기
pip install -U pip

// 다운그레이드하기
python -m pip install pip==18.1

// 현재 설치되어있는 패키지 확인하기
pip list

// 패키지 설치 및 제거
pip install 패키지명
pip uninstall 패키지명
````

👉  [참고](https://dora-guide.com/pip-install/)



