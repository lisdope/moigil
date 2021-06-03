<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Main Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/commons.css">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main.css">
<script src="js/jQuery.js"></script>
<script src="js/webcafe.js"></script>
  
 

    
</head>

<body>
	<!-- #wrapper ?์ -->
	<div id="wrapper">
	
		<!-- #header ?์ -->
		<jsp:include page="WEB-INF/header.jsp" />
		<!-- //#header ์ข๋ฃ -->
		
		<!-- //#visual ์ข๋ฃ -->
		<!-- #contentsArea ?์ -->
		<div id="contentsArea"> 
		

		<div id="contentsArea" class="container"> 
		<!-- ๋ก๊ทธ?? ๋ฐ? ๋ฐฐ๋, ?ฉ์ด?ค๋ช ๊ด?? ์ฝํ์ธ? ์ปฌ๋ผ ?์ -->
		
		<div id="usefulArea">
		
			<!-- ๋ก๊ทธ?? ?์ -->
			<section class="login">
				<h1>๋ก๊ทธ??</h1>

				<c:if test="${empty sessionScope.user.id}">
					<form action="login.do" method="post">
						<fieldset>
							<legend>?์ ๋ก๊ทธ?? ??</legend>
							<p>
								<label for="userId">?์ด??</label> <input type="text" name="id" required placeholder="?์ด??">
							</p>
							<p>
								<label for="userPw">๋น๋?๋ฒํธ</label> <input type="password" name="pw" required placeholder="4?์ด?? 8?์ด??">
							</p>
							<p>
								<button type="submit">๋ก๊ทธ??</button>
							</p>
						</fieldset>
					</form>
				</c:if>
				<c:if test="${!empty sessionScope.user.id}">
					<h1>[${user.id}]?? ?์?ฉ๋??!</h1>
				</c:if>
				
				<div class="memberLink">
				<c:if test="${empty sessionScope.user.id}">
					<a href="createUser.jsp" class="join">?์๊ฐ??</a>
					<a href="getId.jsp" class="find">?์ด??/๋น๋?๋ฒํธ ์ฐพ๊ธฐ</a>
					</c:if>
				</div>
			</section>
			<!-- //๋ก๊ทธ?? ์ข๋ฃ -->
			<!-- //๋ก๊ทธ?? ๋ฐ? ๋ฐฐ๋, ?ฉ์ด?ค๋ช ๊ด?? ์ฝํ์ธ? ์ปฌ๋ผ ์ข๋ฃ -->
		</div>
		<!-- ๋ฉ์ธ ?์ด์ง ?๊ฐ ?์ -->
		<section id="infoArea" class="html5Intro">
			<p class="location">Home &gt; ๋ชจ์ด๊ธธ์ ??? &gt; <strong>๋ชจ์ด๊ธ? ?๊ฐ</strong></p> 
			<h1>๋ชจ์ด๊ธ? ?๊ฐ</h1>
			<h2>๋ชจ์ด๊ธธ์ด??</h2>
			<p>?ฐ์ฑ, ?ฑ์ฐ ?ฑ์ ์ข์?๋ ?ฌ๋?ค์ ?ํ ์ปค๋??ํฐ ?น์ผ ?ฐ์ฑ ๋ชจ์, ์ฑํ ?ฑ์ ?๊ณต?๋ฉฐ,</p>
			<br>
        	<p>๊ด?? ?ํ?ค์ ๊ณต๋๊ตฌ๋งค๋ฅ? ?? ?? ?๋ ?ผํ๋ช? ?? ? ํ ?? ?๋น?ค๋? ?๊ณต?ฉ๋??. 
        	๊ทธ๋ฆฌ๊ณ? GPS?์น๊ธฐ๋ฐ?ผ๋ก ?ฐ์ฑ๊ธ? ?๋ ?๋ด ๋ฐ? ?ค์๊ฐ? ?์น๊ณต์ ๋ก? ?ธ๋ฆฌ?จ๊ณผ ?์ ?จ์ ?๊ณต?๋ ?? ?๋น?ค์?๋ค. 
        	</p> 
        	<br>
        	
        	<h2>๋ชจ์ด๊ธธ์ ์ฝํ์ธ?</h2>
        	
			<!-- //HTML5 ?๊ฐ ์ข๋ฃ -->
			</section>
		
		
		</div>
		
		<!-- #footer ?์ -->
			<jsp:include page="WEB-INF/footer.jsp" />
		<!-- //#footer ์ข๋ฃ -->
		
	</div>
	<!-- //#wrapper ์ข๋ฃ -->
</body>
</html>