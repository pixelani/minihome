<!--  최병훈 : 2024.01.29 PM 02:30 수정 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



    	<!-- Header -->
	<%@ include file="/header.jsp" %>
    	<!-- navi sm -->
	<%@ include file="/navi_sm.jsp" %>


<style type="text/css">
	tr {
	border-bottom: 1px solid #eee;
	}
	.wid40{    width: 40%;    }
	.wid50{    width: 49%;    }
	
	#user_grade{
	width: 150px;
	}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	
	 // 쿠폰수정
	function admin_coupon_update(f) {
		let coupon_idx 	   = f.coupon_idx.value;
		let coupon_name    = f.coupon_name.value;
		let coupon_content = f.coupon_content.value;
		let deducted_price = f.deducted_price.value;
		let coupon_min_order_price = f.coupon_min_order_price.value;
		let user_idx			   = f.user_idx.value;
		let coupon_expired_date	   = f.coupon_expired_date.value;
		
		// 빈값 체크
		if(coupon_name==''){
			alert('제목을 입력하세요');
			f.coupon_name.value='';
			f.coupon_name.focus();
			return;
		}
		
		if(coupon_content==''){
			alert('내용을 입력하세요');
			f.coupon_content.value='';
			f.coupon_content.focus();
			return;
		}
		
		if(deducted_price==''){
			alert('차감금액을 입력하세요');
			f.deducted_price.value='';
			f.deducted_price.focus();
			return;
		}
		
		if(coupon_min_order_price==''){
			alert('최소 주문금액을 입력하세요');
			f.coupon_min_order_price.value='';
			f.coupon_min_order_price.focus();
			return;
		}
		
		if(user_idx==''){
			alert('유저번호를 입력하세요');
			f.user_idx.value='';
			f.user_idx.focus();
			return;
		}
		
		if(coupon_expired_date==''){
			alert('소멸일자를 입력하세요');
			f.coupon_expired_date.value='';
			f.coupon_expired_date.focus();
			return;
		}

		f.method = "POST";
		f.action = "admin_coupon_update_action.do"; // AdminCouponUpdateAction
		f.submit();
	} 
	
	
	
	
</script>

</head>
<body>
	

	<!-- Contents -->
        <div class="container pt-4 pt-xl-5 c">
	
	        <main id="content">
            <div class="container">
                <div class="row shop_tt">


                    <article class="col-md-12 article affix-purchase-target">
                        <div class="content-inner" role="toolbar">
                            <div class="page-header">
                                <h1 class="page-title"> 쿠폰 수정</h1>
                            </div><!-- .page-header -->
						</div>
                            <!--.page-body -->
                            <div class="tab-content">

	
	
	
	
	
	
	
	
	
	<form class="form-inline">
		<input type="hidden" name="coupon_idx" value="${ vo.coupon_idx }" >
<!-- 		<div class="panel-heading">
			<h4>등록</h4>
		</div> -->
		<table class="table table-hover">
			<tr>
				<th>쿠폰제목</th>
				<td>
					<input type="text" class="form-control" 
						name="coupon_name" value="${ vo.coupon_name }">
				</td>
			</tr>

			<tr>
				<th>쿠폰내용</th>
				<td>
					<input type="text" class="form-control" 
						name="coupon_content" value="${ vo.coupon_content }" >
				</td>
			</tr>

			<tr>
				<th>차감금액</th>
				<td>
					<input type="text" class="form-control" 
						name="deducted_price" value="${ vo.deducted_price }" >
				</td>
			</tr>

			<tr>
				<th>최소주문금액</th>
				<td>
					<input type="text" class="form-control" 
						name="coupon_min_order_price" value="${ vo.coupon_min_order_price }">
				</td>
			</tr>

			<tr>
				<th>유저번호</th>
				<td>
					<input type="text" class="form-control" 
						name="user_idx" value="${ vo.user_idx }" >
				</td>
			</tr>
			
			<tr>
				<th>소멸일자</th>
				<td>
					<input type="date" class="form-control" 
						name="coupon_expired_date" value="${ vo.coupon_expired_date }" >
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<input class="btn wid50 btn_cart" type="button" value="수정" onclick="admin_coupon_update(this.form);">
					<input class="btn wid50 btn_cart" type="button" value="취소" onclick="location.href='admin_page.do'">
					<br>
				</td>
			</tr>

		</table>
	</form>
	<br>

	
	
	
	
	
	
	
	


					</div>
                        	<!-- End // .page-body -->
                      
                    </article>

<!------ 쿠폰페이지 -------------------------------------------------------------------------------------- -->

                </div> <!--  end - 실제 컨텐츠영역 -->

	        </div>
        </main><!-- /#content-box -->
	
</div>
	
	
	
	
</body>
</html>