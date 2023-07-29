<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS -->
<%-- <link rel="stylesheet" href="<%=cp %>/css/StoreMain.css"> --%>

<!-- IONICONS -->
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<!-- JS 
<script src="assets/js/main.js"></script> -->


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<style type="text/css">
	.container
	{
		position: static;
		display: flex;
		justify-content: flex-start;
		width: 100%;
		align-items: stretch;
		font-family: 'Black Han Sans', sans-serif;
		font-family: 'Orbit', sans-serif;
		margin: 0;
	}
	
	.side-menu 
	{
		top: 50px;
		width: 5vw;
		z-index: 10;
		background: #ef6351;
		border-right: 1px solid rgba(0, 0, 0, 0.07);
		height: 90%;
		margin-top: 6.2vh;
		position: fixed;
		align-items: center;
	}
	
	.has_sub_menu
	{
		list-style-type: none;
	}
	
	#sidebar-menu li
	{
		font-size: 1.5rem;
	}

    #sidebar-menu .fas
    {
    	padding-top: 3vh;
    	padding-left: 1.2vw
    }
	.left_sub_menu 
	{
		position: fixed;
		top: 50px;
		width: 18vw;
		z-index: 10;
		left: 5.07vw;
		background: white;
		height: 90%;
		margin-top: 5.7vh;
	}

	.sub_menu 
	{
		margin-top: 50px;
	}

	.left_sub_menu>.sub_menu li:hover 
	{
		color: ff5858;
		background-color: #e1e1e1;
	}

	.left_sub_menu>.sub_menu li
	{
		color: black;
		font-size: 17px;
		font-weight: 600;
		padding: 20px 0px 8px 14px;
		border-bottom: 1px solid #e1e1e1;
	}

	.sub_menu>h2
	{
		padding-bottom: 4px;
		border-bottom: 3px solid #797979;
		margin-top: 30px;
 		font-size: 21px;
		font-weight: 600;
		color: #333;
		margin-left: 10px;
		margin-right: 10px;
		font-family: 'NotoKrB';
	}

	.fas 
	{
		color: #ff5858;
		font-size: 20px;
		line-height: 20px;
		float: right;
		margin-top: 0.6vh;
		margin-right: 2vw;
	}

	.sub_menu>.big_menu>.small_menu li
	{
		color: black;
		font-size: 14px;
		font-weight: 600;
		border-bottom: 0px solid #e1e1e1;
	}

	.big_menu
	{
		list-style-type: none;
		cursor: pointer;
	}

	.samll_menu
	{
		position: fixed;
		list-style-type: none;
		padding-inline-start: 0px;
		list-style: none;
		transition-duration: 0.5s;
	}

	.small_menuA
	{
		color: black;
		text-decoration-line : none;
		background-color: transparent;
		margin-bottom: 1vh
	}

	.big_menu ul
	{
		margin-top: 0;
		margin-bottom: 0;
	}

	.has_sub
	{
		width: 100%;
	}
	
	.storemain_body
	{
		display: flex;
		flex-direction: column;
		width: 50%;
		height: 100%;
		margin-left: 10vw;
	}
	
	.storemain_bodyTop
	{
		position: static;
		display: flex;
		height: 15vh
	}
	
	.storeName
	{
		font-family: 'Black Han Sans', sans-serif;
		font-size: 40pt;
	}
	
	.storemain_chart
	{
		display: flex;
		flex-direction: column;
	}
	
	.doughnutChart
	{
		width: 55vw;
		margin-bottom: 10vh;
	}
	
	.chart_content
	{
		max-width: 100%
	}
	
	canvas
	{
		width: 80vw;
		heigt: 40vh;
	}
	
	.chart_name
	{
		padding-left: 36vw;
	}
	
	h2
	{
		font-size: 30pt;
		margin-top: 0em;
	}
	
	.review_keyword
	{
		display:flex;
		align-content: flex-start; 
		flex-direction:column; 
		flex-wrap:wrap;
		width: 100%;
		height: 25vh;
	}
	
	.review_keyword li
	{
		width: 15vw;
		margin-bottom: 3vh;
		font-size: 1vw;
	}
	
	h3
	{
		font-size: 20pt;
	}
	
	.review
	{
		width: 76vw;
		height: 6em;
		margin-bottom: 1vh;
		background-color: #f5f3e7;
	}
	
	.review_top
	{
		display: flex;
		justify-content: space-between;
		padding-top: 0.5vh;
		margin-bottom: 0.6vh;
		margin-right: 0.8vw;
		margin-left: 0.8vw;
	}
	
	.review_body
	{
		margin-left: 0.8vw;
	}
	
	.error
	{
		display: flex;
		width: 84.1vw;
		height: 6em;
		justify-content: center;
		align-items: center;
		background-color: #FF4500;
		
	}
	
	.errorMsg
	{
		width: 33vw;
		color: white;
		text-align: center;
	}
	
	.button  
	{
		display: flex;
		flex-direction: column;
		justify-content: center;
		padding-top: 2vh;
	}
	
	.btn
	{ 
		display: flex;
		justify-content: center;
		width: 14vh;
		height: 3vh;
		margin-bottom: 1.5vh;
		cursor: pointer;
		text-align: center;
		border: none;
		border-radius: 4px;
		font-size: 13px;
		font-weight: 500;
		align-items: center;
		background-color: transparent;
	}
	.btn-outline-primary:hover
	{
		transition: all 150ms linear;
		opacity: .85;
	}
	.btn-outline-primary:active
	{
		transition: all 150ms linear;
		opacity: .75;
	}
	
	.btn-outline-primary
	{
		background: none;
		border: 1px solid white;
		color: white;
	}
	
	.modifyBtn
	{
		font-size: small;
		width: 6vw;
		height: 5vh;
		margin-top: 3.1vw;
		margin-left: 2vh;
	}
	
	i
	{
		background: none;
		color: white;
		margin-left: 0.3vw;
	}
	
	.sendBtn
	{
		margin-top: 0.5vh;
	}
	
	
      
</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

<script type="text/javascript">

$(function () {
    $(".left_sub_menu").hide();
    $(".has_sub").click(function () {
        $(".left_sub_menu").fadeToggle(300);
        if ($('#checkOverlay').val()=="true")
		{
			$('.overlay').css("position", "fixed");
			$('.overlay').css("width", "0%");
			$('.overlay').css("height", "0%");
			$('.overlay').css("background", "rgba(0, 0, 0, 0.7)");
			$('#checkOverlay').attr("value", "false");
		}
		else
		{
			$('.overlay').css("position", "fixed");
			$('.overlay').css("width", "100%");
			$('.overlay').css("height", "100%");
			$('.overlay').css("background", "rgba(0, 0, 0, 0.7)");
			$('#checkOverlay').attr("value", "true");
		}
       
    });
    // 왼쪽메뉴 드롭다운
    $(".sub_menu ul.small_menu").hide();
    $(".sub_menu ul.big_menu").click(function () {
        $("ul", this).slideToggle(300);
    });
    // 외부 클릭 시 좌측 사이드 메뉴 숨기기
    $('.overlay').on('click', function () {
        $('.left_sub_menu').fadeOut();
        $('.overlay').css("position", "fixed");
		$('.overlay').css("width", "0%");
		$('.overlay').css("height", "0%");
		$('.overlay').css("background", "rgba(0, 0, 0, 0.7)");
		$('#checkOverlay').attr("value", "false");
    });
});

</script>



<title>SideBar sub menus</title>
</head>
<body>


<c:import url="header_user_sh.jsp"></c:import>

<div class="container">
	<!-- 왼쪽 메뉴 -->
	<div class="left side-menu">
	    <div class="sidebar-inner">
	        <div id="sidebar-menu">
	            <ul class="has_sub_menu">
	                <li class="has_sub">
	                	<a href="javascript:void(0);" class="waves-effect">
	                    <i class="fas fa-bars" style="color:#fff"></i>
	                	</a>
	                </li>
	            </ul>
	        </div>
	    </div>
	</div>
	
	<!-- 왼쪽 서브 메뉴 -->
    <div class="left_sub_menu">
		<div class="sub_menu">
			<h2>MENU</h2>
			<ul class="big_menu">
				<li>가게 리스트<i class="arrow fas fa-angle-right"></i></li>
			
				<ul class="small_menu">
					<li><a href="#" class="small_menuA">가게1</a></li>
	                <li><a href="#" class="small_menuA">가게2</a></li>
	                <li><a href="#" class="small_menuA">가게3</a></li>
	                <li><a href="#" class="small_menuA">가게4</a></li>
	            </ul>
	        </ul>
			<ul class="big_menu">
				<li>접수 내역<i class="arrow fas fa-angle-right"></i></li>
				<ul class="small_menu">
					<li><a href="#" class="small_menuA">소메뉴2-1</a></li>
					<li><a href="#" class="small_menuA">소메뉴2-2</a></li>
				</ul>
			</ul>
			<ul class="big_menu">
				<li>경고 내역</li>
			</ul>
			<ul class="big_menu">
				<li>새로운 가게 등록 신청</i></li>
			</ul>
		</div>
	</div>
	<div class="overlay"><input type="hidden" id="checkOverlay" value="false"></div>

	<div class="storemain_body">
		
		<div class="error">
			<div class="errorMsg">
				토리네 도토리묵(으)로 가게정보수정요청이 들어왔습니다.<br>
				신고 접수된 정보에 대해 수정이 없을 시 3일 내로 패널티가 부여됩니다.
			</div>
			<div class="button">
				<button class="btn btn-outline-primary btn-layer-2_1">
					이의 제기 요청
					<i class="fa fa-check"></i>
				</button>
				<button class="btn btn-outline-primary btn-layer-2_1">
					패널티 회수 요청
					<i class="fa fa-check"></i>
				</button>
			</div>
		</div>
		<div class="storemain_bodyTop">
			<p class="storeName">토리네 도토리묵</p>
			<button type="button" class="modifyBtn">
				가게 정보 수정
			</button>
			
		</div>
		<div class="storemain_content">
			<div class="storemain_chart">
				<!--차트가 그려질 부분-->
				<div class="chart_name"><h2>별점 추이</h2></div>
				<div class="chart_content"><canvas id="myChart" height="270px"></canvas></div>
			</div>
			<div class="storemain_rekey">
				<h3>선택된 리뷰 키워드</h3>
					<div class="doughnutChart"><canvas id="doughnutChartCanvas"></canvas></div>
					<ul class="review_keyword">
						<li>음식이 빨리 나와요.<span>(35)</span></li>
						<li>특별한 메뉴가 있어요.<span>(23)</span></li>
						<li>양이 많아요.<span>(287)</span></li>
						<li>메뉴가 다양해요.<span>(154)</span></li>
						<li>음식이 맛있어요.<span>(458)</span></li>
						<li>재료가 신선해요.<span>(171)</span></li>
						<li>애견메뉴가 있어요.<span>(0)</span></li>
						<li>혼자오기 좋아요.<span>(75)</span></li>
						<li>대화하기 좋아요.<span>(82)</span></li>
						<li>매장이 청결해요.<span>(376)</span></li>
						<li>매장이 넓어요.<span>(62)</span></li>
						<li>단체 모임하기 좋아요.<span>(8)</span></li>
						<li>인테리어가 멋져요.<span>(103)</span></li>
						<li>컨셉이 독특해요.<span>(2)</span></li>
						<li>특별한 날 가기 좋아요.<span>(231)</span></li>
						<li>화장실이 깨끗해요.<span>(321)</span></li>
						<li>주차하기 편해요.<span>(0)</span></li>
						<li>포장이 가능해요.<span>(77)</span></li>
						<li>가성비가 좋아요.<span>(21)</span></li>
						<li>친절해요<span>(177)</span></li>
					</ul>
			</div>
			<div class="storemain_review">
				<h3>작성된 리뷰 목록</h3>
				<div class="review">
					<div class="review_top" >
						<div class="reviewNick">
							<span class="reviewNick">작성자</span>
						</div>
						<div class="sendBtn">
							<button type="button">신고하기</button>
							<button type="button">답글쓰기</button>
						</div>
					</div>
					<div class="review_body">
						어쩌구 저쩌구 맛있다 오맘ㅁ마 이러쿵 저러쿵<br>
						꼼지락 웅냐냐 왕나누 ㄴ니나 누룰라
					</div>
				</div>
				<div class="review">
					<div class="review_top" >
						<div class="reviewNick">
							<span class="reviewNick">작성자</span>
						</div>
						<div class="sendBtn">
							<button type="button">신고하기</button>
							<button type="button">답글쓰기</button>
						</div>
					</div>
					<div class="review_body">
						어쩌구 저쩌구 맛있다 오맘ㅁ마 이러쿵 저러쿵<br>
						꼼지락 웅냐냐 왕나누 ㄴ니나 누룰라
					</div>
				</div>
				<div class="review">
					<div class="review_top" >
						<div class="reviewNick">
							<span class="reviewNick">작성자</span>
						</div>
						<div class="sendBtn">
							<button type="button">신고하기</button>
							<button type="button">답글쓰기</button>
						</div>
					</div>
					<div class="review_body">
						어쩌구 저쩌구 맛있다 오맘ㅁ마 이러쿵 저러쿵<br>
						꼼지락 웅냐냐 왕나누 ㄴ니나 누룰라
					</div>
				</div>
				<div class="review">
					<div class="review_top" >
						<div class="reviewNick">
							<span class="reviewNick">작성자</span>
						</div>
						<div class="sendBtn">
							<button type="button">신고하기</button>
							<button type="button">답글쓰기</button>
						</div>
					</div>
					<div class="review_body">
						어쩌구 저쩌구 맛있다 오맘ㅁ마 이러쿵 저러쿵<br>
						꼼지락 웅냐냐 왕나누 ㄴ니나 누룰라
					</div>
				</div>
				<div class="review">
					<div class="review_top" >
						<div class="reviewNick">
							<span class="reviewNick">작성자</span>
						</div>
						<div class="sendBtn">
							<button type="button">신고하기</button>
							<button type="button">답글쓰기</button>
						</div>
					</div>
					<div class="review_body">
						어쩌구 저쩌구 맛있다 오맘ㅁ마 이러쿵 저러쿵<br>
						꼼지락 웅냐냐 왕나누 ㄴ니나 누룰라
					</div>
				</div>
				<div class="review">
					<div class="review_top" >
						<div class="reviewNick">
							<span class="reviewNick">작성자</span>
						</div>
						<div class="sendBtn">
							<button type="button">신고하기</button>
							<button type="button">답글쓰기</button>
						</div>
					</div>
					<div class="review_body">
						어쩌구 저쩌구 맛있다 오맘ㅁ마 이러쿵 저러쿵<br>
						꼼지락 웅냐냐 왕나누 ㄴ니나 누룰라
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
	<script type="text/javascript">
		var context = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(context, {type: 'line' // 차트의 형태
										 // 차트에 들어갈 데이터
                						 ,data: {labels: ['1','2','3','4','5','6','7'] //x 축  
		                    					,datasets: [{label: '별점평균'	//라벨 제목
									                        ,fill: false	// line 형태일 때, 선 안쪽을 채우는지 안채우는지
									                        ,data: [2.5, 3.4, 3.9, 4.3, 4.7, 4.9, 4.8]	//x축 label에 대응되는 데이터 값
									                        ,backgroundColor: '#e09a8d'	//포인트 안을 채우는 색상
									                        ,borderColor: '#ef6351'		//선 색상
									                        ,borderWidth: 1}]}			//경계선 굵기
		 								 ,options: {scales: {yAxes: [{ticks: {beginAtZero: true}}]}
		 								 		   ,responsive: false							//
		 								 		   ,scales: {yAxes: [{ticks: {min: 0
																			 ,max: 5
																			 ,stepSize: 1}}]}	// 축 설정
		 								 		   ,legend: {display: false}}});		// 라벨 제목 안보이게 설정
		const canvas = document.getElementById("doughnutChartCanvas");
		const data = {labels: ["음식이 맛있어요.","매장이 청결해요.", "화장실이 깨끗해요.", "양이 많아요.", "특별한 날 가기 좋아요."]
  			 		 ,datasets: [{label: "My First Dataset"
     					 		 ,data: [458, 376, 321, 287, 231]
     					 		 ,backgroundColor: ["rgb(255, 99, 132)","rgb(54, 162, 235)","rgb(255, 205, 86)",]
      					 		 ,hoverOffset: 4,},]
      		 		 ,options: {responsive: false, }};
		new Chart(canvas, {type: "doughnut", data,});	
	</script>
</body>
</html>