<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<h2>Board Register</h2>

<form action="/board/register" method="post" enctype="multipart/form-data">
	
	title : <input type="text" name="title" > <br>
	writer : <input type="text" name="writer"> <br>
	content : <textarea rows="10" cols="30" name="content"></textarea><br>
	<input  type="file" style="display: none;"
  				 id="files" name="files" multiple>
  		<button type="button" id="trigger" class="btn btn-outline-primary btn-block d-block">Files Upload</button>
			</div>		
			<div class="col-12" id="fileZone">
				
			</div>
	<button class="w-100 btn btn-primary btn-lg my-5" id="regBtn" type="submit">Continue to Register</button>
</form>

<script src="/resources/js/board.register.js"></script>
<jsp:include page="../common/footer.jsp" />