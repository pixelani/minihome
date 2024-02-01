<!--  최병훈 : 2024.01.29 PM 02:30 수정 -->

<!--  최병훈 : 2024.01.25 AM 08:40 파일 경로수정 -->
<!--  JSTL LIBRALY 사용 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    	<!-- Header -->
	<%@ include file="header.jsp" %>
        <!-- Navi -->
        <%@ include file="navi.jsp" %>

<style>
#radius_info {
	position: relative;
	top: 5px;
	left: 5px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	font-size: 12px;
	padding: 5px;
	background: #fff;
	list-style: none;
	margin: 0;
}

#radius_info:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

#radius_info .label {
	display: inline-block;
	width: 50px;
}

#radius_number {
	font-weight: bold;
	color: #00a0e9;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script type="text/javascript">

function coupon_button(form) {
	
	let coupon_name = form.coupon_name.value;
	let user_idx    = form.user_idx.value;
	let user_id     = form.user_id.value;
	
	if(	${ empty sessionScope.user}==true){
		alert("로그인 후 이용하세요.");
		return;
	}
		
	
		$.ajax({
			url : "coupon_issued_action.do",
			dataType : "json",
			data : {
				"coupon_name"	:	coupon_name,
				"user_idx"		:	user_idx,
				"user_id"		:	user_id
			},
			success	 : function(result){
				if(result.data == true)
					alert("쿠폰이 발행되었습니다");
				else{
					alert("소진된 쿠폰이거나 이미 발행된 쿠폰입니다.");
				}					
			},
			error    : function(err){
				console.log(err.responseText);
			}
			
		}); // end : ajax
	
} // end : coupon_button(function)

</script>
    

        <!-- intro banner -->
        <div class="container pt-4 pt-xl-5 c" id="intro_banner">
        <img src="${pageContext.request.contextPath}/assets/img/dongne_store.jpg" width="100%"></div>
		
		
		
		
		<div class="container pt-4 pt-xl-5 c" id="map_view">
		<main id="content">
            <div class="container">
                <div class="row shop_tt">
					<article class="col-md-12 article affix-purchase-target">
						<!-- 백상희 수정 지도부분 :20240126 -->
						<!-- 지도를 표시할 div 입니다 -->
						<div id="map_container">
							<div id="map" style="width:100%;height:350px;"></div>
								<div id="btn_remove_circles" style="float: left;">
									<button id="remove_circles" class="btn btn-primary" >원의반경 모두 지우기</button>
									<span>지도를 마우스로 클릭하면 원 그리기가 시작되고, 오른쪽 마우스를 클릭하면 원 그리기가 종료됩니다.</span> 
								</div>							  	
						</div>
						
   						<br>  

						<!-- API로 불러온 가게리스트를 표시할 div 입니다. -->
						<div id="store_display"></div>
					</article>
				</div>
			</div>
		</main>
		</div>
        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>


		<!-- Event Coupon -->
		<div class="container pt-4 pt-xl-5 c">
		
			<h2 class="fw-bold st">EVENT COUPON</h2>
		
			<div class="row row-cols-md-3 d-flex justify-content-center">
			
				<div class="d-flex flex-column align-items-center align-items-sm-start">
					<form>
						<input type="hidden" name="user_idx" value="${ user.user_idx }">
						<input type="hidden" name="user_id" value="${ user.user_id }">
						<input type="hidden" name="coupon_name" value="Welcome Coupon1">
						<p class="bg-body-tertiary border rounded border-0 p-4 c">
							<img src="${pageContext.request.contextPath}/assets/img/coupon_a.jpg" width="100%">
							<input class="btn_e" type="button" value="쿠폰받기" style="margin: 0px auto" onclick="coupon_button(this.form);">
						</p>
					</form>
				</div>
				
				
				<!-- 2번 쿠폰 -->
				<div class="d-flex flex-column align-items-center align-items-sm-start">	
					<form>
						<p class="bg-body-tertiary border rounded border-0 p-4 c">
							<img src="${pageContext.request.contextPath}/assets/img/coupon_b.jpg" width="100%">
							<input type="hidden" name="user_idx" value="${ user.user_idx }">
							<input type="hidden" name="user_id" value="${ user.user_id }">
							<input type="hidden" name="coupon_name" value="Welcome Coupon2">
							<input class="btn_e" type="button" value="쿠폰받기" style="margin: 0px auto" onclick="coupon_button(this.form);">
						</p>
					</form>
				</div>
				
				<div class="d-flex flex-column align-items-center align-items-sm-start">
					<form>
						<p class="bg-body-tertiary border rounded border-0 p-4 c">
							<img src="${pageContext.request.contextPath}/assets/img/coupon_c.jpg" width="100%">
							<input type="hidden" name="user_idx" value="${ user.user_idx }">
							<input type="hidden" name="user_id" value="${ user.user_id }">
							<input type="hidden" name="coupon_name" value="Welcome Coupon3">
							<input class="btn_e" type="button" value="쿠폰받기" style="margin: 0px auto" onclick="coupon_button(this.form);">
						</p>
					</form>
				</div>
				
			</div>
		</div>


        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>



         <!-- Time Sale -->
        <div class="container pt-4 pt-xl-5 c" style="opacity: 0.5"><h1 class="fw-bold st">Time Sale (Comming Soon)</h1></div>
        <div class="container pt-4 pt-xl-5 c" style="opacity: 0.5">
            <div class="row row-cols-md-3 d-flex justify-content-center">
                <div class="col mb-3">
                    <div class="card bg-primary-subtle">
                        <div class="card-body text-center px-4 py-5 px-md-5">
                        <img src="${pageContext.request.contextPath}/assets/img/sale_a.png" width="100%"></div>
                    </div>
                </div>
                <div class="col mb-3">
                    <div class="card bg-secondary-subtle">
                        <div class="card-body text-center px-4 py-5 px-md-5">
                        <img src="${pageContext.request.contextPath}/assets/img/sale_b.png" width="100%"></div>
                    </div>
                </div>
                <div class="col mb-3">
                    <div class="card bg-info-subtle">
                        <div class="card-body text-center px-4 py-5 px-md-5">
                        <img src="${pageContext.request.contextPath}/assets/img/sale_a.png" width="100%"></div>
                    </div>
                </div>
            </div>
        </div>


    




        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>



    <!-- News Letter -->
    

    <section class="py-5">
        <div class="container">
            <div class="border rounded border-0 border-white d-flex flex-column justify-content-between align-items-center flex-lg-row bg-primary-gradient p-4 p-lg-5">
                
                <form class="form-control" method="post" data-bs-theme="light">
                    <div class="mb-2"><input class="form-control" type="email" name="email" placeholder="구독 알림 받기 이메일을 등록하세요"></div>
                    <div class="my-2"><button class="btn_e btn-primary shadow ms-2" type="submit">등록</button></div>
                </form>
            </div>
        </div>
    </section>



        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>


<!-- Navi -->
        <%@ include file="footer.jsp" %>


    </body>

    </html>