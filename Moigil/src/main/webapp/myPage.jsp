<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>mypage</title>
</head>
<link rel="stylesheet" type="text/css" media="screen"
	href="/css/main.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="/css/animation.css" />
<script src="main.js"></script>
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
<script src="js/jquery.js"></script>
<script src="js/webcafe.js"></script>
<script src="/js/main.js"></script>
<style>
/* 헤더 */
section {
	text-align: center;
	margin-top: 75px;
}

section .thumb {
	width: 92px;
	height: 92px;
	border-radius: 50%;
	box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.1), 0 12px 24px 0
		rgba(0, 0, 0, 0.24);
}

section .thumb-wrapper {
	position: relative;
	display: inline-block;
	margin-bottom: 36px;
}

section .badge {
    width: 125px;
    height: 37px;
    font-size: 17px;
    position: absolute;
    background-color: #2023217a;
    border-radius: 50%;
    margin-top: 9px;
    top: 175px;
    right: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    animation: scaleUp 0.5s;
    animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1.275);
    animation-fill-mode: both;
    animation-delay: 1.0s;
    font-family: KyoboHand;
	display: flex;

}

section .greeting {
	margin-bottom: 10px;
}

section .mail {
    padding: 8px 22px 10px 22px;
    background-color: #2023217a;
    border-radius: 20px;
    box-shadow: inset 0 0 0 1px rgb(0 0 0 / 8%);
    animation-delay: 2.5s;
    animation: scaleUp 0.5s;
    animation-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1.275);
    animation-fill-mode: both;
    animation-delay: 1.5s;
    width: min-content;
    position: absolute;
    display: flex;
    align-items: center;
    font-family: KyoboHand;
    margin: 9px 360px
}

/* 리스트 */
.list {
	margin-top: 48px;
}

.list .item:hover {
	background: #f8f9fa;
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

#contents>h1 {
	font-size: 18px;
	font-family: nanumEX;
	color: #3cbb1c;
	text-shadow: 1px 1px 0px rgb(0 0 0/ 20%);
	border-bottom: 2px solid #3cbb1c;
	padding-top: 15px;
	padding-bottom: 15px;
	margin-bottom: 20px;
	text-align: left;
}

#slogan {
    left: -208px;
    padding: 15px 0;
    position: relative;
}
.guide {
    background: #7b8385;
    border-radius: 5px;
    padding-left: 18px;
    margin-bottom: 12px;
    text-transform: uppercase;
    margin-top: 4px;
}
</style>
<body>
	<div id="wrapper">
		<jsp:include page="WEB-INF/header.jsp" />
		<div id="contentsArea">

			<div id="contentsArea">
				<!-- #contents 시작 -->
				<!-- 회원가입 시작 -->
				<section id="contents" class="memberJoin">
					<!-- 현재위치 시작 -->
					<p class="location">
						Home &gt; <strong>마이페이지</strong>
					</p>
					<!-- //현재위치 종료 -->
					<h1>마이페이지</h1>
				</section>
				<section>
					<div class="thumb-wrapper stagger-item">
						<img id="pic" style="margin-left: 15px;" height="180px"
							width="150px" src="/userImg/${user.userImage}"><br />
						<div class="badge">${user.id}</div>
					</div>

					<div class="mail">
						<a href="mailto:${user.email}" style="color: rgb(255 255 255);">${user.email}</a>
					</div>
				</section>

				<ul class="list">
					<li class="item mouse-effect stagger-item">
						<div class="left">
							<img src="css/icon/idea.png" />
							<div class="name">Bookmark</div>
						</div>
						<div class="right">
							<img src="css/icon/arrow.png" />
						</div>
					</li>

					<li class="item mouse-effect stagger-item">
						<div class="left">
							<img src="css/icon/settings.png" /> <a class="index"
								href="updateUser.jsp"><button type="button"
									class="btn btn-primary btn-sm">정보수정</button></a>
						</div>
						<div class="right">
							<img src="css/icon/arrow.png" />
						</div>
					</li>

					<li class="item mouse-effect stagger-item">
						<div class="left">
							<img src="css/icon/basket.png" />
							<div class="name">구매사항</div>
						</div>
						<div class="right">
							<img src="css/icon/arrow.png" />
						</div>
					</li>

					<li class="item mouse-effect stagger-item">
						<div class="left">
							<img src="css/icon/trash.png" /> <a
								href="deleteUser.do?userCode=${user.userCode}"><button
									type="button" class="btn btn-danger btn-sm">회원탈퇴</button></a>
						</div>
						<div class="right">
							<img src="css/icon/arrow.png" />
						</div>
					</li>

				</ul>
				<br>
				<br>
			</div>

		</div>
		<!-- #footer 시작 -->
		<jsp:include page="WEB-INF/footer.jsp" />
		<!-- //#footer 종료 -->
</body>
</html>