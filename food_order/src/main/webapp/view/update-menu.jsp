<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<c:import url="../common/header.jsp" />
<title>update menu</title>
</head>
<body>

	<!-- navigation -->
	<c:import url="../common/nav.jsp" />

	<div class="container" style="margin-top: 100px">
        <div class="row">
            <div class="col-12 col-lg-6 col-md-6 col-sm-8 offset-lg-3 offset-md-3 offset-sm-2">
                <div class="login-form mt-4 p-4 shadow p-3 mb-5" style="border-radius: 50px;background-color: #ffff;">
                    <form action="menu" method="post" class="row g-3">
                        <h1 class="text-center text-danger">Update Menu</h1>

                        <c:if test="${not empty success and success }">
                        	<p class="text-success"> Successifully updated to menu </p>
                        </c:if>
                        
                        <c:if test="${not empty success and not success }">
                        	<p class="text-danger"> Fail to update menu! </p>
                        </c:if>
                        
                        <input type="hidden" name="mode" value="UPDATE" ><!-- mode -->
                        <input type="hidden" name="id" value="${menu.id }" >
                        
                        	<!-- title -->
	                        <div class="col-12">
	                            <label>Title</label>
	
	                            <div class="input-group">
	                                <span class="input-group-text">
	                                    <i class="bi bi-egg-fried"></i>
	                                </span>
	                                <input type="text" name="title" class="form-control" value="${menu.title }" placeholder="Title" required="required">
	                            </div>
	                        </div>
	                        <!-- Category -->
	                        <div class="col-12">
	                            <label>Category</label>
	
	                            <div class="input-group">
                                    <span class="input-group-text">
	                                    <i class="bi bi-bookmarks"></i>
	                                </span>
                                	<select name="category" class="form-select" aria-label="Default select example">
                                		<option value="SANDWICH" ${fn:contains(menu.category,'SANDWICH')? "selected" : "" }>SANDWICH</option>
                                        <option value="BURGER" ${fn:contains(menu.category,'BURGER')? "selected" : "" }>BURGER</option>
                                        <option value="PIZZA" ${fn:contains(menu.category,'PIZZA')? "selected" : "" }>PIZZA</option>
                                        <option value="RICE" ${fn:contains(menu.category,'RICE')? "selected" : "" }>RICE</option>
                                        <option value="COFFEE" ${fn:contains(menu.category,'COFFEE')? "selected" : "" }>COFFEE</option>
                                        <option value="JUICE" ${fn:contains(menu.category,'JUICE')? "selected" : "" }>JUICE</option>
                                    </select>
	                            </div>
	                        </div>
                        	<!-- price -->
	                        <div class="col-12">
	                            <label>Price</label>
	
	                            <div class="input-group">
	                                <span class="input-group-text">
	                                    <i class="bi bi-cash-stack"></i>
	                                </span>
	                                <input type="text" name="price" class="form-control" value="${menu.price }" placeholder="Price" required="required">
	                            </div>
	                        </div>
	                        <!-- ingredients -->
	                         <div class="col-12">
	                            <label>Ingredients '-'</label>
	
	                            <div class="input-group">
	                                <span class="input-group-text">
	                                    <i class="bi bi-egg"></i>
	                                </span>
	                                <input type="text" name="ingredients" class="form-control" value="${menu.ingredients }" placeholder="Ingredients" required="required">
	                            </div>
	                        </div>
                            <!-- description -->
	                         <div class="col-12">
	                            <label>Description</label>
	
	                            <div class="input-group">
	                                <textarea rows="12" class="form-control" name="description" placeholder="Description" required="required" > ${menu.description } </textarea>
	                            </div>
	                        </div>
                            <!-- Nutrition -->
                                <label>Nutrition</label>
	                         <div class="col-12 d-flex justify-content-evenly">
	                            <div class="d-inline-block" style="width: 30%;">
	                                <input type="text" name="calorie" class="form-control" value="${menu.calorie }" placeholder="Calorie" required="required">
	                            </div>
                                <div class="d-inline-block" style="width: 30%;">
	                                <input type="text" name="fat" class="form-control" value="${menu.fat }" placeholder="Fat" required="required">
	                            </div>
                                <div class="d-inline-block" style="width: 30%;">
	                                <input type="text" name="protein" class="form-control" value="${menu.protein }" placeholder="Protein" required="required">
	                            </div>
	                        </div>
                            <!-- checkbox -->
                            <c:choose>
                            	<c:when test="${menu.veg }">
                            		<div class="col-12">
			                            <div class="form-check">
			                                <input class="form-check-input" type="checkbox" id="vegetarian" name="vegetarian" value="true" checked="checked">
			                                <label class="form-check-label" for="vegetarian" > Vegetarian </label>
			                            </div>
			                        </div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="col-12">
			                            <div class="form-check">
			                                <input class="form-check-input" type="checkbox" id="vegetarian" name="vegetarian" value="true">
			                                <label class="form-check-label" for="vegetarian" > Vegetarian </label>
			                            </div>
			                        </div>
                            	</c:otherwise>
                            </c:choose>
	                        
	                        <!-- Image -->
	                        <div class="col-12">
	                            <label>Image</label>
	
	                            <div class="input-group">
	                                <span class="input-group-text">
	                                    <i class="bi bi-image"></i>
	                                </span>
	                                <input type="url" name="image" class="form-control" value="${menu.image }" placeholder="Image URL" required="required">
	                            </div>
	                        </div>
	                        <!-- button -->
                        <div class="col-12 d-flex justify-content-center mt-5">
                            <button type="submit" class="btn btn-dark float-end">Edit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div><!-- row end -->
    </div><!-- container div end -->

	<!-- footer -->
	<c:import url="../common/footer.jsp" />
</body>
</html>