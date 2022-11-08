# JSP 기반 model 1 및 model 2 toy project
## 1. model1 기반 차량 예약 서비스 구현 (회원가입, 로그인, 차량 예약, 예약 현황 조회/예약삭제)
<div align="center">
  <a href="https://youtu.be/BaCln5yJg8E" target="_blank">
    <img width="50%" src="https://user-images.githubusercontent.com/100783749/200532976-5f8a60c8-7638-4b62-a6bc-9216fc186aa1.png">
  </a>
  <p>
  < 위 이미지 클릭시 시연 영상으로 연결됩니다. >
  </p>
</div>
<br>

- 목적 : JSP 실습 및 활용도 향상
- 사용 기술 스택 : JSP, JAVA, Apache Tomcat, Mariadb, Vanilla javascript
- 사용 툴 : Eclipse, Git, Github
- 구현 내용 :
  * 로그인/아웃, 회원 가입/조회/수정/탈퇴 구현
  * 렌트카 조회, 예약 조회/생성,삭제 구현
  * 게시판 목록 조회 및 페이지네이션 구현
  * 게시글/게시글의 등록/조회/수정/삭제 구현
  * github flow branch 전략 적용
  
  <br>
- 구현 관련 기타 상세 :
    <br> ✔️ jsp 기반 model 1 구현
      <table>
        <tr>
          <td> 
            <img src="https://user-images.githubusercontent.com/100783749/200535946-73d7f64f-3046-4746-9780-a464c998b140.png" width="100%" />
          </td>
          <td>
            <img src="https://user-images.githubusercontent.com/100783749/200535953-c1c9280a-dfdf-43d7-baa0-9a928a9570f9.png" width="100%" />
          </td>
          <td>
            <img src="https://user-images.githubusercontent.com/100783749/200535955-472c9f54-ed5f-4918-8747-4be3fd8f1f7a.png" width="100%" />
          </td>
      </tr >
      </table>
    
    <br> ✔️ mariadb 이용한 게시판 DB 구축
    <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="https://user-images.githubusercontent.com/100783749/200597611-2a4a6112-db01-4f1a-9ca9-b93e5c9ddf85.png" />
    
    <br> ✔️ JNDI (Java Naming Directory Interface)를 이용한 JDBC Connection Pool 설정 및 mariadb 연결
    
    ```java
    // server.xml
      ...
      <Host ...> ... 
        ...
        <Context docBase="RentCar" path="/RentCar" reloadable="true" source="org.eclipse.jst.jee.server:RentCar">
	      	<Resource auth="Container" driverClassName="org.mariadb.jdbc.Driver" maxWaitMillis="5000" name="jdbc_maria" password="1111" removeAbandonedOnBorrow="true" removeAbandonedTimeout="300" type="javax.sql.DataSource" url="jdbc:mariadb://localhost:3306/jspPractice1" username="jspmanager"/>
	      </Context>
        ...
      </Host>
      ...
    ```
    
    <br> ✔️ JSTL, EL, vanilla javascript, Bootstrap 등을 이용한 프론트 페이지 구현
      <table>
        <tr>
          <td>
              <img width="100%" src="https://user-images.githubusercontent.com/100783749/200585103-952c8211-685b-4853-841d-e774873fbe61.png" >
          </td>
          <td>
              <img width="100%" src="https://user-images.githubusercontent.com/100783749/200585811-3df9df6a-414d-45e3-aa76-6295e9d3c48c.png" >
          </td>
        </tr>
        <tr>
          <td>
              <img width="100%" src="https://user-images.githubusercontent.com/100783749/200585106-da55b42e-01b2-4179-b3b8-62b243e411fc.png" >
          </td>
          <td>
              <img width="100%" src="https://user-images.githubusercontent.com/100783749/200585109-0e980e47-2b6c-4079-9aa8-732ed96a1e56.png" >
          </td>
        </tr>
      </table>

<br>
<hr>
<br>

## 2. model2, servlet 방식 게시판 구현 (게시글 CRUD, 답글 CRUD)
<div align="center">
  <a href="https://youtu.be/iReu7KRb1jI" target="_blank">
    <img width="50%" src="https://user-images.githubusercontent.com/100783749/200230119-e08db236-d577-4825-b3fc-cb693a7cad87.png">
  </a>
  <p>
  < 위 이미지 클릭시 시연 영상으로 연결됩니다. >
  </p>
</div>
<br>

- 목적 : JSP 를 이용한 model2 MVC 패턴 및 servlet 실습 및 활용도 향상
- 사용 기술 스택 : JSP, JAVA, Apache Tomcat, Mariadb, Vanilla javascript
- 사용 툴 : Eclipse, Git, Github
- 구현 내용 :
  * 게시판 목록 조회 및 페이지네이션
  * 게시글 등록/조회/수정/삭제 및 관련 유효성 평가(필수 필드 검증, 비밀번호 검증 등)
  * 게시글 답글 등록/조회/수정/삭제(필수 필드 검증, 비밀번호 검증 등)
  * github flow branch 전략 적용
  
  <br>
- 구현 관련 기타 상세 :
    <br> ✔️ MVC 패턴 기반 servlet 이용 구현
      <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://user-images.githubusercontent.com/100783749/200208564-4510fc30-96d0-4418-823b-2346d7b97e11.png" width="95%" />
      <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="https://user-images.githubusercontent.com/100783749/200224355-e4c4153d-d37d-4dff-94bf-c6b44328618a.png" />
    
    <br> ✔️ mariadb 이용한 게시판 DB 구축
    <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="https://user-images.githubusercontent.com/100783749/200229078-c10786b5-e495-410e-90d2-6afd6b9af989.png" />
    
    <br> ✔️ JNDI (Java Naming Directory Interface)를 이용한 JDBC Connection Pool 설정 및 mariadb 연결
    
    ```java
    // server.xml
      ...
      <Host ...> ... 
        ...
        <Context docBase="Model2Board" path="/" reloadable="true" source="org.eclipse.jst.jee.server:Model2Board">
    	  	<Resource auth="Container" dirverClassName="org.mariadb.jdbc.Driver" maxWaitMillis="5000" name="jdbc_maria" password="xxxx" removeAbandonedOnBorrow="true" removeAbandonedTimeout="300" type="javax.sql.DataSource" url="jdbc:mariadb://localhost:3306/jspPractice1" username="xxxx" />
    	  </Context>
        ...
      </Host>
      ...
    ```
    
    <br> ✔️ JSTL, EL, vanilla javascript, Bootstrap 등을 이용한 프론트 페이지 구현
      <table>
        <tr>
          <td>
              <img width="100%" src="https://user-images.githubusercontent.com/100783749/200230119-e08db236-d577-4825-b3fc-cb693a7cad87.png" >
          </td>
          <td>
              <img width="100%" src="https://user-images.githubusercontent.com/100783749/200230131-a9df9a85-2ea7-47b9-95db-2e0753877c58.png" >
          </td>
        </tr>
        <tr>
          <td>
              <img width="100%" src="https://user-images.githubusercontent.com/100783749/200230137-7fab10d5-caaf-4d8c-80f8-2d5cee8c2ce8.png" >
          </td>
          <td>
              <img width="100%" src="https://user-images.githubusercontent.com/100783749/200230138-018d9cc9-61ff-47e8-b15f-02670ae37399.png" >
          </td>
        </tr>
      </table>

    <br> ✔️ Github-flow 전략 적용하여 기능별로 master에 merge 하는 방식으로 개발 진행
    <img width="50%" src="https://user-images.githubusercontent.com/37354145/110271722-ed599a00-800b-11eb-99c9-d9fe8bed0f20.png">
