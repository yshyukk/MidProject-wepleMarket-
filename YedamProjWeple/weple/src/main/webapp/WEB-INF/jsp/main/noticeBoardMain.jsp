<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style>

	* {
		font-family: 'Noto Sans KR', sans-serif;
	}
	td, th{
		padding: 10px;
	}
	
	.td-bno {
		width: 80px;
		text-align: center;
	}
	
	.td-date {
		width: 190px;
		text-align: center;
	}
	
	.td-cnt{
		width: 65px;
		text-align: center;
	}
	
	.td-title {
		color: #555555;
	}
	
	.td-title:hover {
		color: #6c7ae0;
	}
</style>

<section class="bg0 p-t-23 p-b-140" style="padding-top: 150px;">
	<div class="container">
		<div class="p-b-10" style="padding-bottom: 15px;">
			<h3 class="ltext-103 cl5" style="font-weight: 900; font-size: 26px; color: #444;">
				공지사항
			</h3>
		</div>

		<div class="wrap-table-shopping-cart">
			<table class="table-shopping-cart">
				<tr>
					<th class="td-bno">글번호</th>
					<th class="td-date">작성일자</th>
					<th style="text-align: center;">제목</th>
					<th class="td-cnt">조회수</th>
				</tr>
				<tbody>
					<c:forEach var="items" items="${notices }">
						<tr>
							<td class="td-bno">${items.bno }</td>
							<td class="td-date">${items.writeDate }</td>
							<td><a href="showNoticeDetail.do?bno=${items.bno }" class="td-title">
								${items.title }</a></td>
							<td class="td-cnt">${items.CNT }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</section>
