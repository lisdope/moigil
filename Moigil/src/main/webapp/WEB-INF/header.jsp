<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- �ǳʶٱ� ��ũ ���� -->
	<header id="header">
			<!-- ��ī�� �ΰ� ���� -->
			<h1 class="logo">
				<a href="index.jsp"  id="moigil">���̱�</a>
			</h1>
			<!-- //��ī�� �ΰ� ���� -->
			<!-- ��ī�� �ȳ� ��ũ ���� -->
			<ul class="infoLink">
				<li><a href="mypage.jsp">����������</a></li>
				<li><a href="updateUser.jsp">ȸ������ ����</a></li>
				<li><a href="logout.do">�α׾ƿ�</a></li>
			</ul>
			<!-- //��ī�� �ȳ� ��ũ ���� -->
			<!-- ���� �޴� ���� -->
			<nav>
				<h1 class="hidden">���� �޴�</h1>
				<ul class="mainMenu">
					<li><a href="#">��������</a>
					</li>
					<li><a href="#">�Բ�����(����)</a>
						<ul class="aboutCss">
							<li><a href="getBoardList.do">�����Խ���</a></li>
							<li><a href="getBoardListArea.do?areaCode=����">������</a></li>
							<li><a href="#">���ɺ�</a></li>
							<li><a href="#">�ݷ������� �Բ�</a></li>
							<li><a href="#">���ϸ���</a></li>
						</ul></li>
					<li><a href="#">������</a>
						<ul class="webStandard">
							<li><a href="#">�ֽż�</a></li>
							<li><a href="#">������</a></li>
						</ul></li>
					<li><a href="#">��������</a>
						<ul class="commonbuy">
							<li><a href="#">���ؽ�</a></li>
						</ul>
					</li>
					
				</ul>
			</nav>
			<!-- //���� �޴� ���� -->
		</header>
		<!-- //#header ���� -->
		<!-- #visual ���� -->
		<div id="visual">
			<p>
				Web Standard &amp; Accessibility				
			</p>
		</div>
		
</body>
</html>