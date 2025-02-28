<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width">
<!--외부참조(script.js, style.css) START LINE -->
<!--JQUERY(1EA), BOOTSTRAP(2EA) CDN START LINE-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--외부참조 + CDN END -->
<style type="text/css">
#inc_header{
	height: 100px;
	position: relative;
	width: 100vw;
	background: rgba(255,255,255,1);
	border-bottom: 0.5px solid rgba(0,0,0,0.5);
}
#inc_header *{
	color: rgba(0,0,0,0.5);
}
#inc_menuList{
	content: "";
	position: absolute;
	font-size: 20px;
	font-weight: bold;
	right: 3vw;
}
#inc_menuList>ul>li{
 	margin-left: 10px;
 	margin-right: 10px;
 	margin-top: 10px;
 	margin-bottom: 10px;
 	vertical-align: middle;
}
#inc_menuList>ul>li>a{
	text-decoration: none;
	transition: all 0.5s
}
#inc_menuList>ul>li>a:HOVER{
	color: #ff6347;
}
#inc_mainlogo{
	animation-duration: 2s;
	animation-name: visible_incmainlogo;
	padding: 0px;
	margin: 0px;
}
@keyframes visible_incmainlogo{
	0% {
 		opacity: 0;
	}
	100% {
		opacity: 1;
		
	}
}

.inc_floating{
	position: absolute;
	top: 30px;
}

/* 햄버거메뉴 */
	#inc_hamburger {
		display: inline;
		z-index: 10000;
		position: fixed;
		float: right;
		right: 1vw;
		top: 50px;
		width: 50px;
		height: 50px;
		transform: translate(-50%, -50%);
		cursor: pointer;
		background: rgba(0,0,0,0.9);
		border-radius: 50%;
		border: none;
		outline: none;
		transition: all 0.5s;
	}
	#inc_hamburger:HOVER{
		background-color: tomato;
	}
	#inc_hamburger>span {
		position: absolute;
		width: 30px;
		height: 4px;
		top: 50%;
		left: 50%;
		background: rgba(255,255,255,0.8);
		border-radius: 2px;
		overflow: hidden;
		transition: all 0.3s linear;
	}
	
	#inc_hamburger>span::before {
		content: "";
		position: absolute;
		width: 0;
		height: 100%;
		top: 0;
		right: 0;
		background: rgba(255,255,255,0.2);
		transition: all 0.3s linear;
	}
	
	#inc_hamburger>span:nth-child(1) {
		animation: span-first-off 0.5s ease-in-out;
		animation-fill-mode: forwards;
	}
	
	#inc_hamburger>span:nth-child(2) {
		animation: span-second-off 0.5s ease-in-out;
		animation-fill-mode: forwards;
	}
	
	#inc_hamburger>span:nth-child(3) {
		animation: span-third-off 0.5s ease-in-out;
		animation-fill-mode: forwards;
	}
	
	#inc_hamburger.on:hover span::before {
		width: 100%;
		transition: all 0.3s linear;
	}
	
	#inc_hamburger.on span:nth-child(1) {
		animation: span-first-on 0.5s ease-in-out;
		animation-fill-mode: forwards;
	}
	
	#inc_hamburger.on span:nth-child(2) {
		animation: span-second-on 0.5s ease-in-out;
		animation-fill-mode: forwards;
	}
	
	#inc_hamburger.on span:nth-child(3) {
		animation: span-third-on 0.5s ease-in-out;
		animation-fill-mode: forwards;
	}
	
	@keyframes span-first-on {
		0% {
			transform: translate(-50%, -300%);
		}
		30% {
			transform: translate(-50%, -50%);
		}
		100% {
			transform: translate(-50%, -50%) rotate(-45deg);
		}
	}
	
	@keyframes span-first-off {
		0% {
			transform: translate(-50%, -50%) rotate(-45deg);
		}
		30% {
			transform: translate(-50%, -50%) rotate(0deg);
		}
		100% {
			transform: translate(-50%, -300%);
		}
	}
	
	@keyframes span-second-on {
		0% {
			transform: translate(-50%, -50%);
		}
		25% {
			background: gray;
		}
		50% {
			transform: translate(-50%, -50%) scale(1);
		}
		100% {
			transform: translate(-150%, -50%) scale(0);
		}
	}
	
	@keyframes span-second-off {
		0% {
			transform: translate(-150%, -50%) scale(0);
		}
		25% {
			background: gray;
		}
		50% {
			transform: translate(-50%, -50%) scale(1);
		}
		100% {
			transform: translate(-50%, -50%);
		}
	}
	
	@keyframes span-third-on {
		0% {
			transform: translate(-50%, 200%);
		}
		30% {
			transform: translate(-50%, -50%);
		}
		100% {
			transform: translate(-50%, -50%) rotate(45deg);
		}
	}
	
	@keyframes span-third-off {
		0% {
			transform: translate(-50%, -50%) rotate(45deg);
		}
		30% {
			transform: translate(-50%, -50%) rotate(0deg);
		}
		100% {
			transform: translate(-50%, 200%);
		}
	}
	
	#inc_onmenuset{ 
		position: fixed;
		float: right;
		top: 0px;
		right: 0px;
		width: 200px;
		height: 100vh;
		z-index: 1000;
		padding-top: 100px;
		animation-duration: 1s;
		animation-name: slide_for_left;
		background-color: rgba(255,255,255,0.8);
	}
	.TH_menubar{
		display:none;
	}
	
	@keyframes slide_for_left{
		0%{
			background-color: rgba(255,255,255,0);
		}
		100%{
			background-color: rgba(255,255,255,0.8);
		}
	}
	
</style>
<title></title>
</head>
<body style="overflow-x: hidden;">
	<header id="inc_header">
		<div id="inc_mainlogo" class="col-xs-2" align="center">
			<a href="${contextpath}/main.jsp" style="display:inline-block; padding: 10px; vertical-align: middle; width: 100px; height: 100px;">
				<img src="${contextpath}/3_img/large.png" style="width:80px; height: 80px;">
			</a>
		</div>
		<div class="col-xs-10">
			<div class="inc_floating" align="left">
				<div class="col-xs-9">
					<form action="" method="GET">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="카테고리 + 제목" style="color: gray;" >
							<div class="input-group-btn">
								<button type="submit" class="btn btn-default">
									<span class="glyphicon glyphicon-search" style="color: black; font-size: 15px;"></span>
								</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-xs-3">
				
<c:if test="${sessionScope.id ne null}">
				
					<button id="inc_hamburger">
						<span></span>
						<span></span>
						<span></span>
					</button>
					<div id="inc_menuList">
						<ul class="list-inline">
							<c:if test="${sessionScope.Group == 2}">
								<li>
									<a href="javascript:;" id="message_info_h" class="TH_menubar">
										내 쪽지함
									</a>
								</li>
								<li>
									<a href="javascript:;" id="logout_h" class="TH_menubar">
										로그아웃
									</a>
								</li>
								<li>
									<a href="/Learn_N_Run/article1/getUserInfo.do" class="TH_menubar">
										 회원정보 수정
									</a>
								</li>
								<li>
									<a href="/Learn_N_Run/article2/crt_getAllClassList.me" class="TH_menubar">
										 내 클래스
									</a>
								</li>
								<li>
									<a href="/Learn_N_Run/article1/getMyClassInfo.do" class="TH_menubar">
										 내 수강목록
									</a>
								</li>
								<li>
									<a href="/Learn_N_Run/article2/jjim.me" class="TH_menubar">
										 찜목록
									</a>
								</li>
								<li>
									<a href="javascript:"; id="coupon_h" class="TH_menubar">
										 쿠폰보관함
									</a>
								</li>
							</c:if>
							<c:if test="${sessionScope.Group == 1 }">
								<li>
									<a href="javascript:;" id="message_info_h" class="TH_menubar">
										내 쪽지함
									</a>
								</li>
								<li>
									<a href="javascript:;" id="logout_h" class="TH_menubar">
										로그아웃
									</a>
								</li>
								<li>
									<a href="/Learn_N_Run/article1/getUserInfo.do" class="TH_menubar">
										 회원정보 수정
									</a>
								</li>
								<li>
									<a href="/Learn_N_Run/article1/AddCreator.jsp" class="TH_menubar">
										크리에이터 지원
									</a>
								</li>
								<li>
									<a href="/Learn_N_Run/article1/getMyClassInfo.do" class="TH_menubar">
										 내 수강목록
									</a>
								</li>
								<li>
									<a href="/Learn_N_Run/article2/jjim.me" class="TH_menubar">
										 찜목록
									</a>
								</li>
								<li>
									<a href="javascript:"; id="coupon_h" class="TH_menubar">
										 쿠폰보관함
									</a>
								</li>
							</c:if>
							</ul>
						</div>
</c:if>
				</div>
			</div>
		</div>
	</header>

<c:import url="/1_Include/couponEx.jsp"></c:import>

<!-- 햄버거메뉴 -->	
<script type="text/javascript">
	var inc_onmenuset = document.querySelector('#inc_menuList>ul');
	var TH_menubar = document.querySelectorAll('.TH_menubar');
	
	document.getElementById('inc_hamburger').addEventListener('click', function() {
		if (this.className == 'on'){
			
			this.classList.remove('on');

			inc_onmenuset.removeAttribute('id','inc_onmenuset');
			
			for ( var it in TH_menubar) {
					TH_menubar[it].style.display = 'none';
			};
			
		}else{
			
			this.classList.add('on');
			
			inc_onmenuset.setAttribute('id','inc_onmenuset');
			
			for ( var it in TH_menubar) {
				TH_menubar[it].style.display = 'block';
			};
			
		}});
	
	
	
	$(document).on("click","#logout_h", function() {
		var result = confirm("정말 로그아웃하시겠습니까?");
		if(result){
			location.href="/Learn_N_Run/article1/logout.do";	
		}else{
			return false;
		}
	});
	
</script>
</body>
</html>