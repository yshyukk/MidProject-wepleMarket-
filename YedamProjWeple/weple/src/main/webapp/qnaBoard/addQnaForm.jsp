<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>문의하기에서 문의하기 클릭하면 실행</title>
</head>
<body>
	
	<form action="../insertQna.do" method="post">
	<h3>Qna</h3>
		
		<textarea row="60" cols="80" name="title" placeholder = "제목을 입력해주세요"></textarea><br>
		<textarea row="150" cols="80" name="boardContent" placeholder="한 번 작성하신 후기는 등록하신 후기는 수정이 불가하니 신중하게 작성해주시기 바랍니다.
												  사실과 관계없는 단순 비방성 내용은 신고합니다."></textarea><br>
		<input type="submit" value="등록">
		<input type="button" value="홈으로" onclick="location.href='../index.jsp'"/>
		
	</form>
</body>
</html>