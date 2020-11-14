package queryrunner;

import java.util.ArrayList;
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
        
        this.m_projectTeamApplication="GLOBETROTTER";    // THIS NEEDS TO CHANGE FOR YOUR APPLICATION
        
        // Each row that is added to m_queryArray is a separate query. It does not work on Stored procedure calls.
        // The 'new' Java keyword is a way of initializing the data that will be added to QueryArray. Please do not change
        // Format for each row of m_queryArray is: (QueryText, ParamaterLabelArray[], LikeParameterArray[], IsItActionQuery, IsItParameterQuery)
        
        //    QueryText is a String that represents your query. It can be anything but Stored Procedure
        //    Parameter Label Array  (e.g. Put in null if there is no Parameters in your query, otherwise put in the Parameter Names)
        //    LikeParameter Array  is an array I regret having to add, but it is necessary to tell QueryRunner which parameter has a LIKE Clause. If you have no parameters, put in null. Otherwise put in false for parameters that don't use 'like' and true for ones that do.
        //    IsItActionQuery (e.g. Mark it true if it is, otherwise false)
        //    IsItParameterQuery (e.g.Mark it true if it is, otherwise false)
        
        insertMember();         // Query 0
        insertRating();         // Query 1
        top3MostVisited();      // Query 2
        luxuryTrip();			// Query 3
        bangForYourBuck();      // Query 4
        findDestination();      // Query 5
        top5DesiredDest();      // Query 6
        mostPopularHotels();    // Query 7
        mostPopularAirlines();  // Query 8
        findDestByHighlight();  // Query 9
        getAirlines();          // Query 10
        getHotels();			// Query 11
        getDestinations();	    // Query 12
        getHighlights();		// Query 13
    }
     
    
    /**
     * Insert Member Query
     */
    private void insertMember() {
    	m_queryArray.add(new QueryData("INSERT into MEMBER(member_fname, member_lname, member_city, member_country) VALUES (?, ?, ?, ?)"
    			, new String[]{"First Name", "Last Name", "City", "Country"}, new boolean[] {false, false, false, false}, true, true));
    }
    
    /**
     * Query to add a rating
     * @return
     */
    private void insertRating() {
    	m_queryArray.add(new QueryData(""
    			+ "INSERT INTO RATING "
    			+ "(rat_stars, rat_amt_spent, hotel_id, member_id, air_code, dest_id, highlight_id)\r\n"
    			+ "VALUES (?, ?, ?, ?, ?, ?, ?)"
    			, new String[]{
    					"Stars", 
    					"Amount Spent", 
    					"Hotel ID", 
    					"Member ID",
    					"Airline Code",
    					"Destination ID",
    					"Favorite Highlight ID"
    					},
    			new boolean[] {false, false, false, false, false, false, false},
    			true, true));
    }
    
    /**
     * This query is a way for users to see what the most visited destinations are. 
     */
    private void top3MostVisited() {
   	 m_queryArray.add(new QueryData(""
   	 			+ "SELECT\r\n"
        		+ "DESTINATION.dest_name AS Destination,\r\n"
        		+ "COUNT(RATING.dest_id) AS 'Number of Visits'\r\n"
        		+ "From\r\n"
        		+ "DESTINATION\r\n"
        		+ "JOIN RATING ON RATING.dest_id = DESTINATION.dest_id\r\n"
        		+ "GROUP BY RATING.dest_id\r\n"
        		+ "ORDER BY COUNT(RATING.dest_id) DESC\r\n"
        		+ "LIMIT 3;", null, null, false, false));
    }
    
    /**
     * Displays 4 and 5 star rated destinations where users spent over $2,950
     */
    private void luxuryTrip() {
    	 m_queryArray.add(new QueryData(
    			 "SELECT\r\n"
    	 		+ "RATING.rat_stars      AS Rating, \r\n"
    	 		+ "RATING.rat_amt_spent  AS Expenses, \r\n"
    	 		+ "DESTINATION.dest_name AS Destination \r\n"
    	 		+ "From\r\n "
    	 		+ "RATING\r\n "
    	 		+ "JOIN MEMBER ON MEMBER.member_id = RATING.member_id\r\n "
    	 		+ "JOIN DESTINATION ON DESTINATION.dest_id = RATING.dest_id\r\n "
    	 		+ "WHERE\r\n "
    	 		+ "RATING.rat_amt_spent > 2950\r\n "
    	 		+ "AND (RATING.rat_stars = 4\r\n OR RATING.rat_stars = 5)\r\n "
    	 		+ "ORDER BY RATING.rat_amt_spent DESC;\r\n "
    	 		, null, null, false, false));
    }
    
    /**
     * Display 4 and 5 star rated destinations where users spent less than $1,500
     */
    private void bangForYourBuck() {
    	m_queryArray.add(new QueryData(
    			"SELECT\r\n"
    			+ "dest_name     AS Destination,\r\n"
    			+ "rat_amt_spent AS Expenses,\r\n"
    			+ "rat_stars     AS Rating\r\n"
    			+ "FROM\r\n"
    			+ "DESTINATION,\r\n"
    			+ "RATING\r\n"
    			+ "WHERE\r\n"
    			+ "DESTINATION.dest_id      = RATING.dest_ID\r\n"
    			+ "AND RATING.rat_amt_spent < 1500 \r\n"
    			+ "AND (RATING.rat_stars    = 4 "
    			+ "OR  RATING.rat_stars      = 5)\r\n"
    			+ "GROUP BY DESTINATION.dest_name\r\n"
    			+ "ORDER BY RATING.rat_stars DESC;", null, null, false, false));
    	
    }
    
    /* 
     * Query to find a destination known for a certain food type, a certain highlight, 
     * and a cost below a certain value
     */
    private void findDestination() {
    	m_queryArray.add(new QueryData(
    		"SELECT \n"
    		+ " DESTINATION.dest_name    AS Destination,\n"
    		+ " FOOD_TYPE.food_name      AS 'Food Type',\n"
    		+ " HIGHLIGHT.highlight_name AS 'Highlight',\n"
    		+ " RATING.rat_amt_spent     AS 'Expenses' \n"
    		+ "From\n"
    		+ " DESTINATION\n"
    		+ " JOIN FOOD_TYPE ON FOOD_TYPE.food_id      = DESTINATION.food_id\n"
    		+ " JOIN HIGHLIGHT ON HIGHLIGHT.highlight_id = DESTINATION.highlight_id\n"
    		+ " JOIN RATING ON RATING.dest_id            = DESTINATION.dest_id \n"
    		+ "Where\n"
    		+ "	FOOD_TYPE.food_name          = ?\n"
    		+ " AND HIGHLIGHT.highlight_name = ?\n"
    		+ "	AND RATING.rat_amt_spent     < ? \n"
    		+ "GROUP BY DESTINATION.dest_name \n"
    		+ "Order By RATING.rat_amt_spent DESC;",
    		new String [] {"Food Type", "Highlight Type", "Max Amount Spent"},
    		new boolean [] {false, false, false},
    		false,
    		true)
    		);
    }
    
    /**
     * Create a query that displays the top-5 most desired travel destinations among all
	 * Globetrotter users. 
     */
    private void top5DesiredDest() {
    	m_queryArray.add(new QueryData(
    			"SELECT\r\n"
    			+ "d.dest_name       AS Destination,\r\n"
    			+ "f.food_name       AS 'Rec. Food',\r\n"
    			+ "h.hotel_name      AS 'Rec. Hotel',\r\n"
    			+ "a.air_name        AS 'Rec. Airline',\r\n"
    			+ "hi.highlight_name AS 'Rec. Highlight',\r\n"
    			+ "COUNT(dd.dest_id) AS '# of Users'\r\n"
    			+ "FROM\r\n"
    			+ "DESTINATION d\r\n"
    			+ "JOIN HOTEL_BRAND h ON h.hotel_id     = d.hotel_id\r\n"
    			+ "JOIN AIRLINE a ON a.air_code         = d.air_code\r\n"
    			+ "JOIN HIGHLIGHT hi ON hi.highlight_id = d.highlight_id\r\n"
    			+ "JOIN FOOD_TYPE f ON f.food_id        = d.food_id\r\n"
    			+ "JOIN DESIRED_DEST dd ON dd.dest_id   = d.dest_id\r\n"
    			+ "GROUP BY d.dest_id\r\n"
    			+ "ORDER BY COUNT(dd.dest_id) DESC\r\n"
    			+ "LIMIT 5", null, null, false, false));
    }
    
    /**
     * Display the most stayed with hotel for each destination
     */
    private void mostPopularHotels() {
    	m_queryArray.add(new QueryData(
    			"SELECT\r\n"
    			+ "d.dest_name AS Destination,\r\n"
    			+ "h.hotel_name AS `Hotel Name`,\r\n"
    			+ "t1.numStays AS `# of Stays`\r\n"
    			+ "FROM(\r\n"
    			+ "    SELECT\r\n"
    			+ "	     r.dest_id,\r\n"
    			+ "      dest_name,\r\n"
    			+ "      r.hotel_id,\r\n"
    			+ "      hotel_name,\r\n"
    			+ "      COUNT(*) AS numStays\r\n"
    			+ "    FROM RATING r\r\n"
    			+ "    JOIN DESTINATION d ON r.dest_id = d.dest_id\r\n"
    			+ "    JOIN HOTEL_BRAND h ON r.hotel_id = h.hotel_id\r\n"
    			+ "    GROUP BY dest_id, hotel_id\r\n"
    			+ "    ) t1\r\n"
    			+ "JOIN(\r\n"
    			+ "    SELECT\r\n"
    			+ "	     dest_id,\r\n"
    			+ "	     hotel_id,\r\n"
    			+ "      MAX(numStays) AS largestCount\r\n"
    			+ "    FROM(\r\n"
    			+ "        SELECT\r\n"
    			+ "		     dest_id,\r\n"
    			+ "          hotel_id,\r\n"
    			+ "          COUNT(*) AS numStays\r\n"
    			+ "        FROM RATING\r\n"
    			+ "        GROUP BY dest_id, hotel_id) temp\r\n"
    			+ "        GROUP BY dest_id\r\n"
    			+ "        ) t2\r\n"
    			+ "ON t2.dest_id       = t1.dest_id "
    			+ "AND t2.largestCount = t1.numStays\r\n"
    			+ "JOIN DESTINATION d ON t1.dest_id  = d.dest_id\r\n"
    			+ "JOIN HOTEL_BRAND h ON t1.hotel_id = h.hotel_id\r\n"
    			+ "ORDER BY d.dest_name", null, null, false, false));
    }
    
    /**
     * Display the most flown with airline for each destination
     */
    private void mostPopularAirlines() {
    	m_queryArray.add(new QueryData(
    			"SELECT\r\n"
    			+ "d.dest_name AS Destination,\r\n"
    			+ "a.air_name AS `Airline Name`,\r\n"
    			+ "t1.numFlys AS `# of Flys`\r\n"
    			+ "FROM(\r\n"
    			+ "	SELECT\r\n"
    			+ "	  r.dest_id,\r\n"
    			+ "	  dest_name,\r\n"
    			+ "	  r.air_code,\r\n"
    			+ "	  air_name,\r\n"
    			+ "	  COUNT(*) AS numFlys\r\n"
    			+ "	FROM RATING r\r\n"
    			+ "	JOIN DESTINATION d ON r.dest_id = d.dest_id\r\n"
    			+ "	JOIN AIRLINE a ON r.air_code = a.air_code\r\n"
    			+ "	GROUP BY dest_id, a.air_code\r\n"
    			+ "	) t1\r\n"
    			+ "JOIN(\r\n"
    			+ "	SELECT\r\n"
    			+ "	  dest_id,\r\n"
    			+ "	  air_code,\r\n"
    			+ "	  MAX(numFlys) AS largestCount\r\n"
    			+ "	FROM(\r\n"
    			+ "		SELECT\r\n"
    			+ "		  dest_id,\r\n"
    			+ "		  air_code,\r\n"
    			+ "		  COUNT(*) AS numFlys\r\n"
    			+ "		FROM RATING\r\n"
    			+ "		GROUP BY dest_id, air_code) temp\r\n"
    			+ "		GROUP BY dest_id\r\n"
    			+ "		) t2\r\n"
    			+ "ON t2.dest_id       = t1.dest_id\r\n"
    			+ "AND t2.largestCount = t1.numFlys\r\n"
    			+ "JOIN DESTINATION d ON t1.dest_id = d.dest_id\r\n"
    			+ "JOIN AIRLINE a ON t1.air_code    = a.air_code\r\n"
    			+ "ORDER BY d.dest_name", null, null, false, false));
    }
    
    /**
     * Display 5 star destinations matching a specified highlight
     */
    private void findDestByHighlight() {
    	m_queryArray.add(new QueryData(
        		"SELECT\n"
        		+ " dest_name      AS Destination,\n"
        		+ " highlight_name AS Highlight,\n"
        		+ " rat_stars      AS Rating \n"
        		+ "FROM\n"
        		+ " DESTINATION,\n"
        		+ " RATING,\n"
        		+ " HIGHLIGHT \n"
        		+ "WHERE\n"
        		+ " DESTINATION.dest_id          = RATING.dest_id\n"
        		+ " AND HIGHLIGHT.highlight_id   = RATING.highlight_id\n"
        		+ " AND RATING.rat_stars         = 5\n"
        		+ " AND HIGHLIGHT.highlight_name = ? \n"
        		+ "GROUP BY DESTINATION.dest_name;"
        		, new String [] {"Highlight Name"}, 
        		new boolean [] {false},  
        		false, 
        		true)
        		);
    }
    
    /**
     * Get all airlines
     */
    private void getAirlines() {
    	m_queryArray.add(new QueryData("SELECT * FROM AIRLINE"
    			, null, null, false, false));
    }
    
    /**
     * Get all hotels
     */
    private void getHotels() {
    	m_queryArray.add(new QueryData("SELECT * FROM HOTEL_BRAND"
    			, null, null, false, false));
    }
    
    /**
     * Get all destinations
     */
    private void getDestinations() {
    	m_queryArray.add(new QueryData("SELECT dest_id, dest_name FROM DESTINATION"
    			, null, null, false, false));
    }
    
    /**
     * Get all highlights
     */
    private void getHighlights() {
    	m_queryArray.add(new QueryData("SELECT * FROM HIGHLIGHT"
    			, null, null, false, false));
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
    
    /**
     * Function to display options to the user and return query choice
     * @return the integer choice of the user
     */
    public static int getUserChoice() {
    	Scanner scan = new Scanner(System.in);
    	
		System.out.println("  *** What would you like to do?*** \n");
		
		System.out.println("1.  Add a member");
		System.out.println("2.  Add a rating");
		System.out.println("3.  See the top 3 most visited destinations");
		System.out.println("4.  See luxurious 4 and 5 star destinations");
		System.out.println("5.  See low cost 4 and 5 star destinations");
		System.out.println("6.  Find a destination by food type, highlight type, and cost");
		System.out.println("7.  Display the top 5 most desired destinations by our members");
		System.out.println("8.  Display the most commonly stayed with hotels at each destination");
		System.out.println("9.  Display the most commonly flown with airlines for each destination");
		System.out.println("10. Find a destination by a highlight type");
		System.out.println("11. Quit");
		
		System.out.print("\nPlease enter a number for your choice: ");
		
		int queryChoice = scan.nextInt();
		
		while (queryChoice < 1 || queryChoice > 11) {
			System.out.println("That is not a valid choice.");
			System.out.print("\nPlease enter a number for your choice: ");
			queryChoice = scan.nextInt();
		}
		
		return queryChoice;
    }
    
    /**
     * Function to choose a query base on a passed in user choice
     */
    public static void querySwitch(QueryRunner qr, int queryChoice) {
		switch (queryChoice) {
		case 1:
			runMemberQuery(qr);
			break;
		case 2:
			runRatingQuery(qr);
			break;
		case 3:
			runQuery(qr, 2);
			break;
		case 4:
			runQuery(qr, 3);
			break;
		case 5:
			runQuery(qr, 4);
			break;
		case 6:
			runParamQuery(qr, 5);
			break;
		case 7:
			runQuery(qr, 6);
			break;
		case 8:
			runQuery(qr, 7);
			break;
		case 9:
			runQuery(qr, 8);
			break;
		case 10:
			runQuery(qr, 9);
			break;
		default:
			displayExit();
		}
    }

	/**
	 * Runs a non-parameter query and prints out results.
	 * @precon the query does not require parameters and is not an action query
	 * @param queryrunner a QueryRunner instance
	 * @param i           the number query the client wishes to run
	 */
	public static void runQuery(QueryRunner qr, int i) 
	    		throws IllegalArgumentException {
	
			String [] parmstring={};
	        String [] headers;
	        String [][] allData;
			
			// Check if this query requires parameters
			if (qr.isParameterQuery(i)) {
				throw new IllegalArgumentException("The passed in query requires "
						+ "parameters.  This function does not handle "
						+ "parameters.");
			}
				
			// Check if this query is an action query
			if (qr.isActionQuery(i)) {
				throw new IllegalArgumentException("The passed in query is "
						+ "an action query.  This function does not handle "
						+ "action queries.");
			}
			
			// Not an action query
			else {
				boolean success = qr.ExecuteQuery(i, parmstring);
				
				if (success = true) {
					
					headers = qr.GetQueryHeaders();
	                allData = qr.GetQueryData();
	                
	                for (String s : headers) {
	                	String header = qr.padRightSpaces(s, 20);
	                	System.out.print(header + " ");
	                }
	                System.out.println();
	                
	                System.out.println(qr.getHorizontalLine(20 * headers.length));
	                
					for (int j = 0; j < allData.length; j++) {
						for (int k = 0; k < allData[j].length; k++) {
							String data = qr.padRightSpaces(allData[j][k], 20);
							System.out.print(data + " ");
						}
						System.out.println();
					}
				}
				else {
					System.err.print("There was an error getting data from the db: ");
					System.err.println(qr.GetError());
				}
			}
	    }
	     
	/**
	 * Runs a parameterized query and prints out results.
	 * @precon the query requires parameters
	 * @param queryrunner a QueryRunner instance
	 * @param i           the number query the client wishes to run
	 */
	public static void runParamQuery(QueryRunner qr, int i) 
			throws IllegalArgumentException {
		
			Scanner scan = new Scanner(System.in);
	
			int numParam = qr.GetParameterAmtForQuery(i);
			String [] parmstring={};
	        String [] headers;
	        String [][] allData;
	        boolean success = false;
			
			// Check if this query requires parameters
			if (!qr.isParameterQuery(i)) {
				
				throw new IllegalArgumentException("The passed in query does not "
						+ "require parameters.  "
						+ "This function only handles queries with parameters.");
			}
			
			// Get parameters
			parmstring = new String[numParam];
			
			for (int j = 0; j < numParam; j++) {
				String currParam = qr.GetParamText(i, j);
				
				System.out.print("\nEnter a value for parameter \"");
				System.out.println(currParam + "\": ");
				
				parmstring[j] = scan.nextLine();
			}
				
			// Check if this query is an action query
			if (qr.isActionQuery(i)) {
				
				success = qr.ExecuteUpdate(i, parmstring); 
				
				if (success == true) {
					
					int updateAmt = qr.GetUpdateAmount();
					
					System.out.println("\n" + updateAmt + " total row(s) affected.\n");
				}
				else {
					System.err.print("There was an error updating the db: ");
					System.err.println(qr.GetError());
				}
			}
			// Not an action query
			else {
				success = qr.ExecuteQuery(i, parmstring);
				
				if (success = true) {
					
					headers = qr.GetQueryHeaders();
	                allData = qr.GetQueryData();
	                
	                for (String s : headers) {
	                	String header = qr.padRightSpaces(s, 20);
	                	System.out.print(header + " ");
	                }
	                System.out.println();
	                
	                System.out.println(qr.getHorizontalLine(20 * headers.length));
	                
					for (int j = 0; j < allData.length; j++) {
						for (int k = 0; k < allData[j].length; k++) {
							String data = qr.padRightSpaces(allData[j][k], 20);
							System.out.print(data + " ");
						}
						System.out.println();
					}
				}
				else {
						System.err.print("There was an error getting data from the db: ");
					System.err.println(qr.GetError());
				}
			}
	    }
	    
	/**
	 * Runs the add member query and prompts user for proper parameters
	 * @param queryrunner a QueryRunner instance
	 */
	public static void runMemberQuery(QueryRunner qr) {
		
		Scanner scan = new Scanner(System.in);

		String [] parmstring={};
        boolean success = false;
		
		// Get parameters
		parmstring = new String[4];
		
		System.out.println("What is the member's first name? ");
		parmstring[0] = scan.nextLine();
		
		System.out.println("What is the member's last name? ");
		parmstring[1] = scan.nextLine();
		
		System.out.println("What is the member's home city? ");
		parmstring[2] = scan.nextLine();
		
		System.out.println("What is the member's country of citizenship? ");
		parmstring[3] = scan.nextLine();	
			
		success = qr.ExecuteUpdate(0, parmstring); 
		
		if (success == true) {
			
			int updateAmt = qr.GetUpdateAmount();
			
			System.out.println("\n" + updateAmt + " total row(s) affected.\n");
		}
		else {
			System.err.print("There was an error updating the db: ");
			System.err.println(qr.GetError());
	}
		
	/**
	 * Runs the add rating query and prompts user for proper parameters
	 * @param queryrunner a QueryRunner instance
	 */
	public static void runRatingQuery(QueryRunner qr) {
		
		Scanner scan = new Scanner(System.in);

		String [] parmstring={};
        boolean success = false;
        int intChoice;
        String strChoice;
        
        rat_stars, rat_amt_spent, hotel_id, member_id, air_code, 5, highlight_id)
		
		// Get parameters
		parmstring = new String[7];
		
		// Get destination
		System.out.println("What is the destination ID for your destination? ");
		System.out.println("Enter 0 to see all destinations: ");
		intChoice = scan.nextInt();
		
		// display all destinations to the user
		while (intChoice == 0) {
			qr.getDestinations();
			System.out.println("What is the destination ID for your destination? ");
			System.out.println("Enter 0 to see all destinations: ");
			intChoice = scan.nextInt();
		}
		
		// make sure the choice is a valid dest_id
		while (intChoice < 0 || intChoice > 60) {
			System.out.println("That is not a valid destination ID.");
			System.out.println("What is the destination ID for your destination? ");
			intChoice = scan.nextInt();
		}
		
		parmstring[5] = scan.nextLine();
		
		// Get airline
		System.out.println("Who did you fly with? (please enter the airline code) ");
		System.out.println("Enter 0 to see all arlines: ");
		strChoice = scan.nextLine();
		
		// display all destinations to the user
		while (strChoice == "0") {
			qr.getAirlines();
			System.out.println("Who did you fly with? (please enter the airline code) ");
			System.out.println("Enter 0 to see all arlines: ");
			strChoice = scan.nextLine();
		}
		
		// make sure the choice is a valid dest_id
		while (strChoice.length() <= 1 || strChoice.length() > 3) {
			System.out.println("That is not a valid airline code.");
			System.out.println("Please enter an airline code 1 to 3 characters in length: ");
			strChoice = scan.nextLine();
		}
		
		parmstring[4] = scan.nextLine();
		
		System.out.println("What is the member's last name? ");
		parmstring[1] = scan.nextLine();
		
		System.out.println("What is the member's home city? ");
		parmstring[2] = scan.nextLine();
		
		System.out.println("What is the member's country of citizenship? ");
		parmstring[3] = scan.nextLine();	
			
		success = qr.ExecuteUpdate(0, parmstring); 
		
		if (success == true) {
			
			int updateAmt = qr.GetUpdateAmount();
			
			System.out.println("\n" + updateAmt + " total row(s) affected.\n");
		}
		else {
			System.err.print("There was an error updating the db: ");
			System.err.println(qr.GetError());
	}
	
	public static void displayExit() {
		System.out.println("\nThank you for using GlobeTrotter!  Enjoy your travels!");
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
            	
            	// TO-DO:
            	//    1. Add a insert rating query
            	//    2. Allow users to log in
            	//        a. Need a member lookup query
            	//    3. Number all queries and let a user choose one
            	//    4. Create function to display query results
            	//    5. Create function for each query perhaps
            	//    6. If no results are returned then let the user know that
//            	runMemberQuery(qr);
//                runRatingQuery(qr);
//                runParamQuery(qr, 5);
//                displayExit();
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
            		
            		int queryChoice = 0;
            		while (queryChoice != 11) {
            			queryChoice = getUserChoice();
            			querySwitch(queryrunner, queryChoice);
            		}
            		
            		int n = queryrunner.GetTotalQueries();
            		
            		// Loop through  all queries
            		for (int i = 6; i < 14; i++) {
                		runQuery(queryrunner, i);
            		}
            		

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
