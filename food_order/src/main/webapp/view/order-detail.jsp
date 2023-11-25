<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/header.jsp" />
<title>order detail</title>
</head>
<body>

	<!-- navigatrion bar -->
	<c:import url="../common/nav.jsp"/>


	<div class="container-lg" style="margin-top: 100px;min-height: 500px">
        <div class="row d-flex justify-content-md-start justify-content-sm-center">

          <div class="border-0 col-md-6"><!-- order box -->
          <div class="w-100 text-center mb-3"> <h1 class="text-secondary">Order List</h1></div>

            <c:forEach var="order" items="${orderItems }">
            	<div class="card mb-2" ><!-- cart -->
	              <div class="row d-flex justify-content-evenly" style="min-height: 50px;">
	                  <div class="col-3">
	                    <img src="${order.image }"
	                    class="img-fluid rounded" style="height: 50px;" alt="img">
	                  </div>
	
	                  <div class="col-9">
	                    <div class="row d-flex">
	                      <div class="col-8">
	                        <p class="my-2 fs-6 fw-bold">${order.title }</p>
	                      </div>
	                      <div class="col-4 d-flex justify-content-center my-2 py-0">
	                        <div class="btn-group border border-0" role="group" aria-label="Basic example">
	                            <p class="my-2 fs-6 fw-bold">x ${order.quantity }</p>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	            </div><!-- cart -->
            </c:forEach>

          </div><!-- order box -->

          <div class="col-md-6 d-flex justify-content-center mt-3"><!-- form -->
            <div class=" rounded-3" style="width: 80%; ">
              <form class="row g-3" action="orderlist?mode=ORDERCON&orderid=${order.id }" method="post">
              <div class="col-12 mb-5">
                    <div style="width: 50%;height: 30px;margin-left: 50%;border-bottom: 2px solid gray;">
                        <p style="margin-bottom: 0;padding-left: 10px;" >Date _ ${order.date } : ${order.time }</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div style="width: 100%;height: 30px;margin-left: 10%;border-bottom: 2px solid gray;">
                        <p style="margin-bottom: 0;padding-left: 10px;" >Customer _ ${customer.name }</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div style="width: 80%;height: 30px;margin-left: 10%;border-bottom: 2px solid gray;">
                        <p style="margin-bottom: 0;padding-left: 10px;" >Ph no _ ${customer.phone }</p>
                    </div>
                </div>
                <div class="col-12">
                    <div style="width: 90%;height: 50px;margin-left: 5%;border-bottom: 2px solid gray;align-items: end;">
                        <p style="margin-bottom: 0;padding-left: 10px;padding-top: 20px;" >Order Location _ ${customer.location}</p>
                    </div>
                </div>
                <c:if test="${order.pickup }">
                	<div class="col-12">
                    <div style="width: 90%;height: 50px;margin-left: 5%;border-bottom: 2px solid gray;align-items: end;">
                        <p style="margin-bottom: 0;padding-left: 10px;padding-top: 20px;" > This Order is Picking UP </p>
                    </div>
                </div>
                </c:if>
                <c:if test="${ not order.pickup }">
                	<div class="col-12">
                    <div style="width: 90%;height: 50px;margin-left: 5%;border-bottom: 2px solid gray;align-items: end;">
                        <p style="margin-bottom: 0;padding-left: 10px;padding-top: 20px;" >Order Address _ ${customer.address}</p>
                    </div>
                </div>
                </c:if>
                <div class="col-12">
                    <div style="width: 90%;height: 50px;margin-left: 5%;border-bottom: 2px solid gray;align-items: end;">
                        <p style="margin-bottom: 0;padding-left: 10px;padding-top: 20px;" >Payment _ ${customer.payment} - ${customer.card} </p>
                    </div>
                </div>
                <div class="col-12">
                    <div style="width: 90%;height: 50px;margin-left: 5%;border-bottom: 2px solid gray;align-items: end;">
                        <p style="margin-bottom: 0;padding-left: 10px;padding-top: 20px;" >Description _ ${order.description}</p>
                    </div>
                </div>
                <div class="col-12 d-flex justify-content-center mt-5">
                  <c:if test="${order.orderup }">
                  	<button type="submit" class="btn btn-primary">Confirm Order</button>
                  </c:if>
                </div>
              </form>
            </div>
          </div><!-- form -->

        </div>
    </div>
	

	
	<c:import url="../common/footer.jsp"/>
</body>
</html>