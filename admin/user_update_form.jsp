<!--  최병훈 : 2024.01.29 PM 02:30 수정 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    	<!-- Header -->
	<%@ include file="/header.jsp" %>
    	<!-- navi sm -->
	<%@ include file="/navi_sm.jsp" %>


<script type="text/javascript">
	function send(f) {

		//폼에서 입력된값 체크...
		let user_name = f.user_name.value.trim();
		let user_id = f.user_id.value.trim();
		let user_pwd = f.user_pwd.value.trim();
		let user_email = f.user_email.value.trim();
		let user_cellphone = f.user_cellphone.value.trim();
		let user_addr = f.user_addr.value;

		if (user_name == '') {
			alert('이름을 입력하세요');
			f.user_name.value = '';
			f.user_name.focus();
			return;
		}
		if (user_id == '') {
			alert('이름을 입력하세요');
			f.user_id.value = '';
			f.user_id.focus();
			return;
		}

		if (user_pwd == '') {
			alert('비밀번호를 입력하세요');
			f.user_pwd.value = '';
			f.user_pwd.focus();
			return;
		}

		if (user_email == '') {
			alert('이메일을 입력하세요');
			f.user_email.value = '';
			f.user_email.focus();
			return;
		}

		if (user_cellphone == '') {
			alert('번호를 입력하세요');
			f.user_cellphone.value = '';
			f.user_cellphonee.focus();
			return;
		}

		if (user_addr == '') {
			alert('주소를 입력하세요');
			f.user_addr.value = '';
			f.user_addr.focus();
			return;
		}

		f.method = "POST";
		f.action = "admin_user_update.do"; // AdminUserUpdateAction
		f.submit();//전송
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








	<form class="form-inline form-control">
		<input type="hidden" name="user_idx" value="${ user.user_idx }">



		<table class="table table-hover">
			<tr>
				<th><label>이름</label></th>
				<th><label>아이디</label></th>
				<th><label>비밀번호</label></th>
				<th><label>전화번호</label></th>
				<th><label>이메일</label></th>
				<th><label>주소</label></th>
				<th><label>등급</label></th>
				<th><label></label></th>

			</tr>
			<tr>
				<td><input type="text" name="user_name" class="form-control"
					value="${ user.user_name }"></td>
				<td><input type="text" name="user_id" class="form-control"
					value="${ user.user_id }"></td>
				<td><input type="text" type="password" name="user_pwd" class="form-control"
					value="${ user.user_pwd }"></td>
				<td><input type="text" name="user_email" class="form-control"
					value="${ user.user_email }"></td>
				<td><input type="text" name="user_cellphone" class="form-control"
					id="user_cellphone" value="${ user.user_cellphone }"></td>
				<td><input type="text" name="user_addr" id="user_addr" readonly="readonly"
					value="${ user.user_addr }" class="form-control"></td>

				<td>
				    <select name="user_grade" id="user_grade"
				     class="form-control" 
				            <c:if test="${ user.user_grade eq 'admin' }">
				                <c:out value="disabled" />
				            </c:if>>
				        <option value="buyer" <c:if test="${ user.user_grade eq 'buyer' }">selected</c:if>>buyer</option>
				        <option value="seller" <c:if test="${ user.user_grade eq 'seller' }">selected</c:if>>seller</option>
				        <option value="admin" <c:if test="${ user.user_grade eq 'admin' }">selected</c:if>>admin</option>
				    </select>
				</td>
			</tr>
		</table>

		<input class="btn wid50 btn_cart" type="button" value="회원수정"
			onclick="send(this.form);"> <input class="btn wid50 btn_cart"
			type="button" value="돌아가기"
			onclick="location.href='admin_page.do'">

	</form>















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