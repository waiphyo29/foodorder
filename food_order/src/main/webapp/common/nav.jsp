<%@page import="org.apache.catalina.Context"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
    
    <nav class="navbar navbar-expand navbar-light shadow-sm mb-3 fixed-top" style="background-color: #ffff;">
      <div class="container-lg mt-2">
        <a href="menu"> 
          <img src="image/yummy-high-resolution-logo-color-on-transparent-background.png" alt="log" style="width: 110px;height: 50px;"> 
        </a>
        <div class="collapse navbar-collapse justify-content-end align-item-center">
          <ul class="navbar-nav">
          	
          	<c:if test="${ not empty user and fn:contains(user.role,'admin') }">
          	<li class="nav-item me-5">
          		<a href="orderlist?mode=ORDERS" >
          		<button type="button" class="btn btn-danger mt-2">Check Order <span class="badge bg-info">${orderNo}</span>
          		</button></a>
          	</li>
          	</c:if>
          
            <li class="nav-item me-5">
				<c:if test="${ empty user }"> <!-- not login yet -->
				  <div class="collapse navbar-collapse" id="navbarNavDropdown">
			        <ul class="navbar-nav">
			          <li class="nav-item dropdown">
			            <a class="nav-link " href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			              <h3> <i class="bi bi-person text-danger"></i> </h3>
			            </a>
			            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="min-width: 100px;">
			              <li><a class="dropdown-item text-info" href="login">Login</a></li>
			              <li><a class="dropdown-item text-success" href="user">SignUp</a></li>
			            </ul>
			          </li>
			        </ul>
			      </div>
				</c:if>
				
				<c:if test="${ not empty user }">
					<c:choose>
						<c:when test="${ fn:contains(user.role,'admin') }"><!-- admin -->
							  <div class="collapse navbar-collapse" id="navbarNavDropdown">
						        <ul class="navbar-nav">
						          <li class="nav-item dropdown">
						            <a class="nav-link " href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						             <h3> <i class="bi bi-person-check text-info"></i> </h3>
						            </a>
						            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="min-width: 100px;">
						              <li><p class="ms-3 text-info"> Admin </p></li>
						              <li><a class="dropdown-item text-danger" href="login?mode=LOGOUT">Log out</a></li>
						            </ul>
						          </li>
						        </ul>
						      </div>
						</c:when>
						<c:otherwise><!-- user -->
							  <div class="collapse navbar-collapse" id="navbarNavDropdown">
						        <ul class="navbar-nav">
						          <li class="nav-item dropdown">
						            <a class="nav-link " href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						             <h3> <i class="bi bi-person-check text-info"></i> </h3>
						            </a>
						            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="min-width: 100px;">
						              <li><p class="mx-3 text-info"> ${ user.name } </p></li>
						              <li><a class="dropdown-item text-danger" href="login?mode=LOGOUT">Log out</a></li>
						            </ul>
						          </li>
						        </ul>
						      </div>
						</c:otherwise>
					</c:choose>
				</c:if>
            </li>
            
            <c:if test="${ not empty user }">
			<li class="nav-item me-5">
          	 <div class="collapse navbar-collapse" id="navbarNavDropdown">
		        <ul class="navbar-nav">
		          <li class="nav-item dropdown">
		            <a class="nav-link " href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		             <h3> <i class="bi bi-card-checklist text-success"></i> </h3>
		            </a>
		            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="min-width: 100px;">
		              <li><a class="dropdown-item text-secondary" href="user?mode=CHANGEINFO">Edit Info</a></li>
		              <li><a class="dropdown-item text-secondary" href="orderlist?mode=ORDERHISTORY">History</a></li>
		            </ul>
		          </li>
		        </ul>
		      </div>
		    </li>
            </c:if>
            
            <li class="nav-item">
            
            <form action="menu" method="get">
            	<input type="hidden" name="mode" value="CART" >
            	<input id="cart" type="hidden" name="carts" value="">
            	<a><button class="btn position-relative" type="submit" onclick="sendToCart()" >
            	<c:if test="${ not empty info }">
            	  <span id="info" class="position-absolute translate-middle badge rounded-pill bg-danger" style="top: 10px;left: 90%">
				    ${ info }
				  </span>
				</c:if>
				<c:if test="${ empty info }">
            	  <span id="info" class="position-absolute translate-middle badge rounded-pill bg-danger" style="top: 10px;left: 90%">
				    0
				  </span>
				</c:if>
                <i class="bi bi-cart2 text-danger h3"></i>
                </button></a>
            </form>
              
            </li>
          </ul>
        </div>
      </div>
    </nav>