<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>���̵� ã��</title>
</head>
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
</head>
<body>


			<form action="getId.do" method="post">

				<legend>���̵� ã��</legend>
					<p>
						<label for="name">����<strong class="require">�ʼ�</strong></label> <input
							type="text" id="name" name="name" required placeholder="ȫ�浿">
					</p>
					
					<p>
						<label for="email">�̸���<strong class="require">�ʼ�</strong></label> <input
							type="text" id="email" name="email" required placeholder="jang@gamil.com">
					</p>
				
				<p>
					<td colspan="2" align="center"><input type="submit" value="���̵� ã�� " /></td>
				</p>

				</form>
	
</body>
</html>