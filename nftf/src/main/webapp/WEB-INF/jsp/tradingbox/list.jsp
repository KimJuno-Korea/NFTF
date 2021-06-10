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
								
								<table border="1">
								
									<thead>
										<tr>
										<th>거래함 번호</th>
										<th>관련 게시글 링크</th>
										<th>상태</th>
										</tr>
									</thead>
									<tbody>
											<c:forEach items="${tradingBoxList}" var="tradingBox">
												<tr>
													<td><c:out value="${tradingBox.no}" /></td>
													<td><a href="/branch/${tradingBox.boardNo}">${boardNo}</a></td>
													<td><c:out value="${tradingBox.status}" /></td>
												</tr>
											</c:forEach>
									</tbody>
								</table>
								
							</div>
							
							<a href="/branch/${name}form" ><input type="button" value="수정"/></a>
							<form action="/branch/${name}" method="post">
								<input type="submit" value="삭제" />
								<input type="hidden" name="_method" value="delete"/>
							</form>
					
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	
	
<jsp:include page="/WEB-INF/jsp/common/bottom.jsp" />