<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<script src="/resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="/resources/jqLib/comunityCheck.js"></script>
<div class="sidebar-category-nav">
            <h3 class="sub-title">커뮤니티</h3>
            <ul class="nav">
                <li><a href="/comunity/clist" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">All</span> <span class="nav-indicator nav-selected"><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/clist" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">공지사항</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/clist" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">사는얘기</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/clist" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">포럼</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/clist" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">IT 행사</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/clist" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">정기모임/스터디</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/clist" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">학원/홍보</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
            </ul>
            <div class="special-nav">
            </div>
        </div>
        <div id="list-article" class="content scaffold-list" role="main">
<c:if test="${fCode=='BI'}">
	<h3>새글 등록에 오류가 있어서 실패했습니다~~~</h3>
	<h3>다시 하시겠습니까 ?</h3>
	===> <a href="binsertf">[새글 등록]</a>
</c:if>
<c:if test="${fCode=='BN'}">
	<h3>글 내용이 없습니다 ~~</h3>
	<h3>다시 하시겠습니까 ?</h3>
	<a href="#" onclick="history.back()">[다시 하기]</a> 
</c:if>
<c:if test="${fCode=='BU'}">
	<h3>글 수정에 오류가 있어서 실패했습니다~~~</h3>
	<h3>다시 하시겠습니까 ?</h3>
	===> <a href="javascript:history.go(-1)">[다시 하기]</a> 
</c:if>
<c:if test="${fCode=='BD'}">
	<h3>글 삭제에 오류가 있어서 실패했습니다~~~</h3>
	<h3>다시 하시겠습니까 ?</h3>
	===> <a href="#" onclick="history.back()">[다시 하기]</a> 
</c:if>
        
        
<%@include file="../includes/footer.jsp"%>