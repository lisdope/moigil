<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
    table{margin: auto;}
    </style>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	<div class="container">
	<form action="insertReply.do" method="post">
			<input name="boardNo" type="hidden" value="${reply.boardNo}" />
			<input name="userCode" type="hidden" value="${reply.userCode}" />
			<input name="replyDate" type="hidden" value="${reply.replyDate}" />
			<input name="id" type="hidden" value="${reply.id}"/>
			<input name="userReplyNo" type="hidden" value="${reply.userReplyNo}" />
			<table class="table table-bordered" border="1" cellpadding="0" cellspacing="0">
				<tr bgcolor="#dfefff">
					<td>��� ��ȣ</td>
					<td align="left">${reply.userReplyNo}</td>
				<tr>
				<tr>
					<td bgcolor="orange">����</td>
					<td align="left"><textarea name="userReply" cols="40" rows="10">${reply.userReply }</textarea></td>
				</tr>
				<tr bgcolor="#dfefff">
					<td colspan="2" align="center"><input type="submit"
						value="�� ����" /></td>
				</tr>
				
			</table>
		</form>
		</div>
	</body>
	</html>