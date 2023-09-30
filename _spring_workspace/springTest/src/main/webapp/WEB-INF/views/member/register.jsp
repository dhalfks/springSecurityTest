<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div class="container">
  <main>
	<!-- 회원등록란 시작 -->
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">Input your information</h4>
        <form action="/member/register" method="post">
          <div class="row g-3">

            <div class="col-12">
              <label for="email" class="form-label">Email</label>
              <div class="input-group has-validation">
                <input type="email" class="form-control" name="email"
                id="email" placeholder="Email" required>
                <button type="button" class="btn btn-success" 
                id="dupleCheck">중복확인</button>              
              </div>
            </div>

            <div class="col-12">
              <label for="nickName" class="form-label">nickName</label>
              <input type="text" class="form-control" name="nickName"
               id="nickName" placeholder="nickName">              
            </div>
            
            <div class="col-sm-6">
              <label for="pwd" class="form-label">Password</label>
              <input type="password" class="form-control" name="pwd"
               id="pwd" placeholder="" value="" required>              
            </div>

            <div class="col-sm-6">
              <label for="rpwd" class="form-label">Re-Password</label>
              <input type="password" class="form-control" 
              id="rpwd" placeholder="" value="" required>
            </div>
           </div>
          <button class="w-100 btn btn-primary btn-lg my-5" id="regBtn" type="submit">
          Continue to Register</button>
        </form>
      </div>
 </main>
</div>
<script src="/resources/js/member.register.js"></script> 

<jsp:include page="../common/footer.jsp" />