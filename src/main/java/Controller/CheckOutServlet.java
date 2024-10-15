package Controller;
import java.util.*;
import bean.*;
import dao.DBOperations;
import daoOp.OrderDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter())
		{
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			
	    	ArrayList<CartDetails> cart_list = (ArrayList<CartDetails>) request.getSession().getAttribute("cart-list");
			UserDetails auth = (UserDetails) request.getSession().getAttribute("auth");
			if(cart_list!=null && auth!=null)
			{
				for(CartDetails c : cart_list)
				{
					OrderDetails order = new OrderDetails();
					order.setId(c.getId());
				    order.setUid(auth.getId());
				    order.setQuantity(c.getQuantity());
				    order.setDate(formatter.format(date));
				    OrderDao orderDao = new OrderDao(DBOperations.getConnection());
				    boolean result = orderDao.insertOrder(order);
				    if(!result) break;
				}
				cart_list.clear();
				response.sendRedirect("orders.jsp");
			}
			else
			{
				if(auth==null) response.sendRedirect("login.jsp");
				response.sendRedirect("cart.jsp");
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
