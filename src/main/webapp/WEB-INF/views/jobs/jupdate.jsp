<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<h2>** [글 수정] **</h2>
<form action="jupdate" method="post">
<table>
  <tr><td bgcolor="Chartreuse">S E Q</td>
      <td><input type="text" name="seq" value="${Detail.seq}" readonly="readonly">
  </td></tr>
  <tr><td bgcolor="Chartreuse">Title</td>
      <td><input type="text" name="title" value="${Detail.title}">
  </td></tr>
  <tr><td bgcolor="Chartreuse">I  D</td>
      <td><input type="text" name="id" value="${Detail.id}" readonly="readonly">
  </td></tr>
  <tr><td bgcolor="Chartreuse">Content</td>
      <td><textarea name="content" rows="10" cols="40">${Detail.content}</textarea>
  </td></tr>
  <tr><td bgcolor="Chartreuse">RegDate</td>
      <td><input type="text" name="regdate" value="${Detail.regdate}" readonly="readonly">
  </td></tr>
  <tr><td bgcolor="Chartreuse">ViewCount</td>
      <td><input type="text" name="cnt" value="${Detail.cnt}" readonly="readonly">
  </td></tr>
  <tr><td></td>
  	  <td><input type="submit" value="글수정">&nbsp;
  	      <input type="reset"  value="Reset">
  </td></tr>
</table>
</form><br>
<br>
<hr>
<a href="home">Home</a><br>
<%@include file="../includes/footer.jsp"%>