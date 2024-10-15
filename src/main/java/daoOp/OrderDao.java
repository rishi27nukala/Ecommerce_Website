package daoOp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import bean.*;
import java.util.*;

public class OrderDao {
	private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public OrderDao(Connection con) {
        this.con = con;
    }
    
    public boolean insertOrder(OrderDetails order)
    {
    	boolean result  = false;
    	try
    	{
    		query = "insert into orders(p_id,u_id,o_quantity,o_date) values(?,?,?,?)"; 
    		pst = this.con.prepareStatement(query);
    		pst.setInt(1, order.getId());
    		pst.setInt(2,order.getUid());
    		pst.setInt(3,order.getQuantity());
    		pst.setString(4,order.getDate());
    		pst.executeUpdate();
    		result = true;
    	} catch (Exception e) {
            e.printStackTrace(); 
        }
    	return result;
    }
    
    public List<OrderDetails> userOrders(int id)
    {
    	List<OrderDetails>  list = new ArrayList<>();
    	try
    	{
    		query = "select * from orders where u_id=? order by orders.o_id desc";
    		pst = this.con.prepareStatement(query);
    		pst.setInt(1,id);
    		rs = pst.executeQuery();
    	
    		while(rs.next())
    		{
    			OrderDetails order = new OrderDetails();
    			ProductDao productDao = new ProductDao(this.con);
    			int pId = rs.getInt("p_id");
    			ProductDetails product = productDao.getSingleProduct(pId);
    			order.setOrderId(rs.getInt("o_id"));
    			order.setId(pId);
    			order.setName(product.getName());
    			order.setCategory(product.getCategory());
    			order.setPrice(product.getPrice()*rs.getInt("o_quantity"));
    			order.setDate(rs.getString("o_date"));
    			list.add(order);
    		}
    	
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	return list;
    }
    
    public void cancelOrder(int id)
    {
    	try
    	{
    		query = "delete from orders where o_id=?";
    		pst = this.con.prepareStatement(query);
    		pst.setInt(1, id);
    		pst.execute();
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    }
}
