<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
</head>
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
</head>
<body>


			<form action="getId.do" method="post">

				<legend>아이디 찾기</legend>
					<p>
						<label for="name">성명<strong class="require">필수</strong></label> <input
							type="text" id="name" name="name" required placeholder="홍길동">
					</p>
					
					<p>
						<label for="email">이메일<strong class="require">필수</strong></label> <input
							type="text" id="email" name="email" required placeholder="jang@gamil.com">
					</p>
				
				<p>
					<td colspan="2" align="center"><input type="submit" value="아이디 찾기 " /></td>
				</p>

				</form>
	
</body>
</html>