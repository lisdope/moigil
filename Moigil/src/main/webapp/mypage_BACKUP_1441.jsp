<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/jquery.form.js"></script>
<script type="text/javascript">
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
<<<<<<< HEAD

<div id="contentsArea"> 
      		<!-- #contents ���� -->
      		<!-- ȸ������ ���� -->
      	<section id="contents" class="memberJoin">
        		<!-- ������ġ ���� -->
        		<p class="location">Home &gt; <strong>myPage</strong></p> 
        		<!-- //������ġ ���� -->
        		<h1>myPage</h1>
        		
=======
<div id="contentsArea"> 
    <nav class="gnb">
      <a href="index.jsp" class="cover mouse-effect">
        <img src="images/icon/cover.svg" />Ȩ
      </a>
      <a href="getBoardList.jsp" class="issue mouse-effect">
        <img src="images/icon/issue.svg" />�Խ���
      </a>
    </nav>
>>>>>>> kingdong5
	<header>
      <div class="thumb-wrapper stagger-item">
		<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src="/userImg/${user.userImage}"><br/>
        <div class="badge">${user.id}</div>
      </div>

      <div class="text-area">
        <h2 class="greeting stagger-item">myPage</h2>
        <div class="desc stagger-item">
          	${user.id}�� ȯ���մϴ� !!
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
          <a class="index" href="updateUser.jsp">��������</a>
        </div>
        <div class="right"><img src="images/icon/right_arrow.svg" /></div>
      </li>

      <li class="item mouse-effect stagger-item">
        <div class="left">
          <img src="images/icon/business.svg" />
          <div class="name">���Ż���</div>
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