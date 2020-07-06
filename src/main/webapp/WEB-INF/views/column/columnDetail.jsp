<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<script src="/resources/jqLib/jquery-3.2.1.min.js"></script>

<ul class="nav nav-sidebar nav-main">

	<li data-toggle="tooltip" data-placement="right"
		data-container="body" title="Q&A"><a href="/qna/list"
		class="link"><i class="nav-icon fa fa-database"></i> <span
			class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>

	<li data-toggle="tooltip" data-placement="right" data-container="body"
		title="Tech"><a href="/tech/list" class="link"><i
			class="nav-icon fa fa-code"></i> <span
			class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>

	<li data-toggle="tooltip" data-placement="right" data-container="body"
		title="커뮤니티"><a href="/comunity/list" class="link"><i
			class="nav-icon fa fa-comments"></i> <span
			class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>

	<li class="active" data-toggle="tooltip" data-placement="right" data-container="body"
		title="칼럼"><a href="/column/list" class="link"><i
			class="nav-icon fa fa-quote-left"></i> <span
			class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>

	<li data-toggle="tooltip" data-placement="right" data-container="body"
		title="Jobs"><a href="/jobs/list" class="link"><i
			class="nav-icon fa fa-group"></i> <span
			class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>

</ul>

<ul class="nav nav-sidebar nav-bottom">
	<li data-toggle="tooltip" data-placement="right" data-container="body"
		title="Github Issues"><a
		href="https://github.com/okjsp/okky/issues" class="link"
		target="_blank"><i class="fa fa-github"></i> <span
			class="nav-sidebar-label nav-sidebar-category-label">Github
				Issues</span></a></li>
</ul>
</div>
        <div class="sidebar-category-nav">
            <h3 class="sub-title">칼럼</h3>
            <ul class="nav">
                <li><a href="/column/detail" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">All</span> <span class="nav-indicator nav-selected"><span class="nav-selected-dot"></span></span></a></li>
            </ul>
            <div class="special-nav">
            </div>
        </div>
        <div id="list-article" class="content scaffold-list" role="main">
<div>
	<h3>칼럼</h3>
	<div style="float: right;"><a href="/column/insertf">새 글 쓰기</a></div>
</div><br><br>
<br>
<table>
	<tr height="40"><td">Seq</td>
		<td>${Detail.seq}</td></tr>
	<tr height="40"><td>Title</td>
		<td>${Detail.title}</td></tr>
	<tr height="40"><td>Id</td>
		<td>${Detail.id}</td></tr>
	<tr height="40"><td>Content</td>
		<td><textarea rows="10" cols="40" readonly="readonly">${Detail.content}</textarea></td>
	</tr>
	<tr height="40"><td>Regdate</td>
		<td>${Detail.regdate}</td></tr>
	<tr height="40"><td>Count</td>
		<td>${Detail.cnt}</td></tr>
</table>
<hr>
<%-- <c:if test="${logID==Detail.id}"> --%>
	<a href="/column/updatef?seq=${Detail.seq}">[글수정]</a>&nbsp;
	<a href="delete?seq=${Detail.seq}">[글삭제]</a><br>
<%-- </c:if> --%>
<hr>
<table>
	<tr>
		<td>댓글</td>
	<c:forEach var="list" items="${comment}">
	<tr align="center" height="30">
		<td>${list.comment_id}</td>
		<td>${list.comment_point}</td>
		<td>${list.comment_content}</td>
		<td>${list.comment_like}</td>
	</tr>
	</c:forEach>
	</table>
	<form action="/column/cinsert" method="post">
		<input type="hidden" name="comment_id" value="kimgildong"/>
		<input type="hidden" name="seq" value="${get.seq}"/>
	<table>
		<tr align="center" height="30">
			<td rowspan="0">image</td>
			<td>id</td>
		</tr>
		<tr>
			<td><textarea rows="10" cols="40" name="comment_content"></textarea></td>
			<td><input type="reset" value="취소">
			<input type="submit" value="등록">
			<input type="hidden" name="id" value="honggildong"></td>
		</tr>
	</table>
	</form>
<%@include file="../includes/footer.jsp"%>