<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<!DOCTYPE html>
<head>
<title>모이길 | 지역 게시판</title>
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
<script src="js/jquery.js"></script>
<script src="js/webcafe.js"></script>
</head>
<body>
	<!-- #wrapper 시작 -->
	<div id="wrapper">
		<!-- #header 시작 -->
		<header id="header">
			<!-- 웹카페 로고 시작 -->
			<h1 class="logo">
				<a href="index2.jsp"  id="moigil">모이길</a>
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
							<li><a href="getBoardListArea.do?areaCode=seoul">지역별</a></li>
							<li><a href="#">연령별</a></li>
							<li><a href="#">반려동물과 함께</a></li>
							<li><a href="#">당일모임</a></li>
						</ul></li>
					<li><a href="#">갤러리</a>
						<ul class="webStandard">
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
				모이길 &amp; 지역 게시판				
			</p>
		</div>
		<!-- //#visual 종료 -->
		
		
		<!-- #contentsArea 시작 -->
		<div id="contentsArea"> 
      		<!-- #contents 시작 -->
      		<section id="contents" class="qnaBoard">
        		<!-- 현재위치 시작 -->
        		<p>
        			<a href="getBoardListArea.do?areaCode=seoul" >서울&nbsp&nbsp&nbsp</a>
        			<a href="getBoardListArea.do?areaCode=gyeonggi">경기</a>
        		</p>
        		<p class="location">모이길 &gt; 함께가요(모임) &gt; <strong>지역별 게시판</strong></p> 
        		<!-- //현재위치 종료 -->
        		<h1>지역 게시판</h1>
        		<!-- 
		        	<p class="allPost">전체 <strong>102</strong>개 게시물</p>
        		 -->
		        <table class="boardTable">
		          <caption>지역 게시판 게시물</caption>
		          <thead>
		            <tr>
		              <th scope="col" class="bbsNumber">No</th>
		              <th scope="col" class="bbsArea">지역</th>
		              <th scope="col" class="bbsTitle">제목</th>
		              <th scope="col" class="bbsDate">등록일</th>
		              <th scope="col" class="bbsHit">조회수</th>
		            </tr>
		          </thead>
		          <tbody>
		          <!-- 
		            <tr>
		              <td>102</td>
		              <td><a href="#">모바일 웹 개발에서 viewport의 역할이 궁금해요</a><span>[<strong>2</strong>]</span></td>
		              <td><time datetime="2013-10-04">2013.10.04</time></td>
		              <td>121</td>
		            </tr>
		           -->
		            <c:forEach items="${page.content}" var="board">
							<tr>
								<td style="text-align: center;">${board.boardNo}</td>
								<td> ${board.areaCode} </td>
								<td align="left" style="text-align: center;"><a
									href="getBoard.do?boardNo=${board.boardNo}">
										${board.boardTitle}</a></td>
								<td>${board.boardDate}</td>
								<td>${board.boardHits}</td>
							</tr>
						</c:forEach>
		          </tbody>
		          
		          <tfoot>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td align="center"><a href="insertBoard.jsp">새글 등록</a></td>
							<!-- 검색 시작 -->
							<td>
								<form action="getBoardListArea.do" method="post">
									<select name="searchCondition">
										<option value="TITLE">제목
										<option value="CONTENT">내용
									</select> <input name="searchKeyword" type="text" /> 
									<input type="submit" value="검색" />
								</form>
							</td>
							<!-- 검색 종료 -->
						</tr>
					</tfoot>
		        </table>
		        <div>
				<nav aria-label="Page navigation example" >
					<ul class="pagination">
						<c:if test="${page.number > 0}">
							<a href="getBoardListArea.do?PageNo=${page.number-1}">[이전]</a>
						</c:if>
						<c:if test="${page.hasNext()}">
							<a href="getBoardListArea.do?PageNo=${page.number+1}">[다음]</a>
						</c:if>
					</ul>
				</nav>
			</div>
			</section>
			<!-- //묻고 답하기 시작 -->
			<!-- //#contents 종료 --> 
			<!-- 트위터 시작 -->
			<!--
			<h1>twitter</h1>
			<aside id="twitter" title="HTML5 관련 글">
				<article class="twitterArticle">
					<img src="images/seulbinim.jpg" class="twitterUserProfile" alt="">
					<a href="http://twitter.com/seulbinim" class="twitterUserName" title="seulbinim의 트위터로 연결됩니다.">seulbinim</a>
					<p class="twitterContent">슬비네에서 웹표준 핵심 가이드북 출시 기념으로 <mark>HTML5</mark> 교육을 무료로 진행한다고 합니다. <mark>HTML5</mark>에 관심이 있는 분들은 슬비네로 문의하시기 바랍니다. </p>
					<time datetime="2013-10-04" class="twitterDate">2013년 10월 04일</time>
				</article> 
			</aside>
				 -->
			<!-- //트위터 종료 -->       
		</div>
		<!-- //#contentsArea 종료 -->
		<!-- #slogan 시작 -->
		<section id="slogan">
			<h1 title="웹카페에서 웹표준을">Web Cafe 슬로건</h1>
			<p>
				산택 하는 당신에게 가장 좋은 선택 모이길
			</p>
			<!-- 슬로건 푸터 시작 -->
			<footer class="hidden">출처 : World Wide Consortium -	http://www.w3.org/WAI/</footer>
			<!-- //슬로건 푸터 종료 -->
		</section>
		<!-- //#slogan 종료 -->
		<!-- #footer 시작 -->
		<footer id="footer">
			<!-- #footerInner 시작 -->
			<div id="footerInner">
				<!-- 푸터 로고 시작 -->
				<a class="footerLogo"><img src="images/footer_logo.png" alt="WebCafe"></a>
				<!-- //푸터 로고 종료 -->
				<!-- 사이트 이용안내 시작 -->
				<section class="guide">
					<h1 class="hidden">사이트 이용안내</h1>
					<ul>
						<li><a href="#">팀원 소개</a></li>
						<li><a href="#">이인석</a></li>
						<li><a href="#">최미경</a></li>
						<li><a href="#">신동일</a></li>
						<li><a href="#">송민준</a></li>
						<li><a href="#">김영종</a></li>
						<li><a href="#">백승진</a></li>
					</ul>
				</section>
				<!-- //사이트 이용안내 종료 -->
				<!-- 웹카페 주소 시작 -->
				<address>
					<span>동탄 사우나 수건도둑 엄준식</span>                    
                    <span>· 전화: 112</span>
					<span>· 엄준식의 정체: <a href="https://www.youtube.com/watch?v=3FuL_5tUpxw">엄준식의 정체</a></span>
				</address>
				<!-- //웹카페 주소 종료 -->
				<!-- 웹카페 저작권정보 시작 -->
				<p class="copyright">Copyright since &copy; 2021 by Moigil Web.</p>
				<!-- //웹카페 저작권정보 종료 -->
				<!-- HTML5 & CSS3 로고 시작 -->
				<div class="techLogoArea">
					<img src="images/html5_logo.png" alt="HTML5">
					<img src="images/css3_logo.png" alt="CSS3">
				</div>
				<!-- //HTML5 & CSS3 로고 종료 -->
			</div>
			<!-- //#footerInner 종료 -->
		</footer>
		<!-- //#footer 종료 -->
	</div>
	<!-- //#wrapper 종료 -->
</body>
</html>
