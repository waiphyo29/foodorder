<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- header -->
<c:import url="../common/header.jsp" />
<title>Sign up</title>
</head>
<body>

	<!-- navigatrion bar -->
	<c:import url="../common/nav.jsp"/>

	    <div class="container" style="margin-top: 100px;">
        <div class="row">
            <div class="col-12 col-lg-4 col-md-6 col-sm-8 offset-lg-4 offset-md-3 offset-sm-2">
                <div class="login-form mt-4 p-4 shadow p-3 mb-5" style="border-radius: 50px;background-color: #ffff;">
                    <form action="user" method="post" class="row g-3">
                        <h1 class="text-center text-danger">Sign Up</h1>
                        
                        <c:if test="${not empty success and success }">
                        	<p class="text-success"> account is created! </p>
                        </c:if>
                        
                        <c:if test="${not empty success and not success }">
                        	<p class="text-danger"> account creation is fail! </p>
                        </c:if>
                        
                        <input type="hidden" name="mode" value="CREATE" >
                        <div class="col-12">
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-person-fill"></i>
                                </span>
                                <input type="text" name="name" class="form-control" placeholder="Name" required="required">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-envelope-fill"></i>
                                </span>
                                <input type="email" name="email" class="form-control" placeholder="Email" required="required">
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
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-lock-fill"></i>
                                </span>
                                <input type="password" name="confirm-password" class="form-control" placeholder="Confirm Password">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-telephone-fill"></i>
                                </span>
                                <input type="number" name="phone" class="form-control" placeholder="PhoneNumber">
                            </div> 
                        </div>
                        <div style="height: 20px;"></div>
                        <div class="col-12 d-flex justify-content-center">
                            <button type="submit" class="btn btn-danger w-50 rounded-pill" style="color: #ffff;">Signup</button>
                        </div>
                    </form>
                    <hr class="mt-4">
                    <div class="col-12">
                        <p class="text-center mb-0">already have an account? <a href="login">Login</a></p>
                    </div>
                </div>
            </div>
        </div><!-- row end -->
    </div><!-- container div end -->

 <!-- footer -->
 <c:import url="../common/footer.jsp"></c:import>
</body>
</html>