<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
<!--외부참조(script.js, style.css) START LINE -->
	<link rel="stylesheet" href="${contextpath}/article3/css/style.css?ver=3">
	<script src="${contextpath}/article3/js/script.js"></script>
<!--JQUERY(1EA), BOOTSTRAP(2EA) CDN START LINE-->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!--외부참조 + CDN END -->
	<title>Learn & Run</title>
</head>
<body>
	<div id="wrap" style="box-shadow: 5px 5px 5px rgba(0,0,0,0.2),
										-5px -5px 5px rgba(0,0,0,0.2),
										5px -5px 5px rgba(0,0,0,0.2),
										-5px 5px 5px rgba(0,0,0,0.2);
							height: 60vh;
							padding: 20px;">
		<div class="col-lg-6">
			<c:import url="/article3/inc_classInfo/community.jsp"></c:import>
			
			
		</div>
		<div class="col-lg-6">
					<h3>
				<font color="tomato">메모장</font>
				</h3>
<textarea class="form-control" maxlength="1000" rows="20"></textarea>
		</div>
	</div>
</body>
</html>