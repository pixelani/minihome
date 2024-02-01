<!--  최병훈 : 2024.01.29 PM 02:30 수정 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

    	<!-- Header -->
	<%@ include file="/header.jsp" %>
    	<!-- navi sm -->
	<%@ include file="../navi_sm.jsp" %>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	//유저정보 삭제
	function admin_del_user(user_idx) {
		if (confirm(user_idx + '유저 삭제') == false)
			return;
		//삭제처리
		location.href ="../member/user_delete.do?user_idx="
				+ user_idx; //MemberDeleteAction
	}
	
	 //유저정보 수정
	function admin_user_update_ready(user_idx) {
		
		location.href ="user_update_form.do?user_idx="
				+ user_idx; //MemberUpdateFormAction
	} 
	 
	// 유저등급 보기 -----------------------------------------------------------------------------------

	$(document).ready(function(){
	    window.user_table = function(form) {
	        // 선택된 라디오 버튼의 값을 가져오기
	        let user_grade = form.querySelector('input[name="user_grade"]:checked').value;
	        
	        // 사용자가 "user"를 선택했을 때 바로 페이지 이동 (DB에 user 목록이 없기 때문에 ajax를 실행시키지 않기위함)
	        if (user_grade === 'user') {
	            location.href = 'admin_page.do';
	        } else {
	            // 선택된 등급에 따라 테이블 내용 변경
	            updateTableByUserGrade(user_grade);
	        }
	    }
	
	    function updateTableByUserGrade(user_grade) {
	        // 여기에서 선택된 등급에 따라 테이블 내용을 변경하는 로직을 작성
	        // AJAX를 사용하여 서버에서 해당 등급의 데이터를 가져와 테이블 업데이트
	        $.ajax({
	            url: "admin_user_table_form.do",
	            data: {"user_grade": user_grade },
	            success: function(res_data){
	                console.log(res_data);
	                $("#disp").html(res_data);
	            },
	            error: function(err){
	                alert(err.responseText);
	            }
	        }); // end : ajax
	    }
	});
	 
	

// 쿠폰페이지 --------------------------------------------------------------------------------------
 
	///쿠폰생성
	function admin_coupon_insert(f) {
		let coupon_name    = f.coupon_name.value;
		let coupon_content = f.coupon_content.value;
		let deducted_price = f.deducted_price.value;
		let coupon_min_order_price = f.coupon_min_order_price.value;
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
		
		
		if(coupon_expired_date==''){
			alert('소멸일자를 입력하세요');
			f.coupon_expired_date.value='';
			f.coupon_expired_date.focus();
			return;
		}
		
		
		f.method = "POST";
		f.action = "admin_coupon_insert_form.do"; // AdminCouponInsert
		f.submit();
	}

	
	// 쿠폰삭제
	function admin_del_coupon(coupon_idx) {
		if (confirm(coupon_idx + '쿠폰 삭제') == false)
			return;
		//삭제처리
		location.href = "admin_coupon_delete_action.do?coupon_idx="
				+ coupon_idx; //AdminCouponDeleteAction
	}
	
	 // 쿠폰수정
	function admin_coupon_update_ready(coupon_idx) {
		
		location.href = "admin_coupon_form.do?coupon_idx=" 
				+ coupon_idx; // AdminCouponFormAction
	} 

</script>

 <style type="text/css">
	tr {
	border-bottom: 1px solid #eee;
	}
	.wid50 {
		width: 45%;
		background-color: #eee;
	}
</style> 

<body>



	<!-- Contents -->
        <div class="container pt-4 pt-xl-5 c">
	
	        <main id="content">
            <div class="container">
                <div class="row shop_tt">


                    <article class="col-md-12 article affix-purchase-target">
                        <div class="content-inner" role="toolbar">
                            <div class="page-header">
                                <h1 class="page-title"> 관리자페이지</h1>
                            </div><!-- .page-header -->

                            <!--.page-body -->
                            <div class="tab-content">



<!------ 유저별 등급보기 페이지 -------------------------------------------------------------------------------------- -->
						<hr>
						<div>유저 목록</div>
						<hr>
						<form class="form-control">
							<label>
						        <input type="radio" name="user_grade" value="user" onclick="user_table(this.form)" checked>
						        등록순
						    </label>
						    <label>
						        <input type="radio" name="user_grade" value="buyer" onclick="user_table(this.form)">
						        사용자
						    </label>
						    <label>
						        <input type="radio" name="user_grade" value="seller" onclick="user_table(this.form)">
						        판매자
						    </label>
						    <label>
						        <input type="radio" name="user_grade" value="admin" onclick="user_table(this.form)">
						        관리자
						    </label>
						</form>

	
	
		
<!------ 유저별 등급보기 페이지 -------------------------------------------------------------------------------------- -->

<!------ 유저페이지 -------------------------------------------------------------------------------------- -->	
		<div id="disp" class="panel-body">
		<form class="form-control">
      	   <table class="table table-striped">
										    <thead>
			
				<tr>
					<th>순번</th>
					<th>유저번호</th>
					<th>유저네임</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>집주소</th>
					<th>주문 주소</th>
<!-- 					<th>등록일</th>
					<th>수정일</th> -->
					<th>증빙 파일</th>
				</tr>
										    </thead>
										    <tbody>
			<c:forEach var="user" items="${ user_list }" varStatus="i">
				<tr>
					<td>${ i.count }</td>
					<td>${ user.user_idx }</td>
		        	<td>${ user.user_name }</td>
		        	<td>${ user.user_id }</td>
		        	<td>${ user.user_pwd }</td>
		        	<td>${ user.user_cellphone }</td>
		        	<td>${ user.user_email }</td>
		        	<td>${ user.user_addr }</td>
		        	<td>${ user.user_order_addr }</td>
<%-- 		        	<td>${ user.user_created_date }</td>
		        	<td>${ user.user_modified_date }</td> --%>
		        	<td>${ user.user_proof }</td>	        	
		        	<%-- <td>${ fn:substring(member.coupon_expired_date,0,11) }</td> --%>
					<td><input type="button" value="수정"  class="btn wid50 btn_cart"
							onclick="admin_user_update_ready('${ user.user_idx }');"></td>
					<td><input type="button" value="삭제"  class="btn wid50 btn_cart"
							onclick="admin_del_user('${ user.user_idx }');"></td>
				</tr>
			</c:forEach>
		</tbody>
	  </table>
	</form>
	</div>
</div>
<!------ 유저페이지 -------------------------------------------------------------------------------------- -->




<!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>












<!------ 쿠폰페이지 -------------------------------------------------------------------------------------- -->	
<div>
<hr>
<div>쿠폰 목록</div>
<hr>
	<form class="form-inline form-control">
		<input type="hidden" name="coupon_idx" value="${ vo.coupon_idx }" >
		<div class="panel-heading">
			<h4>등록</h4>
		</div>
		<table class="table table-hover">
			<tr>
				<th>쿠폰제목</th>
				<td>
				<select class="form-control" name="coupon_name">
				    <option value="Welcome Coupon1">Welcome Coupon1</option>
				    <option value="Welcome Coupon2">Welcome Coupon2</option>
				    <option value="Welcome Coupon3">Welcome Coupon3</option>
				</select>			
			<!-- 		<input type="text" class="form-control" 
						name="coupon_name"> -->
				</td>
			</tr>

			<tr>
				<th>쿠폰내용</th>
				<td>
					<input type="text" class="form-control" 
						name="coupon_content">
				</td>
			</tr>

			<tr>
				<th>차감금액</th>
				<td>
					<input type="text" class="form-control" 
						name="deducted_price">
				</td>
			</tr>

			<tr>
				<th>최소주문금액</th>
				<td>
					<input type="text" class="form-control" 
						name="coupon_min_order_price">
				</td>
			</tr>

			
			<tr>
				<th>소멸일자</th>
				<td>
					<input type="date" class="form-control" 
						name="coupon_expired_date">
				</td>
			</tr>
			
			
			<tr>
				<td colspan="2" align="center">
					<input class="btn wid100 btn_cart" type="button" value="생성" onclick="admin_coupon_insert(this.form);">
					<br>
				</td>
			</tr>

		</table>
	</form>
</div>
	
<div>
	<form class="form-control">
		<table class="table table-hover">
			<!-- <caption>목록</caption> -->
				<tr>
					<th>순번</th>
					<th>쿠폰번호</th>
					<th>쿠폰명</th>
					<th>내용</th>
					<th>사용 최소금액</th>
					<th>할인가</th>
					<th>생성일자</th>
					<th>사용기한</th>
<!-- 					<th>유저번호</th> -->
					<th>등록된회원ID</th>
					<th>사용여부</th>
				<tr>
			<c:forEach var="coupon" items="${ coupon_list }" varStatus="i">
				<tr>
					<td>${ i.count }</td>
					<td>${ coupon.coupon_idx }</td>
		        	<td>${ coupon.coupon_name }</td>
		        	<td>${ coupon.coupon_content }</td>
		        	<td>${ coupon.deducted_price }</td>
		        	<td>${ coupon.coupon_min_order_price }</td>
		        	<td>${fn:substring(coupon.coupon_created_date,0,10)}</td>
		        	<td>${fn:substring(coupon.coupon_expired_date,0,10)}</td>
<%-- 		        	<td>${ coupon.user_idx }</td> --%>
		        	<td>${ coupon.user_id }</td>
		        	<td>${ coupon.coupon_status }</td>
					<td><input type="button" value="수정"  class="btn wid100 btn_cart"
							onclick="admin_coupon_update_ready('${ coupon.coupon_idx }');"></td>
					<td><input type="button" value="삭제"  class="btn wid100 btn_cart"
							onclick="admin_del_coupon('${ coupon.coupon_idx }');"></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</div>
	
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