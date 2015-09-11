<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,dto.DblpElement"%>
<%
	List<DblpElement> elements = (List<DblpElement>) session
	        .getAttribute("session_elements");
%>

<jsp:include page="header.jsp" />

<div class="container">
	<h1>Shopping cart</h1>

	<%
		if (elements == null || elements.isEmpty()) {
	%>

	<h3>Shopping Cart is Empty!</h3>

	<%
		} else {
	%>

	<form action="do" method="get">
		<input type="hidden" name="servlet" value="onDel" />
		<table class="table table-borderd">
			<tr>
				<th></th>
				<th>Title</th>
				<th>Author</th>
				
			</tr>

			<%
				for (DblpElement element : elements) {
			%>
			<tr>
				<td><input type="checkbox" name="pick"
					value="<%=element.getId()%>"></td>
				<td><a href="info.jsp?id=<%=element.getId()%>"> <%=element.getTitle()%></a>
				</td>
				<td><%=element.getAuthors().toString()%></td>
				
			</tr>
			<%
				}
			%>
		</table>

		<button class="btn btn-danger" type="submit">Remove from Shopping cart</button>
		<a class="btn btn-info" href="index.jsp">Back to search</a>

	</form>

	<%
		}
	%>
</div>

