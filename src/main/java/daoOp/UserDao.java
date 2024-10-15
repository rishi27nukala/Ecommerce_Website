package daoOp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import bean.UserDetails;

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public UserDetails userlogin(String email, String password) {
        UserDetails user = null;
        String query = "SELECT * FROM users WHERE email=? AND password=?";
        try (PreparedStatement pst = this.con.prepareStatement(query)) {
            pst.setString(1, email);
            pst.setString(2, password); 

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                user = new UserDetails();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
                System.out.println("User found: " + email);
            } else {
                System.out.println("Login failed: No user found with the provided email and password.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public void insertUserDetails(String email, String password, String role) throws SQLException {
        String query = "INSERT INTO users (email, password, role) VALUES (?, ?, ?)";
        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, email);
            pst.setString(2, password); 
            pst.setString(3, role);
            pst.executeUpdate();
            System.out.println("User details inserted successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
            throw e; 
        }
    }
}
