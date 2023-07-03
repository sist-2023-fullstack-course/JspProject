<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Topbar Start -->
    <div class="container-fluid bg-primary text-white d-none d-lg-flex">
        <div class="container py-3">
            <div class="d-flex align-items-center">
                <a href="index.html">
                    <h2 class="text-white fw-bold m-0">GrowMark</h2>
                </a>
                <div class="ms-auto d-flex align-items-center">
                    <small class="ms-4"><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</small>
                    <small class="ms-4"><i class="fa fa-envelope me-3"></i>info@example.com</small>
                    <small class="ms-4"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</small>
                    
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid bg-white sticky-top">
        <div class="container">
            <nav class="navbar navbar-expand-lg bg-white navbar-light p-lg-0">
                <a href="index.jsp" class="navbar-brand d-lg-none">
                    <h1 class="fw-bold m-0">GrowMark</h1>
                </a>
                <button type="button" class="navbar-toggler me-0" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav">
                        <a href="#" class="nav-item nav-link active">업체</a>
                        <a href="#" class="nav-item nav-link">쇼핑몰</a>
                        <a href="#" class="nav-item nav-link">커뮤니티</a>
                        <a href="#" class="nav-item nav-link">공지사항</a>
                        <a href="#" class="nav-item nav-link">문의하기</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">마이페이지</a>
                            <div class="dropdown-menu bg-light rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">내정보</a>
                                <a href="#" class="dropdown-item">펫정보</a>
                                <a href="#" class="dropdown-item">예약내역</a>
                                <a href="#" class="dropdown-item">구매내역</a>
                                <a href="#" class="dropdown-item">리뷰</a>
                                <a href="#" class="dropdown-item">위시리스트</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="ms-auto d-none d-lg-block">
                      <div class="ms-3 d-flex">
                        <a class="btn btn-sm-square btn-light text-primary rounded-circle ms-2" href=""><i
                                class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-sm-square btn-light text-primary rounded-circle ms-2" href=""><i
                                class="fab fa-twitter"></i></a>
                        &nbsp;&nbsp;
                        <c:if test="${sessionScope.id==null }">
                        <a href="" class="btn btn-primary rounded-pill py-2 px-3">로그인</a>
                        </c:if>
                      </div>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->