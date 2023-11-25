<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<div class="mb-5 d-flex justify-content-center" >
  <div><a href="menu?mode=DELI&pickup=true" class="text-dark" style="text-decoration: none;"><h3>Pick Up</h3></a></div>
  <div style="display: flex;justify-content: center;">
    <a href="menu?mode=DELI&pickup=true" ><h3 class="my-1 mx-3"><i class="bi bi-toggle2-on text-info"></i></h3></a>
  </div>
  <div><a href="menu?mode=DELI&pickup=false" class="text-info" style="text-decoration: none;"><h3>Delivery</h3></a></div>
</div>

<c:if test="${ not empty user }">

<form class="row g-3" action="orderlist?mode=ORDERUP" method="post">
<input type="hidden" name="total" value="${total }">
<div class="col-md-6">
  <label for="inputEmail4" class="form-label">City</label>
  <input type="text" class="form-control" id="inputEmail4" placeholder="Mandalay" name="location" value="${user.location }">
</div>
<div class="col-md-6">
  <label for="inputPassword4" class="form-label">Phone</label>
  <input type="number" class="form-control" id="inputPassword4" placeholder="+959" name="phone" value="${user.phone }" required>
</div>
<div class="col-12">
  <label for="inputAddress" class="form-label">Address</label>
  <input name="address" type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" value="${user.address }" required>
</div>
<div class="col-md-4">
  <label for="inputState" class="form-label">Payment</label>
  <select name="payment" id="inputState" class="form-select">
    <option value="KBZ" ${fn:contains(user.payment,'KBZ')? "selected": ""} >KBZ</option>
    <option value="AYA" ${fn:contains(user.payment,'AYA')? "selected": ""} >AYA</option>
  </select>
</div>
<div class="col-md-6">
  <input type="text" class="form-control" style="margin-top: 32px;" placeholder="Card Number" name="card" value="${user.card }" required>
</div>
<div class="col-12">
  <label for="inputDescription" class="form-label">Description</label>
  <textarea name="description" type="text" class="form-control" id="inputDescription" placeholder="Any Description"></textarea>
</div>
<div class="col-12 d-flex justify-content-center mt-5">
    <button type="submit" class="btn btn-primary">Order Now</button>
  </div>
</form>
</c:if>
