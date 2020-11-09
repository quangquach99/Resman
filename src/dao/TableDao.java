package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Table;

public class TableDao extends Dao {
    private static final String GET_AVAILABLE_TABLES = "SELECT * FROM `table` WHERE `maximum_of_people` >= ? AND `table_id` NOT IN" + 
    		"(SELECT `table_id` FROM `reservation` WHERE `reservation_date` = ? AND `reservation_time` = ?)";
    private static final String GET_TABLE_BY_ID = "SELECT * FROM `table` WHERE `table_id` = ?";
    
    public TableDao() {}
    
    public List<Table> selectAvailableTables(int numberOfPeople, String reservationDate, String reservationTime) {
    	List<Table> tables = new ArrayList < >();
    	
    	try (Connection connection = getConnection();
    		// Query
    		PreparedStatement preparedStatement = connection.prepareStatement(GET_AVAILABLE_TABLES);) {
    		preparedStatement.setInt(1, numberOfPeople);
    		preparedStatement.setString(2, reservationDate);
    		preparedStatement.setString(3, reservationTime);
    		System.out.println(preparedStatement);
    		//Execute the query
    		ResultSet rs = preparedStatement.executeQuery();
    		// Process Result
    		while(rs.next()) {
    			int tableID = rs.getInt("table_id");
    			int maximumOfPeople = rs.getInt("maximum_of_people");
    			String tableImage = rs.getString("table_image");
    			int nearWindow = rs.getInt("near_window");
    			float tablePrice = rs.getFloat("table_price");
    			tables.add(new Table(tableID, maximumOfPeople, tableImage, nearWindow, tablePrice));
    		}
    	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return tables;
    }
    
    public Table getTableById(int tableId) {
    	Table table = null;
    	
    	try (Connection connection = getConnection();
        		// Query
        		PreparedStatement preparedStatement = connection.prepareStatement(GET_TABLE_BY_ID);) {
        		preparedStatement.setInt(1, tableId);
        		System.out.println(preparedStatement);
        		//Execute the query
        		ResultSet rs = preparedStatement.executeQuery();
        		// Process Result
        		while(rs.next()) {
        			int tableID = rs.getInt("table_id");
        			int maximumOfPeople = rs.getInt("maximum_of_people");
        			String tableImage = rs.getString("table_image");
        			int nearWindow = rs.getInt("near_window");
        			float tablePrice = rs.getFloat("table_price");
        			table = new Table(tableID, maximumOfPeople, tableImage, nearWindow, tablePrice);
        		}
        	} catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
        	return table;
    }
//    public List<Table> selectAllTables() throws ClassNotFoundException {
//    	Class.forName("com.mysql.jdbc.Driver");
//    	List<TableModel> tables = new ArrayList<>();
//        try (Connection connection = DriverManager
//            .getConnection("jdbc:mysql://localhost:3306/restaurant?useSSL=false", "root", "dinhquang");
//
//            // Step 2:Create a statement using connection object
//            PreparedStatement preparedStatement = connection
//            .prepareStatement("SELECT * FROM `tables` WHERE `table_available` = 1")) {
//            System.out.println(preparedStatement);
//            ResultSet rs = preparedStatement.executeQuery();
//        	while (rs.next()) {
//        		int table_ID = rs.getInt("table_ID");
//        		int maximum_of_people = rs.getInt("maximum_of_people");
//        		String table_image = rs.getString("table_image");
//        		int near_window = rs.getInt("near_window");
//        		float table_price = rs.getFloat("table_price");
//        		int table_floor = rs.getInt("table_floor");
//        		tables.add(new TableModel(table_ID,maximum_of_people,table_image,near_window,
//        				table_price,table_floor));
//            }
//        } catch (SQLException e) {
//            // process sql exception
//            printSQLException(e);
//        }
//        return tables;
//    }
//    
//    public List<TableModel> selectAvailableTables(String reservation_date, String reservation_time, String number_of_people) throws ClassNotFoundException {
//    	Class.forName("com.mysql.jdbc.Driver");
//    	List<TableModel> tables = new ArrayList<>();
//        try (Connection connection = DriverManager
//            .getConnection("jdbc:mysql://localhost:3306/restaurant?useSSL=false", "root", "dinhquang");
//
//            // Step 2:Create a statement using connection object
//            PreparedStatement preparedStatement = connection
//            .prepareStatement("SELECT * FROM `tables` WHERE `maximum_of_people` >= ? AND `table_ID` "
//            		+ "NOT IN (SELECT `table_ID` FROM `reservations` WHERE `reservation_date` = ? AND `reservation_time` = ?)")) {
//        	preparedStatement.setString(1, number_of_people);
//        	preparedStatement.setString(2, reservation_date);
//        	preparedStatement.setString(3, reservation_time);
//            System.out.println(preparedStatement);
//            ResultSet rs = preparedStatement.executeQuery();
//        	while (rs.next()) {
//        		int table_ID = rs.getInt("table_ID");
//        		int maximum_of_people = rs.getInt("maximum_of_people");
//        		String table_image = rs.getString("table_image");
//        		int near_window = rs.getInt("near_window");
//        		float table_price = rs.getFloat("table_price");
//        		int table_floor = rs.getInt("table_floor");
//        		tables.add(new TableModel(table_ID,maximum_of_people,table_image,near_window,
//        				table_price,table_floor));
//            }
//        } catch (SQLException e) {
//            // process sql exception
//            printSQLException(e);
//        }
//        return tables;
//    }
    
}