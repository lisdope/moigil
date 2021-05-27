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

    <style>
      /* 헤더 */
      header {
        text-align: center;
        margin-top: 75px;
      }

      header .thumb {
        width: 92px;
        height: 92px;
        border-radius: 50%;
        box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.1),
          0 12px 24px 0 rgba(0, 0, 0, 0.24);
      }

      header .thumb-wrapper {
        position: relative;
        display: inline-block;
        margin-bottom: 36px;
      }

      header .badge {
        width: 28px;
        height: 28px;
        font-size: 12px;
        position: absolute;
        background-color: #ff5500;
        border-radius: 50%;
        top: 0;
        right: -8px;
        display: flex;
        justify-content: center;
        align-items: center;
        /* animation */
        animation: scaleUp 0.5s;
        animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1.275);
        animation-fill-mode: both;
        animation-delay: 0.5s;
      }

      header .greeting {
        margin-bottom: 10px;
      }

      header .mail {
        padding: 8px 22px 10px 22px;
        background-color: rgba(0, 0, 0, 0.05);
        display: inline-block;
        border-radius: 20px;
        box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.08);
        margin-top: 18px;
      }

      /* 리스트 */
      .list {
        margin-top: 48px;
      }

      .list .item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid rgba(0, 0, 0, 0.08);
        font-size: 15px;
      }

      .list .item .left {
        display: flex;
        align-items: center;
      }

      .list .item .left .name {
        margin-left: 6px;
      }

      .list .item .right {
        opacity: 0.5;
      }

      .list .item img {
        padding: 20px 22px;
      }

      .list .item .right img {
        padding-right: 14px;
      }
    </style>
<body>
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
		<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src="/Upload/${user.userImage}"><br/>
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

</body>
</html>