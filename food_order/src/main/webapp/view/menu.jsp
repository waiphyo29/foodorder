<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/header.jsp" />
<title>menu page</title>

	<style type="text/css">
	
		#carouselExampleControls{
			height: 350px;
		}
		
      	@media(max-width: 992px){
        	#carouselExampleControls{
          	height: 300px;
        	}
      	}

      	@media(max-width: 768px){
       	 	#carouselExampleControls{
          	height: 200px;
        	}
      	}
	</style>
</head>
<body>
	<!-- navigatrion bar -->
	<c:import url="../common/nav.jsp"/>
	
	    <!-- Image slide show -->
    <div id="carouselExampleControls" class="carousel slide mb-4" data-bs-ride="carousel" style="margin-top: 100px;">
      <div class="carousel-inner container-sm" style="height: 100%">
        <div class="carousel-item active" style="bottom: 20%;">
          <a href="#rice"><img src="https://glutenfreeandmore.com/wp-content/uploads/2016/12/Gluten-Free-Fried-Rice.jpg" class="d-block w-100" alt="image1"></a>
        </div>
        <div class="carousel-item" style="bottom: 20%;">
          <a href="#burger"><img src="https://s41230.pcdn.co/wp-content/uploads/2018/10/Hungry-Jacks-Commercial-2-e1540216532954.jpeg" class="d-block w-100" alt="image2"></a>
        </div>
        <div class="carousel-item">
          <a href="#juice"><img src="https://cdn3.vectorstock.com/i/1000x1000/80/62/apple-juice-advertising-fruit-refreshing-drink-vector-18608062.jpg" class="d-block w-100" alt="iamge3"></a>
        </div>
      </div>
      <button class="carousel-control-prev ms-5" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next me-5" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
    
    <!-- categories -->
    <div style="position: sticky;top: 77px; background-color: #ffff; z-index: 1;padding-bottom: 0px;">
      <div class="mx-5" >
        <div class="d-flex justify-content-between">
        
          <div class="dropdown d-inline-block">
            <p class="dropdown-toggle mb-0 pt-3 mx-4 fs-5" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
              CATEGORIES
            </p>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
              <li><a class="dropdown-item" href="#rice">RICE</a></li>
              <li><a class="dropdown-item" href="#burger">BURGER</a></li>
              <li><a class="dropdown-item" href="#pizza">PIZZA</a></li>
              <li><a class="dropdown-item" href="#sandwich">SANDWICH</a></li>
              <li><a class="dropdown-item" href="#juice">JUICE</a></li>
              <li><a class="dropdown-item" href="#coffee">COFFEE</a></li>
            </ul>
          </div>
          
          <div class="d-inline-block pt-3" style="width: 30%;">
            <form class="d-flex mb-0 " action="menu" method="get">
              <input type="hidden" name="mode" value="SEARCH">
              <input name="search" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" required="required">
              <button class="btn btn-outline-danger" type="submit">Search</button>
            </form>
          </div>
          
          <div class="mt-3">
          
          	<c:if test="${not empty user and fn:contains(user.role,'admin') }">
          		<a href="menu?mode=SHOW_CREATE"><button type="button" class="btn btn-outline-success btn-sm me-2 rounded-pill">add new menu</button></a>
          	</c:if>
          	
         	<c:choose>
          		<c:when test="${ not empty onlyVeg and onlyVeg }">
          			<a href="menu"><button type="button" class="btn btn-danger btn-sm me-2 rounded-pill">vegetarian</button></a>
          		</c:when>
          		<c:otherwise>
          			<a href="menu?mode=VEG"><button type="button" class="btn btn-outline-danger btn-sm me-2 rounded-pill">vegetarian</button></a>
          		</c:otherwise>
          	</c:choose>
          	
         	<c:choose>
          		<c:when test="${ not empty sortByPrice and sortByPrice }">
          			<a href="menu"><button type="button" class="btn btn-danger btn-sm me-3 rounded-pill">price <i class="bi bi-sort-down-alt"></i></button></a>	
          		</c:when>
          		<c:otherwise>
          			<a href="menu?mode=PRICE"><button type="button" class="btn btn-outline-danger btn-sm me-3 rounded-pill">price <i class="bi bi-sort-down-alt"></i></button></a>
          		</c:otherwise>
          	</c:choose>
            
          </div>
        </div>
		<hr class="mt-2">
      </div>
    </div>
      <!-- Searched Result Container -->
      <c:if test="${ not empty exist and not exist }">
      	<h1 class="text-danger">The Result is not found</h1>
      </c:if>
      
	  <c:if test="${ not empty exist and exist }">
      		<h1 class="pt-3" style="margin-left: 10%">RESULT</h1>
      <section id="card-holder" class="mt-5">
        <div class="container-sm">
            <div class="row  justify-content-lg-start">
             <c:forEach var="searchedList" items="${searchedList }">
             	<c:url var="detailsLink" value="menu">
             		<c:param name="mode" value="DETAIL"/>
             		<c:param name="id" value="${searchedList.id }"/>
             	</c:url>
             
             	<div class="col-12 col-sm-6 col-md-4 col-lg-4 mb-3">
                <div class="card shadow-sm border-0">
                    <a href="${detailsLink }">
                    <img src="${searchedList.image }" class="card-img-top h-100 rounded-3" alt="rice" style="max-height: 200px">
                    </a>
                    <div class="card-body">
                    	<div class=" text-center"> 
                    	<h5 class="card-title fs-3 fw-light pb-2">${searchedList.title }</h5>
                    	</div>
                    	<div class="d-flex justify-content-between">
	                      <p class="card-text"> <span class="text-secondary lead fs-3 fw-bold" > <fmt:formatNumber value="${(searchedList.price)}" pattern="#,###.#" />Ks </span> </p>
	                      
	                      <c:if test="${ empty user }"> <!-- button -->
	                      	<c:import url="../common/button-trigger-model.jsp"></c:import>
	                      </c:if>
	                      
	                      <c:if test="${not empty user and not empty cartList }">
	                      	<c:set var="searchedIdexist" value="false"></c:set>
		                      <c:forEach var="cart" items="${ cartList }">
		                      	<c:choose>
			                      	<c:when test="${searchedList.id eq cart.menuid }">
			                      		<c:set var="searchedIdexist" value="true"></c:set>
			                      	</c:when>
			                    </c:choose>
		                      </c:forEach>
		                      <c:if test="${ not searchedIdexist }">
		                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" onclick="toggleText(${searchedList.id},this)">ADD</button>
		                      </c:if>
		                      <c:if test="${ searchedIdexist }">
		                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" >ADDED</button>
		                      </c:if>
		                   </c:if><!-- user button -->
		                   
		                      <c:if test="${not empty user and empty cartList and fn:contains(user.role,'user')}">
		                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" onclick="toggleText(${searchedList.id},this)">ADD</button>
		                      </c:if><!--  user button -->
		                      
		                      <c:if test="${not empty user and empty cartList and fn:contains(user.role,'admin')}">
		                      	<a href="${detailsLink }"><button class="btn btn-success btn-sm rounded px-4 py-0 fs-5 my-2">Edit</button></a>
		                      </c:if><!-- admin button -->
	                      
                    	</div>
                    </div>
                </div>
                </div>
                
              </c:forEach>
               
            </div>
        </div>
      </section>
      </c:if>
      
    
    	<p id="rice"></p>
          	      <!-- Rice Cards Container -->
	  <c:if test="${ not empty riceList }">
      		<h1 class="pt-3" style="margin-left: 10%">RICE</h1>
      <section id="card-holder" class="mt-5">
        <div class="container-sm">
            <div class="row  justify-content-lg-start">
             <c:forEach var="riceList" items="${riceList }">
             	<c:url var="detailsLink" value="menu">
             		<c:param name="mode" value="DETAIL"/>
             		<c:param name="id" value="${riceList.id }"/>
             	</c:url>
             
             	<div class="col-12 col-sm-6 col-md-4 col-lg-4 mb-3">
                <div class="card shadow-sm border-0">
                    <a href="${detailsLink }">
                    <img src="${riceList.image }" class="card-img-top h-100 rounded-3" alt="rice" style="max-height: 200px">
                    </a>
                    <div class="card-body">
                    	<div class=" text-center"> 
                    	<h5 class="card-title fs-3 fw-light pb-2">${riceList.title }</h5>
                    	</div>
                    	<div class="d-flex justify-content-between">
	                      <p class="card-text"> <span class="text-secondary lead fs-3 fw-bold" > <fmt:formatNumber value="${(riceList.price)}" pattern="#,###.#" />Ks </span> </p>
	                      
	                      <c:if test="${ empty user }"> <!-- button -->
	                      	<c:import url="../common/button-trigger-model.jsp"></c:import>
	                      </c:if>
	                      
	                      <c:if test="${not empty user and not empty cartList }">
	                      	<c:set var="riceIdexist" value="false"></c:set>
		                      <c:forEach var="cart" items="${ cartList }">
		                      	<c:choose>
			                      	<c:when test="${riceList.id eq cart.menuid }">
			                      		<c:set var="riceIdexist" value="true"></c:set>
			                      	</c:when>
			                    </c:choose>
		                      </c:forEach>
		                      <c:if test="${ not riceIdexist }">
		                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" onclick="toggleText(${riceList.id},this)">ADD</button>
		                      </c:if>
		                      <c:if test="${ riceIdexist }">
		                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" >ADDED</button>
		                      </c:if>
	                      </c:if><!-- user button -->
	                      
	                     <c:if test="${not empty user and empty cartList and fn:contains(user.role,'user')}">
	                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" onclick="toggleText(${riceList.id},this)">ADD</button>
	                      </c:if><!-- user button -->
	                      
	                      <c:if test="${not empty user and empty cartList and fn:contains(user.role,'admin')}">
	                      	<a href="${detailsLink }"><button class="btn btn-success btn-sm rounded px-4 py-0 fs-5 my-2">Edit</button></a>
	                      </c:if><!-- admin button -->
	                      
                    	</div>
                    </div>
                </div>
                </div>
                
              </c:forEach>
               
            </div>
        </div>
      </section>
      </c:if>
      
      
		<p id="burger"></p>
	      <!-- Burgers Cards Container -->
	  <c:if test="${ not empty burgerList }">
      		<h1 class="pt-3" style="margin-left: 10%">BURGERS</h1>
      <section id="card-holder" class="mt-5">
        <div class="container-sm">
            <div class="row  justify-content-lg-start">

             <c:forEach var="burgerList" items="${burgerList }">
             	<c:url var="detailsLink" value="menu">
             		<c:param name="mode" value="DETAIL"/>
             		<c:param name="id" value="${burgerList.id }"/>
             	</c:url>
             
             	<div class="col-12 col-sm-6 col-md-4 col-lg-4 mb-3">
                <div class="card shadow-sm border-0">
                	<a href="${detailsLink }">
                    <img src="${burgerList.image }" class="card-img-top h-100 rounded-3" alt="shoes" style="max-height: 200px">
                    </a>
                    <div class="card-body text-center">
                    	<div class=" text-center"> 
                    	<h5 class="card-title fs-3 fw-light pb-2">${burgerList.title }</h5>
                    	</div>
                    	<div class="d-flex justify-content-between">
	                      <p class="card-text"> <span class="text-secondary lead fs-3 fw-bold" > <fmt:formatNumber value="${(burgerList.price)}" pattern="#,###.#" />Ks </span> </p>
	                      
	                      <c:if test="${ empty user }"> <!-- button -->
	                      	<c:import url="../common/button-trigger-model.jsp"></c:import>
	                      </c:if>
	                      
	                      <c:if test="${not empty user and not empty cartList }">
	                      	<c:set var="burgerIdexist" value="false"></c:set>
		                      <c:forEach var="cart" items="${ cartList }">
		                      	<c:choose>
			                      	<c:when test="${burgerList.id eq cart.menuid }">
			                      		<c:set var="burgerIdexist" value="true"></c:set>
			                      	</c:when>
			                    </c:choose>
		                      </c:forEach>
		                      <c:if test="${ not burgerIdexist }">
		                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" onclick="toggleText(${burgerList.id},this)">ADD</button>
		                      </c:if>
		                      <c:if test="${ burgerIdexist }">
		                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" >ADDED</button>
		                      </c:if>
	                      </c:if>
	                      <c:if test="${not empty user and empty cartList and fn:contains(user.role,'user')}">
	                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" onclick="toggleText(${burgerList.id},this)">ADD</button>
	                      </c:if><!-- button -->
	                      
	                      <c:if test="${not empty user and empty cartList and fn:contains(user.role,'admin')}">
	                      	<a href="${detailsLink }"><button class="btn btn-success btn-sm rounded px-4 py-0 fs-5 my-2">Edit</button></a>
	                      </c:if><!-- admin button -->
	                      
                    	</div>
                    </div>
                </div>
                </div>
              </c:forEach>
               
            </div>
        </div>
      </section>
      </c:if>
      
      
      <p id="pizza"></p>
      	      <!-- Pizza Cards Container -->
	  <c:if test="${ not empty pizzaList }">
      		<h1 class="pt-3" style="margin-left: 10%">PIZZA</h1>
      <section id="card-holder" class="mt-5">
        <div class="container-sm">
            <div class="row  justify-content-lg-start">

             <c:forEach var="pizzaList" items="${pizzaList }">
             	<c:url var="detailsLink" value="menu">
             		<c:param name="mode" value="DETAIL"/>
             		<c:param name="id" value="${pizzaList.id }"/>
             	</c:url>
             
             	<div class="col-12 col-sm-6 col-md-4 col-lg-4 mb-3">
                <div class="card shadow-sm border-0">
                	<a href="${detailsLink }">
                    <img src="${pizzaList.image }" class="card-img-top h-100 rounded-3" alt="shoes" style="max-height: 200px">
                    </a>
                    <div class="card-body text-center">
                    	<div class=" text-center"> 
                    	<h5 class="card-title fs-3 fw-light pb-2">${pizzaList.title }</h5>
                    	</div>
                    	<div class="d-flex justify-content-between">
	                      <p class="card-text"> <span class="text-secondary lead fs-3 fw-bold" > <fmt:formatNumber value="${(pizzaList.price)}" pattern="#,###.#" />Ks </span> </p>
	                      
	                      <c:if test="${ empty user }"> <!-- button -->
	                      	<c:import url="../common/button-trigger-model.jsp"></c:import>
	                      </c:if>
	                      
	                      <c:if test="${not empty user and not empty cartList }">
	                      	<c:set var="pizzaIdexist" value="false"></c:set>
		                      <c:forEach var="cart" items="${ cartList }">
		                      	<c:choose>
			                      	<c:when test="${pizzaList.id eq cart.menuid }">
			                      		<c:set var="pizzaIdexist" value="true"></c:set>
			                      	</c:when>
			                    </c:choose>
		                      </c:forEach>
		                      <c:if test="${ not pizzaIdexist }">
		                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" onclick="toggleText(${pizzaList.id},this)">ADD</button>
		                      </c:if>
		                      <c:if test="${ pizzaIdexist }">
		                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" >ADDED</button>
		                      </c:if>
	                      </c:if>
	                      <c:if test="${not empty user and empty cartList and fn:contains(user.role,'user')}">
	                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" onclick="toggleText(${pizzaList.id},this)">ADD</button>
	                      </c:if><!-- user button -->
	                      
	                      <c:if test="${not empty user and empty cartList and fn:contains(user.role,'admin')}">
	                      	<a href="${detailsLink }"><button class="btn btn-success btn-sm rounded px-4 py-0 fs-5 my-2">Edit</button></a>
	                      </c:if><!-- admin button -->
	                      
                    	</div>
                    </div>
                </div>
                </div>
              </c:forEach>
               
            </div>
        </div>
      </section>
      </c:if>
      
      
      <p id="sandwich"></p>
      	      <!-- Sandwich Cards Container -->
	  <c:if test="${ not empty sandwichList }">
      		<h1 class="pt-3" style="margin-left: 10%">SANWICH</h1>
      <section id="card-holder" class="mt-5">
        <div class="container-sm">
            <div class="row  justify-content-lg-start">

             <c:forEach var="sandwichList" items="${sandwichList }">
             	<c:url var="detailsLink" value="menu">
             		<c:param name="mode" value="DETAIL"/>
             		<c:param name="id" value="${sandwichList.id }"/>
             	</c:url>
             
             	<div class="col-12 col-sm-6 col-md-4 col-lg-4 mb-3">
                <div class="card shadow-sm border-0">
                	<a href="${detailsLink }">
                    <img src="${sandwichList.image }" class="card-img-top h-100 rounded-3" alt="shoes" style="max-height: 200px">
                    </a>
                    <div class="card-body text-center">
                    	<div class=" text-center"> 
                    	<h5 class="card-title fs-3 fw-light pb-2">${sandwichList.title }</h5>
                    	</div>
                    	<div class="d-flex justify-content-between">
	                      <p class="card-text"> <span class="text-secondary lead fs-3 fw-bold" > <fmt:formatNumber value="${(sandwichList.price)}" pattern="#,###.#" />Ks </span> </p>
	                      
	                      <c:if test="${ empty user }"> <!-- button -->
	                      	<c:import url="../common/button-trigger-model.jsp"></c:import>
	                      </c:if>
	                      
	                      <c:if test="${not empty user and not empty cartList }">
	                      	<c:set var="sandwichIdexist" value="false"></c:set>
		                      <c:forEach var="cart" items="${ cartList }">
		                      	<c:choose>
			                      	<c:when test="${sandwichList.id eq cart.menuid }">
			                      		<c:set var="sandwichIdexist" value="true"></c:set>
			                      	</c:when>
			                    </c:choose>
		                      </c:forEach>
		                      <c:if test="${ not sandwichIdexist }">
		                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" onclick="toggleText(${sandwichList.id},this)">ADD</button>
		                      </c:if>
		                      <c:if test="${ sandwichIdexist }">
		                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" >ADDED</button>
		                      </c:if>
	                      </c:if>
	                      
	                      <c:if test="${not empty user and empty cartList and fn:contains(user.role,'user')}">
	                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" onclick="toggleText(${sandwichList.id},this)">ADD</button>
	                      </c:if><!-- user button -->
	                      
	                      <c:if test="${not empty user and empty cartList and fn:contains(user.role,'admin')}">
	                      	<a href="${detailsLink }"><button class="btn btn-success btn-sm rounded px-4 py-0 fs-5 my-2">Edit</button></a>
	                      </c:if><!-- admin button -->
	                      
                    	</div>
                    </div>
                </div>
                </div>
              </c:forEach>
                
            </div>
        </div>
      </section>
      </c:if>
      
      
      <p id="coffee"></p>
      	      <!-- Coffee Cards Container  -->
	  <c:if test="${ not empty coffeeList }">
      		<h1 class="pt-3" style="margin-left: 10%">COFFEE</h1>
      <section id="card-holder" class="mt-5">
        <div class="container-sm">
            <div class="row  justify-content-lg-start">

             <c:forEach var="coffeeList" items="${coffeeList }">
             	<c:url var="detailsLink" value="menu">
             		<c:param name="mode" value="DETAIL"/>
             		<c:param name="id" value="${coffeeList.id }"/>
             	</c:url>
             
             	<div class="col-12 col-sm-6 col-md-4 col-lg-4 mb-3">
                <div class="card shadow-sm border-0">
                	<a href="${detailsLink }">
                    <img src="${coffeeList.image }" class="card-img-top h-100 rounded-3" alt="shoes" style="max-height: 200px">
                    </a>
                    <div class="card-body text-center">
                    	<div class=" text-center"> 
                    	<h5 class="card-title fs-3 fw-light pb-2">${coffeeList.title }</h5>
                    	</div>
                    	<div class="d-flex justify-content-between">
	                      <p class="card-text"> <span class="text-secondary lead fs-3 fw-bold" > <fmt:formatNumber value="${(coffeeList.price)}" pattern="#,###.#" />Ks </span> </p>
	                      
	                      <c:if test="${ empty user }"> <!-- button -->
	                      	<c:import url="../common/button-trigger-model.jsp"></c:import>
	                      </c:if>
	                      
	                      <c:if test="${not empty user and not empty cartList }">
	                      	<c:set var="coffeeIdexist" value="false"></c:set>
		                      <c:forEach var="cart" items="${ cartList }">
		                      	<c:choose>
			                      	<c:when test="${coffeeList.id eq cart.menuid }">
			                      		<c:set var="coffeeIdexist" value="true"></c:set>
			                      	</c:when>
			                    </c:choose>
		                      </c:forEach>
		                      <c:if test="${ not coffeeIdexist }">
		                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" onclick="toggleText(${coffeeList.id},this)">ADD</button>
		                      </c:if>
		                      <c:if test="${ coffeeIdexist }">
		                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" >ADDED</button>
		                      </c:if>
	                      </c:if>
	                      <c:if test="${not empty user and empty cartList and fn:contains(user.role,'user')}">
	                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" onclick="toggleText(${coffeeList.id},this)">ADD</button>
	                      </c:if><!-- user button -->
	                      
	                      <c:if test="${not empty user and empty cartList and fn:contains(user.role,'admin')}">
	                      	<a href="${detailsLink }"><button class="btn btn-success btn-sm rounded px-4 py-0 fs-5 my-2">Edit</button></a>
	                      </c:if><!-- admin button -->
	                      
                    	</div>
                    </div>
                </div>
                </div>
              </c:forEach>
               
            </div>
        </div>
      </section>
      </c:if>
      
      
      <p id="juice"></p>
      	      <!-- Juice Cards Container  -->
	  <c:if test="${ not empty juiceList }">
      		<h1 class="pt-3" style="margin-left: 10%">JUICE</h1>
      <section id="card-holder" class="mt-5">
        <div class="container-sm">
            <div class="row  justify-content-lg-start">

             <c:forEach var="juiceList" items="${juiceList }">
             	<c:url var="detailsLink" value="menu">
             		<c:param name="mode" value="DETAIL"/>
             		<c:param name="id" value="${juiceList.id }"/>
             	</c:url>
             
             	<div class="col-12 col-sm-6 col-md-4 col-lg-4 mb-3">
                <div class="card shadow-sm border-0">
                	<a href="${detailsLink }">
                    <img src="${juiceList.image }" class="card-img-top h-100 rounded-3" alt="shoes" style="max-height: 200px">
                    </a>
                    <div class="card-body text-center">
                    	<div class=" text-center"> 
                    	<h5 class="card-title fs-3 fw-light pb-2">${juiceList.title }</h5>
                    	</div>
                    	<div class="d-flex justify-content-between">
	                      <p class="card-text"> <span class="text-secondary lead fs-3 fw-bold" > <fmt:formatNumber value="${(juiceList.price)}" pattern="#,###.#" />Ks </span> </p>
	                      
	                      <c:if test="${ empty user }"> <!-- button -->
	                      	<c:import url="../common/button-trigger-model.jsp"></c:import>
	                      </c:if>
	                      
	                      <c:if test="${not empty user and not empty cartList }">
	                      	<c:set var="juiceIdexist" value="false"></c:set>
		                      <c:forEach var="cart" items="${ cartList }">
		                      	<c:choose>
			                      	<c:when test="${juiceList.id eq cart.menuid }">
			                      		<c:set var="juiceIdexist" value="true"></c:set>
			                      	</c:when>
			                    </c:choose>
		                      </c:forEach>
		                      <c:if test="${ not juiceIdexist }">
		                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" onclick="toggleText(${juiceList.id},this)">ADD</button>
		                      </c:if>
		                      <c:if test="${ juiceIdexist }">
		                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" >ADDED</button>
		                      </c:if>
	                      </c:if>
	                      
	                      <c:if test="${not empty user and empty cartList and fn:contains(user.role,'user')}">
	                      	<button class="btn btn-danger btn-sm rounded px-4 py-0 fs-5 my-2" onclick="toggleText(${juiceList.id},this)">ADD</button>
	                      </c:if><!-- user button -->
	                      
	                      <c:if test="${not empty user and empty cartList and fn:contains(user.role,'admin')}">
	                      	<a href="${detailsLink }"><button class="btn btn-success btn-sm rounded px-4 py-0 fs-5 my-2">Edit</button></a>
	                      </c:if><!-- admin button -->
	                     
	                      
                    	</div>
                    </div>
                </div>
                </div>
              </c:forEach>
               
            </div>
        </div>
      </section>
      </c:if>
      



	<script type="text/javascript">

	
		var carts = [];
		let n = document.getElementById("info").innerHTML;
		
		function toggleText(id,event) {
			let i = 0;
            var text = event.textContent || event.innerText;
            if(text == 'ADD'){
                event.innerHTML = 'ADDED';
				document.getElementById("info").innerHTML = ++n;
            }else{
                event.innerHTML = 'ADD';
				document.getElementById("info").innerHTML = --n;
            }
            
            if(carts.some(i => i == id)){
				
				const index = carts.indexOf(id);
				if(index !== -1){
					delete carts[index];
				}
			}else {
				carts.push(id);
			}
        }
		
		 function sendToCart(){
			 document.getElementById('cart').value = carts;
		 }
		
	</script> 
	<c:import url="../common/footer.jsp"/>
</body>
</html>