<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/jsp/common/top.jsp" />
<c:set var="list" value="${list }" />

	<section>
		<div class="block no-padding">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="inner2">
							<div class="inner-title2">
								<h3>중고 거래</h3>
							</div>
							<div class="page-breacrumbs">
								<ul class="breadcrumbs">
									<li><a href="${pageContext.request.contextPath}/index" title="">Home</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section>
	<div class="block less-top">
		<div class="container">
			<div class="row">
				<aside class="col-lg-3 column margin_widget">
					<form name="searchForm">
						<div class="widget">
							<h3 class="sb-title open">구분</h3>
							<div class="posted_widget">
								<input type="radio" name="division" value="A" id="232" checked><label for="232">전체</label><br>
								<input type="radio" name="division" value="S" id="wwqe"><label for="wwqe">판매</label><br>
								<input type="radio" name="division" value="B" id="all"><label for="all">구매</label><br>
							</div>
						</div>
					
						<div class="widget">
							<h3 class="sb-title open">거래방식</h3>
							<div class="posted_widget">
								<input type="radio" name="tradeWay" value="A" id="all2" checked><label for="all2">전체</label><br>
								<input type="radio" name="tradeWay" value="D" id="qwe"><label for="qwe">직거래</label><br>
								<input type="radio" name="tradeWay" value="P" id="wqe"><label for="wqe">택배 거래</label><br>
								<input type="radio"	name="tradeWay" value="T" id="qweqw"><label class="nm" for="qweqw">거래함</label><br>
							</div>
						</div>
						<div class="widget">
							<div class="search_widget">
								<div class="field_search">
									<input type="text" name="keyword" placeholder="검색할 제목을 입력하세요." id="keyword">
									<button type="button" onclick="searchClick()" style="padding: 0px 0px;">
										<i class="la la-search"></i>
									</button>
								</div>
								<!-- Search Widget -->
								<c:if test="${sessionScope.id != null }">
			 						<a class="apply-thisjob" onclick="location.href='/board/form'" style="padding:10px 30px;">등록하기</a>
			 					</c:if>
							</div>
						</div>
					</form>
				</aside>
				<div class="col-lg-9 column" id="boardList">
					<div class="emply-list-sec style2">
						<!-- Employe List -->
						<c:forEach var="list" items="${boardList }" varStatus="board">
						<c:choose>
							<c:when test="${list.status eq 'S' }"> <!-- 거래 완료 -->
								<div class="emply-list" style="background:#f7f5f5;opacity:0.6;">
							</c:when>
							<c:otherwise>
								<div class="emply-list">
							</c:otherwise>
						</c:choose>
						
								<div class="emply-list-thumb">
									<img src="<%=request.getContextPath()%>/photo/thumbnail/${list.no}">
								</div>
								<div class="emply-list-info">
									<div class="emply-pstn">
										<c:choose>
											<c:when test="${list.division eq 'S'}">
												<b style="color: #4381ff;">판매&nbsp;&nbsp;</b>
											</c:when>
											<c:when test="${list.division eq 'B'}">
												<b style="color: #fb236a;">구매&nbsp;&nbsp;</b>
											</c:when>
										</c:choose>
										
										<c:choose>
											<c:when test="${list.tradeWay eq 'D'}">
												<b style="color: black;">&nbsp;&nbsp;직거래&nbsp;&nbsp;</b>
											</c:when>
											<c:when test="${list.tradeWay eq 'P'}">
												<b style="color: black;">&nbsp;&nbsp;택배&nbsp;&nbsp;</b>
											</c:when>
											<c:when test="${list.tradeWay eq 'T'}">
												<b style="color: black;">&nbsp;&nbsp;거래함&nbsp;&nbsp;</b>
											</c:when>
										</c:choose>
										
										<c:choose>
											<c:when test="${list.status eq 'S'}">
												<b style="color: #fb236a;">&nbsp;&nbsp;거래완료&nbsp;&nbsp;</b>
											</c:when>
											<c:when test="${list.status eq 'W'}">
												<b style="color: blue;">&nbsp;&nbsp;거래중&nbsp;&nbsp;</b>
											</c:when>
											<c:when test="${list.status eq 'M'}">
												<b style="color: #1ede3e;">&nbsp;&nbsp;거래가능&nbsp;&nbsp;</b>
											</c:when>
										</c:choose>
									</div>
									<h3>
										<a href="/board/${list.no}">${list.title }</a>
									</h3>
									<c:choose>
										<c:when test="${list.division eq 'S'}">
											<span  style="color:#4381ff"><fmt:formatNumber value="${list.price}" pattern="#,###,###"/> ￦</span>

										</c:when>
										<c:when test="${list.division eq 'B'}">
											<span  style="color:#fb236a"><fmt:formatNumber value="${list.price}" pattern="#,###,###"/> ￦</span>
										</c:when>
									</c:choose>
									<p>${list.content }</p>
								</div>
							</div>
						</c:forEach>
						<!-- Pagination -->
					</div>
					
					<div class="pagination">
						<ul>
						<c:if test="${paging.prev}">
							<li class="prev">
								<a href="<%=request.getContextPath() %>/board?num=${paging.startPageNum - 1}">
									<i class="la la-long-arrow-left"></i>이전
								</a>
							</li>
						</c:if>

						<c:forEach begin="${paging.startPageNum}" end="${paging.endPageNum}" var="num">
							<c:if test="${select != num}">
								<li><a href="<%=request.getContextPath() %>/board?num=${num}">${num}</a></li>
							</c:if>
							<c:if test="${select == num}">
								<li class="active">
									<a style="font:bold;">${num}</a>
								</li>
							</c:if>
						</c:forEach>

						<c:if test="${paging.next}">
							<li class="next">
								<a href="<%=request.getContextPath() %>/board?num=${paging.endPageNum + 1}">다음
									<i class="la la-long-arrow-right"></i>
								</a>
							</li>
						</c:if>
						</ul>
					</div>
				</div>
				
				<div class="col-lg-9 column">
					<div id="boardSearchResult">
						<%@ include file="../board/boardSearch.jsp" %>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />

</html>
