<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.DblpDao, dto.DblpElement"%>

<jsp:include page="header.jsp" />

<div class="container">
	<h1>Welcome</h1>

	<div class="row">
		<form class="" action="do">
			<input type="hidden" name="servlet" value="onSimpleSearch" />
			<h4>Search</h4>
			<div class="form-group col-sm-4">
				<label for="keywords">Keywords</label> <input type="text"
					class="form-control" id="keywords" name="keywords"
					placeholder="Enter keywords">
			</div>

			<div class="form-group col-sm-4">
				<label for="publicationtype">Publication Type</label> <select
					class="form-control" name="publicationtype" id="publicationtype">
					<option value="article">Article</option>
					<option value="inproceeding">In proceeding</option>
					<option value="book">Book</option>
					<option value="proceeding">Proceeding</option>
					<option value="incollection">In collection</option>
					<option value="phdthesis">PhDthesis</option>
					<option value="masterthesis">MasterThesis</option>
					<option value="www">www</option>
				</select>
			</div>

			<button type="submit" class="btn btn-primary" style="margin-top: 25px;">Search</button>
		</form>

	</div>


	<h3>Random 10</h3>
	<table class="table table-bordered">
		<tr>
			<th>Title</th>
			<th>Author</th>

		</tr>

		<%
			for (DblpElement element : DblpDao.getRandomTen()) {
		%>
		<tr>
			<td><a href="info.jsp?id=<%=element.getId()%>"><%=element.getTitle()%></a></td>
			<td><%=element.getAuthors().toString()%></td>

		</tr>
		<%
			}
		%>
	</table>
</div>

