<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>

<table>
	<tr height="40"><td bgcolor="yellow">Seq</td>
		<td>${Detail.seq}</td></tr>
	<tr height="40"><td bgcolor="yellow">Title</td>
		<td>${Detail.title}</td></tr>
	<tr height="40"><td bgcolor="yellow">Id</td>
		<td>${Detail.id}</td></tr>
	<tr height="40"><td bgcolor="yellow" >Content</td>
		<td><textarea rows="10" cols="40" readonly="readonly">${Detail.content}</textarea></td>
	</tr>
	<tr height="40"><td bgcolor="yellow">Regdate</td>
		<td>${Detail.regdate}</td></tr>
	<tr height="40"><td bgcolor="yellow">Count</td>
		<td>${Detail.cnt}</td></tr>
</table>

<%@include file="../includes/footer.jsp"%>