<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comunity Insert</title>
</head>
<body>
<h2>새 글 쓰기</h2>

<div>image</div>
<div>
	${logID}
</div>
	<form action="insert" method="post">
		<table>
			<tr>
				<td>
					<select name="category" id="category">
  						<option value="default">게시판을 선택해주세요</option>
    					<option value="story">사는 얘기</option>
    					<option value="forum">포럼</option>
    					<option value="it">IT 행사</option>
    					<option value="study">정기모임/스터디</option>
    					<option value="school">학원/홍보</option>
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