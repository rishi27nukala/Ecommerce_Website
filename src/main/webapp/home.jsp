<%@page import="dao.DBOperations"%>
<%@ page import="java.util.*" %>
<%@page import="bean.*"%>
<%@page import="daoOp.*"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	UserDetails auth = (UserDetails) request.getSession().getAttribute("auth");
	if (auth != null) {
		request.setAttribute("auth", auth);
	}

	ProductDao pd = new ProductDao(DBOperations.getConnection());
	List<ProductDetails> products = pd.getAllProducts();

	ArrayList<CartDetails> cart_list = (ArrayList<CartDetails>) session.getAttribute("cart-list");
	if (cart_list != null) {
    	request.setAttribute("cart_list", cart_list);
	}
%>
<!doctype html>
<html lang="en">
<head>
<%@include file="includes/head.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>

	<div class="container" >
		<div class="card-header my-3" style="background-color: #ffffff; color: #3c3c3c; font-weight: none; font-size: 1.3rem; border-radius: 10px 10px 0 0;">
    			All Products
		</div>
		<div class="row" >
		<%if(!products.isEmpty())
			{
				for(ProductDetails p:products)
				{
					String base64Image = Base64.getEncoder().encodeToString(p.getImage());
					String imageUrl = "data:image/jpeg;base64," + base64Image;
				%>
					<div class="col-md-3 my-3">
						<div class="card w-100" style="width: 15rem; height:430px">
							<img class="card-img-top" src="<%= imageUrl %>" alt="..."style="width: auto; height: 250px;">
							<div class="card-body">
								<h5 class="card-title" style="font-size:1rem"><%= p.getName() %></h5>
								<h6 class="price">Price: &#8377;<%= p.getPrice() %></h6>
								<h6 class="category">Category: <%= p.getCategory() %></h6>
								<div class="mt-3 d-flex justify-content-between">
    								<% if (auth != null && "user".equals(auth.getRole())) { %>
        								<a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a>
        								<a href="order-now?quantity=1&id=<%= p.getId() %>" class="btn btn-primary">Buy Now</a>
    								<% } 
    								else if (auth != null && "data_manager".equals(auth.getRole())) { %>
        								<a href="update-product?id=<%= p.getId() %>" class="btn btn-primary">Update</a>
        								<a href="remove-product?id=<%= p.getId() %>" class="btn btn-danger">Remove</a>
    								<% } 
    								else { %>
    									<a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a>
        								<a href="order-now?quantity=1&id=<%= p.getId() %>" class="btn btn-primary">Buy Now</a>
    								<% } %>
								</div>
							</div>
						</div>
					</div>
				<%}
			}%>
		</div>
	</div>
	<%@include file="includes/footer.jsp"%>
</body>
</html>
