<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/sub.css">
<script src="js/jQuery.js"></script>
<script src="js/webcafe.js"></script>
<style type="text/css">
html {
	overflow-y: scroll;
}
</style>
<script type="text/javascript">
	function upload() {

		$("#ajaxform").ajaxSubmit({
			type : "POST",
			dataType : 'text',
			url : $("#ajaxform").attr("action"), //?ì¡?? ?ì´ì§ ==> ?¬ê¸°?? upload.doë¡? ë³´ë´?ê±´ê°?
			data : $("#ajaxform").serialize(), // ?°ì´?°ì ?ì¡ ë°©ì?? ì¿¼ë¦¬?¤í¸ë§? ?ì?? ?°ì´?°ë¡ ë³?í´ ë°í?ë¤.
			success : function(data) { // ?°ì´?? ?ì¡?? ?±ê³µ?? ?? ?¤í?ë ë¶ë¶?
				data2 = data.replace(/"/gi, "");
				// ??? 
				var imageUrl = "${context}/galleryImg/" + data2; // ?´ë?ì§ê²½ë¡ë¥? ?ë?ê²½ë¡ë¡? ?¤ì ?ì¬ ê°?¸ì¤?? ë°©ì
				$("#pic").attr("src", imageUrl); // ë¯¸ë¦¬ë³´ê¸°ë¥? ?¤ì ?ë ë¶ë¶? => id?ì±ê°ì¼ë¡? pic?? ?ì?? src?ì±?? imageUrl?? ??ì?¨ë¤. => ?ì?? ?ë¡?í ?¬ì§?? ê²½ë¡ë¡? ?¤ì ?ë¤	 
				$("#filenames").val(data2); // userImage?? ê°ì data2ë¡? ?¤ì ?ë¤.
			},
			error : function(xhr, status, error) {
				alert(error);
			}
		});
	}
</script>
<title>getGallery</title>
</head>
<body>
	<div id="wrapper">

		<!-- #header ?ì -->
		<jsp:include page="WEB-INF/header.jsp" />
		<!-- //#header ì¢ë£ -->
		<div id="contentsArea" class="container">

			<!--   ì½íì¸? ì»¬ë¼ ?ì -->
			<section id="contents" class="qnaBoard">
				<!-- ?ì¬?ì¹ ?ì -->
				<p class="location">
					ëª¨ì´ê¸? &gt; ?¨ê»ê°??(ëª¨ì) &gt; <strong>?´ë?ì§ ê²ì??</strong>
				</p>
				<!-- //?ì¬?ì¹ ì¢ë£ -->
				<h1>?´ë?ì§ ê²ì??</h1>


		<div class="container">
					<section id="boardview">
						<table class="table table-hover " border="1">
						

							<tr>
								<th class="table-primary"><p>
										<label for="filenames" class="filenames">?ëª©</label>
									</p></th>
								<td colspan="2" align="left">${gallery.galleryTitle }</td>

							</tr>
							<tr>
								<th class="table-primary"><p>
										<label for="filenames" class="filenames">ë²í¸</label>
									</p></th>
								<td colspan="2" align="left">${gallery.galleryNo }</td>

							</tr>

							<tr>
								<th class="table-primary"><p>
										<label for="filenames" class="filenames">?´ì©</label>
									</p></th>
								<td colspan="3" align="left">${gallery.galleryContents}</td>
							</tr>
							<tr>
								<th class="table-primary"><p>
										<label for="filenames" class="filenames">?¬ì§</label>
									</p></th>
								<td colspan="3" align="left"><img id="pic"
									style="position: relative; margin-left: 15px;" height="200px"
									width="300px" src="/galleryImg/${gallery.filenames}"
									onerror="this.style.display='none'" alt='' /></td>
							</tr>
						</table>
					</section>
				</div>
				
				<div class="container2" align="center">
					
					<a href="editGallery.do?galleryNo=${gallery.galleryNo}">
					<button type="button" class="btn btn-primary ">ê¸?ì </button></a>&nbsp;&nbsp;&nbsp;
					<a href="deleteGallery.do?galleryNo=${gallery.galleryNo}">
					<button type="button" class="btn btn-primary ">ê¸?? </button></a>&nbsp;&nbsp;&nbsp;
					<a href="createGallery.jsp"><button type="button" class="btn btn-primary ">ê¸?±ë¡</button></a>&nbsp;&nbsp;&nbsp; 
					<a href="getGalleryList.do"><button type="button" class="btn btn-primary ">ê¸ëª©ë¡</button></a>&nbsp;&nbsp;&nbsp; 
					<br>

				</div>
			</section>
			
		</div>
	</div>
	<!-- #footer ?ì -->
	<jsp:include page="WEB-INF/footer.jsp" />
	<!-- //#footer ì¢ë£ -->
</body>
</html>