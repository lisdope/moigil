<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/jquery.form.js"></script>
<script type="text/javascript">

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.zipNo.value = zipNo;
		document.form.roadFullAddr.value = roadFullAddr;

		
}

</script>
<title>정보수정</title>
</head>
<body>

	<div id="contentsArea">
		<!-- #contents 시작 -->
		<!-- 회원정보수정 시작 -->
		<section id="contents" class="memberJoin"> <!-- 현재위치 시작 -->
		<p class="location">
			Home &gt; <strong>정보수정</strong>
		</p>
		<!-- //현재위치 종료 -->
		<h1>정보수정</h1>
		<p class="formSign">
			<strong class="require">필수</strong> 는 반드시 입력하여야 하는 항목입니다.
		</p>
<form action="updateUser.do" name="form" id="form" method="post">
<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src="/userImg/${user.userImage}"><br/>
		<fieldset>
			<legend>회원가입 정보 입력 폼</legend>
			<p>
			<input type="hidden" name="userCode" value="${user.userCode}" />
			<input type="hidden" name="entDate" value="${user.entDate}" />
			<p><label for="id">아이디</label><input type="text"  style="width:100px;" name="id" value="${user.id}" readonly />
			<p><label for="password">비밀번호</label><input type="password"  style="width:100px;" name="pw" id="pw" value="${user.pw}" />
			<p><label for="name">이름</label><input type="text"  style="width:50px;" name="name" value="${user.name}" /></p>
			<p><label for="birth">생일</label><input type="date" name="birth" value="${user.birth}" />
		    <p><label for="email">이메일</label><input type="text"  style="width:200px;" name="email" value="${user.email}" />
			<p><label for="tel">번호</label><select name="phoneCd">
						<option value="010">010</option>
						<option value="011">011</option>					
					</select>
			<input type="text"  style="width:100px;" name="phoneNum" value="${user.phoneNum}" />
			<p><label for="tel">우편번호 </label><input type="text"  style="width:100px;" id="zipNo"  name="postNum" value="${user.postNum}" readonly/><input type="button" onClick="goPopup();" value="주소검색"/>
			<p><label for="tel">도로명주소</label><input type="text"  style="width:500px;" id="roadFullAddr"  name="address" value="${user.address}" readonly/>
			<p><label for="tel">이미지</label><input type="text"  style="width:200px;" name="userImage" value="${user.userImage}" />
			<p><input type="submit" value="수정하기 " /><input type="button" value="회원탈퇴" onClick="location.href='deleteUser.do?userCode=${user.userCode}'">
		</fieldset>

</form>
</section>
</body>
</html>