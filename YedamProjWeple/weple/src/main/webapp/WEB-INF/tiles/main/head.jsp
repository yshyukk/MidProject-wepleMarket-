<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- Header -->
	<header>
		<!-- Header desktop -->
		<div class="container-menu-desktop">

			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="main.do" class="logo">
						<img src="images/icons/logo-01.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li class="active-menu"><a href="#">전체 카테고리</a>
							<ul class="sub-menu">

								<li class="active-menu"><a href="#" class="catg level1" id="95739">과일</a>
									<ul class="sub-menu">
										<li><a
											href="catgDisp.do?catgId=95784&catgLevel=2&name=사과/배"
											class="catg level2" id="95784">사과/배</a></li>
										<li><a href="catgDisp.do?catgId=95785&catgLevel=2&name=감귤/만감류" class="catg level2" id="95785">감귤/만감류</a>
										</li>
										<li><a href="catgDisp.do?catgId=95786&catgLevel=2&name=수박/멜론/참외/토마토" class="catg level2" id="95786">수박/멜론/참외/토마토</a>
										</li>
										<li><a href="catgDisp.do?catgId=95787&catgLevel=2&name=딸기/키위/블루베리" class="catg level2" id="95787">딸기/키위/블루베리</a>
										</li>
										<li><a href="catgDisp.do?catgId=95788&catgLevel=2&name=포도/자두/복숭아" class="catg level2" id="95788">포도/자두/복숭아</a>
										</li>
										<li><a href="catgDisp.do?catgId=95789&catgLevel=2&name=감/곶감" class="catg level2" id="95789">감/곶감</a></li>
										<li><a href="catgDisp.do?catgId=95790&catgLevel=2&name=바나나/파인애플" class="catg level2" id="95790">바나나/파인애플</a>
										</li>
										<li><a href="catgDisp.do?catgId=95791&catgLevel=2&name=오렌지/자몽/레몬" class="catg level2" id="95791">오렌지/자몽/레몬</a>
										</li>
										<li><a href="catgDisp.do?catgId=95792&catgLevel=2&name=망고/열대과일" class="catg level2" id="95792">망고/열대과일</a>
										</li>
										<li><a href="catgDisp.do?catgId=95793&catgLevel=2&name=체리/석류/아보카도" class="catg level2" id="95793">체리/석류/아보카도</a>
										</li>
										<li><a href="catgDisp.do?catgId=95794&catgLevel=2&name=건과일/분말" class="catg level2" id="95794">건과일/분말</a>
										</li>
										<li><a href="catgDisp.do?catgId=95796&catgLevel=2&name=냉동/간편과일" class="catg level2" id="95796">냉동/간편과일</a>
										</li>
									</ul></li>
								<li class="active-menu"><a class="catg level1" href="#">채소</a>
									<ul class="sub-menu">
										<li><a href="catgDisp.do?catgId=96144&catgLevel=2&name=두부/콩나물/숙주나물" class="catg level2" id="96144">두부/콩나물/숙주나물</a>
										</li>
										<li><a href="catgDisp.do?catgId=96145&catgLevel=2&name=고구마/감자" class="catg level2" id="96145">고구마/감자</a>
										</li>
										<li><a href="catgDisp.do?catgId=96146&catgLevel=2&name=양파/마늘/파/생강" class="catg level2" id="96146">양파/마늘/파/생강</a>
										</li>
										<li><a href="catgDisp.do?catgId=96147&catgLevel=2&name=오이/가지/호박/옥수수" class="catg level2" id="96147">오이/가지/호박/옥수수</a>
										</li>
										<li><a href="catgDisp.do?catgId=96148&catgLevel=2&name=상추/깻잎/쌈채소" class="catg level2" id="96148">상추/깻잎/쌈채소</a>
										</li>
										<li><a href="catgDisp.do?catgId=96149&catgLevel=2&name=고추/피망/파프리카" class="catg level2" id="96149">고추/피망/파프리카</a>
										</li>
										<li><a href="catgDisp.do?catgId=96150&catgLevel=2&name=시금치/부추/나물" class="catg level2" id="96150">시금치/부추/나물</a>
										</li>
										<li><a href="catgDisp.do?catgId=96151&catgLevel=2&name=양배추/양상추/브로콜리" class="catg level2" id="96151">양배추/양상추/브로콜리</a>
										</li>
										<li><a href="catgDisp.do?catgId=96152&catgLevel=2&name=샐러드/어린잎채소" class="catg level2" id="96152">샐러드/어린잎채소</a>
										</li>
										<li><a href="catgDisp.do?catgId=96153&catgLevel=2&name=당근/우엉/연근/마" class="catg level2" id="96153">당근/우엉/연근/마</a>
										</li>
										<li><a href="catgDisp.do?catgId=96154&catgLevel=2&name=버섯" class="catg level2" id="96154">버섯</a></li>
										<li><a href="catgDisp.do?catgId=96156&catgLevel=2&name=아스파라거스/허브류/기타" class="catg level2" id="96156">아스파라거스/허브류/기타</a>
										</li>
									</ul></li>
								<li class="active-menu"><a class="catg level1" href="#"
									class="has-children">쌀/잡곡/견과</a>
									<ul class="sub-menu">
										<li><a href="catgDisp.do?catgId=96701&catgLevel=2&name=백미" class="catg level2" id="96701">백미</a></li>
										<li><a href="catgDisp.do?catgId=96702&catgLevel=2&name=찹쌀/현미/흑미" class="catg level2" id="96702">찹쌀/현미/흑미</a></li>
										<li><a href="catgDisp.do?catgId=96703&catgLevel=2&name=혼합곡" class="catg level2" id="96703">혼합곡</a></li>
										<li><a href="catgDisp.do?catgId=96704&catgLevel=2&name=콩/팥/보리/귀리" class="catg level2" id="96704">콩/팥/보리/귀리</a></li>
										<li><a href="catgDisp.do?catgId=96705&catgLevel=2&name=수수/조/깨/잡곡" class="catg level2" id="96705">수수/조/깨/잡곡</a></li>
										<li><a href="catgDisp.do?catgId=96706&catgLevel=2&name=견과류" class="catg level2" id="96706">견과류</a></li>
										<li><a href="catgDisp.do?catgId=96707&catgLevel=2&name=선식/곡물가공" class="catg level2" id="96707">선식/곡물가공</a></li>
									</ul> </li>
								<li class="active-menu"><a class="catg level1" href="#"
									class="has-children">정육/계란류</a>
									<ul class="sub-menu">
										<li><a href="catgDisp.do?catgId=96981&catgLevel=2&name=계란/알류" class="catg level2" id="96981">계란/알류</a></li>
										<li><a href="catgDisp.do?catgId=96982&catgLevel=2&name=닭/오리고기" class="catg level2" id="96982">닭/오리고기</a></li>
										<li><a href="catgDisp.do?catgId=96983&catgLevel=2&name=양고기" class="catg level2" id="96983">양고기</a></li>
										<li><a href="catgDisp.do?catgId=96984&catgLevel=2&name=돼지고기" class="catg level2" id="96984">돼지고기</a></li>
										<li><a href="catgDisp.do?catgId=96985&catgLevel=2&name=국내산소고기" class="catg level2" id="96985">국내산소고기</a></li>
										<li><a href="catgDisp.do?catgId=96986&catgLevel=2&name=수입산소고기" class="catg level2" id="96986">수입산소고기</a></li>
										<li><a href="catgDisp.do?catgId=96987&catgLevel=2&name=양념육/가공육" class="catg level2" id="96987">양념육/가공육</a></li>
									</ul></li>
								<li class="active-menu"><a class="catg level1" href="#"
									class="has-children">수산물/건해산</a>
									<ul class="sub-menu">
										<li><a href="catgDisp.do?catgId=97212&catgLevel=2&name=생선" class="catg level2" id="97212">생선</a></li>
										<li><a href="catgDisp.do?catgId=97213&catgLevel=2&name=오징어/낙지/주꾸미/문어" class="catg level2" id="97213">오징어/낙지/주꾸미/문어</a></li>
										<li><a href="catgDisp.do?catgId=97214&catgLevel=2&name=새우/게/랍스터" class="catg level2" id="97214">새우/게/랍스터</a></li>
										<li><a href="catgDisp.do?catgId=97215&catgLevel=2&name=전복/굴/멍게/조개류" class="catg level2" id="97215">전복/굴/멍게/조개류</a></li>
										<li><a href="catgDisp.do?catgId=97216&catgLevel=2&name=회/명란/날치알/장" class="catg level2" id="97216">회/명란/날치알/장</a></li>
										<li><a href="catgDisp.do?catgId=97218&catgLevel=2&name=김/미역/기타해조류" class="catg level2" id="97218">김/미역/기타해조류</a></li>
										<li><a href="catgDisp.do?catgId=40154&catgLevel=2&name=건오징어/건어물/다시팩" class="catg level2" id="40154">건오징어/건어물/다시팩</a></li>
										<li><a href="catgDisp.do?catgId=97219&catgLevel=2&name=멸치/황태/노가리" class="catg level2" id="97219">멸치/황태/노가리</a></li>
									</ul></li>
								<li class="active-menu"><a class="catg level1" href="#"
									class="has-children">우유/유제품/유아식</a>
									<ul class="sub-menu">
										<li><a href="catgDisp.do?catgId=97431&catgLevel=2&name=우유" class="catg level2" id="97431">우유</a></li>
										<li><a href="catgDisp.do?catgId=97432&catgLevel=2&name=요거트/요구르트" class="catg level2" id="97432">요거트/요구르트</a></li>
										<li><a href="catgDisp.do?catgId=97433&catgLevel=2&name=두유" class="catg level2" id="97433">두유</a></li>
										<li><a href="catgDisp.do?catgId=97434&catgLevel=2&name=치즈" class="catg level2" id="97434">치즈</a></li>
										<li><a href="catgDisp.do?catgId=97435&catgLevel=2&name=버터/생크림/연유" class="catg level2" id="97435">버터/생크림/연유</a></li>
									</ul></li>
							</ul></li>

						<li class="label1" data-label1="hot"><a href="rank.do">랭킹</a></li>

						<li><a href="newer.do">신상품</a></li>

						<li><a href="realTimeReview.do?pageNum=1&amount=10">실시간 후기</a></li>

						<li><a href="showNoticeBoard.do">공지사항</a></li>
						</ul>
					</div>	

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						
						
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>

						<c:choose>
							<c:when test="${userId != null }">
								<a href="cart.do" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11" data-notify="2">
									<i class="zmdi zmdi-shopping-cart"></i>
								</a>
		
								<a href="jjim.do?pageNum=1&amount=10" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11" data-notify="0">
									<i class="zmdi zmdi-favorite-outline"></i>
								</a>
								<a href="mypage.do" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11" style="font-size: 14px;">My Page</a>
								<a href="logout.do" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11" style="font-size: 14px;">로그아웃</a>
							</c:when>
							<c:otherwise>
								<a href="loginForm.do" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11" style="font-size: 14px;">로그인</a>
								<a href="userInsertForm.do" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11" style="font-size: 14px;">회원 가입</a>
							</c:otherwise>
						</c:choose>
					</div>
				</nav>
			</div>	
		</div>


		<!-- Modal Search -->
		<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<div class="container-search-header">
				<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="images/icons/icon-close2.png" alt="CLOSE">
				</button>

				<form class="wrap-search-header flex-w p-l-15">
					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="plh3" type="text" name="search" placeholder="Search...">
				</form>
			</div>
		</div>
	</header>
	
	
