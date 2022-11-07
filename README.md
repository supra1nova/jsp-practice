# JSP 기반 model 1 및 model 2 toy project
## 1. model1 기반 차량 예약 서비스 구현 (회원가입, 로그인, 차량 예약, 예약 현황 조회/예약삭제)

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

- 목적 : JSP 를 이용한 model2 MVC 패턴 실습 및 활용도 향상
- 사용 기술 스택 : JSP, JAVA, Apache Tomcat, Mariadb, Vanilla javascript, Git, Github, Eclipse
- 구현 내용 :
  * 게시판 목록 조회 및 페이지네이션
  * 게시글 등록/조회/수정/삭제 및 관련 유효성 평가(필수 필드 검증, 비밀번호 검증 등)
  * 게시글 답글 등록/조회/수정/삭제(필수 필드 검증, 비밀번호 검증 등)
  
  <br>
- 구현 관련 기타 상세 :
    <br> ✔️ MVC 패턴 기반 및 servlet 방식 적용 
      <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://user-images.githubusercontent.com/100783749/200208564-4510fc30-96d0-4418-823b-2346d7b97e11.png" width="95%" />
      <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="https://user-images.githubusercontent.com/100783749/200224355-e4c4153d-d37d-4dff-94bf-c6b44328618a.png" />
    
    <br> ✔️ mariadb 이용한 게시판 DB 구축
    <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="https://user-images.githubusercontent.com/100783749/200229078-c10786b5-e495-410e-90d2-6afd6b9af989.png" />
    
    <br> ✔️ JDBC Connection Pool를 이용한 mariadb 연결 및 클라이언트 요청 처리
    
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
    <div style="display: flex; justify-content: center">
<img width="45%" src="https://user-images.githubusercontent.com/100783749/200230119-e08db236-d577-4825-b3fc-cb693a7cad87.png" >
<img width="45%" src="https://user-images.githubusercontent.com/100783749/200230131-a9df9a85-2ea7-47b9-95db-2e0753877c58.png" >
<img width="45%" src="https://user-images.githubusercontent.com/100783749/200230137-7fab10d5-caaf-4d8c-80f8-2d5cee8c2ce8.png" >
<img width="45%" src="https://user-images.githubusercontent.com/100783749/200230138-018d9cc9-61ff-47e8-b15f-02670ae37399.png" >
</div>

