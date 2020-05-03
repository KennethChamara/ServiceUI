package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;

import util.DBConnection;

public class AuthUser {
	
 	 public static boolean isUserAllowed(final String username, final String password, final Set<String> rolesSet)
     {
         boolean isAllowed = false;
         String role = "" , user = "", psw = "" ;
         
         try {
     		Connection con = DBConnection.connect();
     		if (con == null) {
     			
     			
     		}
     		// create a prepared statement
     		String query = "SELECT * FROM users where username='"+username+"' and password='"+password+"'";
     		PreparedStatement preparedStmt = con.prepareStatement(query);
     		
     	
     	   	preparedStmt.execute();
     //execute the statement
     		  ResultSet rs = preparedStmt.executeQuery(query);
     		 
     		  if(rs.next()) {
     			  user = rs.getString("username");
     			  psw = rs.getString("password");
     			  role=rs.getString("roll");
     			 
     		  }
     		  con.close();
     		  
     		  
     	} catch (Exception e) {
     				
     				System.err.println(e.getMessage());
     			}
         
         if(username.equals(user) && password.equals(psw))
         {
              
             //Step 2. Verify user role
             if(rolesSet.contains(role))
             {
            	 
                 isAllowed = true;
                 System.out.println(username +" "+password );
             }
         }
         return isAllowed;
         
     }

}
