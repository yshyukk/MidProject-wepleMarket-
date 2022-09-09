<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.nio.file.FileSystems"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.Reader"%>
<%@page import="com.dev.service.jjim.JjimService"%>
<%@page import="com.dev.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.dev.service.product.ProductService"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/css/catgDisp.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/css/catgDisp-homepage.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath}/css/catgDisp.css"
	rel="stylesheet">

</head>
<body>
	<%
	ProductService service = ProductService.getInstance();
	int where = Integer.parseInt(request.getParameter("catgLevel"));
	int get = where + 1;
	int id = Integer.parseInt(request.getParameter("catgId"));
	String userId = (String) session.getAttribute("userId");
	
	
	List<Integer> catgList = service.getCatgId(get, where, id);
	
	pageContext.setAttribute("catgList", catgList);

	List<Product> prodList = service.getProdUsingCatgId(where, id, userId);
	pageContext.setAttribute("prodList", prodList);

	pageContext.setAttribute("currentCatg", where);
	pageContext.setAttribute("nextCatg", get);
	
	
	%>
	<div class="container" style="padding-top: 40px;">

		<div class="row">

			<div class="col-lg-3">

				<h1 class="my-4" style="color: #444; font-weight: bold; font-size: 25px;"><%=request.getParameter("name")%></h1>
				<div class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
					<c:forEach var="catgProd" items="${catgStrList }">
					<a href="catgDisp.do?catgId=${catgProd.prodId }&catgLevel=3&name=${catgProd.prodName}"
		   				class="list-group-item">${catgProd.prodName }</a>
					
					</c:forEach>
				
				</div>

			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">

				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="https://product-image.kurly.com/category/banner/pc/c4c5cf3e-428c-47fb-ac39-16e6c0e3b71b.jpg"
								alt="First slide">
						</div>
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="https://product-image.kurly.com/category/banner/pc/560b044b-5cbc-458c-9a04-a51bab4fe7f6.jpg"
								alt="First slide">
						</div>
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="https://product-image.kurly.com/category/banner/pc/8d264e6e-f5de-434f-8e3b-e49ae5c668f9.jpg"
								alt="First slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
				<div class="row" id="prodListTemplate">


				</div>
				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/catgDisp.js"></script>
</body>
</html>