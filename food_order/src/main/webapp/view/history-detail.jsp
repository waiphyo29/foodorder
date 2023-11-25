<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- header -->
<c:import url="../common/header.jsp" />
<title>history detail</title>
</head>
<body>
	

	<!-- navigatrion bar -->
	<c:import url="../common/nav.jsp"/>
		
		<div class="container-lg" style="margin-top: 100px;min-height: 500px">
		<div class="row d-flex justify-content-md-start justify-content-sm-center border">
          <div class="border col-md-8 border-0 offset-2">
          <div class="w-100 text-center mb-3"> <h1 class="text-secondary">Your Order List</h1></div>
		
		<c:forEach var="orderItem" items="${orderItemList }">
            <div class="card mb-2" ><!-- cart -->
              <div class="row d-flex justify-content-evenly" style="min-height: 50px;">
                  <div class="col-3">
                    <img src="${ orderItem.image }" 
                    class="img-fluid rounded" style="height: 50px;" alt="img">
                  </div>

                  <div class="col-9">
                    <div class="row d-flex">
                      <div class="col-6">
                        <p class="mb-1 fs-6 fw-bold">${orderItem.title }</p>
                      </div>
                      <div class="col-4 d-flex justify-content-center my-2 py-0">
                        <div class="border border-0">
                         x ${orderItem.quantity }
                        </div>
                      </div>
                      <div class="col-2">
                        <p class="my-2 text-info">${orderItem.subtotal } Ks</p>
                      </div>
                    </div>
                  </div>
                </div>
            </div><!-- cart -->

    </c:forEach>
    
    		<div class="card mt-2 border-0 border-top text-center" style="height: 60px;">
    			<p class="lead fw-3 my-2">Total Cost : <span class="text-secondary fs-5">${ order.cost } Ks</span> </p>
    		</div>
    		</div>
    		
        </div>
    </div>

 <!-- footer -->
 <c:import url="../common/footer.jsp"></c:import>
</body>
</html>