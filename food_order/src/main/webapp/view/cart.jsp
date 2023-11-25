<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- header -->
<c:import url="../common/header.jsp" />
<title>cart</title>
</head>
<body>
	

	<!-- navigatrion bar -->
	<c:import url="../common/nav.jsp"/>
	
		<c:if test="${not empty cartList }">
		
		<div class="container-lg" style="margin-top: 100px;min-height: 500px">
		<div class="row d-flex justify-content-md-start justify-content-sm-center">
          <div class="border col-md-6 border-0">
          <div class="w-100 text-center mb-3"> <h1 class="text-secondary">Your Cart List</h1></div>
		
		<c:forEach var="cartList" items="${cartList }">
            <div class="card mb-2" ><!-- cart -->
              <div class="row d-flex justify-content-evenly" style="min-height: 50px;">
                  <div class="col-3">
                    <img src="${ cartList.image }" 
                    class="img-fluid rounded" style="height: 50px;" alt="img">
                  </div>

                  <div class="col-9">
                    <div class="row d-flex">
                      <div class="col-6">
                        <p class="mb-1 fs-6 fw-bold">${cartList.title }</p>
                        <p class="my-0 text-info">${cartList.subtotal } Ks</p>
                      </div>
                      <div class="col-4 d-flex justify-content-center my-2 py-0">
                        <div class="btn-group border border-0" role="group" aria-label="Basic example">
                        	<a href="menu?mode=MINUS&minus=${cartList.menuid }"><span class="minus btn">-</span></a> 
	                        <span class="num btn border border-top-0 border-bottom-0">
	                        	${cartList.quantity }
	                        </span>
	                        <a href="menu?mode=PLUS&plus=${cartList.menuid }"><span class="plus btn">+</span></a>
                        </div>
                      </div>
                      <div class="col-2">
                       <a href="menu?mode=CANCEL&cancel=${cartList.menuid }"> <h5 class="my-3"><i class="bi bi-trash3 text-danger"></i></h5></a>
                      </div>
                    </div>
                  </div>
                </div>
            </div><!-- cart -->

    </c:forEach>
    
    		<div class="card mt-2 border-0 border-top text-center" style="height: 60px;">
    			<p class="lead fw-3 my-2">Total Price : <span class="text-secondary fs-5">${ total } Ks</span> </p>
    		</div>
    		</div>
    		
    		<div class="col-md-6 d-flex justify-content-center"><!-- form -->
            <div class=" rounded-3" style="width: 80%; ">
            
            <c:if test="${ not pickup }">
              <c:import url="../common/delivery-cart.jsp"></c:import>
            </c:if>
            
            <c:if test="${ pickup }">
              <c:import url="../common/pickup-cart.jsp"></c:import>
            </c:if>
              
            </div>
          </div><!-- form -->
    		
        </div>
    </div>
    </c:if>
    
    <c:if test="${empty cartList }">
    <div class="container-lg " style="margin-top: 100px;">
		<c:if test="${not empty orderup }">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
			  <strong>Order UP!</strong> Thank you for your order.
			  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</c:if>
    	<div class="d-flex justify-content-center " style="align-items: center;min-height: 500px">
    		<div style="width: 50%; height: 200px;display: flex;justify-content: center;align-items: center;">
    		<h1 class="text-secondary" style="display: block;">Your Cart is Empty.</h1>
    		<a style="display: block;" href="menu"><button class="btn btn-danger"> browse </button></a>
    		</div>
    	</div>
    </div>
    </c:if>

 <!-- footer -->
 <c:import url="../common/footer.jsp"></c:import>
</body>
</html>