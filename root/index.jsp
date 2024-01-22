<!--  JSTL LIBRALY 사용 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    	<!-- Header -->
		<%@ include file="./inc/header.jsp" %>
        <!-- Navi -->
        <%@ include file="./inc/navi.jsp" %>




        <!-- intro banner -->
        <div class="container pt-4 pt-xl-5 c"><img src="assets/img/products/dongne_store.jpg" width="100%"></div>

        <!-- Time Sale -->
        <div class="container pt-4 pt-xl-5 c"><h1 class="fw-bold st">Time Sale</h1></div>
        <div class="container pt-4 pt-xl-5 c">
            <div class="row row-cols-md-3 d-flex justify-content-center">
                <div class="col mb-3">
                    <div class="card bg-primary-subtle">
                        <div class="card-body text-center px-4 py-5 px-md-5"><img src="assets/img/products/sale_a.png" width="100%"></div>
                    </div>
                </div>
                <div class="col mb-3">
                    <div class="card bg-secondary-subtle">
                        <div class="card-body text-center px-4 py-5 px-md-5"><img src="assets/img/products/sale_b.png" width="100%"></div>
                    </div>
                </div>
                <div class="col mb-3">
                    <div class="card bg-info-subtle">
                        <div class="card-body text-center px-4 py-5 px-md-5"><img src="assets/img/products/sale_a.png" width="100%"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>




        <!-- Event Coupon -->
        <div class="container pt-4 pt-xl-5 c">

                <h2 class="fw-bold st">EVENT COUPON</h2>

            <div class="row row-cols-md-3 d-flex justify-content-center">
                <div class="d-flex flex-column align-items-center align-items-sm-start">
                    <p class="bg-body-tertiary border rounded border-0 p-4 c"><img src="assets/img/team/coupon_a.jpg" width="100%"></p><button class="btn_e" type="button" style="margin: 0px auto">쿠폰받기</button>
                </div>                <div class="d-flex flex-column align-items-center align-items-sm-start">
                    <p class="bg-body-tertiary border rounded border-0 p-4 c"><img src="assets/img/team/coupon_b.jpg" width="100%"></p><button class="btn_e" type="button" style="margin: 0px auto">쿠폰받기</button>
                </div>                <div class="d-flex flex-column align-items-center align-items-sm-start">
                    <p class="bg-body-tertiary border rounded border-0 p-4 c"><img src="assets/img/team/coupon_c.jpg" width="100%"></p><button class="btn_e" type="button" style="margin: 0px auto">쿠폰받기</button>
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




    </body>

    </html>