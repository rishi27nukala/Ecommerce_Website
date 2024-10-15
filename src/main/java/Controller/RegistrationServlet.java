package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserDetails;
import dao.DBOperations;
import daoOp.UserDao;


@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("login-email");
            String password = request.getParameter("login-password");
            String role = request.getParameter("role");
            try {
                UserDao udao = new UserDao(DBOperations.getConnection());
                UserDetails user = udao.userlogin(email, password);
                
                if (user == null) {
                    udao.insertUserDetails(email, password,role); 
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('User registered successfully! Please login.');");
                    out.println("location='login.jsp';");
                    out.println("</script>");
                } 
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
	}

}
