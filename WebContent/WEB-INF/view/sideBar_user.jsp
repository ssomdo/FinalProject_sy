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
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/side_bar.css">

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
</head>
<body>
<div class="sideBarContainer">
<!-- 왼쪽 사이드 바 -->
<div class="left side-menu">
	<div class="sidebar-inner">
		<div id="sidebar-menu">
			<ul class="has_sub_menu">
				<li class="has_sub"><a href="javascript:void(0);"
					class="waves-effect"> <i class="fas fa-bars"
						style="color: #fff"></i>
				</a></li>
			</ul>
		</div>
	</div>
</div>

<div class="col-md-2" id="mleft">
	<div class="left_sub_menu">
		<div class="sub_menu">
			<h2>MENU</h2>
			<ul class="big_menu">
				<c:if test="${not empty sessionScope.st_num }">
				<li>가게 리스트<i class="arrow fas fa-angle-right"></i></li>
				<ul class="small_menu">
					<c:forEach var="st" items="${st_list }">
						<li><a href="storeinfo.action?stNum=${st.st_num }" class="samll_menuA" id="${st.st_num }">${st.st_name }</a>
					</c:forEach>
				</ul>
				</c:if>
			</ul>
			<ul class="big_menu">
				<li>접수 내역<i class="arrow fas fa-angle-right"></i></li>
				<ul class="small_menu">
					<li><a href="user_rv_report.action" class="small_menuA">리뷰신고 내역</a></li>
					<li><a href="user_stupdate_relist.action" class="small_menuA">가게정보오류수정요청 내역</a></li>
					<li><a href="user_stinout_list.action" class="small_menuA">가게 등/폐업 신청 내역</a></li>
					<c:if test="${not empty sessionScope.st_num }">
					<li><a href="objlist.action" class="small_menuA">이의제기 요청 내역</a></li>
					<li><a href="penaltylist.action" class="small_menuA">패널티 회수 요청 내역</a></li>		
					</c:if>
				</ul>
			</ul>
			<ul class="big_menu">
				<li>경고 내역<i class="arrow fas fa-angle-right"></i></li>
				<ul class="small_menu">
					<li><a href="userrvpenalty.action" class="small_menuA">리뷰 경고 내역</a></li>
					<c:if test="${not empty sessionScope.st_num }">
					<li><a href="stinfoupdaterelist.action" class="small_menuA">가게정보오류수정요청 경고 내역</a></li>
					</c:if>
				</ul>
			</ul>
			<c:if test="${not empty sessionScope.st_num }">
			<ul class="big_menu">
    			<li><a href="storeOutform.action?user_num=${user_num}" class="small_menuA">폐업신청</a></li>
			</ul>
			</c:if>
		</div>
	</div>
	<div class="overlay">
		<input type="hidden" id="checkOverlay" value="false">
	</div>
</div>
</div>

</body>
</html>