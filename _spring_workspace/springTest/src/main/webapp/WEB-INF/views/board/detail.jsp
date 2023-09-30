<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<!-- 게시글상세정보란 시작 -->
   <div class="col-md-7 col-lg-8">
     <h4 class="mb-3">Board information</h4>
       <div class="row g-3">
<c:set var="bvo" value="${bdto.bvo }"/>
         <div class="col-12">
           <label for="email" class="form-label">Writer</label>
           <div class="input-group has-validation">
             <span class="input-group-text">@</span>
             <input type="email" class="form-control" name="writer"
             id="writer" value="${bvo.writer }" readonly>              
           </div>
         </div>
         
         <div class="col-12">
           <label for="regAt" class="form-label">Reg At</label>
           <input type="text" class="form-control" value="${bvo.regAt }" readOnly>              
         </div>
         <div class="col-12">
           <label for="modAt" class="form-label">Mod At</label>
           <input type="text" class="form-control" value="${bvo.modAt }" readOnly>              
         </div>
         <div class="col-12">
           <label for="readCount" class="form-label">Read Count</label>
           <input type="text" class="form-control" value="${bvo.readCount }" readOnly>              
         </div>
         <div class="col-12">
           <label for="title" class="form-label">Title</label>
           <input type="text" class="form-control" name="title"
            id="title" placeholder="Title" value="${bvo.title }" readOnly>              
         </div>
         <div class="col-12">
           <label for="cont" class="form-label">Content</label>
           <textarea class="form-control" name="content" readOnly
            id="cont" placeholder="Content">${bvo.content }</textarea>              
         </div>

<c:set var="bfList" value="${bdto.bfList }"/>
<div class="col-12 mb-3">
<ul class="list-group list-group-flush">
<c:forEach items="${bfList }" var="bfvo">
	<li class="list-group-item d-flex justify-content-between align-items-start">
	<c:choose>
		<c:when test="${bfvo.fileType > 0 }">
		<div>
			<img src="/upload/${fn:replace(bfvo.saveDir,'\\','/')}/${bfvo.uuid }_th_${bfvo.fileName}">
		</div>
		</c:when>
		<c:otherwise>
		<div>
			<!-- 클립모양의 아이콘을 넣어서 파일을 표현할 수 있음 -->
		</div>
		</c:otherwise>
	</c:choose>
		<div class="ms-2 me-auto">
			<div class="fw-bold">${bfvo.fileName }</div>
			${bfvo.regAt }
		</div>
			<span class="badge bg-secondary rounded-pill">${bfvo.fileSize } Byte</span>
			</li>
	</c:forEach>
	</ul>
</div>
         
<div class="col-4">
<a href="/board/list?pageNo=${pgvo.pageNo }&qty=${pgvo.qty}&type=${pgvo.type}&keyword=${pgvo.keyword}" class="btn btn-primary">LIST</a>
</div>
<div class="col-4">
<a href="/board/modify?bno=${bvo.bno }&pageNo=${pgvo.pageNo }&qty=${pgvo.qty}&type=${pgvo.type}&keyword=${pgvo.keyword}" id="modBtn" class="btn btn-outline-warning">MOD</a>
</div>
<div class="col-4">
 		<button type="button" id="delBtn" class="btn btn-outline-danger">DEL</button>
</div>
 	   	
     </div>
   </div>


<form action="/board/remove" method="post" id="delForm">
	<input type="hidden" name="bno" value="${bvo.bno }">
	<input type="hidden" name="pageNo" value="${pgvo.pageNo }">
    <input type="hidden" name="qty" value="${pgvo.qty }">
    <input type="hidden" name="type" value="${pgvo.type }">
    <input type="hidden" name="keyword" value="${pgvo.keyword }">
</form>

<!-- 댓글영역 시작 -->
<div class="container">
<div class="input-group my-3">
	<span class="input-group-text" id="cmtWriter">Anonymous</span>
	<input type="text" class="form-control" id="cmtText" value="Test Add Comment ">
	<button class="btn btn-success" id="cmtPostBtn" type="button">Post</button>
</div>
<ul class="list-group list-group-flush" id="cmtListArea">
  <li class="list-group-item d-flex justify-content-between align-items-start">
    <div class="ms-2 me-auto">
      <div class="fw-bold">Writer</div>
      Content for Comment
    </div>
    <span class="badge bg-dark rounded-pill">modAt</span>
  </li>
</ul>
<div class="row" id="cmtPaging">
	<ul class="pagination justify-content-center">
	
    <li class="page-item">
      <a class="page-link" href="">Prev</a>
    </li>    
    
    <li class="page-item"
     aria-current="page">
      <a class="page-link" href=""></a>
    </li>
        
    <li class="page-item">
      <a class="page-link" href="">Next</a>
    </li>
    
  </ul>
</div>

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Anonymous</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class="input-group my-3">
			<input type="text" class="form-control" id="cmtTextMod">
			<button class="btn btn-success" id="cmtModBtn" type="button">Post</button>
		</div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</div>

<script>
const bnoVal = document.querySelector("input[name=bno]").value;
</script>
<script src="/resources/js/board.detail.js"></script>
<script src="/resources/js/board.comment.js"></script>
<script>
let isMod = '<c:out value="${isMod}"/>';
if (parseInt(isMod)) {
	alert('게시글 수정 성공~');
}
getCommentList(bnoVal);
</script>
<jsp:include page="../common/footer.jsp" />
