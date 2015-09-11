<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp" />

<div class="container">
	<h1>Advance Search</h1>

	<form class="" action="do">
		<input type="hidden" name="servlet" value="onAdvancedSearch" />
		<h4>Search</h4>
		<div class="form-group col-sm-3">
			<label for="title">Title</label> <input type="text"
				class="form-control" id="title" name="title"
				placeholder="Enter title">
		</div>

		<div class="form-group col-sm-3">
			<label for="author">Author</label> <input type="text"
				class="form-control" id="author" name="author"
				placeholder="Enter author">
		</div>

		<div class="form-group col-sm-3">
			<label for="year">Year</label> <input type="text"
				class="form-control" id="year" name="year"
				placeholder="Enter year">
		</div>
		
		<div class="form-group col-sm-3">
            <label for="url">URL</label> <input type="text"
                class="form-control" id="url" name="url"
                placeholder="Enter URL">
        </div>

		<div class="form-group col-sm-3">
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

		<hr />
		<button type="submit" class="btn btn-primary"
			style="margin-left: 15px;margin-top: 25px;">Search</button>
	</form>

</div>
