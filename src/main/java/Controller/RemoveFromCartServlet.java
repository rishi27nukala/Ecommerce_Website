package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.CartDetails;

@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect("cart.jsp");
            return; 
        }
        
        int id = Integer.parseInt(idParam);
        ArrayList<CartDetails> cart_list = (ArrayList<CartDetails>) request.getSession().getAttribute("cart-list");
        if (cart_list != null) {
            for(CartDetails c:cart_list)
            {
            	if(c.getId()==id)
            	{
            		cart_list.remove(c);
            		break;
            	}
            }
            response.sendRedirect("cart.jsp");
        }
        else
        {
        	response.sendRedirect("cart.jsp");
        }
    }
}
