<h1 align="center">
  <br>
  <img src="https://github.com/jihyeon00/CNR_FURNITURE/assets/120089047/be0d3185-ce03-4e08-a777-5a3264c0c370" alt="Cozy&Rest Furniture" width="400">
  <br>
  가구 MES 웹 프로그램
  <br>
</h1>

## 📌 목차
1. [🖥️ 프로젝트 개요](#-프로젝트-개요)
2. [📕 주요기능](#-주요기능)
3. [🔧 아키텍처](#-아키텍처)
4. [🏗️ ERD](#-ERD)
5. [📖 파일명 설명 및 개발일정](#-파일명-설명-및-개발일정)
6. [📽️ 작동 영상](#-작동-영상)
7. [🗃️ 발표자료](#-발표자료)
8. [📃 화면설계](#-화면설계)

      <br><br>

## 🖥️ 프로젝트 개요
### :calendar: 개발기간
  - 2024년 3월 19일 ~ 4월 21일 개발 진행
  ![image](https://github.com/heyJSH/CNR_FURNITURE/assets/150403977/78905272-b349-4a12-a23d-5435d5c8c4fd)

### 🔖프로젝트 주제
  - 대상: 가구를 생산하고 제조하는 회사
  - 용도: 회사의 MES 프로그램
  - 선정 이유:
    <br>
      ① 가구 제조업이 다른 산업에 비해 복잡한 공정과 다양한 작업 단계를 포함함
    <br>
      ② 생산과 품질의 요구사항을 충족하고 자동화와 생산 효율이 필요하다고 생각함
    
### ⚙️ 개발환경 및 도구
  - `JAVA 17`
  - `JDK 17.0.2`
  - **IDE**: IntelliJ
  - **Framework**: Springboot(3.1.10)
  - **DataBase**: Oracle DB(ojdbc8)
  - **ORM**: Mybatis
  - **DevOps**: Maven, Git, GitHub
  - **Tools**: Discord, GoogleDrive, StarUML
### 🧑‍🤝‍🧑 멤버 구성
|팀원명|프로필|담당업무|
|---|---|---|
|[배지현<br>(팀장)](https://github.com/jihyeon00)|<p align="center"><img src="https://avatars.githubusercontent.com/u/120089047?v=4" width="100"></p>|회의 진행 및 일정·팀원 관리, 전체 설계 담당<br>RDBMS관리(OracleDB), 테이블 설계, 샘플데이터작성, ERD작성, 유즈케이스 작성<br>작업관리, 작업자관리|
|[김다은<br>(팀원)](https://github.com/dan3319)|<p align="center"><img src="https://avatars.githubusercontent.com/u/156730588?v=4" width="100"></p>|테이블 설계, 샘플데이터작성<br>설비관리, 설비점검|
|[이시연<br>(팀원)](https://github.com/sieoh)|<p align="center"><img src="https://avatars.githubusercontent.com/u/151722461?v=4" width="100"></p>|로고제작, 테이블 설계, 샘플데이터작성<br>로그인, 권한관리|
|[이현주<br>(팀원)](https://github.com/icanbewhatever)|<p align="center"><img src="https://avatars.githubusercontent.com/u/139785614?v=4" width="100"></p>|테이블 설계, 샘플데이터작성<br>제품/자재 정보관리, BOM 관리, 작업자 스케줄 조회|
|[정수하<br>(팀원)](https://github.com/heyJSH)|<p align="center"><img src="https://avatars.githubusercontent.com/u/150403977?v=4" width="100"></p>|테이블 설계, ERD작성<br>제품 재고 조회, 품질관리|
|[조다혜<br>(팀원)](https://github.com/ChoDaHye)|<p align="center"><img src="https://avatars.githubusercontent.com/u/151722511?v=4" width="100"></p>|테이블 설계, 샘플데이터작성<br>제조계획지시, 제조수행지시, 공정정보관리|

<br><br>

## 📕 주요기능
원목 가구를 생산/제조하는 업체에서 사용하는 MES 시스템 프로그램을 제공한다.

<details>
  <summary><b>작업 관리 [배지현]</b> (👈 Click)</summary>
  <br>
  <h3>공정관리 - 작업관리 - 검색 및 조회</h3>
  <ul>
    <li>대부분의 검색항목을 datalist를 이용하여 해당하는 항목의 정보를 확인하고 가져올 수 있도록 했다.</li>
    <img src="https://github.com/heyJSH/CNR_FURNITURE/assets/150403977/37933cfc-ed88-4cc4-a2f0-769c4952e9db" alt="작업관리 검색">
  </ul>
  <br>
  <h3>공정관리 - 작업관리 - 조회 및 작업등록</h3>
  <ul>
    <li>work의 작업목록 위에 있는 [작업등록] 버튼을 누르면 '작업등록 모달창'이 뜬다.</li>
    <img src="https://github.com/heyJSH/CNR_FURNITURE/assets/150403977/846c1325-e839-474e-971f-2229d2c02a2f" alt="작업등록1">
    <li>'제조LOT번호'를 입력하면,<br>'제품번호', '제품명', '생산단위'의 내용이 자동으로 채워진다.</li>
    <li>'공정번호'를 입력하면,<br>'설비번호', '설비명', '작업위치', '남은생산수량'의 내용이 자동으로 채워진다.</li>
    <img src="https://github.com/heyJSH/CNR_FURNITURE/assets/150403977/a8dd3322-7fa9-42e8-99d7-3b2baf81c18a" alt="작업등록2">
    <li>나머지 세부 정보를 입력한 후, [추가] 버튼을 누르면 입력한 데이터가 배열에 저장되고 '작업등록목록'을 조회할 수 있다.</li>
    <img src="https://github.com/heyJSH/CNR_FURNITURE/assets/150403977/59a5476d-1ecc-4470-ae50-680bd890efdc" alt="작업등록3">
    <li>원하는 만큼 추가한 후, [등록] 버튼을 누르면 DB에 저장된다.</li>
    <li>이 때, 소요시간 계산 수식은 다음과 같다.</li>
    <ul>
      <li>소요시간 = 작업종료시간 - 작업시작시간</li>
      <li>조건1. 작업시간 차이가 810분(13시간 30분) 이상인 경우 -90분</li>
      <li>조건2. 작업시간 차이가 4시간 이상 8시간 미만인 경우 -30분</li>
      <li>조건3. 작업시간 차이가 4시간 미만인 경우 -0분</li>
      <li>그 외. -60분</li>
    </ul>
  </ul>
  <br>
  <h3>공정관리 - 작업관리 - 작업 상세 및 수정/삭제</h3>
  <ul>
    <li>work의 '작업목록' 중, [작업상세] 버튼을 누르면, 작업상세 조회와 수정/삭제를 할 수 있는 모달창이 나타난다.</li>
    <li>앞서 작업등록에 이용된 것처럼, '작업종료시간 - 작업시작시간'으로 소요시간을 계산한다.</li>
    <li>작업시작시간이 현재시간보다 과거라면, 이미 작업이 시작된 것으로 readonly 속성을 가진다.</li>
    <img src="https://github.com/heyJSH/CNR_FURNITURE/assets/150403977/e7d83890-26a1-492e-a4de-31b682f5e586" alt="작업상세 수정1">
    <ul>
      <li><b>수정할 경우, 한 번에 수정되어야 할 사항은 다음과 같다.</b></li>
      1. 생산수량이 1 이상일 경우, process 테이블의 누적생산수량에 합해진다.<br>
      2. 진행상황이 '작업중'일 경우, 설비 작동 테이블의 MW_STATUS = '가동'<br>
      3. 진행상황이 '작업정지' 혹은 '작업종료'일 경우, 설비 작동 테이블의 MW_STATUS = '비가동'<br>
      4. 진행상황이 '작업중단'일 경우, 설비 작동 테이블의 MW_STATUS = '수리중', MW_CONDITION = '수리요청'
    </ul>
    <li>한 번에 수정하기 위하여, MyBatis를 이용해 작성한 쿼리를 트랜잭션 처리하도록 했다.</li>
    <img src="https://github.com/heyJSH/CNR_FURNITURE/assets/150403977/9928b7a8-e445-4023-b076-c020e801b047" alt="작업상세 수정2">
  </ul>
  <br>
  <h3>공정관리 - 작업관리 - 자재투입 - 등록</h3>
  <ul>
    <li>work의 '작업목록' 위에 있는 [자재투입] 버튼을 누르면, 자재투입등록 모달창이 나타난다.</li>
    <img src="https://github.com/heyJSH/CNR_FURNITURE/assets/150403977/3e3ffdc3-e638-4df8-ac96-2a20eb42f6b5" alt="자재투입 등록1">
    <li>'제조LOT번호'를 입력하면, 해당하는 '제조LOT번호'에 따른 '공정번호'를 조회하고, 선택할 수 있다.</li>
    <li>'공정번호'를 선택하면, '제품번호', '제품명', '계획생산수량'의 내용이 자동으로 채워진다.</li>
    <li>불러온 '제품번호'에 따른 BOM의 '자재번호' 목록을 조회하고 선택할 수 있다.</li>
    <img src="https://github.com/heyJSH/CNR_FURNITURE/assets/150403977/5ce67b24-989e-4225-962b-1379a477b6f6" alt="자재투입 등록2">
    <li>'자재번호'를 선택하면, 해당하는 '자재번호'에 따른 '자재명', '제품1EA별 투입수량', '최소투입수량', '단위'의 내용이 자동으로 채워진다.</li>
    <img src="https://github.com/heyJSH/CNR_FURNITURE/assets/150403977/7dcfb793-bfea-4858-8b4e-ba5082463107" alt="자재투입 등록3">
    <li>'투입수량'을 입력하고 [추가] 버튼을 누르면, 추가할 자재투입내역을 미리 보여주는 테이블이 생성된다.</li>
    <li>만약, '자재투입목록'의 [삭제] 버튼을 누르면, 배열에 저장된 자재투입내역이 삭제된다.</li>
    <img src="https://github.com/heyJSH/CNR_FURNITURE/assets/150403977/b7fc49cc-76d0-4f54-9b6d-0f0ee72578bb" alt="자재투입 등록4">
    <li>추가된 자재투입목록을 확인 후, [등록] 버튼을 누르면, DB에 저장된다.</li>
    <img src="https://github.com/heyJSH/CNR_FURNITURE/assets/150403977/e5e5dac8-c013-496a-a83b-439d43de2fa8" alt="자재투입 등록5">
  </ul>
  <br>
  <h3>공정관리 - 작업관리 - 자재투입 - 수정</h3>
  <ul>
    <li>work의 '자재투입내역' 중, [수정] 버튼을 누르면 '자재투입수정' 모달창이 나타난다.</li>
    <li>'투입수량'을 수정하고 [수정] 버튼을 누르면, DB에 저장된다.</li>
    <img src="https://github.com/heyJSH/CNR_FURNITURE/assets/150403977/3fb784fb-1651-49d8-afff-275d04a860d9" alt="자재투입 수정1">
  </ul>
</details>
<details>
  <summary><b>작업자 관리 [배지현]</b> (👈 Click)</summary>
  <br>
  <h3>공정관리 - 작업자관리 - 등록/상세 및 수정/삭제</h3>
  <ul>
    <li>workerInsert의 '작업자배치' 중, [관리] 버튼을 누르면, '작업자관리' 모달창이 나타난다.</li>
    <li>작업자 관리 모달창</li>
    <ul>
      <li>조회된 데이터를 통해 작업자 등록을 할 수 있다.</li>
      <li>부서명 선택 시, 부서명에 따라 사원번호 datalist를 조회하고 선택할 수 있다.</li>
      <img src="https://github.com/heyJSH/CNR_FURNITURE/assets/150403977/adfb4477-d961-45b6-be56-a2fe7c61c29b" alt="작업자관리1">
    </ul>
  </ul>
  <br>
  <h3>공정관리 - 작업자관리 - 등록/상세 및 수정/삭제 - 상세 및 수정</h3>
  <ul>
    <li>작업번호에 따른 작업자 정보 조회</li>
    <ul>
      <li>등록된 작업자 목록에 조회한 데이터가 나타난다.</li>
      <img src="https://github.com/heyJSH/CNR_FURNITURE/assets/150403977/be74b065-bba7-4632-aee9-8cfbf1bb1111" alt="작업자관리2">
    </ul>
    <li>'사원번호'를 입력 후 [추가] 버튼을 누르면, '추가된 작업자 목록'에 입력한 사원번호가 등록된다.</li>
    <img src="https://github.com/heyJSH/CNR_FURNITURE/assets/150403977/25701df8-d700-4a41-97a7-770f8e3d88a0" alt="작업자관리3">
    <li>'추가된 작업자 목록'은 [등록] 버튼을 누르면, DB에 저장된다.</li>
    <li>단, 이미 등록된 작업자를 추가하려고 할 경우, 아래와 같이 alert창을 통해 추가를 방지한다.</li>
    <img src="https://github.com/heyJSH/CNR_FURNITURE/assets/150403977/87e15cf8-8e7d-42fc-aa50-f7ab8d5cc3ce alt="작업자관리4">
  </ul>
  <br>
  <h3>공정관리 - 작업자관리 - 등록/상세 및 수정/삭제 - 삭제</h3>
  <ul>
    <li>'등록된 작업자 목록' 중 [삭제] 버튼을 누르면, 작업자 삭제 confirm 창이 뜨고, 작업자가 삭제된다.</li>
    <img src="https://github.com/heyJSH/CNR_FURNITURE/assets/150403977/b06e0d5d-e379-4543-a7d1-171e41ab91dc" alt="작업자관리5">
  </ul>
</details>

<br><br>

## 🔧 아키텍처
####  * 서버 배포를 진행하지 않았음
![C_R-FURNITURE-아키텍처](https://github.com/jihyeon00/CNR_FURNITURE/assets/120089047/2e26b54e-86aa-4711-ad6d-11b6d36f420e)
<br><br>

## 🏗️ ERD
DB와 ERD <br>
![ERD](https://github.com/jihyeon00/CNR_FURNITURE/assets/120089047/6e185a73-564b-4d12-ae31-2379761be4ab)
<br><br>

## 📖 파일명 설명 및 개발일정
[[📑 파일명 설명 및 개발일정]](https://docs.google.com/spreadsheets/d/1f2Vgb-qmd-GQKiG3kfBYp12KGKcHwL41/edit?usp=sharing&ouid=106247567413866015973&rtpof=true&sd=true)

<br><br>

## 📽️ 작동 영상
[📹 작동 영상](https://drive.google.com/file/d/1XMyq7nY6RMWWIbY-3hHvlq5u0yq_x1Qo/view?usp=sharing)

<br><br>

## 🗃️ 발표자료
[[📂 발표자료]](https://www.canva.com/design/DAGB09QYuLw/aAn0IDhyphJN4kNFbcFN7g/edit?utm_content=DAGB09QYuLw&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)

<br><br>

## 📃 화면설계
[[📑 Figma 확인하기]](https://www.figma.com/file/TJCIsPWBYpiGFq3VZo7aAL/Cozy%26Rest-FURNTIURE?type=design&node-id=12%3A29&mode=design&t=lBsTPDw3kZcSzh4i-1)
<br><br>
