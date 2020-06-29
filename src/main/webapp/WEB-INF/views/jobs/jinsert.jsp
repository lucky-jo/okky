<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jobs Insert</title>
</head>
<body bgcolor="blue">
<h2>새 글 쓰기</h2>

<div>image</div>
<div>
	${logID}
</div>
	<form action="/jobs/newinsert" method="post">
		<table>
			<tr>
				<td>
					<select name="category" id="category">
  						<option value="0">게시판을 선택해주세요</option>
    					<option value="1">좋은회사/나쁜회사</option>
    					<option value="2">구인</option>
    					<option value="3">구직</option>
    					
  					</select>
				</td>
			</tr>
			<tr>
				<td>제목을 입력해주세요</td>
			</tr>
			<tr>
				<td><textarea rows="10" cols="40" name="content"></textarea></td>
			</tr>
				<td><input type="reset" value="취소">
					<input type="submit" value="글등록" onclick=""> </td>
				
		</table>
	</form>
</body>
</html>