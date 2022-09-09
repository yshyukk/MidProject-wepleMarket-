<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="p-b-10">
	<h3 class="ltext-103 cl5"
		style="font-weight: 900; font-size: 20px; margin: 10px; text-align: right; color: #444;">
		작성한 리뷰 확인하기</h3>
</div>
<div class="wrap-table-shopping-cart">
	<table class="table-shopping-cart">
		<tr class="table_head">
			<th style="width: 180px; text-align: center;">작성일</th>
			<th style="width: 160px; text-align: center;">별점</th>
			<th style="padding-left: 40px;">작성내용</th>
		</tr>
		<tr style="padding:0; margin:0;">
			<td style="padding:10px; margin:0; width: 180px;">${thisBD.writeDate }</td>
			<td style="padding:10px; margin:0; width: 160px; text-align: center;">
				<c:forEach var="star" items="1,2,3,4,5" begin="0" end="${thisBD.CNT - 1 }">
					⭐
				</c:forEach>
			</td>
			<td style="padding-left: 40px; margin:0;">${thisBD.boardContent }</td>
		</tr>
	</table>
</div>