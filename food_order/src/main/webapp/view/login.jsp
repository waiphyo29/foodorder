<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- header -->
<c:import url="../common/header.jsp" />
<title>Login</title>
</head>
<body>

	<!-- navigatrion bar -->
	<c:import url="../common/nav.jsp"/>

	    <div class="container" style="margin-top: 100px;">
        <div class="row">
            <div class="col-12 col-lg-4 col-md-6 col-sm-8 offset-lg-4 offset-md-3 offset-sm-2">
                <div class="login-form mt-4 p-4 shadow p-3 mb-5" style="border-radius: 50px;background-color: #ffff;">
                    <form action="login" method="post" class="row g-3">
                        <h1 class="text-center text-danger">Login</h1>
                        
                        <c:if test="${not empty success and success }">
                        	<p class="text-success"> login success </p>
                        </c:if>
                        
                        <c:if test="${not empty success and not success }">
                        	<p class="text-danger"> username or password is incorrect! </p>
                        </c:if>
                        
                        <input type="hidden" name="mode" value="LOGIN">
                        <div class="col-12">
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-envelope-fill"></i>
                                </span>
                                <input type="text" name="email" class="form-control" placeholder="E-mail">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-shield-lock-fill"></i>
                                </span>
                                <input type="password" name="password" class="form-control" placeholder="Password">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="rememberMe">
                                <label class="form-check-label"for="rememberMe"> Remember me</label>
                            </div>
                        </div>
                        <div class="col-12 d-flex justify-content-center">
                            <button type="submit" class="btn btn-danger w-50 rounded-pill" style="color: #ffff;">Login</button>
                        </div>
                    </form>
                    <hr class="mt-4">
                    <div class="col-12">
                        <p class="text-center mb-0">have't account yet? <a href="user">Signup</a></p>
                    </div>
                </div>
            </div><!-- column end -->
        </div><!-- row end -->
    </div><!-- container end -->

 <!-- footer -->
 <c:import url="../common/footer.jsp"></c:import>
</body>
</html>