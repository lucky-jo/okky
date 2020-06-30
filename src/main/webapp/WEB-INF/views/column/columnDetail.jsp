<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
        <div class="sidebar-category-nav">
            <h3 class="sub-title">칼럼</h3>
            <ul class="nav">
                <li><a href="/column/list" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">All</span> <span class="nav-indicator nav-selected"><span class="nav-selected-dot"></span></span></a></li>
            </ul>
            <div class="special-nav">
            </div>
        </div>
        <div id="list-article" class="content scaffold-list" role="main">
<div>
	<h3>칼럼</h3>
	<div style="float: right;"><a href="/column/insert">새 글 쓰기</a></div>
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

<c:if test="${logID==Detail.id}">
	<a href="columnUpdatef?seq=${Detail.seq}">[글수정]</a>&nbsp;
	<a href="columnDelete?seq=${Detail.seq}">[글삭제]</a><br>
</c:if>

<%@include file="../includes/footer.jsp"%>