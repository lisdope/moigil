
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="author" content="Teresa,BMH">
<meta name="keywords" content="HTML5,CSS3,묻고 답하기,질문과 답변,웹카페 Q&amp;A">
<meta name="description" content="HTML5와 CSS3 관련 궁금한 점을 웹카페 묻고 답하기 게시판에 올려주세요">
<meta name="robots" content="all">
<title>묻고 답하기 | WebCafe</title>
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
	<div id="wrapper">
		<!-- #header 시작 -->
		<header id="header" role="banner">
			<!-- 웹카페 로고 시작 -->
			<h1 class="logo"><a href="index.html"><img src="images/logo.png" alt="WebCafe"></a></h1>
			<!-- //웹카페 로고 종료 -->
			<!-- 웹카페 안내 링크 시작 -->
			<ul class="infoLink">
				<li><a href="#">홈</a></li>
				<li><a href="#">로그인</a></li>
				<li><a href="join.html">회원가입</a></li>
				<li><a href="#">사이트맵</a></li>
				<li><a href="#">ENGLISH</a></li>
			</ul>
			<!-- //웹카페 안내 링크 종료 -->
			<!-- 메인 메뉴 시작 -->
			<nav role="navigation">
				<h1 class="hidden">메인 메뉴</h1>
				<ul class="mainMenu">
					<li><a href="#">HTML에 대해</a>
						<ul class="aboutHtml">
							<li><a href="introduce.html">HTML5 소개</a></li>
							<li><a href="#">레퍼런스 소개</a></li>
							<li><a href="#">활용예제</a></li>
						</ul></li>
					<li><a href="#">CSS에 대해</a>
						<ul class="aboutCss">
							<li><a href="#">CSS 소개</a></li>
							<li><a href="#">CSS2 VS CSS3</a></li>
							<li><a href="#">CSS 애니메이션</a></li>
							<li><a href="#">CSS Framework</a></li>
						</ul></li>
					<li><a href="#">웹 표준</a>
						<ul class="webStandard">
							<li><a href="#">웹 표준이란?</a></li>
							<li><a href="#">W3C</a></li>
							<li><a href="#">HTML5의 현재와 미래</a></li>
						</ul></li>
					<li><a href="#">웹 접근성</a>
						<ul class="webAccessibility">
							<li><a href="#">웹 접근성의 개요</a></li>
							<li><a href="#">장애 환경의 이해</a></li>
							<li><a href="#">장차법</a></li>
							<li><a href="#">웹 접근성 품질마크</a></li>
						</ul></li>
					<li><a href="#">묻고 답하기</a>
						<ul class="qna">
							<li><a href="qna.html">묻고 답하기</a></li>
							<li><a href="#">FAQ</a></li>
							<li><a href="#">1대1 질문</a></li>
							<li><a href="#">웹표준</a></li>
							<li><a href="#">웹접근성</a></li>
						</ul></li>
					<li><a href="#">자료실</a>
						<ul class="archive">
							<li><a href="#">공개 자료실</a></li>
							<li><a href="gallery.html">이미지 자료실</a></li>
							<li><a href="#">웹 표준 자료실</a></li>
							<li><a href="#">웹 접근성 자료실</a></li>
						</ul></li>
				</ul>
			</nav>
			<!-- //메인 메뉴 종료 -->
		</header>
		<!-- //#header 종료 -->
		<!-- #visual 시작 -->
		<div id="visual">
			<p>
				Web Standard &amp; Accessibility				
			</p>
		</div>
		<!-- //#visual 종료 -->
		<!-- #contentsArea 시작 -->
		<div id="contentsArea"> 
      		<!-- #contents 시작 -->
      		<!-- 묻고 답하기 시작 -->
      		<section id="contents" class="qnaBoard">
        		<!-- 현재위치 시작 -->
        		<p class="location">Home &gt; 묻고 답하기 &gt; <strong>묻고 답하기</strong></p> 
        		<!-- //현재위치 종료 -->
        		<h1>묻고 답하기</h1>
		        <p class="allPost">전체 <strong>102</strong>개 게시물</p>
		        <table class="boardTable">
		          <caption>묻고 답하기 게시물</caption>
		          <thead>
		            <tr>
		              <th scope="col" class="bbsNumber">No</th>
		              <th scope="col" class="bbsTitle">제목</th>
		              <th scope="col" class="bbsDate">등록일</th>
		              <th scope="col" class="bbsHit">조회수</th>
		            </tr>
		          </thead>
		          <tbody>
		            <tr>
		              <td>102</td>
		              <td><a href="#">모바일 웹 개발에서 viewport의 역할이 궁금해요</a><span>[<strong>2</strong>]</span></td>
		              <td><time datetime="2013-10-04">2013.10.04</time></td>
		              <td>121</td>
		            </tr>
		            <tr>
		              <td>101</td>
		              <td><a href="#">IE11버전 출시에 따른 준비로 무엇이 필요할까요?</a> <span>[<strong>2</strong>]</span></td>
		              <td><time datetime="2013-10-04">2013.10.04</time></td>
		              <td>97</td>
		            </tr>
		            <tr>
		              <td>100</td>
		              <td><a href="#">최신 웹 브라우저의 SVG 이미지 지원여부가 궁금해요.</a> <span>[<strong>2</strong>]</span></td>
		              <td><time datetime="2013-10-04">2013.10.04</time></td>
		              <td>123</td>
		            </tr>
		            <tr>
		              <td>99</td>
		              <td><a href="#">웹 접근성 평가 시 유용한 응용프로그램을 소개해 주세요.</a> <span>[<strong>2</strong>]</span></td>
		              <td><time datetime="2013-10-04">2013.10.04</time></td>
		              <td>97</td>
		            </tr>
		            <tr>
		              <td>98</td>
		              <td><a href="#">오페라에서 CSS3 Animation은 언제쯤 지원될까요?</a> <span>[<strong>2</strong>]</span></td>
		              <td><time datetime="2013-10-04">2013.10.04</time></td>
		              <td>123</td>
		            </tr>
		          </tbody>
		        </table>
		        <p class="paging">
		          <a href="#" class="btnPrev">이전 5개</a>
		          <span class="pageNumber"><a href="#">5</a> <strong>4</strong> <a href="#">3</a> <a href="#">2</a> <a href="#">1</a></span>
		          <a href="#" class="btnNext">다음 5개</a>
		        </p>
			</section>
			<!-- //묻고 답하기 시작 -->
			<!-- //#contents 종료 --> 
			<!-- 트위터 시작 -->
			<aside id="twitter" title="HTML5 관련 글">
				<h1>twitter</h1>
				<article class="twitterArticle">
					<img src="images/seulbinim.jpg" class="twitterUserProfile" alt="">
					<a href="http://twitter.com/seulbinim" class="twitterUserName" title="seulbinim의 트위터로 연결됩니다.">seulbinim</a>
					<p class="twitterContent">슬비네에서 웹표준 핵심 가이드북 출시 기념으로 <mark>HTML5</mark> 교육을 무료로 진행한다고 합니다. <mark>HTML5</mark>에 관심이 있는 분들은 슬비네로 문의하시기 바랍니다. </p>
					<time datetime="2013-10-04" class="twitterDate">2013년 10월 04일</time>
				</article>
				<article class="twitterArticle">
					<img src="images/miheeya.jpg" class="twitterUserProfile" alt="">
					<a href="http://twitter.com/miheeya" class="twitterUserName" title="miheeya의 트위터로 연결됩니다.">miheeya</a>
					<p class="twitterContent"><mark>HTML5</mark>도  HTML4.01과 똑같은 마크업 언어입니다. <mark>HTML5</mark>를 사용한다고 해서 웹표준을 준수하지 않는다거나 웹접근성이 떨어지는 것은 아닙니다.</p>
					<time datetime="2013-10-04" class="twitterDate">2013년 10월 04일</time>
				</article>		
			</aside>
			<!-- //트위터 종료 -->       
		</div>
		<!-- //#contentsArea 종료 -->
		<!-- #slogan 시작 -->
		<section id="slogan">
			<h1 title="웹카페에서 웹표준을">Web Cafe 슬로건</h1>
			<p>
				<q>The power of the Web is in its universality, Access by everyone regardless of disability is an essential aspect.</q>
				Tim Berners - Lee , W3C Director and inventor of the World Wide Web
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
						<li><a href="#">회사 소개</a></li>
						<li><a href="#">개인정보 보호정책</a></li>
						<li><a href="#">이메일 주소 무단 수집거부</a></li>
						<li><a href="#">contact us</a></li>
						<li><a href="#">site map</a></li>
					</ul>
				</section>
				<!-- //사이트 이용안내 종료 -->
				<!-- 웹카페 주소 시작 -->
				<address>
					<span>서울시 마포구 상수동 123-12 한주빌딩 5층</span>                    
                    <span>· 전화: 02-234-5678</span>
					<span>· E-MAIL: <a href="mailto:webmaster@webcafe.com">webmaster@webcafe2010.com</a></span>
				</address>
				<!-- //웹카페 주소 종료 -->
				<!-- 웹카페 저작권정보 시작 -->
				<p class="copyright">Copyright since &copy; 2010 by Web Cafe CORPORATION ALL RIGHTS RESERVED.</p>
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
