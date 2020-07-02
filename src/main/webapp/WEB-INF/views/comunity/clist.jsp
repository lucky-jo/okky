<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<script src="/resources/jqLib/jquery-3.2.1.min.js"></script>
<script>
$(function(){
	$('#searchBtn').on("click",function(){
				self.location="listcri"
					+"${maker.makeQuery(1)}"
					+"&searchType="
					+$("#searchType").val()
					/* + $("select option:selected").val() */
					+"&keyword="
					+$("#keyword").val();
	});
}); // ready 
</script>
        <div class="sidebar-category-nav">
            <h3 class="sub-title">커뮤니티</h3>
            <ul class="nav">
                <li><a href="/comunity/list" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">All</span> <span class="nav-indicator nav-selected"><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category='공지사항'" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">공지사항</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category='사는얘기'" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">사는얘기</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category='포럼'" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">포럼</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category='IT 행사'" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">IT 행사</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category='정기모임/스터디'" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">정기모임/스터디</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category='학원/홍보'" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">학원/홍보</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
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
	<input type="text" name="keyword" id="keyword" value="${maker.cri.keyword}">
	<button id="searchBtn"><img src="/resources/image/search.png" width="10" height="14"></button>
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
	<a href="list${maker.makeSearch(1)}">1&nbsp;</a>
	<a href="list${maker.makerSearch(maker.sPageNo-1)}">&laquo;&nbsp;</a>
	</c:if>
	<c:forEach begin="${maker.sPageNo}" end="${maker.ePageNo}" var="i">
		<c:choose>
			<c:when test="${maker.cri.currPage==i}">&nbsp;
				${i}
			</c:when>
			<c:otherwise>
				<a href="list${maker.makeSearch(i)}">${i}</a>&nbsp;
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${maker.next && maker.ePageNo > 0}">
		<a href="list${maker.makeSearch(maker.ePageNo+1)}">&nbsp;&raquo;</a>
		<a href="list${maker.makeSearch(maker.lastPageNo)}">&nbsp;${lastPageNo}</a>
	</c:if>
</div>


<%@include file="../includes/footer.jsp"%>