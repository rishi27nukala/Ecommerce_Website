package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DBOperations;
import daoOp.ProductDao;

@WebServlet("/remove-product")
public class RemoveProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productIdStr = request.getParameter("id");
        if (productIdStr != null && !productIdStr.isEmpty()) {
            try {
                int productId = Integer.parseInt(productIdStr);

                ProductDao productDao = new ProductDao(DBOperations.getConnection());
                boolean isDeleted = productDao.removeProduct(productId);

                if (isDeleted) {
                    response.sendRedirect("home.jsp?status=removed");
                } else {
                    response.sendRedirect("home.jsp?status=failed");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("home.jsp?status=invalid");
            }
        } else {
            response.sendRedirect("home.jsp?status=invalid");
        }
    }
}
