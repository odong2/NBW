## NBW 엔비더 
<img width="300" height="100" src="https://user-images.githubusercontent.com/95892601/199779347-40e4e48f-90a0-481c-b6e2-3a00c86d974a.png">
 
## 프로젝트 소개  Introduction
NBW는 도서이커머스 웹사이트로 개발 기간은 2022-10-03 ~ 2022-11-16 까지 진행되었습니다</br>
**N**o **B**ook Is **W**orthless(세상에 가치없는 책은 없다)의 약자를 따서 NBW라고 작명하였으며 전자상거래의 목적 뿐 아니라 독서 모임 및 여러 독서 관련 강연 이벤트를 자체적으로
주관한다는 아이디어로 개발을 진행하였습니다.</br>



##  <img width="30" height="30" src="https://user-images.githubusercontent.com/95892601/204138950-40ec2ebd-fb00-4e3b-b3db-75ba7fe8f156.png">시연영상 및 회고록
<ul>
<li>🎥<a href="https://www.youtube.com/watch?v=Z4p-AV51g2k">시연영상 바로가기</a></li>
<li>📄<a href="https://odon2.tistory.com/34">회고록 바로가기</a></li>
<li>🔥<a href="http://13.125.246.191/home">배포주소</a></li>
</ul>

## 팀원소개
<ul>
  <li><a href="https://github.com/dongcarry96">김동현</a>&nbsp;&nbsp;Donghyeon kim</br></li>
  <li><a href="https://github.com/odong2">김민준</a>&nbsp;&nbsp;Minjun Kim</br></li>
  <li><a href="https://github.com/jonggukback">백종국</a>&nbsp;&nbsp;Jonggook Back</br></li>
  <li><a href="https://github.com/yuri818">이유리</a>&nbsp;&nbsp;Yuri Lee</br></li>
  <li><a href="https://github.com/congs00n">정채은</a>&nbsp;&nbsp;Chaeeun Jeong </br></li>
</ul>
<p align="center"><img width="800" height="500" alt="image" src="https://user-images.githubusercontent.com/95892601/204135830-49452feb-523f-4de5-82c3-4d9c969137cd.png"></p>


## ERD

저희 프로젝트의 총 테이블은 **23**개, 컬럼은 **151**컬럼으로 구성되어 있습니다.</br>

<p align="center"><img width="1000" height="800" alt="image" src="https://user-images.githubusercontent.com/95892601/204134393-585b0725-38d1-488c-adcf-1fd08e58f583.png"></p>




## 사용기술 및 개발환경 

### 개발 언어 Development Language
<ul>
 <li>Java11</li>
 <li>Javascript ES6</li>
 <li>HTML5</li>
 <li>CSS3</li>
 <li>Oracle 11g</li>
</ul>

### 개발 환경 Development Environment
<ul>
 <li>Eclipse IDE / Intellij IDE </li>
 <li>Visual Studio Code</li>
 <li>Spring 5.0.7</li>
 <li>Apache Tomcat 9</li>
 <li>Oracle 11g</li>
</ul>
<p align="center"><img width="1100" height="600" alt="image" src="https://user-images.githubusercontent.com/95892601/204137130-e14d81cb-2b1e-465f-80d2-b470e0ed5296.png"></p>


## 클래스 다이어그램 UML
<p align="center"><img width="1100" height="800" alt="image" src="https://user-images.githubusercontent.com/95892601/204134525-15d78c47-3bba-4010-8183-9f122355d956.png"></p>
<p align="center"><img width="1100" height="800" alt="image" src="https://user-images.githubusercontent.com/95892601/204134579-cd8ec75c-af95-4c8c-9914-3f32b60f3922.png"></p>


## 본인 작성 코드
아래는 제가 맡은 업무 및 작성한 코드의 디렉토리 및 파일의 일부입니다.
링크를 클릭하시면 소스코드를 확인하실 수 있습니다.
<ul>
 <li><a href="https://github.com/odong2/NBW/blob/main/src/main/java/com/finalpj/nbw/mail/service/MailService.java">메일 관련</a></li>
 <li><a href="https://github.com/odong2/NBW/blob/main/src/main/java/com/finalpj/common/FileUploader.java">파일 업로드 관련</a></li>
 <li><a href="https://github.com/odong2/NBW/blob/main/src/main/java/com/finalpj/common/PageHandler.java">PageHandler</a></li>
 <li><a href="https://github.com/odong2/NBW/tree/main/src/main/java/com/finalpj/nbw/coupon">쿠폰 디렉토리</a></li>
 <li><a href="https://github.com/odong2/NBW/blob/main/src/main/resources/mapper/couponMapper.xml">쿠폰 Mapper</a></li>
 <li><a href="https://github.com/odong2/NBW/blob/main/src/main/webapp/WEB-INF/views/admin/coupon/couponList.jsp">쿠폰 관리자 페이지</a></li>
 <li><a href="https://github.com/odong2/NBW/blob/main/src/main/webapp/WEB-INF/views/mypage/coupon.jsp">마이페이지 쿠폰 페이지</a></li>
 <li><a href="https://github.com/odong2/NBW/tree/main/src/main/java/com/finalpj/nbw/payment/controller">결제 디렉토리</a></li>
 <li><a href="https://github.com/odong2/NBW/blob/main/src/main/resources/mapper/paymentMapper.xml">결제 Mapper1</a></li>
 <li><a href="https://github.com/odong2/NBW/blob/main/src/main/resources/mapper/refundMapper.xml">결제 Mapper2</a></li>
 <li><a href="https://github.com/odong2/NBW/blob/main/src/main/webapp/WEB-INF/views/mypage/payment.jsp">마이페이지 주문조회 페이지</a></li>
 <li><a href="https://github.com/odong2/NBW/tree/main/src/main/java/com/finalpj/nbw/notice">공지글 디렉토리</a></li>
 <li><a href="https://github.com/odong2/NBW/blob/main/src/main/java/com/finalpj/nbw/admin/controller/AdminNoticeController.java">공지글 관리자 Controller</a></li>
 <li><a href="https://github.com/odong2/NBW/blob/main/src/main/resources/mapper/noticeMapper.xml">공지글 Mapper</a></li>
 <li><a href="https://github.com/odong2/NBW/blob/main/src/main/resources/mapper/ntCommentMapper.xml">공지글 댓글 및 대댓글 Mapper</a></li>
 <li><a href="https://github.com/odong2/NBW/tree/main/src/main/webapp/WEB-INF/views/admin/notice">공지글 관리자 페이지</a></li>
</ul>
