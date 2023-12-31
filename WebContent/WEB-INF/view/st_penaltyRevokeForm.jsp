<%@page import="com.yameokja.mc.ObjApplyViewDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패널티 회수 요청</title>

<style type="text/css">
/* 사용할 때 구문 : font-family: 'IBM Plex Sans KR', sans-serif; */
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500&display=swap');
*
{
	font-family: 'IBM Plex Sans KR', sans-serif;
}

body
{
	margin: 0;
}

.st_info_insert
{
	width: 70vw;
	margin-left: 15vw;
	padding-top: 5vh;
	padding-bottom: 5vh;
	border: 5px solid #F7F4EA;
	border-radius: 40px;
}

.top
{
	width: 70vw;
	margin-left: 15vw;
	text-align: center;
}

.igroup
{
	margin-left: 10vw;
	margin-top: 2vh;
	width: 55vw;
	display: flex;
}

.igroup2
{
	margin-top: 0vh;
	margin-left: 10vw;
	width: 55vw;
	display: flex;
}


#button, .input
{
	
	display: inline-block;
	outline: none;
	cursor: pointer;
	font-weight: 500;
	border-radius: 3px;
	padding: 0 16px;
	border-radius: 4px;
	background: #F7F4EA;
	line-height: 1.15;
	font-size: 14px;
	height: 33px;
	word-spacing: 0px;
	letter-spacing: .0892857143em;
	text-decoration: none;
	text-transform: uppercase;
	min-width: 64px;
	border: none;
	text-align: center;
	box-shadow: 0px 3px 1px -2px rgb(0 0 0 / 20%), 0px 2px 2px 0px rgb(0 0 0 / 14%), 0px 1px 5px 0px rgb(0 0 0 / 12%);
	transition: box-shadow 280ms cubic-bezier(0.4, 0, 0.2, 1);
	:hover 
	{
	    background: rgb(98, 0, 238);
	    box-shadow: 0px 2px 4px -1px rgb(0 0 0 / 20%), 0px 4px 5px 0px rgb(0 0 0 / 14%), 0px 1px 10px 0px rgb(0 0 0 / 12%);
	}
                
}

.errorMsg
{
	color: #ef6351;
	font-size: small;
	display: none;
}
.input_group {
    display: flex;
    align-items: center;
}
.title
{
	background-color: #F7F4EA;
	width: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 10px 0 0 10px;
	margin-right: 1vw;
	/* border: 1px solid; */
	height: 3vh;
	padding: 0.5vh 0.5vh 0.5vh 0.5vh
}

 .sendResult
{
	background-color: #F7F4EA;
    width: auto;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 4px;
    margin-right: 1vw;
    border: 0px;
    padding: 1vh;
    box-shadow: 0px 3px 1px -2px rgb(0 0 0 / 20%), 0px 2px 2px 0px rgb(0 0 0 / 14%), 0px 1px 5px 0px rgb(0 0 0 / 12%);
}


#span
{
	padding-top: 10px;
	height: 25px;
}
.sendBtn
{
	display: flex;
    flex-direction: row;
    justify-content: center;
    margin-top: 1%;
}

.checkLabel
{
	display: flex;
    flex-direction: row;
    justify-content: center;
    padding-left: 40vw;
    margin-top: 1% 
}

#myTextarea
{
	display: none;
}
#objReport
{
	cursor: not-allowed;
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	$(function()
	{
		$(".left_sub_menu").hide();
		$(".has_sub").click(function()
		{
			$(".left_sub_menu").fadeToggle(300);
			if ($('#checkOverlay').val() == "true")
			{
				$('.overlay').css("position", "fixed");
				$('.overlay').css("width", "0%");
				$('.overlay').css("height", "0%");
				$('.overlay').css("background", "rgba(0, 0, 0, 0.7)");
				$('.overlay').css("z-index", "0");
				$('#checkOverlay').attr("value", "false");
			} else
			{
				$('.overlay').css("position", "fixed");
				$('.overlay').css("width", "77%");
				$('.overlay').css("height", "100%");
				$('.overlay').css("background", "rgba(0, 0, 0, 0.7)");
				$('.overlay').css("z-index", "3");
				$('.overlay').css("margin-top", "1.011vh");
				$('.overlay').css("margin-left", "23%");
				$('#checkOverlay').attr("value", "true");
			}

		});
		// 왼쪽메뉴 드롭다운
		$(".sub_menu ul.small_menu").hide();
		$(".sub_menu ul.big_menu").click(function()
		{
			$("ul", this).slideToggle(300);
		});
		// 외부 클릭 시 좌측 사이드 메뉴 숨기기
		$('.overlay').on('click', function()
		{
			$('.left_sub_menu').fadeOut();
			$('.overlay').css("position", "fixed");
			$('.overlay').css("width", "0%");
			$('.overlay').css("height", "0%");
			$('.overlay').css("background", "rgba(0, 0, 0, 0.7)");
			$('.overlay').css("z-index", "0");
			$('#checkOverlay').attr("value", "false");
		});
	});
	
	
	$(function(){
		
		$(".sendResult").click(function()
		{
			
			if($("#revo_rs").val().trim() == "" || $("#revo_rs").val().trim() == null)
			{
				alert("이의제기 사유를 입력해주셔야 합니다.");
				$("#revo_rs").focus();
				return;
			}
			
			$("#userForm").submit();		
		});
	});

</script>

</head>
<body>
<form action="revoapply.action" id="userForm" method="post">
<div class="bframe">
	
	
	<!-- header -->
	<div class="header">
		<c:import url="header_user.jsp"></c:import>
	</div>

	
	
	<div class="middle">
	<c:import url="sideBar_user.jsp"></c:import>
		<div class="top">
			<h1>패널티 회수 요청서</h1>
			<input type="hidden" id="req_apply_num" name="req_apply_num" value="${req.req_apply_num }">
			<hr>
		</div>
		
		<!-- 입력 부분 -->
		<div class="st_info_insert">
		
			<div class="st_info_insert2">
				<div class="igroup">
					<h2>${req.st_name }</h2>
				</div>
			
			
				<div class="igroup">
					<div style="width: 40%;">
						${req.chbox_name }
					</div>
					<div>
						${req.yn_name }
					</div>
				</div>
				<br>
			
				<div class="igroup" >
					<div class="title" style="margin-bottom: 0.5vh;">
						<span>가게정보오류수정 요청 사유</span>
					</div>
				</div>
				<div class="igroup2" style="width: 100%;">
					<textarea id="objReport" readonly="readonly" style="width: 72%; height: 5em; 3px; resize: none;">${req.req_rs }</textarea>
				</div>
				
				<br><br>
				<hr style="border: 2px solid #F7F4EA;">
				<br>
		
				<div class="igroup" >
					<div class="title" style="margin-bottom: 0.5vh;">
						<span>패널티 회수 요청 사유 입력란</span>
					</div>
				</div>
				
				<div class="igroup2" style="width: 100%;">
					<textarea id="revo_rs" name="revo_rs" placeholder="패널티 회수 요청 사유를 입력해주세요." style="width: 72%; height: 5em; 3px; resize: none;"></textarea>
				</div>
				
				<br>
				<div class="igroup2" style="width: 100%;">
					<i style="font-size: 8pt;">가게 정보를 수정했음을 증명할 수 있는 캡쳐 사진을 업로드 해주시면 빠른 처리에 도움이 됩니다.</i>
				</div>
				
				<div class="igroup" >
					<div style="width: 100%;">
						<button id="button" style="font-size: 8pt;">사진 업로드</button>
					</div>
				</div>
				
					
				<br><br>
				<div class="sendBtn">
					<input type="button" class="sendResult" value="요청 하기">
				</div>

			</div>
		</div>
	</div>
	
	
	<!-- footer -->
	<div><c:import url="/WEB-INF/view/footer.jsp"></c:import></div>
</div>
</form>


</body>
</html>