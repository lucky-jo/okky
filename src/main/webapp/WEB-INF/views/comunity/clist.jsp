<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>

        <div class="sidebar-category-nav">
            <h3 class="sub-title">커뮤니티</h3>
            <ul class="nav">
                <li><a href="/comunity/list" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">All</span> <span class="nav-indicator nav-selected"><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category=a" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">공지사항</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category=b" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">사는얘기</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category=c" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">포럼</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category=d" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">IT 행사</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category=e" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">정기모임/스터디</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category=c" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">학원/홍보</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
            </ul>
            <div class="special-nav">
            </div>
        </div>
        <div id="list-article" class="content scaffold-list" role="main">
<div>
	커뮤니티
	<div style="float: right;"><a href="/comunity/cinsert" >새 글 쓰기</a></div>
</div><br><br>
<div id="searchBar">
	검색창
</div><br>
<div>
최신순  추천순  댓글순  스크랩순  조회순
</div>
<br>
<table>
	
	<c:forEach var="mm" items="${Banana}">
	<c:choose>
		<c:when test="${mm.exist ==1 }">
			<tbody>
			<tr align="center" height="30">
			<td style="color: gray;">#${mm.seq}&nbsp;${mm.category}</td>
			<td rowspan="0">댓글</td>
			<td rowspan="0">좋아요</td>
			<td rowspan="0">${mm.cnt}</td>
			<td rowspan="0">image</td>
			<td>${mm.id}</td>
		</tr>
		<tr align="center" height="30" bordercolor="gray">
			<td><a href="detail?seq=${mm.seq}">${mm.title}</a></td>
			<td>${mm.regdate}</td>
		</tr>
		</tbody>
		</c:when>
		<c:when test="${mm.exist != 1 }">
		<tbody>
			<tr align="center" height="30">
			<td style="color: gray;">&nbsp;</td>
			<td rowspan="0"></td>
			<td rowspan="0"></td>
			<td rowspan="0"></td>
			<td rowspan="0"></td>
			<td></td>
		</tr>
		<tr align="center" height="30" bordercolor="gray">
			<td>삭제된 게시물 입니다</td>
			<td></td>
		</tr>
		</tbody>
		</c:when>
	</c:choose>
	<%-- <tbody>
		<tr align="center" height="30">
			<td style="color: gray;">#${mm.seq}&nbsp;${mm.category}</td>
			<td rowspan="0">댓글</td>
			<td rowspan="0">좋아요</td>
			<td rowspan="0">${mm.cnt}</td>
			<td rowspan="0">image</td>
			<td>${mm.id}</td>
		</tr>
		<tr align="center" height="30" bordercolor="gray">
			<td><a href="detail?seq=${mm.seq}">${mm.title}</a></td>
			<td>${mm.regdate}</td>
		</tr>
	</tbody> --%>
	</c:forEach>
</table><br><br>
<div align="center">
	<c:if test="${maker.prev}">
	<a href="list${maker.makeSearch(1)}">First&nbsp;</a>
	<a href="list${maker.makerSearch(maker.sPageNo-1)}">&nbsp;</a>
	</c:if>
</div>


<%@include file="../includes/footer.jsp"%>