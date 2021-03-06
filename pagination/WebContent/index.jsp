<%@page import="com.bean.Article"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Server side pagination of articles example</title>
<style type="text/css">
.button {
	border-top: 1px solid #96d1f8;
	background: #65a9d7;
	background: -webkit-gradient(linear, left top, left bottom, from(#3e779d),
		to(#65a9d7) );
	background: -webkit-linear-gradient(top, #3e779d, #65a9d7);
	background: -moz-linear-gradient(top, #3e779d, #65a9d7);
	background: -ms-linear-gradient(top, #3e779d, #65a9d7);
	background: -o-linear-gradient(top, #3e779d, #65a9d7);
	padding: 5px 10px;
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;
	border-radius: 8px;
	-webkit-box-shadow: rgba(0, 0, 0, 1) 0 1px 0;
	-moz-box-shadow: rgba(0, 0, 0, 1) 0 1px 0;
	box-shadow: rgba(0, 0, 0, 1) 0 1px 0;
	text-shadow: rgba(0, 0, 0, .4) 0 1px 0;
	color: white;
	font-size: 14px;
	font-family: Georgia, serif;
	text-decoration: none;
	vertical-align: middle;
}

.button:hover {
	border-top-color: #28597a;
	background: #28597a;
	color: #ccc;
}

.button:active {
	border-top-color: #1b435e;
	background: #1b435e;
}
</style>
</head>
<body>
	<div>
		<h2>Server side pagination of articles example</h2>
	</div>
	<form action="article" method="post">
		<input type="hidden" name="action" value="load"> <input
			type="submit" class="button" value="Get data list">
	</form>
	<br>
	<c:if test="${not empty list}">
		<%
			List<Article> list = (List<Article>) session
						.getAttribute("list");
		%>
		<!-- if number size of list is eq to number of news to be displayed in a page button next will not be displayed -->
		<c:if test="${btnPrevious!='' && btnPrevious!='Previous Disabled'}">
			<form action="article" method="post">
				<input type="hidden" name="action" value="previous"> <input
					type="submit" class="button" value="${btnPrevious}">
			</form>
		</c:if>
		<div class="row">
			<div class="col-md-12">

				<c:if test="${not empty startIndex && not empty endIndex}">
					<%
						for (int j = (Integer) session.getAttribute("startIndex"); j < (Integer) session
										.getAttribute("endIndex"); j++) {
									if (j < list.size()) {
										Article article = list.get(j);
										if (article != null) {
					%>
					<hr>
					<c:set var="article" value="<%=article%>"></c:set>
					<h4>${article.id}.${article.title}</h4>
					<p>${article.content}</p>
					<%
						}
									}
								}
					%>
				</c:if>
				<hr>
				<!-- if number size of list is eq to number of news to be displayed in a page button next will not be displayed -->
				<c:if test="${btnNext!=''&& btnNext!='Next Disabled'}">
					<form action="article" method="post">
						<input type="hidden" name="action" value="next"> <input
							type="submit" class="button" value="${btnNext}">
					</form>
				</c:if>
			</div>
		</div>
		<div class="row"></div>


	</c:if>


</body>
</html>