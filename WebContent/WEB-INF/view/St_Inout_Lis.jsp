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
<title>가게 등폐업 요청 내역</title>

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/reqRepList.css">


<!-- 배너 스크립트 -->
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
				$('.overlay').css("width", "100%");
				$('.overlay').css("height", "100%");
				$('.overlay').css("background", "rgba(0, 0, 0, 0.7)");
				$('.overlay').css("z-index", "3");
				//$('.overlay').css("margin-top", "1.011vh");
				$('#checkOverlay').attr("value", "true");
			}

		});
		// 왼쪽메뉴 드롭다운
		$(".sub_menu ul.small_menu").hide();
		$(".sub_menu ul.big_menu").click(function()
		{
			$(".sub_menu ul.small_menu").not(this).fadeOut(250);
			$("ul", this).stop().slideToggle(300);
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
	
	// 반려/중재 사유 모달
	$(document).on('click', '.rpt_content', function() {
	    var apply_num = $(this).attr('id');
	    
	    if(apply_num.substr(0,1)=="i")
	    {
	    	var inRsValue = $("#in_rej_rs"+apply_num.substr(1)).val();
	    	$("#inRs").html(inRsValue);
	    	
	    	if (document.all.rvPopup.style.visibility == "hidden")
			{
				//alert("확인");
				
				document.all.rvPopup.style.visibility = "visible";
				bgLayerOpen();
				
				//alert("visible check");
				
				var $layerPopupObj = $('#rvPopup');
				var left = ($(window).scrollLeft() + ($(window).width() - $layerPopupObj
						.width()) / 2);
				var top = ($(window).scrollTop() + ($(window).height() - $layerPopupObj
						.height()) / 4);
	
				$layerPopupObj.css(
				{
					'left' : left,
					'top' : top,
					'position' : 'absolute'
				});
				$('body').css('position', 'relative').append($layerPopupObj);
	
				return false;
				
			} 
			else
			{
				document.all.midPopup.style.visibility = "hidden";
				bgLayerClear();
				return false;
			}
	    }
	    else if(apply_num.substr(0,1)=="o")
	    {
	    	var outRsValue = $("#out_rej_rs"+apply_num.substr(1)).val();
	    	$("#outRs").html(outRsValue);
			
			if (document.all.midPopup.style.visibility == "hidden")
			{
				document.all.midPopup.style.visibility = "visible";
				bgLayerOpen();
				
				var $layerPopupObj = $('#midPopup');
				var left = ($(window).scrollLeft() + ($(window).width() - $layerPopupObj
						.width()) / 2);
				var top = ($(window).scrollTop() + ($(window).height() - $layerPopupObj
						.height()) / 4);

				$layerPopupObj.css(
				{
					'left' : left,
					'top' : top,
					'position' : 'absolute'
				});
				$('body').css('position', 'relative').append($layerPopupObj);

				return false;
			} 
			else
			{
				document.all.rvPopup.style.visibility = "hidden";
				bgLayerClear();
				return false;
			}
	    }
	});
	
	function rvPopupOpen(element)
	{
		if ($(element).attr("id") == "out_rej")
		{
			document.all.midPopup.style.visibility = "hidden";
			bgLayerClear();
			return false;
		}
		else
		{
			document.all.rvPopup.style.visibility = "hidden";
			bgLayerClear();
			return false;
		}
	}
	
	function bgLayerOpen()
	{
		if (!$('.bgLayer').length)
		{
			$('<div class="bgLayer"></div>').appendTo($('body'));
		}
		var object = $(".bgLayer");
		var w = $(document).width();
		var h = $(document).height();

		object.css(
		{
			'width' : w,
			'height' : h
		});
		object.fadeIn(500); //생성되는 시간 설정
	}
	
	function bgLayerClear()
	{
		var object = $('.bgLayer');

		if (object.length)
		{
			object.fadeOut(500, function()
			{
				object.remove();

			});
		}
	}
</script>

</head>
<body>
	<!-- header -->
	<div class="header">
		<c:import url="header_user.jsp"></c:import>
	</div>
		
	<div class="middle">
		<c:import url="sideBar_user.jsp"></c:import>
		
		<div class="right_content">
			<div class="rv_report">
				<div class="title">가게 등폐업 요청 내역</div>
				<hr>
				<i style="font-size: 0.8vw; margin-left: 68%">"반려"인 항목을 클릭하면 반려 사유를 볼 수 있습니다.</i>
				<div class="rv_reportlist">
					<div class="subtitle">
						<div class="rpt_subtitle">구분</div>
						<div class="rpt_subtitle">신청일자</div>
						<div class="rpt_subtitle">가게명</div>
						<div class="rpt_subtitle">처리상태</div>
						<div class="rpt_subtitle">처리일자</div>
					</div>
					<c:choose>
						<c:when test="${empty stinoutlist}">
					        <div class="no-data-message">가게 등폐업 요청 내역이 없습니다.</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="inout" items="${stinoutlist }">
								<c:choose>
									<c:when test="${inout.cat eq '등록' }">
										<c:choose>
											<c:when test="${inout.state eq '반려' }">
												<div class="report_content">
													<div class="rpt_content" id="i${inout.apply_num }" style="background-color: #F6CEEC; border-radius: 4px;">${inout.cat }</div>
													<div class="rpt_content" id="i${inout.apply_num }">${inout.reg_date }</div>
													<div class="rpt_content" id="i${inout.apply_num }">${inout.st_name }</div>
													<div class="rpt_content" id="i${inout.apply_num }">${inout.state }</div>
													<div class="rpt_content" id="i${inout.apply_num }">${inout.final_date }</div>
													
									            	<div id="inRej" style="display: none;">${inout.cat}</div>
									                <input type="hidden" class="rej_rs" id="in_rej_rs${inout.apply_num}" value="${inout.in_rej_rs}">
												</div>
											</c:when>
											<c:otherwise>
												<div class="report_content">
													<div class="rpt_content" style="background-color: #F6CEEC; border-radius: 4px;">${inout.cat }</div>
													<div class="rpt_content">${inout.reg_date }</div>
													<div class="rpt_content">${inout.st_name }</div>
													<div class="rpt_content">${inout.state }</div>
													<div class="rpt_content">${inout.final_date }</div>
												</div>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:when test="${inout.cat eq '폐업' }">
										<c:choose>
											<c:when test="${inout.state eq '반려' }">
												<div class="report_content">
													<div class="rpt_content" style="background-color: #86B404; border-radius: 4px;" id="o${inout.apply_num }">${inout.cat }</div>
													<div class="rpt_content" id="o${inout.apply_num }">${inout.reg_date }</div>
													<div class="rpt_content" id="o${inout.apply_num }">${inout.st_name }</div>
													<div class="rpt_content" id="o${inout.apply_num }">${inout.state }</div>
													<div class="rpt_content" id="o${inout.apply_num }">${inout.final_date }</div>
				                
									                <div id="outRej" style="display: none;">${inout.cat}</div>
									                <input type="hidden" class="mid_rs" id="out_rej_rs${inout.apply_num}" value="${inout.out_rej_rs}">
												</div>
											</c:when>
											<c:otherwise>
												<div class="report_content">
													<div class="rpt_content" style="background-color: #86B404; border-radius: 4px;">${inout.cat }</div>
													<div class="rpt_content">${inout.reg_date }</div>
													<div class="rpt_content">${inout.st_name }</div>
													<div class="rpt_content">${inout.state }</div>
													<div class="rpt_content">${inout.final_date }</div>
												</div>
											</c:otherwise>
										</c:choose>
									</c:when>
								</c:choose>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					
					<!-- 페이징 처리 -->
					<div class="pagination">
			            <c:choose>
			                <c:when test="${empty rvReportList}">
			                    <p></p>
			                </c:when>
			                <c:otherwise>
			                    <div class="pageIndex">
									${pageIndex }
								</div>
			                </c:otherwise>
			            </c:choose>
			        </div>
			        
				</div>
				
				<!-- 가게 등록 반려사유 모달 -->
				<div id="rvPopup" style="position: absolute; visibility: hidden;">
					<h4>
						<a href="#" class="close" id="in_rej" onClick="rvPopupOpen(this)">Ⅹ</a>
					</h4>
					<h3>등록 반려사유</h3>
					<div class="rvPopCont">
						<div class="list">
							<div class="rejRs">
								<h5 style="margin-top: 0; margin-bottom:  0;">반려사유</h5>
								<textarea class="rej_rs_content" rows="5" cols="42" id="inRs" style="resize: none;" disabled="disabled">
								</textarea>
							</div>
							
						</div>
						<div class="rv">
							<button class="rvBtn" id="in_rej" onClick="rvPopupOpen(this)">확인</button>
						</div>
					</div>
					
				</div>
				
				
				<!-- 가게 폐업 반려사유 모달 -->
				<div id="midPopup" style="position: absolute; visibility: hidden;">
					<h4>
						<a href="#" class="close" id="out_rej" onClick="rvPopupOpen(this)">Ⅹ</a>
					</h4>
					<h3>폐업 반려사유</h3>
					<div class="rvPopCont">
						<div class="list">
							<div class="rejRs">
								<h5 style="margin-top: 0">반려사유 &nbsp;&nbsp;&nbsp; </h5>
								<textarea class="rej_rs_content" rows="5" cols="42" id="outRs" style="resize: none;" disabled="disabled">
								</textarea>
							</div>
							
						</div>
						<div class="rv">
							<button class="rvBtn" id="out_rej" onClick="rvPopupOpen(this)">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<div class="footer">
		<c:import url="footer.jsp"></c:import>
	</div>

</body>
</html>




