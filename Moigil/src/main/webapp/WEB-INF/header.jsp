<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 건너뛰기 링크 시작 -->
	<header id="navs">
			<!-- 웹카페 로고 시작 -->
			<h1 class="logo">
				<a href="index.jsp"  id="moigil">모이길</a>
			</h1>
			<!-- //웹카페 로고 종료 -->
			<!-- 웹카페 안내 링크 시작 -->
			<ul class="infoLink">
				<li><a href="myPage.jsp" style="font-weight: bold;">마이페이지</a></li>
				<li><a href="updateUser.jsp" style="font-weight: bold;">회원정보 수정</a></li>
				<li><a href="logout.do" style="font-weight: bold;">로그아웃</a></li>
			</ul>
			<!-- //웹카페 안내 링크 종료 -->
			<!-- 메인 메뉴 시작 -->
			<nav >
				<h1 class="hidden">메인 메뉴</h1>
				<ul class="mainMenu">
					<li><a href="#">공지사항</a>
					</li>
					<li><a href="#">함께가요(모임)</a>
						<ul class="aboutCss">
							<li><a href="getBoardList.do">전체게시판</a></li>
							<li><a href="getBoardListArea.do?areaCode=서울">지역별</a></li>
							<li><a href="#">반려동물과 함께</a></li>
							<li><a href="getMeetingList.do">당일모임</a></li>
							<li><a href="room.jsp">채팅방</a></li>
						</ul></li>
					<li><a href="getBoardGallery.jsp">갤러리</a>
						<ul class="webStandard">
							<li><a href="#">지역별</a></li>
						</ul></li>
					<li><a href="#">공동구매</a>
						<ul class="commonbuy">
							
						</ul>
					</li>
					
				</ul>
			</nav>
			<!-- //메인 메뉴 종료 -->
		</header>
		<!-- //#header 종료 -->
		<!-- #visual 시작 -->
		<div id="visual">
			
		</div>
		
</body>
</html>