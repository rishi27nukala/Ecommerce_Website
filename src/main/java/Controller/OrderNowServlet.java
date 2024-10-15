package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import bean.*;
import daoOp.*;
import java.util.*;
import dao.DBOperations;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/order-now")
public class OrderNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter())
		{
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			
			UserDetails auth = (UserDetails) request.getSession().getAttribute("auth");
			if (auth != null) {
				String productId = request.getParameter("id");
				int productQuantity = Integer.parseInt(request.getParameter("quantity"));
				if(productQuantity<=0)
				{
					productQuantity=1;
				}
			    OrderDetails order = new OrderDetails();
			    order.setId(Integer.parseInt(productId));
			    order.setUid(auth.getId());
			    order.setQuantity(productQuantity);
			    order.setDate(formatter.format(date));
			    
			    OrderDao orderDao = new OrderDao(DBOperations.getConnection());
			    boolean result = orderDao.insertOrder(order);
			    if(result)
			    {
			    	ArrayList<CartDetails> cart_list = (ArrayList<CartDetails>) request.getSession().getAttribute("cart-list");
			    	if(cart_list != null)
			    	{
			    		for(CartDetails c : cart_list)
			    		{
			    			if(c.getId()==Integer.parseInt(productId))
			    			{
			    				cart_list.remove(cart_list.indexOf(c));
			    				break;
			    			}
			    		}
			    	}
			    	response.sendRedirect("orders.jsp");
			    }
			    else
			    {
			    	out.print("order failed");
			    }
			}
			else
			{
				response.sendRedirect("login.jsp");
			}
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
