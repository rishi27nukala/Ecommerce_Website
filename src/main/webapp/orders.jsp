<%@page import="dao.DBOperations"%>
<%@page import="daoOp.*"%>
<%@page import="bean.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
UserDetails auth = (UserDetails) request.getSession().getAttribute("auth");
List<OrderDetails> orders = null;
if (auth != null) {
	request.setAttribute("auth", auth);
	orders = new OrderDao(DBOperations.getConnection()).userOrders(auth.getId());
} else {
	response.sendRedirect("login.jsp");
}

ArrayList<CartDetails> cart_list = (ArrayList<CartDetails>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>All Orders</title>
<%@include file="includes/head.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (orders != null) {
					for (OrderDetails o : orders) {
				%>
				<tr>
					<td><%=o.getDate()%></td>
					<td><%=o.getName()%></td>
					<td><%=o.getCategory()%></td>
					<td><%=o.getQuantity()%></td>
					<td><%=o.getPrice()%></td>
					<td><a class="btn btn-sm btn-danger"
						href="cancel-order?id=<%=o.getOrderId()%>">Cancel</a></td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="6" class="text-center">No orders found</td>
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