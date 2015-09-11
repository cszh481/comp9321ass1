<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.DblpDao, dto.DblpElement"%>
<%
	String id = request.getParameter("id");
	DblpElement element = DblpDao.getDblpElementById(Integer
	        .parseInt(id));
%>

<jsp:include page="header.jsp" />

<div class="container">

	<h1>Detail info</h1>

	<%
		if (element == null) {
	%>
	<h3>Oops, no such id</h3>

	<%
		} else {
	%>

	<table class="table table-bordered">
		<tr>
			<td>Title</td>
			<td><%=element.getTitle() == null ? "" : element.getTitle()%></td>
		</tr>
		<tr>
			<td>Author</td>
			<td><%=element.getAuthors()%></td>
		</tr>

		<tr>
			<td>BookTitle</td>
			<td><%=element.getBookTitle() == null ? "" : element
				        .getBookTitle()%></td>
		</tr>
		<tr>
			<td>ISBN</td>
			<td><%=element.getIsbn() == null ? "" : element.getIsbn()%></td>
		</tr>
		<tr>
			<td>Publication Type</td>
			<td><%=element.getType()%></td>
		</tr>
		<tr>
			<td>Page</td>
			<td><%=element.getPage() == null ? "" : element.getPage()%></td>
		</tr>
		<tr>
			<td>Year</td>
			<td><%=element.getYear() == null ? "" : element.getYear()%></td>
		</tr>
		<tr>
			<td>URL</td>
			<td><%=element.getUrl() == null ? "" : element.getUrl()%></td>
		</tr>


	</table>

	<form action="do">
		<input type="hidden" name="servlet" value="onAdd" /> <input
			type="hidden" name="pick" value="<%=element.getId()%>" />
		<button class="btn btn-primary" type="submit">Add to Cart</button>
	</form>


	<%
		}
	%>
</div>
