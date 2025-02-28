<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="${contextpath}/2_js/channelio.js"></script>
<link href="${contextpath}/2_css/aside.css" rel="stylesheet">

<!-- result값 조건별 alert -->
	<c:set var="result" value="${requestScope.result }"/>
	<c:if test="${result==0 }">
		<script>alert("비밀번호가 틀립니다.")</script>
	</c:if>
	<c:if test="${result==-1 }">
		<script>alert("아이디가 틀립니다.")</script>
	</c:if>

<script type="text/javascript">
$(function(){
	
	var messageNo;
	$(".login-window").click(function() {
		
		var loginBox = $(this).attr('href');

		$(loginBox).fadeIn(300);
		
		var popMargTop = ($(loginBox).height() + 24) / 2; 
		var popMargLeft = ($(loginBox).width() + 24) / 2; 
		
		$(loginBox).css({ 
			'margin-top' : -popMargTop,
			'margin-left' : -popMargLeft
		});
		
		$('body').append('<div id="mask"></div>');
		$('#mask').fadeIn(300);
		
		return false;
	});
	
	$('div').on('click','a.close_h, #mask' ,function() { 
	  $('#mask , .login-popup').fadeOut(300 , function() {
		$('#mask').remove();  
	}); 
	return false;
});
	
	/*받은 쪽지함에서 쪽지 작성을 눌렀을때 */
	$(".message_send_h").click(function(){
		$(".message_main").fadeOut("fast");
		$(".container1_h").fadeIn("fast");
		$("#real_receiver_id").val('');
	});

	/*쪽지 쓰기에서 돌아가기를 눌렀을때*/
	$(".reset_h").click(function(){
		$(".message_main").fadeIn("fast");
		$(".container1_h").fadeOut("fast");
	});

	/*쪽지 상세보기에서 돌아가기를 눌렀을때*/
	$(".reset1_h").click(function(){
		$("#remo").remove();
		$.ajax({
			type:'POST',
			url : "selectMessage.do",
			success : function(data,textStatus,jqXHR) {
				$(".mask_h").fadeIn("fast")
				var jsonInfo = JSON.parse(data);
				var messageInfo = "";
					
				for(var i in jsonInfo.message){
					if(jsonInfo.message[i].read_yn==0){ 
						messageInfo += "<tr style='color:blue' id='detail_content' data-value="+jsonInfo.message[i].messageNo+"><td>"+jsonInfo.message[i].send_id+"</td>"
						messageInfo += "<td style='color:blue'>"+jsonInfo.message[i].content+"</td>";
						messageInfo += "<td style='color:blue'>"+jsonInfo.message[i].send_time.replace(".",":")+"</td>";
						}
					else{
						messageInfo += "<tr id='detail_content' data-value="+jsonInfo.message[i].messageNo+"><td>"+jsonInfo.message[i].send_id+"</td>"
						messageInfo += "<td>"+jsonInfo.message[i].content+"</td>";
						messageInfo += "<td>"+jsonInfo.message[i].send_time.replace(".",":")+"</td>";
						}
					
				}
				if(jsonInfo.message.read_yn==0){
					$("#detail_content").css()
				}
				$(".table_h_h").html(messageInfo);
				page();
			},error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
          });
		$(".container2_h").fadeOut("fast");
		$(".message_main").fadeIn("fast");
	});


	/*나가기 버튼을 눌렸을때, mask 없앰*/
	$(".outMessage_h").click(function(){
		$(".mask_h").css("display","none");
		$("#remo").remove();
	});

	/*답장 버튼을 눌렀을때*/
	$(".send_Message_h").click(function(){
		var receiver_id = $("#receiver_id").val();
		$(".container2_h").fadeOut("fast");
		$(".container1_h").fadeIn("fast");
	});

	/*쪽지함을 눌렀을때*/
	$("#message_info_h").click(function() {
		$.ajax({
			type:'POST',
			url : "selectMessage.do",
			success : function(data,textStatus,jqXHR) {
				$(".mask_h").fadeIn("fast")
				var jsonInfo = JSON.parse(data);
				var messageInfo = "";
					
				for(var i in jsonInfo.message){
					if(jsonInfo.message[i].read_yn==0){ 
						messageInfo += "<tr style='color:blue' id='detail_content' data-value="+jsonInfo.message[i].messageNo+"><td>"+jsonInfo.message[i].send_id+"</td>"
						messageInfo += "<td style='color:blue'>"+jsonInfo.message[i].content+"</td>";
						messageInfo += "<td style='color:blue'>"+jsonInfo.message[i].send_time.replace(".",":")+"</td>";
						}
					else{
						messageInfo += "<tr id='detail_content' data-value="+jsonInfo.message[i].messageNo+"><td>"+jsonInfo.message[i].send_id+"</td>"
						messageInfo += "<td>"+jsonInfo.message[i].content+"</td>";
						messageInfo += "<td>"+jsonInfo.message[i].send_time.replace(".",":")+"</td>";
						}
					
				}
				if(jsonInfo.message.read_yn==0){
					$("#detail_content").css()
				}
				$(".table_h_h").html(messageInfo);
				page();
			},error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
          });
		
	});
	
	function page() {
		$("table.paginated").each(function() {
			var pagesu = 5;
			var currentPage = 0;
			var numPerPage = 7;
			var $table = $(this);
			
			var numRows = $table.find('tbody tr').length;
			var numPages = Math.ceil(numRows / numPerPage);
			if (numPages==0) return;
			var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');
			var nowp = currentPage;
			var endp = nowp+10;
		  $table.bind('repaginate', function() {
			  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
			  
			   $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
			   $("#remo").html("");
			   
			   if (numPages > 1) {     // 한페이지 이상이면
			    if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
			     nowp = 0;     // 1부터 
			     endp = pagesu;    // 10까지
			    }else{
			     nowp = currentPage -5;  // 6넘어가면 2부터 찍고
			     endp = nowp+pagesu;   // 10까지
			     pi = 1;
			    }
			    
			    if (numPages < endp) {   // 10페이지가 안되면
			     endp = numPages;   // 마지막페이지를 갯수 만큼
			     nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
			    }
			    if (nowp < 1) {     // 시작이 음수 or 0 이면
			     nowp = 0;     // 1페이지부터 시작
			    }
			   }else{       // 한페이지 이하이면
			    nowp = 0;      // 한번만 페이징 생성
			    endp = numPages;
			   }
			    // [이전]
			      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[이전]&nbsp;</span>').bind('click', {newPage: page},function(event) {
			          if(currentPage == 0) return; 
			          currentPage = currentPage-1;
			    $table.trigger('repaginate'); 
			    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
			   }).appendTo($pager).addClass('clickable');
			    // [다음]
			      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[다음]&nbsp;</span>').bind('click', {newPage: page},function(event) {
			    if(currentPage == numPages-1) return;
			        currentPage = currentPage+1;
			    $table.trigger('repaginate'); 
			     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
			   }).appendTo($pager).addClass('clickable');
			     
			     $($(".page-number")[2]).addClass('active');
			  });
			   $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
			   $pager.appendTo($table);
			   $table.trigger('repaginate');
		});
		
	}

	/*받은 쪽지함에서 컬럼한개를 눌렀을때 상세페이지 로딩*/
	$(document).on("click","#detail_content",function(){
		var hi= $(this).attr("data-value");
		$.ajax({
			type: "POST",
			url : "selectDetailMessage.do",
			data : {"messageNo" : hi},
			success : function(data,textStatus,jqXHR) {
				$(".message_main").fadeOut("fast");
				$(".container2_h").fadeIn("fast");
				var jsonIn = JSON.parse(data);
				$("#receiver_id").val(jsonIn.send_id).html("<span>"+jsonIn.send_time+"</span");
				$(".textsize").text(jsonIn.content);
			},error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
			});
	});
	
	/*쪽지작성이후 보내기를 눌렀을때*/
	$(document).on("click","#sendMessage_h",function(){
		$.ajax({
		type: "POST",
		url : "insertMessage.do",
		data : {"receiver_id" : $("#real_receiver_id").val(), "content" : $(".textsize").val() },
		success : function(data,textStatus,jqXHR) {
			if(data==1){
				alert("받는이 아이디를 확인하세요")
			}else{
				alert("발송 성공")
				$("container1_h").fadeOut("fast");
				$(".message_main").fadeIn("fast");	
			}
			
		},error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
		});
	});
	
	/*쪽지 삭제를 눌렀을때*/
	$(document).on("click","#deleteMessage_h", function() {
		var hi= $("#detail_content").attr("data-value");
		var result = confirm("해당 메세지를 삭제하시겠습니까?")
		if(result){
			$.ajax({
				type:"POST",
				url : "deleteMessage.do",
				data : {"messageNo" : hi},
				success : function(data) {
					$(".message_main").fadeIn("fast");
					$(".mask_h").fadeOut("fast");
					alert("삭제가 완료 되었습니다.")
				},error: function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});	
			
		}else{
			return false;
		}
		
	})
});
</script>

</head>
<body>
	
<!-- TODO: login-box -->
    <div id="login-box" class="login-popup">
		<form class="form_h" action="Learn_N_Run/article1/login.do" method="post">
			<a class="close_h">EXIT</a>
	        <svg id="ryan" viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
	            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243" stroke="#000" stroke-width="2.5" />
	            <g class="ears">
	                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(-10,38,24)" />
	                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(10,82,24)" />
	            </g>
	            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000" stroke-width="2.5" />
	            <g class="eyes">
	                <!-- left eye and eyebrow-->
	                <line x1="37" x2="50" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
	                <circle cx="44" cy="55" r="3" fill="#000" />
	                <!-- right eye and eyebrow -->
	                <line x1="70" x2="83" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
	                <circle cx="76" cy="55" r="3" fill="#000" />
	            </g>
	            <g class="muzzle">
	                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" />
	                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round" />
	                <polygon points="59,63.5,60,63.4,61,63.5,60,65" fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
	            </g>
	            <path d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105" fill="#fff" />
	        </svg>
	        <input class="H_inputText" id="H_login_id" name="userid" type="text" placeholder="email">
	        <input class="H_inputText" id="H_login_pass" name="userpass" type="password" placeholder="Password">
	        <input type="submit" class="H_submit" value="Let's log in!">
	        <a href="${contextpath}/article1/join.jsp" class="H_join">Join us!</a>
	    </form>
   </div>
<!-- 로그인 팝업 -->	
	
<!-- TODO: 받은 쪽지함 -->
	<div class="mask_h">
		<div class="message_main">
			<div class="message_top">
				<span>&nbsp;받은 쪽지함</span>
				<button type="button" class="outMessage_h hover_button_h">나가기</button>
			</div>
			<div class="message_content">
				<br>
				<!-- <button id="message_send_h">메세지 보내기</button> -->
				<div class="table_h">
					<table class="paginated">
						<thead>
							<tr>
								<td width="15%">보낸 사람</td>
								<td width="60%">내 용</td>
								<td width="15%">받은 시간</td>
							</tr>
						</thead>
						<tbody class="table_h_h">
						</tbody>
					</table>
				</div>
			</div>
			<div align="right" class="bottom_button">
				<button type="button" class="message_send_h hover_button_h">쪽지 쓰기</button>
			</div>
		</div>
		<!--end of 받은 쪽지함-->

		<!--start of 쪽지 쓰기-->
			<div class="container1_h">
				<div class="message_top">
					<span>&nbsp;쪽지 쓰기</span>
					<button type="button" class="outMessage_h hover_button_h" >나가기</button>
				</div>
					<div class="message_content">
							<div class="message_send_top">
							<span>받는 사람</span> :
								<input type="text" id="real_receiver_id" name="receiver_id" placeholder="받는사람 ID">
							</div>
							<div class="message_send_content">
								<textarea class="textsize" name="content"></textarea>
							</div>
					</div>
					<div class="bottom_button">
						<button type="button" id="sendMessage_h" class="send_Message_h hover_button_h">보내기</button>&nbsp;
						<button type="button" class="reset_h hover_button_h" >돌아가기</button>
					</div>
			</div>
	
		<!--end of 쪽지 보내기 -->

		<!--start of 쪽지 상세보기 -->
		<div class="container2_h">
			<div class="message_top">
				<span>&nbsp;받은 쪽지</span>
				<button type="button"class="outMessage_h hover_button_h">나가기</button>
			</div>
			<div class="message_content">
					<div class="message_send_top">
					<span>받는 사람</span> :
						<input type="text" value="${sessionScope.id }" readonly="readonly">
					</div>
					<div class="message_send_top">
					<span>보낸 사람</span> :
						<input type="text" id="receiver_id" readonly="readonly">
					</div>
					<div class="message_send_content">
						<textarea class="textsize" name="content" readonly></textarea>
					</div>
			</div>
			<div class="bottom_button">
				<button type="button" id="deleteMessage_h" class="message_delete_h hover_button_h">삭제하기</button>
				<button class="send_Message_h hover_button_h">답장하기</button>&nbsp;
				<button type="button" class ="reset1_h hover_button_h">돌아가기</button>
			</div>
		</div>
	</div>
	<!--end of 쪽지보내기 -->

<script src="${contextpath}/2_js/ryan.js"></script>
</body>
</html>