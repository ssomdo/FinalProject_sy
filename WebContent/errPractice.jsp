<%@page import="com.yameokja.mc.RvApplyViewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	RvApplyViewDTO dto = (RvApplyViewDTO)request.getAttribute("review");
	//System.out.print(dto.getUser_id());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewReportForm.jsp</title>
<style type="text/css">

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

.button
{
	margin-top: 3vh;
	margin-bottom: 3vh;
	text-align: center;
}

button, .input
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
	padding-left: 15vh;
}

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	
	function rejectBtn()
	{
		if ($("#reviewReject").val() == "")
		{
			$("#err").css("display", "inline");
			$("#reviewReject").focus();
			return;
		}
	};
</script>

</head>
<body>

<div class="bframe">
	
	<!-- header -->
	<div><c:import url="/WEB-INF/view/header_admin.jsp"></c:import></div>
	
	<div class="middle">
		<div class="top">
			<h1>가게정보오류수정요청서</h1>
			<hr>
		</div>
		
		<!-- 입력 부분 -->
		<div class="st_info_insert">
		
			<div class="igroup">
				<h2>토리네</h2>
			</div>
			
			<div class="igroup">
				<div style="width: 30%;">
					화장실존재여부
				</div>
				<div>
					예
				</div>
			</div>
			<br>
		
			
			<div class="igroup2" style="width: 100%;">
				<span style="padding-top: 10vh; padding-right: 5vh;">요청사유</span>
				<textarea id="reviewReport" readonly="readonly" style="width: 61%; height: 8em; resize: none;">리뷰내용이 일치하지 않음.</textarea>
			</div>
			<div style="width: 87%; text-align: right; margin-top: 1vh;">
				<button id="agree" style="margin-left: 1vh;">요청승인</button>
			</div>
			
			<div style="width: 87%; text-align: right; margin-top: 2vh; margin-bottom: 2vh;">
				<input class="input" type="submit" style="width: 120px; border-radius: 20px;" value="승인">
			</div>
			
			<div class="igroup2" style="width: 100%;">
				<textarea id="reviewReject"  style="width: 72%; height: 10em; resize: none; border-radius: 10px;" placeholder="반려사유기재"></textarea>
			</div>
			
			<span class="errorMsg" id="err">반려사유를 입력해야 합니다.</span>
			<div style="width: 87%; text-align: right; margin-top: 1vh;">
				<button value="중재" onclick="mediateBtn()">중재</button>
				<button value="반려" onclick="rejectBtn()">반려</button>
			</div>
			
		</div> <!-- st_info_insert -->
	</div>
	
	
	<!-- footer -->
	<div><c:import url="/WEB-INF/view/footer.jsp"></c:import></div>

</div>

</body>
</html>