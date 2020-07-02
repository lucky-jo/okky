<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<script src="/resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="/resources/jqLib/comunityCheck.js"></script>
<script>
function del() {
	if(confirm("정말 삭제하시겠습니까?")==true){
		document.remove.submit();
	}else{
		return;
	}
} // del() 
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

${detail.category}
<div style="float: right;"><a href="/comunity/cinsert" >새 글 쓰기</a></div>
		<table>
			<tbody>
				<tr align="center" height="30">
					<td rowspan="1">image</td>
					<td>${detail.id}</td>
				</tr>
				<tr>
					<td>${detail.regdate}</td>
				</tr>
				<tr align="center" height="30">
					<td style="color: gray;">#${detail.seq}&nbsp;${detail.category}</td>
				</tr>
				<tr>
					<td>${detail.title}</td>
				</tr>
				<tr>
					<td><textarea rows="10" cols="40" readonly="readonly">${detail.content}</textarea></td>
				</tr>
				<tr align="center" height="30" bordercolor="gray">
					<td>${detail.regdate}</td>
				</tr>
				<tr>
					<td><a href="/comunity/updatef?seq=${detail.seq}">수정</a><td>
					<td><a href="/comunity/delete?seq=${detail.seq}" onclick="del()">삭제</a></td>
				</tr>
			</tbody>
		</table><br><br><br>

		<table>
			<tr>
				<td>댓글</td>
			</tr>
			<c:forEach var="rr" items="${reply}">
			<tr align="center" height="30">
				<td rowspan="0">image</td>
				<td>${rr.rid}</td>
			</tr>
			<tr>
				<td>${rr.regdate}</td>
			</tr>
			<tr>
				<td>${rr.rcontent}</textarea></td>
			</tr>
			</c:forEach>
		</table>
		<form action="/comunity/rinsert" method="post">
		<table>
			<tr align="center" height="30">
				<td rowspan="0">image</td>
				<td>id</td>
			</tr>
			<tr>
				<td><textarea rows="10" cols="40" name="content"></textarea></td>
				<td><input type="reset" value="취소">
				<input type="submit" value="등록">
				<input type="hidden" name="id" value="hongildong"></td>
			</tr>
		</table>
	</form>

<%@include file="../includes/footer.jsp"%>