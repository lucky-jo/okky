<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>

<div>
	<h3>칼럼</h3>
	<div style="float: right;"><a href="/column/insert" >새 글 쓰기</a></div>
</div><br><br>
<div style="float: right;">
	검색창 
</div><br>
<div>
최신순  추천순  댓글순  스크랩순  조회순
</div>
<br>
<table>
	<c:forEach var="mm" items="${Banana}">
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





<%@include file="../includes/footer.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKKY - 유용한 테스트 케이스를 위한 개발자의 자세</title>
</head>
<body>

</body>
</html>

