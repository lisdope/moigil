<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>���̵� ã��</title>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
<script src="js/jquery.js"></script>
<script src="js/webcafe.js"></script>
<script>

		function findId() {
            if(joinForm1.name.value == '') { alert('�̸��� �Էµ��� �ʾҽ��ϴ�.'); joinForm1.name.focus(); return false;}
            if(joinForm1.email.value == '') { alert('�̸����� �Էµ��� �ʾҽ��ϴ�.'); joinForm1.email.focus(); return false;}
		}
		
        function findPassword() {
            if(joinForm2.id.value == '') { alert('���̵� �Էµ��� �ʾҽ��ϴ�.'); joinForm2.id.focus(); return false;}
            if(joinForm2.email.value == '') { alert('�̸����� �Էµ��� �ʾҽ��ϴ�.'); joinForm2.email.focus(); return false;}
		}
</script>

</head>
<body>
	
<div id="wrapper">
	<jsp:include page="WEB-INF/header.jsp" />

<div id="contentsArea"> 
      		<!-- #contents ���� -->
      		<!-- ȸ������ ���� -->
      	<section id="contents" class="memberJoin">
        		<!-- ������ġ ���� -->
        		<p class="location">Home &gt; <strong>ȸ�����̵�&��й�ȣ ã��</strong></p> 
        		<!-- //������ġ ���� -->
        		<a href="index.jsp">Ȩ����</a>
        		<h1>ȸ�����̵�&��й�ȣ ã��</h1>
				
        		<p class="formSign"><strong class="require">�ʼ�</strong> �� �ݵ�� �Է��Ͽ��� �ϴ� �׸��Դϴ�.</p>
	
	<form action="getId.do" id="joinForm" name="joinForm1" method="post" >
		<fieldset>
			<legend>ȸ�����̵�&��й�ȣ ã�� ���� �Է� ��</legend>
			<p>
			<label for="name">����<strong class="require">�ʼ�</strong></label> 
			<input type="text" id="name" name="name">
			<p>
			<label for="email">�̸���<strong class="require">�ʼ�</strong></label> 
			<input type="text" id="email" name="email">				
			<p>
			<div class="btnJoinArea"> <button type="submit" class="btnOk" onclick="findId()">���̵�ã��</button></div>
			</fieldset>
		</form>
		<form action="getPw.do" id="joinForm" name="joinForm2" method="post">
			<legend>��й�ȣ ã��</legend>
			<p>
			<label for="id">���̵�<strong class="require">�ʼ�</strong></label>
			<input type="text" id="id" name="id">
			<p>
			<label for="email">�̸���<strong class="require">�ʼ�</strong></label> 
			<input type="text" id="email" name="email">
			<p>
			
				 <div class="btnJoinArea"> <button type="submit" class="btnOk" onclick="findPassword()">��й�ȣã��</button></div>
				
		</form>
		
		</section>
	</div>
		<!-- //#contentsArea ���� -->
	
		
		<!-- #footer ���� -->
			<jsp:include page="WEB-INF/footer.jsp" />
		<!-- //#footer ���� -->
		
	</div>
	<!-- //#wrapper ���� -->
</body>
</html>