<!--  최병훈 : 2024.01.29 PM 02:30 수정 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
    	<!-- Header -->
	<%@ include file="/header.jsp" %>
 <%--    	<!-- navi sm -->
	<%@ include file="/navi_sm.jsp" %>  --%>

<title>동네가게 - 유저 폼</title>
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

</script>
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
                                <h1 class="page-title"> 회원수정</h1>
                            </div><!-- .page-header -->
						</div>
                            <!--.page-body -->
                            <div class="tab-content">







	<table class="table table-hover">
	
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
<!-- 			<th>등록일</th>
			<th>수정일</th> -->
			<th>증빙 파일</th>
		</tr>
		<c:forEach var="user_table" items="${ user_table }" varStatus="i">
				<tr>
					<td>${ i.count }</td>
					<td>${ user_table.user_idx }</td>
		        	<td>${ user_table.user_name }</td>
		        	<td>${ user_table.user_id }</td>
		        	<td>${ user_table.user_pwd }</td>
		        	<td>${ user_table.user_cellphone }</td> 
 		        	<td>${ user_table.user_email }</td> 
 		        	<td>${ user_table.user_addr }</td>
		        	<td>${ user_table.user_order_addr }</td> 
<%-- 		        	<td>${ user_table.user_created_date }</td>
		        	<td>${ user_table.user_modified_date }</td> --%>
		        	<td>${ user_table.user_proof }</td>	  
		        	<%-- <td>${ fn:substring(member.coupon_expired_date,0,11) }</td> --%>
					<td><input type="button" value="수정"  class="btn wid50 btn_cart"
							onclick="admin_user_update_ready('${ user_table.user_idx }');"></td>
					<td><input type="button" value="삭제"  class="btn wid50 btn_cart"
							onclick="admin_del_user('${ user_table.user_idx }');"></td>
				</tr>
			</c:forEach>
	</table>








					</div>
                        	<!-- End // .page-body -->
                      
                    </article>



                </div> <!--  end - 실제 컨텐츠영역 -->

	        </div>
        </main><!-- /#content-box -->
	
</div>

</body>
</html>