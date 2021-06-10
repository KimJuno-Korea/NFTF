<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/jsp/common/top.jsp" />

	<section>
		<div class="block no-padding  gray">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="inner2">
							<div class="inner-title2">
								<h3>거래함 조회</h3>
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
	
	<section style="margin-bottom:60px">	
		<div class="trading-list">
			<div class="container">
				<div class="trading-row">
					<div class="row">
						<div class="col-12">
							<div class="trading-table">
								<table border="1" style="width:100%;margin:80px 0px 40px 0px;">
									<thead>
										<tr>
										<th>거래함 번호</th>
										<th>관련 게시글</th>
										<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${tradingBoxList}" var="tradingBox" varStatus="status">
											<tr>
												<td><c:out value="${tradingBox.no}" /></td>
												
												<td><a href="/board/${tradingBox.boardNo}">${boardList[status.index].title}</a></td>
												
												<c:if test="${tradingBox.status eq 'N'}">
													<td style="color:green">미사용중</td>
												</c:if>
												<c:if test="${tradingBox.status eq 'Y'}">
													<td style="color:red">사용중</td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							
							<div class="row">
								<div class="col-3">
									<a href="/branch/${name}form" ><input type="button" value="수정" class="submit" /></a>
								</div>
								<div class="col-3">
									<form action="/branch/${name}" method="post">
										<input type="submit" value="삭제"  class="submit"/>
										<input type="hidden" name="_method" value="delete"/>
									</form>
								</div>	
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	
	
<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />