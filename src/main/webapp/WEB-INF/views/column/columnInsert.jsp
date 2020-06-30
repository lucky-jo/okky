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
<h4>새 글 쓰기</h4>
<script>
var tCheck=false;

$(function() {
	$('#title').focus();
	$('#title').focusout(function() {
	 	tCheck=ttCheck();
	}); // title_focusout
}); // ready

function inCheck() {
	if (tCheck==true ) {
		return true;
	}else {
		tCheck=ttCheck();
		return false;
	};
} //inCheck 
</script>
</head>
<body>
<form action="/column/insert" method="post">
<table>
<tr height="40"><td>I D</td>
	<td><input type="text" name="id" value="홍길동" readonly="readonly"></td></tr>
<tr height="40"><td>Title</td>
	<td><input type="text" name="title" id="title"><br>
		<span id="tMessage" class="eMessage"></span></td></tr>
<tr height="40"><td>Content</td>
	<td><textarea rows="10" cols="40" name="content"></textarea>
	</td></tr>
<tr><td></td><td><input type="reset" value="취소">
				 <input type="submit" value="글등록" onclick="return inCheck()"></td>
				 
</table>
</form>
</body>
</html>
<%@include file="../includes/footer.jsp"%>