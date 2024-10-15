package Controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import daoOp.*;
import dao.*;
@WebServlet("/update-product")
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("update.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve form data
            String productIdStr = request.getParameter("productId");
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String priceStr = request.getParameter("price");

            if (productIdStr == null || productIdStr.isEmpty() || name == null || category == null || priceStr == null) {
                request.setAttribute("errorMessage", "Invalid input. Please fill all the fields.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            int productId = Integer.parseInt(productIdStr);
            float price = Float.parseFloat(priceStr);

            ProductDao productDAO = new ProductDao(DBOperations.getConnection());
            boolean isUpdated = productDAO.updateProduct(productId, name, category, price);

            if (isUpdated) {
                request.setAttribute("successMessage", "Product updated successfully!");
                request.getRequestDispatcher("success.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Failed to update product.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
