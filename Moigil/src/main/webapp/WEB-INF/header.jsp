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
	<header id="navs">
			<!-- ��ī�� �ΰ� ���� -->
			<h1 class="logo">
				<a href="index.jsp"  id="moigil">���̱�</a>
			</h1>
			<!-- //��ī�� �ΰ� ���� -->
			<!-- ��ī�� �ȳ� ��ũ ���� -->
			<ul class="infoLink">
				<li><a href="myPage.jsp" style="font-weight: bold;">����������</a></li>
				<li><a href="updateUser.jsp" style="font-weight: bold;">ȸ������ ����</a></li>
				<li><a href="logout.do" style="font-weight: bold;">�α׾ƿ�</a></li>
			</ul>
			<!-- //��ī�� �ȳ� ��ũ ���� -->
			<!-- ���� �޴� ���� -->
			<nav >
				<h1 class="hidden">���� �޴�</h1>
				<ul class="mainMenu">
					<li><a href="#">��������</a>
					</li>
					<li><a href="#">�Բ�����(����)</a>
						<ul class="aboutCss">
							<li><a href="getBoardList.do">��ü�Խ���</a></li>
							<li><a href="getBoardListArea.do?areaCode=����">������</a></li>
							<li><a href="#">�ݷ������� �Բ�</a></li>
							<li><a href="getMeetingList.do">���ϸ���</a></li>
							<li><a href="room.jsp">ä�ù�</a></li>
						</ul></li>
					<li><a href="getBoardGallery.jsp">������</a>
						<ul class="webStandard">
							<li><a href="#">������</a></li>
						</ul></li>
					<li><a href="#">��������</a>
						<ul class="commonbuy">
							
						</ul>
					</li>
					
				</ul>
			</nav>
			<!-- //���� �޴� ���� -->
		</header>
		<!-- //#header ���� -->
		<!-- #visual ���� -->
		<div id="visual">
			
		</div>
		
</body>
</html>