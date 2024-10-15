package daoOp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.*;
import bean.*;

public class ProductDao {
    private Connection con;

    public ProductDao(Connection con) {
        this.con = con;
    }

    public List<ProductDetails> getAllProducts() {
        List<ProductDetails> products = new ArrayList<>();

        String query = "SELECT * FROM products";
        try (PreparedStatement pst = con.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {
            while (rs.next()) {
                ProductDetails row = new ProductDetails();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getFloat("price"));
                row.setImage(rs.getBytes("image"));
                products.add(row);
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return products;
    }

    public List<CartDetails> getCartProducts(ArrayList<CartDetails> cartList) {
        List<CartDetails> products = new ArrayList<>();

        if (cartList.size() > 0) {
            for (CartDetails item : cartList) {
                String query = "SELECT * FROM products WHERE id=?";
                try (PreparedStatement pst = con.prepareStatement(query)) {
                    pst.setInt(1, item.getId());
                    try (ResultSet rs = pst.executeQuery()) {
                        while (rs.next()) {
                            CartDetails row = new CartDetails();
                            row.setId(rs.getInt("id"));
                            row.setName(rs.getString("name"));
                            row.setCategory(rs.getString("category"));
                            row.setPrice(rs.getFloat("price"));
                            row.setQuantity(item.getQuantity());
                            products.add(row);
                        }
                    }
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
        }
        return products;
    }
    
    public ProductDetails getSingleProduct(int id) {
        ProductDetails row = null;
        String query = "SELECT * FROM products WHERE id=?";
        try (PreparedStatement pst = this.con.prepareStatement(query)) {
            pst.setInt(1, id);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    row = new ProductDetails();
                    row.setId(rs.getInt("id"));
                    row.setName(rs.getString("name"));  // Fix the missing parentheses
                    row.setCategory(rs.getString("category"));
                    row.setPrice(rs.getFloat("price"));
                    row.setImage(rs.getBytes("image"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();  
        }
        return row;
    }


    public float getTotalCartPrice(ArrayList<CartDetails> cartList) {
        float sum = 0;

        if (cartList.size() > 0) {
            for (CartDetails item : cartList) {
                String query = "SELECT price FROM products WHERE id=?";
                try (PreparedStatement pst = con.prepareStatement(query)) {
                    pst.setInt(1, item.getId());
                    try (ResultSet rs = pst.executeQuery()) {
                        while (rs.next()) {
                            sum += rs.getFloat("price") * item.getQuantity();
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return sum;
    }
    
    public boolean removeProduct(int productId) {
		String query = "DELETE FROM products WHERE id = ?";
		int rowCount=0;
		try(PreparedStatement pst = this.con.prepareStatement(query))
		{
			pst.setInt(1, productId);
			rowCount = pst.executeUpdate();
		}catch (Exception e) {
            e.printStackTrace();
        }
		return rowCount > 0; 
	}
    
    public boolean updateProduct(int productId, String name, String category, float price) {
        String query = "UPDATE products SET name = ?, category = ?, price = ? WHERE id = ?";
        int rowCount = 0;
        try (PreparedStatement pst = this.con.prepareStatement(query)) {
            pst.setString(1, name);
            pst.setString(2, category);
            pst.setFloat(3, price);
            pst.setInt(4, productId);
            rowCount = pst.executeUpdate(); 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rowCount > 0; 
    }
}
