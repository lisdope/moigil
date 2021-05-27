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
	// ì£¼ì†Œê²€?‰ì„ ?˜í–‰?? ?ì—… ?˜ì´ì§€ë¥? ?¸ì¶œ?©ë‹ˆ??.
	// ?¸ì¶œ?? ?˜ì´ì§€(jusopopup.jsp)?ì„œ ?¤ì œ ì£¼ì†Œê²€?‰URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)ë¥? ?¸ì¶œ?˜ê²Œ ?©ë‹ˆ??.
	var pop = window.open("/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	// ëª¨ë°”?? ?¹ì¸ ê²½ìš°, ?¸ì¶œ?? ?˜ì´ì§€(jusopopup.jsp)?ì„œ ?¤ì œ ì£¼ì†Œê²€?‰URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)ë¥? ?¸ì¶œ?˜ê²Œ ?©ë‹ˆ??.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// ?ì—…?˜ì´ì§€?ì„œ ì£¼ì†Œ?…ë ¥?? ?•ë³´ë¥? ë°›ì•„??, ?? ?˜ì´ì§€?? ?•ë³´ë¥? ?±ë¡?©ë‹ˆ??.
		document.userInfo.roadFullAddr.value = roadFullAddr;
		document.userInfo.zipNo.value = zipNo;
}
function idchk(){
	var id = document.getElementById("id").value;
	window.open("/idChk.do?id="+id,"pop","width=400,height=300, scrollbars=no, resizable=no"); 
}
// ?„ì´?? ?…ë ¥ì°½ì— ê°? ?…ë ¥?? hidden?? idUncheckë¥? ?¸íŒ…?œë‹¤.
// ?´ë ‡ê²? ?˜ëŠ” ?´ìœ ?? ì¤‘ë³µì²´í¬ ?? ?¤ì‹œ ?„ì´?? ì°½ì´ ?ˆë¡œ?? ?„ì´?”ë? ?…ë ¥?ˆì„ ??
// ?¤ì‹œ ì¤‘ë³µì²´í¬ë¥? ?˜ë„ë¡? ?œë‹¤.
function inputIdChk(){
	document.userInfo.idDuplication.value ="uncheck";
}


function checkValue(){
	var form = document.userInfo;
	if(!form.id.value){
		alert("?„ì´?”ì„ ?…ë ¥?´ì£¼?¸ìš”");
		return false;
	}		
	if(form.idDuplication.value != "idCheck"){
		alert("?„ì´?? ì¤‘ë³µì²´í¬ë¥? ?´ì£¼?¸ìš”.");
		return false;
	}
	if(!form.pw.value){
		alert("ë¹„ë²ˆ?? ?…ë ¥?´ì£¼?¸ìš”");
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
<title>?Œì›ê°€??</title>
</head>
<body>
	<form id="ajaxform" method="post" action="upload.do" enctype="multipart/form-data">
	<table>
	<tr><td>?„ë¡œ??</td><td><input type="file"  style="width:200px;" name="Image" onchange="upload();" /></td></tr>
	<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src=""><br/>
	</table>
	</form>
<form action="createUser.do" name="userInfo" method="post" onsubmit="return checkValue()">
		<table>
			<tr><td>?„ì´??</td><td><input type="text"  style="width:100px;" name="id"  id="id" onkeydown="inputIdChk()"/>
			<input type="button" onClick="idchk();" value="ì¤‘ë³µì²´í¬"/></td></tr>
			<tr><td><input type="hidden" name="idDuplication" value="uncheck" ></td></tr>
			<tr><td>ë¹„ë?ë²ˆí˜¸</td><td><input type="password"  style="width:100px;" name="pw" id="pw" /></td></tr>
			<tr><td>?´ë¦„</td><td><input type="text"  style="width:50px;" name="name" id="name" /></td></tr>
			<tr><td>?ì¼</td><td><input type="date" name="birth" id="birth"/></td></tr>
			<tr><td>?´ë©”??</td><td><input type="text"  style="width:200px;" name="email" id="email" /></td></tr>
			<tr><td>ë²ˆí˜¸</td><td><select name="phoneCd" id="phoneCd">
						<option value="010">010</option>
						<option value="011">011</option>					
					</select><input type="text"  style="width:100px;" name="phoneNum" /></td></tr>
						<tr><td>?±ê¸‰</td><td>
						<select name="grade">
						<option value="USER">USER</option>
						<option value="ADMIN">ADMIN</option>					
					</select></td></tr>
			<tr><td>?°í¸ë²ˆí˜¸ </td><td><input type="text"  style="width:100px;" id="zipNo"  name="postNum" readonly/>
			<input type="button" onClick="goPopup();" value="ì£¼ì†Œê²€??"/></td></tr>
			<tr><td>?„ë¡œëª…ì£¼??</td><td><input type="text"  style="width:600px;" id="roadFullAddr"  name="address" readonly/></td></tr>
			
			<input type="hidden" id="userImage" name="userImage" value="userImg">
			<!-- <tr><td>?´ë?ì§€</td><td><input type="text"  style="width:200px;" name="userImage" /></td></tr>-->
			<tr><td>?´ë?ì§€</td><td><form id="ajaxform" method="post" action="upload.do" enctype="multipart/form-data">
			<input type="file"  style="width:200px;" name="Image" onchange="upload();" /></td></tr></form>
			<tr><td><input type="submit" value="ê°€?…í•˜ê¸? " /></td></tr>
			</table>
			</form>
</body>
</html>