<%-- 이영준(1/23 12:00) --%>
<%-- 최병훈 Category Menupan  메뉴링크 수정 01.23. 17:38 --%> 
<%-- 최병훈 전체링크 수정 01.24. 05:20 --%> 
<%-- 최병훈 (01/25. 08:30 - file/link 재설정, class수정) --%> 
<%-- 최병훈 (01/25. 10:02 - category alt="숫자로 변경") --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 백상희 :20240124 수정 시작 -->
<script type="text/javascript">
			
			$(document).ready(function(){
				$("#food_category_name img").click(function(){
					
					let food_category_name = $(this).attr("alt");
					/* 가게 인트로로 바꿔야 함 */
					location.href="${pageContext.request.contextPath}/navi.jsp?food_category_name="+food_category_name;
					
				})	
			})
			
		
</script>
<!-- 백상희 :20240124 수정 끝 -->
</head>

<body >

   <%-- 이영준(2/23 12:00) 등록 클릭 시(onclick) 다음 API연결 --%>	
	<%@ include file='addr_reg.jsp' %> 


 	
    <nav class="navbar navbar-expand-md sticky-top navbar-shrink py-3 navbar-light bg_e" id="mainNav">
        <div class="container">

       <!-- 2024.01.29 최병훈 세션정보 없을때 disable --> 
        <button disabled="disabled" id="btn_location" class="btn btn_e" type="button" onclick="find_addr();" style="opacity: 0">등록</button>
        <input type="text" disabled="disabled" id="location" class="nav_loc" placeholder="로그인 필요" value="${user.user_order_addr}" style="opacity: 0">
		<!-- /// End: 2024.01.29 최병훈 세션정보 없을때 disable -->


                        
        <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1">
        <span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav mx-auto navbar-expand-sd">
                <!-- 최병훈 01.24 AM 05:21 링크수정 -->
                <!-- 백상희 : 20240124 경로 수정 -->
                <!-- 20240125 href/class 수정 css파일다시 받으세용~ -->
                    <li class="nav-item"><a class="c" href="${ pageContext.request.contextPath }/main.do"><img src="${ pageContext.request.contextPath }/assets/img/dongne_logo.png" alt="Home"></a></li>
                    
                    <!-- 최병훈 01.29 Menu hidden 
                    <li class="nav-item"><a class="btn_m c" href="${ pageContext.request.contextPath }/seller/menu.jsp"><img src="${ pageContext.request.contextPath }/assets/img/clipboard.svg" alt="Menu"></a></li>
                    <li class="nav-item"><a class="btn_m c" href="${ pageContext.request.contextPath }/review/review.jsp"><img src="${ pageContext.request.contextPath }/assets/img/pen-tool.svg" alt="review"></a></li>
                    <li class="nav-item"><a class="btn_m c" href="${ pageContext.request.contextPath }/contacts.jsp"><img src="${ pageContext.request.contextPath }/assets/img/message-circle.svg" alt="qna"></a></li>
                    -->
                </ul>
                
                <!-- 백상희 20240124 수정 시작-->
                <c:if test="${ empty sessionScope.user }">
                	<a id="login" role="button" href="${ pageContext.request.contextPath }/member/loginform.do" class="btn btn_e">로그인</a>
               		<a id="signup" role="button" href="${ pageContext.request.contextPath }/member/signupform.do" class="btn btn_e">회원가입</a> 
                </c:if>
                
                <c:if test="${ not empty sessionScope.user}">
                	<span>${ sessionScope.user.user_name } 님 환영합니다.</span>
                	                	
                	<c:if test="${ user.user_grade eq 'admin'}">
                		<a id="login" role="button" href="${ pageContext.request.contextPath }/member/logout.do" class="btn btn_e">로그아웃</a>
                		<a id="admin_page" role="button" href="${ pageContext.request.contextPath }/admin/admin_page.do" class="btn btn_e">관리자 페이지</a>
                	</c:if>	
                	
                	<c:if test="${ user.user_grade eq 'seller'}">
                		<a id="login" role="button" href="${ pageContext.request.contextPath }/member/logout.do" class="btn btn_e">로그아웃</a>
                		<a id="seller_page" role="button" href="${ pageContext.request.contextPath }/seller/seller_page.do?user_idx=${user.user_idx}" class="btn btn_e">판매자 페이지</a>
                	</c:if>
                	
                	<c:if test="${ user.user_grade eq 'buyer'}">
                		<a id="login" role="button" href="${ pageContext.request.contextPath }/member/logout.do" class="btn btn_e">로그아웃</a>
                		<a id="cart" role="button" class="btn btn_e" onclick="location.href='${ pageContext.request.contextPath }/member/mypage.do?user_idx='+${user.user_idx}">마이 페이지</a>
               		</c:if>
                </c:if>
  
                <!-- 백상희 20240124 수정 끝-->
            </div>
        </div>
    </nav>



  