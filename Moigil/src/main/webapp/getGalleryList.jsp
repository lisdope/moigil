<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<!DOCTYPE html>
<head>
<title>모이길 | 전체 게시판</title>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
<script src="js/jquery.js"></script>
<script src="js/webcafe.js"></script>
</head>
<body>
	<!-- 건너뛰기 링크 시작 -->
	<a id="skipNav" href="#contentsArea">본문 바로가기</a>
	<!-- //건너뛰기 링크 종료 -->
	<!-- #wrapper 시작 -->
	<a id="skipNav" href="#contentsArea">본문 바로가기</a>
	<!-- //건너뛰기 링크 종료 -->
	<!-- #wrapper 시작 -->
	<div id="wrapper">
		<!-- #header 시작 -->
		<header id="header">
			<!-- 웹카페 로고 시작 -->
			<h1 class="logo">
				<a href="index2.jsp" id="moigil">모이길</a>
			</h1>
			<!-- //웹카페 로고 종료 -->
			<!-- 웹카페 안내 링크 시작 -->
			<ul class="infoLink">
				<li><a href="mypage.jsp">마이페이지</a></li>
				<li><a href="updateUser.jsp">회원정보 수정</a></li>
				<li><a href="logout.do">로그아웃</a></li>
			</ul>
			<!-- //웹카페 안내 링크 종료 -->
			<!-- 메인 메뉴 시작 -->
			<nav>
				<h1 class="hidden">메인 메뉴</h1>
				<ul class="mainMenu">
					<li><a href="#">공지사항</a>
					</li>
					<li><a href="#">함께가요(모임)</a>
						<ul class="aboutCss">
							<li><a href="getBoardList.do">자유게시판</a></li>
							<li><a href="getBoardListArea.do?areaCode=서울">지역별</a></li>
							<li><a href="#">연령별</a></li>
							<li><a href="#">반려동물과 함께</a></li>
							<li><a href="#">당일모임</a></li>
						</ul></li>
					<li><a href="getGalleryList.do">갤러리</a>
						<ul class="webStandard">
							<li><a href="createGallery.jsp">새글등록</a></li>
							<li><a href="#">최신순</a></li>
							<li><a href="#">지역별</a></li>
						</ul></li>
					<li><a href="#">공동구매</a>
						<ul class="commonbuy">
							<li><a href="#">엄준식</a></li>
						</ul>
					</li>
					
				</ul>
			</nav>
			<!-- //메인 메뉴 종료 -->
		</header>
		<!-- //#header 종료 -->
		<!-- #visual 시작 -->
		<div id="visual">
			<p>
				모이길 &amp; 전체 게시판				
			</p>
		</div>
		<!-- //#visual 종료 -->
		<!-- #contentsArea 시작 -->
		<div id="contentsArea"> 
      		<!-- #contents 시작 -->
      		<!-- 묻고 답하기 시작 -->
      		<section id="contents" class="qnaBoard">
        		<!-- 현재위치 시작 -->
        		<p class="location">모이길 &gt; 함께가요(모임) &gt; <strong>자유 게시판</strong></p> 
        		<!-- //현재위치 종료 -->
        		<h1>자유 게시판</h1>
        		<!-- 
		        	<p class="allPost">전체 <strong>102</strong>개 게시물</p>
        		 -->
		        <table class="galleryTable">
		          <caption>자유 게시판 게시물</caption>
		          <thead>
		            <tr>
		              <th scope="col" class="bbsNumber">No</th>
		              <th scope="col" class="bbsTitle">제목</th>
		              <th scope="col" class="bbsTitle">이미지</th>
		            </tr>
		          </thead>
		          <tbody>
		            <c:forEach items="${page.content}" var="gallery">
							<tr>
								<td style="text-align: center;">${gallery.galleryNo}</td>
								<td align="left" style="text-align: center;">
										<a href="getGallery.do?galleryNo=${gallery.galleryNo}">
										${gallery.galleryTitle}</a>
								</td>
								<td align="left" style="text-align: right;">
										<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src="/galleryImg/${gallery.filenames}" onerror="this.style.display='none'" alt='' />
								</td>
								
								
							</tr>
						</c:forEach>
		          </tbody>
		          
		          <tfoot>
						<tr>
							<td></td>
							<td></td>
							<td align="center"><a href="createGallery.jsp">새글 등록</a></td>
							<!-- 검색 시작 -->
							<td>
								
		<!-- //#contentsArea 종료 -->
		

		
	</div>
	<!-- //#wrapper 종료 -->
</body>
</html>
