<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>��й�ȣ ã��</title>
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
</head>
<body>
	<form action="getPw.do" method="post">
		<legend>��й�ȣ ã��</legend>
			<p>
				<label for="name">���̵�<strong class="require">�ʼ�</strong></label> <input
					type="text" id="id" name="id" required placeholder="���̵� �Է��ϼ���.">
			</p>
			<p>
				<label for="email">�̸���<strong class="require">�ʼ�</strong></label> <input
					type="text" id="email" name="email" required placeholder="example@gamil.com">
			</p>
			<p>
				<td colspan="2" align="center"><input type="submit" value="��й�ȣ ã�� " /></td>
			</p>
	</form>
</body>
</html>