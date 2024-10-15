<%@page import="java.util.*"%>
<%@page import="bean.*"%>
<%@page import="dao.*"%>
<%@page import="daoOp.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	UserDetails auth = (UserDetails) request.getSession().getAttribute("auth");
	if (auth != null) {
    	request.setAttribute("auth", auth);
	}

	ArrayList<CartDetails> cart_list = (ArrayList<CartDetails>) session.getAttribute("cart-list");
	List<CartDetails> cartProduct = null;
	float total = 0; 

	if (cart_list != null) {
    	ProductDao pDao = new ProductDao(DBOperations.getConnection());
    	cartProduct = pDao.getCartProducts(cart_list);
    	total = pDao.getTotalCartPrice(cart_list); // Use the total variable
    	request.setAttribute("cart_list", cart_list);
    	request.setAttribute("total", total);
	}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="includes/head.jsp"%>

<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="d-flex py-3">
			<h3>Total Price : &#8377;<%= total %></h3>
			<a class="mx-3 btn btn-primary" href="cart-check-out">CheckOut</a>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col"style="padding-left:10px;">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col"style="padding-left: 40px;">Buy Now</th>
					<th scope="col"style="padding-left: 55px;">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
                if (cartProduct != null) { // Check if cartProduct is not null
                    for (CartDetails c : cartProduct) {
                %>
				<tr>
					<td><%= c.getName() %></td>
					<td><%= c.getCategory() %></td>
					<td>&#8377; <%= c.getPrice() %></td>
					<td>
						<form action="order-now" method="post" class="form-inline d-flex align-items-center justify-content-between">
    						<input type="hidden" name="id" value="<%= c.getId() %>" class="form-input">
    						<div class="d-flex align-items-center">
    							<a class="btn btn-sm btn-decre" href="qunatity-inc-dec?action=dec&id=<%= c.getId() %>"><i class="fas fa-minus-square"></i></a>
        						<input type="text" name="quantity" class="form-control mx-1 text-center" value="<%= c.getQuantity() %>" readonly style="width: 60px;">
        						<a class="btn btn-sm btn-incre" href="qunatity-inc-dec?action=inc&id=<%= c.getId() %>"><i class="fas fa-plus-square"></i></a>
    						</div>
						</form>
					</td>
					<td>
						<form action="remove-from-cart" method="post">
							<input type="hidden" name="id" value="<%= c.getId() %>">
							<button type="submit" class="btn btn-sm btn-primary mx-1 pull-left " style="width:70px">Buy</button>
							<button type="submit" class="btn btn-sm btn-danger">Remove</button>
						</form>
					</td>
				</tr>
				<%
                    }
                } else {
                %>
				<tr>
					<td colspan="5" class="text-center">Your cart is empty.</td>
				</tr>
				<%
                }
                %>
			</tbody>
		</table>
	</div>
	<%@include file="includes/footer.jsp"%>
</body>
</html>
