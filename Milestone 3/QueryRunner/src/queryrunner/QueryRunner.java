/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package queryrunner;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

/**
 * 
 * QueryRunner takes a list of Queries that are initialized in it's constructor
 * and provides functions that will call the various functions in the QueryJDBC class 
 * which will enable MYSQL queries to be executed. It also has functions to provide the
 * returned data from the Queries. Currently the eventHandlers in QueryFrame call these
 * functions in order to run the Queries.
 */
public class QueryRunner {

    
    public QueryRunner()
    {
        this.m_jdbcData = new QueryJDBC();
        m_updateAmount = 0;
        m_queryArray = new ArrayList<>();
        m_error="";
    
        
        // TODO - You will need to change the queries below to match your queries.
        
        // You will need to put your Project Application in the below variable
        
        this.m_projectTeamApplication="globetrotter";    // THIS NEEDS TO CHANGE FOR YOUR APPLICATION
        
        // Each row that is added to m_queryArray is a separate query. It does not work on Stored procedure calls.
        // The 'new' Java keyword is a way of initializing the data that will be added to QueryArray. Please do not change
        // Format for each row of m_queryArray is: (QueryText, ParamaterLabelArray[], LikeParameterArray[], IsItActionQuery, IsItParameterQuery)
        
        //    QueryText is a String that represents your query. It can be anything but Stored Procedure
        //    Parameter Label Array  (e.g. Put in null if there is no Parameters in your query, otherwise put in the Parameter Names)
        //    LikeParameter Array  is an array I regret having to add, but it is necessary to tell QueryRunner which parameter has a LIKE Clause. If you have no parameters, put in null. Otherwise put in false for parameters that don't use 'like' and true for ones that do.
        //    IsItActionQuery (e.g. Mark it true if it is, otherwise false)
        //    IsItParameterQuery (e.g.Mark it true if it is, otherwise false)
        
        m_queryArray.add(new QueryData("Select * from HIGHLIGHT", 
        		null, 
        		null, 
        		false, 
        		false));        // THIS NEEDS TO CHANGE FOR YOUR APPLICATION
        
        /* 
         * Query to find a destination known for a certain food type, a certain highlight, 
         * and a cost below a certain value
         */
        m_queryArray.add(new QueryData(
        		"SELECT \n"
        		+ " DESTINATION.dest_name AS Destination,\n"
        		+ " FOOD_TYPE.food_name AS Food_Type,\n"
        		+ " HIGHLIGHT.highlight_name AS Travel_Highlight,\n"
        		+ " RATING.rat_amt_spent AS Travel_Expense \n"
        		+ "From\n"
        		+ " DESTINATION\n"
        		+ " JOIN FOOD_TYPE ON FOOD_TYPE.food_id = DESTINATION.food_id\n"
        		+ " JOIN HIGHLIGHT ON HIGHLIGHT.highlight_id = DESTINATION.highlight_id\n"
        		+ " JOIN RATING ON RATING.dest_id = DESTINATION.dest_id \n"
        		+ "Where\n"
        		+ "	FOOD_TYPE.food_name = ?\n"
        		+ " AND HIGHLIGHT.highlight_name = ?\n"
        		+ "	AND RATING.rat_amt_spent < ? \n"
        		+ "GROUP BY DESTINATION.dest_name \n"
        		+ "Order By Travel_Expense DESC;",
        		new String [] {"Food Type", "Highlight Type", "Max Amount Spent"},
        		new boolean [] {false, false, false},
        		false,
        		true)
        		);
        
        /* Get 5 Star Destinations best known for a parameterized highlight */
        m_queryArray.add(new QueryData(
        		"SELECT\n"
        		+ " dest_name AS Destination,\n"
        		+ " highlight_name AS Highlight,\n"
        		+ " rat_stars AS Rating \n"
        		+ "FROM\n"
        		+ " DESTINATION,\n"
        		+ " RATING,\n"
        		+ " HIGHLIGHT \n"
        		+ "WHERE\n"
        		+ " DESTINATION.dest_id = RATING.dest_id\n"
        		+ " AND HIGHLIGHT.highlight_id = RATING.highlight_id\n"
        		+ " AND RATING.rat_stars = 5\n"
        		+ " AND HIGHLIGHT.highlight_name = ? \n"
        		+ "GROUP BY DESTINATION.dest_name;"
        		, new String [] {"HIGHLIGHT_NAME"}, 
        		new boolean [] {false},  
        		false, 
        		true)
        		);
        
        m_queryArray.add(new QueryData("Select * from contact where contact_name like ?", new String [] {"CONTACT_NAME"}, new boolean [] {true}, false, true));        // THIS NEEDS TO CHANGE FOR YOUR APPLICATION
        m_queryArray.add(new QueryData("insert into contact (contact_id, contact_name, contact_salary) values (?,?,?)",new String [] {"CONTACT_ID", "CONTACT_NAME", "CONTACT_SALARY"}, new boolean [] {false, false, false}, true, true));// THIS NEEDS TO CHANGE FOR YOUR APPLICATION
                       
    }
       

    public int GetTotalQueries()
    {
        return m_queryArray.size();
    }
    
    public int GetParameterAmtForQuery(int queryChoice)
    {
        QueryData e=m_queryArray.get(queryChoice);
        return e.GetParmAmount();
    }
              
    public String  GetParamText(int queryChoice, int parmnum )
    {
       QueryData e=m_queryArray.get(queryChoice);        
       return e.GetParamText(parmnum); 
    }   

    public String GetQueryText(int queryChoice)
    {
        QueryData e=m_queryArray.get(queryChoice);
        return e.GetQueryString();        
    }
    
    /**
     * Function will return how many rows were updated as a result
     * of the update query
     * @return Returns how many rows were updated
     */
    
    public int GetUpdateAmount()
    {
        return m_updateAmount;
    }
    
    /**
     * Function will return ALL of the Column Headers from the query
     * @return Returns array of column headers
     */
    public String [] GetQueryHeaders()
    {
        return m_jdbcData.GetHeaders();
    }
    
    /**
     * After the query has been run, all of the data has been captured into
     * a multi-dimensional string array which contains all the row's. For each
     * row it also has all the column data. It is in string format
     * @return multi-dimensional array of String data based on the resultset 
     * from the query
     */
    public String[][] GetQueryData()
    {
        return m_jdbcData.GetData();
    }

    public String GetProjectTeamApplication()
    {
        return m_projectTeamApplication;        
    }
    public boolean  isActionQuery (int queryChoice)
    {
        QueryData e=m_queryArray.get(queryChoice);
        return e.IsQueryAction();
    }
    
    public boolean isParameterQuery(int queryChoice)
    {
        QueryData e=m_queryArray.get(queryChoice);
        return e.IsQueryParm();
    }
    
     
    public boolean ExecuteQuery(int queryChoice, String [] parms)
    {
        boolean bOK = true;
        QueryData e=m_queryArray.get(queryChoice);        
        bOK = m_jdbcData.ExecuteQuery(e.GetQueryString(), parms, e.GetAllLikeParams());
        return bOK;
    }
    
     public boolean ExecuteUpdate(int queryChoice, String [] parms)
    {
        boolean bOK = true;
        QueryData e=m_queryArray.get(queryChoice);        
        bOK = m_jdbcData.ExecuteUpdate(e.GetQueryString(), parms);
        m_updateAmount = m_jdbcData.GetUpdateCount();
        return bOK;
    }   
    
      
    public boolean Connect(String szHost, String szUser, String szPass, String szDatabase)
    {

        boolean bConnect = m_jdbcData.ConnectToDatabase(szHost, szUser, szPass, szDatabase);
        if (bConnect == false)
            m_error = m_jdbcData.GetError();        
        return bConnect;
    }
    
    public boolean Disconnect()
    {
        // Disconnect the JDBCData Object
        boolean bConnect = m_jdbcData.CloseDatabase();
        if (bConnect == false)
            m_error = m_jdbcData.GetError();
        return true;
    }
    
    public String GetError()
    {
        return m_error;
    }
    
    /**
     * Method to pad a string with spaces on the end to reach a certain length
     * Then adds a vertical line to the end of the inputString
     * @param inputString string to pad with spaces
     * @param length      the desired length of the string
     * @return            the input string padded with spaces
     */
    public String padRightSpaces(String inputString, int length) {
        if (inputString.length() >= length) {
            return inputString;
        }
        StringBuilder sb = new StringBuilder(inputString);
        while (sb.length() < length - 2) {
            sb.append(' ');
        }
        sb.append('|');
        sb.append(' ');
     
        return sb.toString();
    }
    
    /**
     * Returns a horizontal line of a specified length
     * @param n length of the desired line
     * @return  horizontal line of length n
     */
    public String getHorizontalLine(int n) {
    	StringBuilder sb = new StringBuilder();
    	while (sb.length() < n)
    		sb.append('-');
    	
    	return sb.toString();
    }
 
    private QueryJDBC m_jdbcData;
    private String m_error;    
    private String m_projectTeamApplication;
    private ArrayList<QueryData> m_queryArray;  
    private int m_updateAmount;
            
    /**
     * @param args the command line arguments
     */
    

    
    public static void main(String[] args) {

        final QueryRunner queryrunner = new QueryRunner();
        
        if (args.length == 0)
        {
            java.awt.EventQueue.invokeLater(new Runnable() {
                public void run() {

                    new QueryFrame(queryrunner).setVisible(true);
                }            
            });
        }
        else
        {
            if (args[0].equals ("-console"))
            {            	
            	String hostname;
            	String user;
            	String password;
            	String dbName;
            	
            	Scanner scan = new Scanner(System.in);
            	
//            	System.out.println("Please enter your hostname: ");
//            	hostname = scan.nextLine();
//            	
//            	System.out.println("Please enter your username: ");
//            	user = scan.nextLine();
//            	
//            	System.out.println("Please enter your password: ");
//            	password = scan.nextLine();
//            	
//            	System.out.println("Please enter the database name: ");
//            	dbName = scan.nextLine();
            	
            	hostname = "mysql-test01.cw3pi1ekgozo.us-east-1.rds.amazonaws.com";
            	user     = "admin";
            	password = "Mile!56stone";
            	dbName   = "globetrotter";
            	
            	// Attempt to connect to database
            	if (queryrunner.Connect(hostname, user, password, dbName)) {
            		System.out.println("Connection successful\n");
            		
            		System.out.println("****** Welcome to GlobeTrotter *****\n");
            		
            		int n = queryrunner.GetTotalQueries();
            		
            		// Loop through  all queries
            		for (int i = 0; i < n; i++) {
            		
            			System.out.println("\nQuery " + (i + 1) + " out of " + n + "...\n");
            			
            			int numParam = queryrunner.GetParameterAmtForQuery(i);
            			String [] parmstring={};
            	        String [] headers;
            	        String [][] allData;
            	        boolean success = false;
            			
            			// Check if this query requires parameters
            			if (queryrunner.isParameterQuery(i)) {
            				parmstring = new String[numParam];
            				
            				for (int j = 0; j < numParam; j++) {
            					String currParam = queryrunner.GetParamText(i, j);
            					
            					System.out.print("\nEnter a value for parameter \"");
            					System.out.println(currParam + "\": ");
            					
            					parmstring[j] = scan.nextLine();
            				}
            			}
            				
        				// Check if this query is an action query
        				if (queryrunner.isActionQuery(i)) {
        					
        					success = queryrunner.ExecuteUpdate(i, parmstring); 
        					
        					if (success == true) {
        						
            					int updateAmt = queryrunner.GetUpdateAmount();
            					
            					System.out.println("\n" + updateAmt + " total row(s) affected.\n");
        					}
        					else {
        						System.err.print("There was an error updating the db: ");
        						System.err.println(queryrunner.GetError());
        					}
        				}
        				// Not an action query
        				else {
        					success = queryrunner.ExecuteQuery(i, parmstring);
        					
        					if (success = true) {
        						
        						headers = queryrunner.GetQueryHeaders();
            	                allData = queryrunner.GetQueryData();
            	                
            	                for (String s : headers) {
            	                	String header = queryrunner.padRightSpaces(s, 20);
            	                	System.out.print(header + " ");
            	                }
            	                System.out.println();
            	                
            	                System.out.println(queryrunner.getHorizontalLine(20 * headers.length));
            	                
        						for (int j = 0; j < allData.length; j++) {
        							for (int k = 0; k < allData[j].length; k++) {
        								String data = queryrunner.padRightSpaces(allData[j][k], 20);
        								System.out.print(data + " ");
        							}
        							System.out.println();
        						}
        					}
        					else {
          						System.err.print("There was an error getting data from the db: ");
        						System.err.println(queryrunner.GetError());
        					}
        				}
        				
        				// reset the success variable
        				success = false;
            		}
            		
            		System.out.println("\nThis the end of the application, we hope you enjoyed it!");
            	}
            	else {
            		System.out.print("There was an error connecting to the database: ");
            		System.out.println(queryrunner.GetError());
            	}
            	
            	scan.close();
            	
               // TODO 
                // You should code the following functionality:

                //    You need to determine if it is a parameter query. If it is, then
                //    you will need to ask the user to put in the values for the Parameters in your query
                //    you will then call ExecuteQuery or ExecuteUpdate (depending on whether it is an action query or regular query)
                //    if it is a regular query, you should then get the data by calling GetQueryData. You should then display this
                //    output. 
                //    If it is an action query, you will tell how many row's were affected by it.
                // 
                //    This is Psuedo Code for the task:  
                //    Connect()
                //    n = GetTotalQueries()
                //    for (i=0;i < n; i++)
                //    {
                //       Is it a query that Has Parameters
                //       Then
                //           amt = find out how many parameters it has
                //           Create a paramter array of strings for that amount
                //           for (j=0; j< amt; j++)
                //              Get The Paramater Label for Query and print it to console. Ask the user to enter a value
                //              Take the value you got and put it into your parameter array
            //           If it is an Action Query then
            //              call ExecuteUpdate to run the Query
            //              call GetUpdateAmount to find out how many rows were affected, and print that value
            //           else
            //               call ExecuteQuery 
            //               call GetQueryData to get the results back
            //               print out all the results
                //           end if
                //      }
                //    Disconnect()


                // NOTE - IF THERE ARE ANY ERRORS, please print the Error output
                // NOTE - The QueryRunner functions call the various JDBC Functions that are in QueryJDBC. If you would rather code JDBC
                // functions directly, you can choose to do that. It will be harder, but that is your option.
                // NOTE - You can look at the QueryRunner API calls that are in QueryFrame.java for assistance. You should not have to 
                //    alter any code in QueryJDBC, QueryData, or QueryFrame to make this work.
//                System.out.println("Please write the non-gui functionality");
                
            }
        }
 
    }    
}
