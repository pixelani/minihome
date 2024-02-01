<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- 주소검색 API (다음제공) -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 백상희 20240125 자바스크립트 수정 -->
<script type="text/javascript">

	function find_addr() {
	
		//Daum API 주소 받아서 넣는 방법
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	
	        	//data = {"address", "경기 성남시 분당구 판교역로 166"...}
	        	//alert(data.address);
	        	$("#location").val(data.address);
	        	
	        	$.ajax({
	    			url : "member/addr_change.do",
	    			data: {"user_idx":"${user.user_idx}", 
	    				"user_order_addr": data.address},
	    			success: function(){
	    				alert("주문주소가 변경되었습니다.");
	    			},
	    			error: function(err){
	    				alert(err.responseText);
	    			}
	    		});
	    		
	        	
	        }
	    }).open();
		
	}//end:find_addr()
	


</script>
</head>
<body>

</body>
</html>