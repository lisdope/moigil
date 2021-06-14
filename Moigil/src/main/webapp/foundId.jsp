<%@page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
dl, ol, ul {
    margin-top: -16px;
    margin-bottom: 1rem;
}
#visual {
    margin: -16px;
    height: 500px;
    position: relative;
    background-image: url(/images/Metasequoia.jpg), linear-gradient(to bottom, #c7c7c7 0%,#ffffff 70%,#ffffff 100%);
    background-size: 1930px;
    background-position: center top;
    background-repeat: no-repeat;
}
</style>
<title>아이디 찾기</title>
</head>
<body>
<div id="wrapper">
<jsp:include page="WEB-INF/header.jsp" />
<div id="contentsArea">
	<center>
		<h3 style="margin: 25px;"> 아이디는 ${id} 입니다. </h3>
		<a href="index.jsp"><button class="btn btn-outline-primary btn-sm" type="button">홈으로</button></a>
		<a href="createUser.jsp"><button class="btn btn-outline-primary btn-sm" type="button">회원가입</button></a>
	</center>
	</div>	
			<!-- #footer 시작 -->
			<jsp:include page="WEB-INF/footer.jsp" />
		<!-- //#footer 종료 -->
</div>		
</body>
</html>