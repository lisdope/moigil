<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script language="javascript">
// opener관?? ?�류가 발생?�는 경우 ?�래 주석?? ?��??�고, ?�용?�의 ?�메?�정보�? ?�력?�니??. ("?�업API ?�출 ?�스"?? ?�일?�게 ?�용?�켜?? ?�니??.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검?�을 ?�행?? ?�업 ?�이지�? ?�출?�니??.
	// ?�출?? ?�이지(jusopopup.jsp)?�서 ?�제 주소검?�URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)�? ?�출?�게 ?�니??.
	var pop = window.open("/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바?? ?�인 경우, ?�출?? ?�이지(jusopopup.jsp)?�서 ?�제 주소검?�URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)�? ?�출?�게 ?�니??.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// ?�업?�이지?�서 주소?�력?? ?�보�? 받아??, ?? ?�이지?? ?�보�? ?�록?�니??.
		document.form.zipNo.value = zipNo;
		document.form.roadFullAddr.value = roadFullAddr;

		
}

</script>
<title>?�보?�정</title>
</head>
<body>
<form action="updateUser.do" name="form" id="form" method="post">
		<table>
			<tr><td><input type="hidden" name="userCode" value="${user.userCode}" /></td></tr>
			<tr><td><input type="hidden" name="grade" value="${user.grade}" /></td></tr>
			<tr><td><input type="hidden" name="entDate" value="${user.entDate}" /></td></tr>
			<tr><td>?�이??</td><td><input type="text"  style="width:100px;" name="id" value="${user.id}" readonly /></td></tr>
			<tr><td>비�?번호</td><td><input type="password"  style="width:100px;" name="pw" id="pw" value="${user.pw}" /></td></tr>
			<tr><td>?�름</td><td><input type="text"  style="width:50px;" name="name" value="${user.name}" /></td></tr>
			<tr><td>?�일</td><td><input type="date" name="birth" value="${user.birth}" /></td></tr>
			<tr><td>?�메??</td><td><input type="text"  style="width:200px;" name="email" value="${user.email}" /></td></tr>
			<tr><td>번호</td><td><select name="phoneCd">
						<option value="010">010</option>
						<option value="011">011</option>					
					</select>
			<input type="text"  style="width:100px;" name="phoneNum" value="${user.phoneNum}" /></td></tr>
			<tr><td>?�편번호 </td><td><input type="text"  style="width:100px;" id="zipNo"  name="postNum" value="${user.postNum}" readonly/><input type="button" onClick="goPopup();" value="주소검??"/></td>
			<tr><td>?�로명주??</td><td><input type="text"  style="width:500px;" id="roadFullAddr"  name="address" value="${user.address}" readonly/></td></tr>
			<tr><td>?�로??</td><td>
			<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src="/Upload/${user.userImage}"><br/>
			<tr><td><input type="submit" value="?�정?�기 " /></td><td><input type="button" value="?�원?�퇴" onClick="location.href='deleteUser.do?userCode=${user.userCode}'"></td></tr>
		</table>

</form>
</body>
</html>
    pageEncoding="EUC-KR"%>
  <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/commons.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function(){
			
		if($("#pwForm").submit(function(){
			if($("#pw").val() !== $("#pw2").val()){
				alert("��й�ȣ�� �ٸ��ϴ�.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().length < 8) {
				alert("��й�ȣ�� 8�� �̻����� �����ؾ� �մϴ�.");
				$("#pw").val("").focus();
				return false;
			}else if($.trim($("#pw").val()) !== $("#pw").val()){
				alert("������ �Է��� �Ұ����մϴ�.");
				return false;
			}
		}));
	})
</script>
<title>ȸ����������</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>My Page</h3>
			</div>
			<div>
				<form id="myForm" action="update_mypage.do" method="post">
					<p>
						<label>ID</label> 
						<input class="w3-input" type="text" id="id" name="id" readonly value="${ user.id }"> 
					</p>
					<p>
						<label>Email</label> 
						<input class="w3-input" type="text" id="email" name="email" value="${ user.email }" required> 
					</p>
					<p class="w3-center">
						<button type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">ȸ������ ����</button>
					</p>
				</form>
				<br />
				<form id="pwForm" action="update_pw.do" method="post">	
					<input type="hidden" name="id" value="${ user.id }">
					<p>
						<label>Password</label>
						<input class="w3-input" id="old_pw" name="old_pw" type="password" required>
					</p>
					<p>
						<label>New Password</label> 
						<input class="w3-input" id="pw" name="pw" type="password" required>
					</p>
					<p>
						<label>Confirm</label>
						<input class="w3-input" type="password" id="pw2" type="password" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">��й�ȣ ����</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
