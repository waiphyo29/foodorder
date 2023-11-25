<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<c:import url="../common/header.jsp" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<title>menu details</title>
</head>
<body>
	<!-- navigatrion bar -->
	<c:import url="../common/nav.jsp"/>
	
	<c:url var="update" value="menu">
		<c:param name="mode" value="SHOW_UPDATE"></c:param>
		<c:param name="id" value="${ menu.id }"></c:param>
	</c:url>
	
	<c:url var="delete" value="menu">
		<c:param name="mode" value="DELETE"></c:param>
		<c:param name="id" value="${ menu.id }"></c:param>
	</c:url>
	
    <div class="container-lg" style="margin-top: 120px;">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-6 col-sm-8 mb-5">
                <img class="img-fluid rounded-2 shadow-sm" src="${menu.image }" alt="image">
                
                <c:if test="${fn:contains(user.role,'admin') }">
                	<div class="d-flex justify-content-md-evenly justify-content-end mt-3">
                		<a href="${update }"> <button type="button" class="btn btn-success fs-5">EDIT MENU</button></a>
						
						<!-- Button trigger modal -->
		                <button type="button" class="btn btn-danger fs-5" data-bs-toggle="modal" data-bs-target="#exampleModal">
		                    DELETE MENU
		                </button>
		                
		                <!-- Modal -->
		                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		                    <div class="modal-dialog" style="margin-top: 18%;">
		                    <div class="modal-content">
		                        <div class="modal-header" style="border: none;">
		                        <h5 class="modal-title" id="exampleModalLabel"></h5>
		                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                        </div>
		                        <div class="modal-body fs-3 fw-bold text-center mb-2">
		                            Delete ${ menu.title }
		                        </div>
		                        <div class="modal-footer justify-content-evenly" style="border: none;">
		                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancle</button>
		                        <a href="${delete }"><button type="button" class="btn btn-danger">Delete</button></a>
		                        </div>
		                    </div>
		                    </div>
		                </div>
                
                	</div>
                </c:if>
                
                <c:if test="${ not empty success and not success }">
                	<h1 class="text-danger">Fail to delete.Try again!</h1>
                </c:if>
                
            </div>
            <div class="col-lg-6 col-md-6 col-sm-10 ps-5">
                <h1> ${menu.title} </h1>
                <br>
                
                <p class="lead fs-3 fw-bold fs-3 fw-bold text-secondary"><fmt:formatNumber value="${menu.price }" pattern="#,###.#" />Ks</p>
                <br>

                <c:if test="${menu.veg }">
                	<i class="fa-solid fa-leaf fa-xl ms-3"></i>
                	<p>VEGETARIAN</p>
                </c:if>
                <c:if test="${ not menu.veg }">
                	<i class="fa-solid fa-drumstick-bite fa-xl ms-3"></i>
                	<p>NON VEG</p>
                </c:if>
                <br>
                
                <p class="lead fs-4">INGREDIENTS</p>
				<c:set var="ingredients" value="${menu.ingredients }" />
				<c:set var="ingredient" value="${ fn:split(ingredients,'-') }" />
				<c:forEach var="item" items="${ingredient }">
					<p> - ${item} </p>
				</c:forEach>
                <br>
                
                <h2>DESCRIPTION</h2>
                <p> ${menu.description }
                </p>
                <br>
                
                <p class="lead fs-4">NUTRITION</p>
                <div>
                	<table>
                		<tr>
                			<th class="pe-5">Calories</th>
                			<th class="px-5">Fats</th>
                			<th class="px-5">Proteins</th>
                		</tr>
                		<tr>
                			<td class="pe-5 py-2">${menu.calorie }</td>
                			<td class="px-5 py-2">${menu.fat }</td>
                			<td class="px-5 py-2">${menu.protein }</td>
                		</tr>
                	</table>
                </div>
            </div>
        </div>
    </div>


	<!-- footer -->
	<c:import url="../common/footer.jsp"/>
</body>
</html>