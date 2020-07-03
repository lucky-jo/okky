<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
        <div class="sidebar-category-nav">
            <h3 class="sub-title">칼럼</h3>
            <ul class="nav">
                <li><a href="/column/list" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">All</span> <span class="nav-indicator nav-selected"><span class="nav-selected-dot"></span></span></a></li>
            </ul>
            <div class="special-nav">
            </div>
        </div>
        <div id="list-article" class="content scaffold-list" role="main">
<br>
<table>
<tr align="center" height=30>
	<td>Seq</td><td>Title</td><td>ccnt</td><td>like</td>
	<td>cnt</td><td>ID</td><td>point</td><td>RegDate</td>
</tr>
<c:forEach var="mm" items="${Banana}">
	<tr align="center" height=30>
	<td>${mm.seq}</td>
	<td><a href="detail?seq=${mm.seq}">${mm.title}</a></td>
	<td>${mm.comment}</td>
	<td>${mm.like}</td>
	<td>${mm.cnt}</td>
	<td>${mm.id}</td>
	<td>${mm.point}</td>
	<td>${mm.regdate}</td>
	</tr>
</c:forEach>
</table>
<hr>
<%@include file="../includes/footer.jsp"%>