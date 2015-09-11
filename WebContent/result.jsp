<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,dto.DblpElement"%>
<%
	List<DblpElement> elements = (List<DblpElement>) request
	        .getAttribute("elements");
    int totalPage = (int) Math.ceil(elements.size() / 10);

	String keywords = request.getParameter("keywords");
	String publicationtype = request.getParameter("publicationtype");
%>

<jsp:include page="header.jsp" />
<style>
.dblp-item {
	display: none;
}

#page-select {
	display: inline-block;
	width: 60%;
}

input[type="checkbox"] {
	display: block;
	margin: auto;
}
</style>

<div class="container">
	<h1>Search Result</h1>

<!--  
	<p>
		Searching Keywords:
		<%=keywords%></p>
	<p>
		Searching Publication Type:
		<%=publicationtype%></p>
-->
	<%
		if (elements.isEmpty()) {
	%>

	<h3>Sorry, no matching datasets found!</h3>


	<%
		} else {
	%>

	<form action="do" method="get">
		<input type="hidden" name="servlet" value="onAdd" />
		<table class="table table-bordered">
			<tr>
				<th width="50">Select</th>
				<th>Title</th>
				<th>Author</th>
				<th>Year</th>
			</tr>

			<%
				for (DblpElement element : elements) {
			%>
			<tr class="dblp-item">
				<td><input type="checkbox" name="pick"
					value="<%=element.getId()%>"></td>
				<td><a href="info.jsp?id=<%=element.getId()%>"> <%=element.getTitle()%></a>
				</td>
				<td><%=element.getAuthors().toString()%></td>
				<td><%=element.getYear().toString()%></td>

			</tr>
			<%
				}
			%>
		</table>

		<button class="btn btn-primary" type="submit">Add to shopping
			cart</button>

	</form>


	<div class="pager">
		<div class="">
			<a class="pull-left btn btn-success page-nav" data-action="prev">Prev</a>
			<a class="pull-right btn btn-success page-nav" data-action="next">Next</a>
		</div>
		<div class="">
			<select id="page-select" class="form-control">
				<%
					for (int i = 0; i < totalPage; i++) {
				%>
				<option value="<%=i%>" data-index="<%=i%>">page
					<%= (i+1) %> out of
					<%=totalPage%></option>
				<%
					}
				%>
			</select>
		</div>
	</div>
	<%
		}
	%>
</div>


<script>
	var totalPage =
<%=totalPage%>
	;

	function showCurrentPage() {
		var dblps = $('.dblp-item');
		var select = $('#page-select');
		var currentIndex = select.val();

		dblps.hide();
		var start = currentIndex * 10;
		var i = 0;
		for (i = start; i < start + 10; i++) {
			var el = $(dblps[i]);
			el.show();
		}
	}

	$('#page-select').change(function(e) {
		showCurrentPage();
	});

	$('.page-nav').click(function(e) {
		var btn = $(e.target);
		var action = btn.data('action');
		var currentIndex = parseInt($('#page-select').val());

		if (action == "next") {
			if (currentIndex < totalPage - 1) {
				$('#page-select').val(currentIndex + 1);
				$('#page-select').change();
			}
		} else if (currentIndex > 0) {
			$('#page-select').val(currentIndex - 1);
			$('#page-select').change();
		}
	});

	showCurrentPage();
</script>

