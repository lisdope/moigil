<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>mypage</title>
</head>
  <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <link
      rel="stylesheet"
      type="text/css"
      media="screen"
      href="animation.css"
    />
    <script src="main.js"></script>
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
<script src="js/jquery.js"></script>
<script src="js/webcafe.js"></script>
    
<body>
<div id="wrapper">
<jsp:include page="WEB-INF/header.jsp" />
<div id="contentsArea"> 
    <nav class="gnb">
      <a href="index.jsp" class="cover mouse-effect">
        <img src="images/icon/cover.svg" />홈
      </a>
      <a href="getBoardList.jsp" class="issue mouse-effect">
        <img src="images/icon/issue.svg" />게시판
      </a>
    </nav>
	<header>
      <div class="thumb-wrapper stagger-item">
		<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src="/userImg/${user.userImage}"><br/>
        <div class="badge">${user.id}</div>
      </div>

      <div class="text-area">
        <h2 class="greeting stagger-item">MYpage</h2>
        <div class="desc stagger-item">
          	환영합니다 !!!!!
        </div>
      </div>

      <div class="mail mouse-effect stagger-item">
        <a href="${user.email}">${user.email}</a>
      </div>
    </header>

    <ul class="list">
      <li class="item mouse-effect stagger-item">
        <div class="left">
          <img src="images/icon/bookmark.svg" />
          <div class="name">Bookmark</div>
        </div>
        <div class="right"><img src="images/icon/right_arrow.svg" /></div>
      </li>

      <li class="item mouse-effect stagger-item">
        <div class="left">
          <img src="images/icon/account.svg" />
          <a class="index" href="updateUser.jsp">정보수정</a>
        </div>
        <div class="right"><img src="images/icon/right_arrow.svg" /></div>
      </li>

      <li class="item mouse-effect stagger-item">
        <div class="left">
          <img src="images/icon/business.svg" />
          <div class="name">구매사항</div>
        </div>
        <div class="right"><img src="images/icon/right_arrow.svg" /></div>
      </li>

      <li class="item mouse-effect stagger-item">
        <div class="left">
          <img src="images/icon/puzzle.svg" />
          <div class="name">Blah </div>
        </div>
        <div class="right"><img src="images/icon/right_arrow.svg" /></div>
      </li>
    </ul>
    </div>
	</div>
</body>
</html>