<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- header -->
<c:import url="../common/header.jsp" />
<title>customerOrder history</title>
</head>
<body>

	<!-- navigatrion bar -->
	<c:import url="../common/nav.jsp"/>

	<c:if test="${not empty customerOrderList }">
	<div class="container-lg " style="margin-top: 100px;min-height: 500px">
	<h2 class="text-center">Order History</h2>
		<table class="table table-hover">
				<thead>
					<tr>
						<th>DATE</th>
						<th>TIME</th>
						<th>COST</th>
						<th>CHECK</th>
						<th>ACTION</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="no" value="0"></c:set>
					<c:forEach var="order" items="${customerOrderList }" >
					<tr>
						<td>${order.date }</td>
						<td>${order.time }</td>
						<td>${order.cost } Ks</td>
						<c:if test="${order.orderup }"><td class="text-danger">Waiting</td></c:if>
						<c:if test="${ not order.orderup }"><td class="text-info">Received</td></c:if>
						<td>
							<a href="orderlist?mode=ORDERDETAIL&orderid=${order.id }" class="btn btn-sm btn-primary">Check Detail</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
		</table>
	
     </div>
	</c:if>
	<c:if test="${ empty customerOrderList }">
	<div class="container-lg " style="margin-top: 100px;">
    	<div class="d-flex justify-content-center " style="align-items: center;min-height: 500px">
    		<div style="width: 50%; height: 200px;display: flex;justify-content: center;align-items: center;">
    		<h1 class="text-secondary" style="display: block;">No Order History.</h1>
    		</div>
    	</div>
    </div>
	</c:if>

 <!-- footer -->
 <c:import url="../common/footer.jsp"></c:import>
</body>
</html>