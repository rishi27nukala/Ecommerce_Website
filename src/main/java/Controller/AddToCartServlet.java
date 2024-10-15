package Controller;

import bean.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter())
		{
			ArrayList<CartDetails> cartList = new ArrayList<>();
			
			int id = Integer.parseInt(request.getParameter("id"));
			CartDetails cm = new CartDetails();
			cm.setId(id);
			cm.setQuantity(1);
			
			HttpSession session = request.getSession();
			ArrayList <CartDetails> cart_list = (ArrayList<CartDetails>) session.getAttribute("cart-list");
			
			if(cart_list==null)
			{
				cartList.add(cm);
				session.setAttribute("cart-list", cartList);
				response.sendRedirect("home.jsp");
			}
			else
			{
				cartList = cart_list;
				boolean exist = false;
				for(CartDetails c : cart_list)
				{
					if(c.getId()==id)
					{
						exist=true;
						out.print("<h3 style='color:crimson;text-align:center'>Item already exist in Cart<a href='cart.jsp'>Go to Cart Page</a></h3>");
					}

				}					
					if(!exist)
					{
						cartList.add(cm);
						response.sendRedirect("home.jsp");
					}
			}
		}
	}
}
