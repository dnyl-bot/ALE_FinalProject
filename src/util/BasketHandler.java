/**
 * 
 */
package util;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

import model.Product;

/**
 * @author owens
 *
 */
public class BasketHandler {
	
	public static boolean addToBasket(int pid, int qty){
		
		// Uh-oh - we have no support for an 'order id' to distinguish between orders. We'll make one up.
		// This wouldn't work in reality (e.g. if two people use the system)
		
		try {
			CallableStatement cs = DbConnector.getConnection().prepareCall("{call insertItemIntoBasket(?,?,?,?)}");
			cs.setInt(1,0); // Our fictitious order-Id.
			cs.setInt(2, pid); // Product id. Hope it's correct.
			cs.setInt(3,  qty); // How many customer is buying. Hope it's right.
			cs.registerOutParameter(4, Types.INTEGER);
			cs.execute();
			// We don't need the value from the out parameter. Probably.
			return true;
		} catch(SQLException sqle){
			System.out.println(sqle);
		}
		return false;
		
	}
	
	public static ArrayList<Product> getItemsFromBasket() throws SQLException{
		// Uh-oh - STILL no support for an 'order id' so I can't tell one person's order from another
		// Better way to do this (than using a raw SQL query)?
		String query = "SELECT p.id, p.name, p.description, p.priceInPence FROM Basket b"
				+ "			JOIN Product p ON b.productId = p.id";
		ResultSet rs = DbConnector.runSqlPrepared(query);
		return ProductHandler.resultSetToProducts(rs);
		
	}
	
	

}
