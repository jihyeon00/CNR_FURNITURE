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
5. [⚠️ 트러블 슈팅](#-트러블-슈팅)
      <br><br>

## 🖥️ 프로젝트 개요
### :calendar: 개발기간
  - 2024년 3월 19일 ~ 4월 21일 개발 진행

### 🔖프로젝트 주제
  - 대상: ㅇㅇ
  - 용도: ㅇㅇ
  - 개발: ㅇㅇ
### 📁프로젝트 구현 내용
  - ㅇㅇ
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
|[배지현(팀장)](https://github.com/jihyeon00)|<p align="center"><img src="https://avatars.githubusercontent.com/u/120089047?v=4" width="100"></p>|ㅁㅁㅁ|
|[김다은(팀원)](https://github.com/dan3319)|<p align="center"><img src="https://avatars.githubusercontent.com/u/156730588?v=4" width="100"></p>|ㅁㅁㅁ|
|[이시연(팀원)](https://github.com/sieoh)|<p align="center"><img src="https://avatars.githubusercontent.com/u/151722461?v=4" width="100"></p>|ㅁㅁㅁ|
|[이현주(팀원)](https://github.com/icanbewhatever)|<p align="center"><img src="https://avatars.githubusercontent.com/u/139785614?v=4" width="100"></p>|ㅁㅁㅁ|
|[정수하(팀원)](https://github.com/heyJSH)|<p align="center"><img src="https://avatars.githubusercontent.com/u/150403977?v=4" width="100"></p>|ㅁㅁㅁ|
|[조다혜(팀원)](https://github.com/ChoDaHye)|<p align="center"><img src="https://avatars.githubusercontent.com/u/151722511?v=4" width="100"></p>|ㅁㅁㅁ|

<br><br>

## 📕 주요기능
원목 가구를 생산/제조하는 업체에서 사용하는 MES 시스템 프로그램을 제공한다.

<details>
  <summary><b>1. 로그인 & 접근제한</b> (👈 Click)</summary>
  <div markdown="1">
    <ul>
      <li>직원 번호가 데이터에 있으면 로그인이 가능하다.</li>
      <li>부서별 접근 가능한 페이지가 다르다.
        <ol>
          <li>
            ex1) 생산팀은 로그인 시 `재고현황`, `제조관리`만 보여준다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/83eb1444-d06f-4b7c-a750-cfb08b1dee16" alt="생산팀 접근가능한 메뉴">
          </li>
          <li>
            ex2) 관리팀은 모든 페이지에 접근할 수 있다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/2c487107-703d-44df-b55d-2712ea79ae70" alt="관리팀 접근가능한 메뉴">
          </li>
        </ol>
      </li>
    </ul>
  </div>
</details>

<details>
  <summary><b>2. 마이페이지</b> (👈 Click)</summary>
  <div markdown="1">
    <ul>
      <li>'직원이름'과 '직원아이디'는 수정할 수 없다.</li>
      <li>'비밀번호', '전화번호'는 수정할 수 있다.
        <ol>
          <li>
            비밀번호, 전화번호 수정 시 포맷을 맞추도록 했다. <br>
            <img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/7449c4dd-4328-4408-9483-82ddf8c29686" alt="직원정보수정">
          </li>
        </ol>
      </li>
    </ul>
  </div>
</details>

<br><br>

## 🔧 아키텍처
#### 수정필요!!!!!!!!!!!!!!
그림 첨부 필요. 예시는 아래와 같다.<br>
![C R FURNITURE 아키텍처](https://github.com/jihyeon00/CNR_FURNITURE/assets/120089047/4d2fa8c6-6ea7-46d3-be1e-160689189962)
<br><br>

## 🏗️ ERD
DB와 ERD <br>
![image](https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/bcbfa9be-686b-4970-81d5-977aa1d2e7b5)
<br><br>

## ⚠️ 트러블 슈팅
<br><br>
