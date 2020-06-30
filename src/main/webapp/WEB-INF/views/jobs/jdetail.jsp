<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<div>
	Jobs
	<div style="float: right;"><a href="/jobs/newinsert" >새 글 쓰기</a></div>
</div><br><br>
<div style="border: 10px;">
	content
</div><br>
<div>
최신순  추천순  댓글순  스크랩순  조회순
</div>
<br>
<table>
	<c:forEach var="mm" items="${melon}">
	<tbody>
		<tr align="center" height="30">
			<td style="color: gray;">#${mm.seq}&nbsp;</td>
			<td rowspan="0">댓글</td>
			<td rowspan="0">좋아요</td>
			<td rowspan="0">${mm.cnt}</td>
			<td rowspan="0">image</td>
			<td>${mm.id}</td>
		</tr>
		<tr align="center" height="30" bordercolor="gray">
			<td>${mm.title}</td>
			<td>${mm.regdate}</td>
		</tr>
	</tbody>
	</c:forEach>
</table>

<%-- <div align="center">
<!-- 1) -->
<c:choose>
	<c:when test="${sPage>perPageNo}">
		<a href="plist?currPage=1">First</a>&nbsp;
		<a href="plist?currPage=${sPage-1}">Prev</a>&nbsp;&nbsp;
	</c:when>
	<c:otherwise>
		<font color="gray">First&nbsp;Prev&nbsp;&nbsp;</font>
	</c:otherwise>
</c:choose>
<!-- 2) -->
<c:forEach  var="i"  begin="${sPage}" end="${ePage}">
	<c:choose>
		<c:when test="${i==currPage}">
			<font size="5" color="Orange">${i}</font>
		</c:when>
		<c:otherwise>
			<a href="plist?currPage=${i}">${i}</a>
		</c:otherwise>
	</c:choose>
</c:forEach>
<!-- 3) -->
<c:choose>
	<c:when test="${ePage<totalPageNo}">
		<a href="plist?currPage=${ePage+1}">&nbsp;&nbsp;Next</a>
		<a href="plist?currPage=${totalPageNo}">&nbsp;Last</a>
	</c:when>
	<c:otherwise>
		<font color="gray">&nbsp;&nbsp;Next&nbsp;Last</font>
	</c:otherwise>
</c:choose>
</div> --%>
<%@include file="../includes/footer.jsp"%>