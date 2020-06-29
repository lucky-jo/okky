<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>

<h4>새 글 등록</h4>
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
<form action="columnInsert" method="post">
<table>
<tr height="40"><td>I D</td>
	<td><input type="text" name="id" value="${logID}" readonly="readonly"></td></tr>
<tr height="40"><td>Title</td>
	<td><input type="text" name="title" id="title"><br>
		<span id="tMessage" class="eMessage"></span></td></tr>
<tr height="40"><td>Content</td>
	<td><textarea rows="10" cols="40" name="content"></textarea>
	</td></tr>
<tr><td></td><td><input type="submit" value="글등록" onclick="return inCheck()">
                 <input type="reset" value="취소"></td>	
</table>
</form>

</body>
</html>