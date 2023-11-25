<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<!-- header -->
<c:import url="../common/header.jsp" />
<title>edit info</title>
</head>
<body>

	<!-- navigatrion bar -->
	<c:import url="../common/nav.jsp"/>

    <div class="container" style="margin-top: 100px;">
        <div class="row">
            <div class="col-12 col-lg-6 col-md-6 col-sm-8 offset-lg-3 offset-md-3 offset-sm-2">
                <div class="mt-4 p-4 p-3 mb-5">
                    <form action="user" method="post" class="row g-3">
                        <h1 class="text-center text-danger">Edit Your Info</h1>
                        
                        <c:if test="${not empty success and success }">
                        	<p class="text-success"> successifully saved </p>
                        </c:if>
                        
                        <c:if test="${not empty success and not success }">
                        	<p class="text-danger"> fail to save! try again </p>
                        </c:if> 
                        
                        <input type="hidden" name="mode" value="SAVE" >
                        <div class="col-12">
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-person-fill"></i>
                                </span>
                                <input type="text" name="name" class="form-control" placeholder="Name" value="${user.name }" required>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-telephone"></i>
                                </span>
                                <input type="number" name="phone" class="form-control" placeholder="Phone No" value="${user.phone }" required>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-geo-alt"></i>
                                </span>
                                <input type="text" name="location" class="form-control" placeholder="Location" value="${user.location }" required>
                            </div> 
                        </div>
                        <div class="col-12">
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-map"></i>
                                </span>
                                <input type="text" name="address" class="form-control" placeholder="Address" value="${user.address }" required>
                            </div>
                        </div>
                        <div class="col-4">
                            <select name="payment" id="inputState" class="form-select">
							    <option value="KBZ" ${fn:contains(user.payment,'KBZ')? "selected": ""} >KBZ</option>
							    <option value="AYA" ${fn:contains(user.payment,'AYA')? "selected": ""} >AYA</option>
                            </select>
                        </div>
                        <div class="col-8">
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-credit-card"></i>
                                </span>
                                <input type="number" name="card" class="form-control" placeholder="Card No" value="${user.card }" required>
                            </div>
                        </div>
                        <div style="height: 20px;"></div>
                        <div class="col-12 d-flex justify-content-center">
                            <button type="submit" class="btn btn-info" style="color: #ffff;">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div><!-- row end -->
    </div><!-- container div end -->

 <!-- footer -->
 <c:import url="../common/footer.jsp"></c:import>
</body>
</html>