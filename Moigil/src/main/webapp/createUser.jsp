<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/jquery.form.js"></script>
<script type="text/javascript">
function goPopup(){
	// 주소검?�을 ?�행?? ?�업 ?�이지�? ?�출?�니??.
	// ?�출?? ?�이지(jusopopup.jsp)?�서 ?�제 주소검?�URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)�? ?�출?�게 ?�니??.
	var pop = window.open("/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	// 모바?? ?�인 경우, ?�출?? ?�이지(jusopopup.jsp)?�서 ?�제 주소검?�URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)�? ?�출?�게 ?�니??.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// ?�업?�이지?�서 주소?�력?? ?�보�? 받아??, ?? ?�이지?? ?�보�? ?�록?�니??.
		document.userInfo.roadFullAddr.value = roadFullAddr;
		document.userInfo.zipNo.value = zipNo;
}
function idchk(){
	var id = document.getElementById("id").value;
	window.open("/idChk.do?id="+id,"pop","width=400,height=300, scrollbars=no, resizable=no"); 
}
// ?�이?? ?�력창에 �? ?�력?? hidden?? idUncheck�? ?�팅?�다.
// ?�렇�? ?�는 ?�유?? 중복체크 ?? ?�시 ?�이?? 창이 ?�로?? ?�이?��? ?�력?�을 ??
// ?�시 중복체크�? ?�도�? ?�다.
function inputIdChk(){
	document.userInfo.idDuplication.value ="uncheck";
}


function checkValue(){
	var form = document.userInfo;
	if(!form.id.value){
		alert("?�이?�을 ?�력?�주?�요");
		return false;
	}		
	if(form.idDuplication.value != "idCheck"){
		alert("?�이?? 중복체크�? ?�주?�요.");
		return false;
	}
	if(!form.pw.value){
		alert("비번?? ?�력?�주?�요");
		return false;
	}	
}


function upload(){
	$("#ajaxform").ajaxSubmit({
        type: "POST",
        dataType: 'text',
        url: $("#ajaxform").attr("action"),
        data: $("#ajaxform").serialize(),
        success: function (data) {
        	data2 = data.replace(/"/gi, "");
        	var imageUrl = "/Upload/" + data2;
        	$("#pic").attr("src", imageUrl);
        	$("#userImage").val(data2);
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
    });
}
	

function upload(){
	$("#ajaxform").ajaxSubmit({
        type: "POST",
        dataType: 'text',
        url: $("#ajaxform").attr("action"),
        data: $("#ajaxform").serialize(),
        success: function (data) {
        	data2 = data.replace(/"/gi, "");
        	var imageUrl = "/Upload/" + data2;
        	$("#pic").attr("src", imageUrl);
        	$("#userImage").val(data2);
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
    });
}



</script>
<title>?�원가??</title>
</head>
<body>
	<form id="ajaxform" method="post" action="upload.do" enctype="multipart/form-data">
	<table>
	<tr><td>?�로??</td><td><input type="file"  style="width:200px;" name="Image" onchange="upload();" /></td></tr>
	<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src=""><br/>
	</table>
	</form>
<form action="createUser.do" name="userInfo" method="post" onsubmit="return checkValue()">
		<table>
			<tr><td>?�이??</td><td><input type="text"  style="width:100px;" name="id"  id="id" onkeydown="inputIdChk()"/>
			<input type="button" onClick="idchk();" value="중복체크"/></td></tr>
			<tr><td><input type="hidden" name="idDuplication" value="uncheck" ></td></tr>
			<tr><td>비�?번호</td><td><input type="password"  style="width:100px;" name="pw" id="pw" /></td></tr>
			<tr><td>?�름</td><td><input type="text"  style="width:50px;" name="name" id="name" /></td></tr>
			<tr><td>?�일</td><td><input type="date" name="birth" id="birth"/></td></tr>
			<tr><td>?�메??</td><td><input type="text"  style="width:200px;" name="email" id="email" /></td></tr>
			<tr><td>번호</td><td><select name="phoneCd" id="phoneCd">
						<option value="010">010</option>
						<option value="011">011</option>					
					</select><input type="text"  style="width:100px;" name="phoneNum" /></td></tr>
						<tr><td>?�급</td><td>
						<select name="grade">
						<option value="USER">USER</option>
						<option value="ADMIN">ADMIN</option>					
					</select></td></tr>
			<tr><td>?�편번호 </td><td><input type="text"  style="width:100px;" id="zipNo"  name="postNum" readonly/>
			<input type="button" onClick="goPopup();" value="주소검??"/></td></tr>
			<tr><td>?�로명주??</td><td><input type="text"  style="width:600px;" id="roadFullAddr"  name="address" readonly/></td></tr>
			
			<input type="hidden" id="userImage" name="userImage" value="userImg">
			<!-- <tr><td>?��?지</td><td><input type="text"  style="width:200px;" name="userImage" /></td></tr>-->
			<tr><td>?��?지</td><td><form id="ajaxform" method="post" action="upload.do" enctype="multipart/form-data">
			<input type="file"  style="width:200px;" name="Image" onchange="upload();" /></td></tr></form>
			<tr><td><input type="submit" value="가?�하�? " /></td></tr>
			</table>
			</form>
</body>
</html>