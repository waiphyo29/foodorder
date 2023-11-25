<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- header -->
<c:import url="../common/header.jsp" />
<title>order history</title>
</head>
<body>

	<!-- navigatrion bar -->
	<c:import url="../common/nav.jsp"/>

	<c:if test="${not empty orderList }">
	<div class="container-lg " style="margin-top: 100px;min-height: 500px">
	<h2 class="text-center">Order History</h2>
		<table class="table table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>DATE</th>
						<th>DEL/PIC</th>
						<th>CHECK</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="no" value="0"></c:set>
					<c:forEach var="order" items="${orderList }" >
					<tr>
						<td><c:out value="${ no = no + 1 }"></c:out></td>
						<td>${order.date }</td>
						<c:if test="${ not order.pickup }"><td class="text-info">Delivery</td></c:if>
						<c:if test="${order.pickup }"><td class="text-success">Pick UP</td></c:if>
						<c:if test="${order.orderup }">
							<td><a href="orderlist?mode=CHECK&orderid=${order.id }" class="btn btn-sm btn-primary">Confirm</a></td>
						</c:if>
						<c:if test="${ not order.orderup }">
							<td><a href="orderlist?mode=CHECK&orderid=${order.id }" class="btn btn-sm btn-secondary">Check</a></td>
						</c:if>
					</tr>
					</c:forEach>
				</tbody>
		</table>
	
     </div>
	</c:if>
	<c:if test="${ empty orderList }">
	<div class="container-lg " style="margin-top: 100px;">
    	<div class="d-flex justify-content-center " style="align-items: center;min-height: 500px">
    		<div style="width: 50%; height: 200px;display: flex;justify-content: center;align-items: center;">
    		<h1 class="text-secondary" style="display: block;">No Order Yet.</h1>
    		</div>
    	</div>
    </div>
	</c:if>

 <!-- footer -->
 <c:import url="../common/footer.jsp"></c:import>
</body>
</html>