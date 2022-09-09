<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>상품의 총 평점</title>

<style>
h2 {font-size:15px;}
.star-rating {width:304px; }
.star-rating,.star-rating span {display:inline-block; height:55px; overflow:hidden; background:url(${pageContext.request.contextPath}/img/star.png)no-repeat; }
.star-rating span{background-position:left bottom; line-height:0; vertical-align:top; }
</style>

</head>

<body>
	
<p>${star/100} / 5.0점</p>

<div class="wrap-star">
    <div class='star-rating'>
        <span style ="width:${(star/5)}%"></span>   
    </div>
    
    
</div>




</body>
</html>
