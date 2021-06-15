<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>���̵� ã��</title>

<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/jquery.form.js"></script>
<script type="text/javascript">
</script>
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
#contentsArea {
    overflow: hidden;
    min-height: 600px;
    padding: 30px 0 30px 30px;
    background-color: #fff;
    border-radius: 15px 15px 0 0;
	margin-left: 650px;
    margin-top: 45px;
}
</style>

</head>
<body>
<div id="wrapper">
<jsp:include page="WEB-INF/header.jsp" />
	<div id="contentsArea">
			
		<h2>��ġ�ϴ� ȸ���� �����ϴ�.</h2>
		
		<div class="memberLink" style="position: relative; margin-left: 36px;">
		<a href="index.jsp"><button class="btn btn-outline-primary btn-sm" type="button">Ȩ����</button></a>
		<a href="createUser.jsp"><button class="btn btn-outline-primary btn-sm" type="button">ȸ������</button></a>
		<a href="getId.jsp" class="find"><button class="btn btn-outline-primary btn-sm" type="button">���̵�/��й�ȣ ã��</button></a>
		</div>
	</div>
	<!-- #footer ���� -->
	<jsp:include page="WEB-INF/footer.jsp" />
	<!-- //#footer ���� -->
</div>	
</body>
</html>