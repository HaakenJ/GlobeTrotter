/* The Top 3 Most Rated Destination by User */
SELECT
	RATING. dest_id AS destination_id,
	DESTINATION.dest_name AS destination,
	COUNT(RATING.dest_id) AS Number_Of_Times_Rated_By_User
From
	DESTINATION
	JOIN RATING ON RATING.dest_id = DESTINATION.dest_id
GROUP BY RATING.dest_id
ORDER BY Number_Of_Times_Rated_By_User DESC
LIMIT 3;



/* User Search for a Highly Rated, Luxurious, Travel Destination */
SELECT
CONCAT (MEMBER.member_fname, ' ', MEMBER.member_lname) AS User_Name,
	RATING.rat_stars AS User_Rating,
 	RATING.rat_amt_spent as Trip_Expense,
DESTINATION.dest_name as Destination
From
	RATING
    	JOIN MEMBER ON MEMBER.member_id = RATING.member_id
    	JOIN DESTINATION ON DESTINATION.dest_id = RATING.dest_id
WHERE
	RATING.rat_amt_spent > 2950
		AND (RATING.rat_stars = 4 
			or RATING.rat_stars = 5)
GROUP BY User_Name
ORDER BY User_Rating DESC;



/* A List of Trip Highlights Recommended By Chinese Users */
SELECT
    	MEMBER.member_country AS User_Country,
    	HIGHLIGHT.highlight_name AS Trip_Highlight,
    	COUNT(RATING.highlight_id) AS Numbers_Of_Times_Recommended
From
	RATING
    	JOIN MEMBER ON MEMBER.member_id = RATING.member_id 	
    	JOIN HIGHLIGHT ON HIGHLIGHT.highlight_id = RATING.highlight_id
Where 
	MEMBER.member_country = 'Ch'
GROUP BY Trip_Highlight
ORDER BY Numbers_Of_Times_Recommended DESC;



/* Get How Frequently Each Airline Was Flown With */
SELECT 
	air_name AS Airline_Name,
	count(air_name) AS Frequency_Of_Airline
FROM
(
	SELECT air_name,
		AIRLINE.air_code,
		RECOMMENDED_DEST.dest_id,
		member_id
	FROM AIRLINE
		JOIN DESTINATION ON AIRLINE.air_code = DESTINATION.air_code
		JOIN RECOMMENDED_DEST ON DESTINATION.dest_id = RECOMMENDED_DEST.dest_id
    )t1
GROUP BY air_name
ORDER BY Frequency_Of_Airline DESC;



/* Get 5 Star Destinations best known for their beaches */
SELECT 
    	dest_name AS Destination, 
   	 highlight_name AS Highlight, 
    	rat_stars AS Rating
FROM 
    	DESTINATION, 
    	RATING, 
    	HIGHLIGHT
WHERE 	
	DESTINATION.dest_id = RATING.dest_id 
	AND  HIGHLIGHT.highlight_id = RATING.highlight_id 
	AND RATING.rat_stars = 5
	AND HIGHLIGHT.highlight_name = "beaches"
GROUP BY DESTINATION.dest_name;



/* Get Lowest Average Amount Spent to Visit a 4 or 5-star Location */
SELECT 
	dest_name AS Destination, 
    	rat_amt_spent AS Cost, 
    	rat_stars AS Rating
FROM 
	DESTINATION, 
    	RATING
WHERE 
	DESTINATION.dest_id = RATING.dest_ID
	AND (RATING.rat_stars = 4 OR RATING.rat_stars = 5)
GROUP BY DESTINATION.dest_name
order by RATING.rat_amt_spent;




/* Top 5 Most Desired Travel Destinations with Recommendations */
SELECT
	DESTINATION.dest_name AS Destination,
    	FOOD_TYPE.food_name AS Rec_Food,
    	HOTEL_BRAND.hotel_name AS Rec_Hotel,
    	AIRLINE.air_name AS Rec_Airline,
    	HIGHLIGHT.highlight_name AS Rec_Highlight,
    	COUNT(DESIRED_DEST.dest_id) AS Times_Desired_Destination_Mentioned
FROM
	DESTINATION
    	JOIN HOTEL_BRAND ON HOTEL_BRAND.hotel_id = DESTINATION.hotel_id
    	JOIN AIRLINE ON AIRLINE.air_code = DESTINATION.air_code
    	JOIN HIGHLIGHT ON HIGHLIGHT.highlight_id = DESTINATION.highlight_id
    	JOIN FOOD_TYPE ON FOOD_TYPE.food_id = DESTINATION.food_id
    	JOIN DESIRED_DEST ON DESIRED_DEST.dest_id = DESTINATION.dest_id
GROUP BY DESTINATION.dest_name
ORDER BY Times_Desired_Destination_Mentioned DESC
LIMIT 5;




/* Most Commonly Stayed With Hotels At Each Destination */
SELECT
    t1.dest_id,
    d.dest_name AS Destination,
    t1.hotel_id,
    h.hotel_name AS `Hotel Name`,
    t1.numStays AS `# of Stays`
FROM(
   	SELECT
       		r.dest_id,
       		dest_name,
       		r.hotel_id,
       		hotel_name,
       		COUNT(*) AS numStays
   	FROM RATING r
       	JOIN DESTINATION d ON r.dest_id  = d.dest_id
       	JOIN HOTEL_BRAND h ON r.hotel_id = h.hotel_id
   	GROUP BY dest_id, hotel_id
   ) t1
JOIN(
   	SELECT
       		dest_id,
       		hotel_id,
       		MAX(numStays) AS largestCount
   	FROM(
       		SELECT
         	   dest_id,
         	   hotel_id,
        	   COUNT(*) AS numStays
       		   FROM RATING
       		   GROUP BY dest_id, hotel_id) temp
   		   GROUP BY dest_id
 ) t2
ON t2.dest_id = t1.dest_id AND t2.largestCount = t1.numStays
JOIN DESTINATION d ON t1.dest_id  = d.dest_id
JOIN HOTEL_BRAND h ON t1.hotel_id = h.hotel_id
ORDER BY t1.dest_id;




/* Get Destinations With All Recommendations */
SELECT 
    DESTINATION.dest_name, 
    food_name, air_name, 
    hotel_name, 
    item_name
FROM DESTINATION 
    JOIN FOOD_TYPE   ON DESTINATION.food_id  = FOOD_TYPE.food_id
    JOIN AIRLINE     ON DESTINATION.air_code   = AIRLINE.air_code
    JOIN HOTEL_BRAND ON DESTINATION.hotel_id = HOTEL_BRAND.hotel_id
    JOIN (SELECT dest_name, item_name
          	FROM DEST_ITEM di
               JOIN DESTINATION d ON d.dest_id = di.dest_id
               JOIN ITEM i        ON i.item_id = di.item_id) AS DI
    ON DESTINATION.dest_name = DI.dest_name
ORDER BY dest_name;




/* Curry Loving Hiker Look for a cheap travel destination */
SELECT
    DESTINATION.dest_name AS Destination,
    FOOD_TYPE.food_name AS Food_Type,
    HIGHLIGHT.highlight_name AS Travel_Highlight,
    RATING.rat_amt_spent AS Travel_Expense
From 
    DESTINATION
    JOIN FOOD_TYPE ON FOOD_TYPE.food_id = DESTINATION.food_id
    JOIN HIGHLIGHT ON HIGHLIGHT.highlight_id = DESTINATION.highlight_id
    JOIN RATING ON RATING.dest_id = DESTINATION.dest_id
Where 
	FOOD_TYPE.food_name = 'curry'
		AND HIGHLIGHT.highlight_name = 'hiking'
		AND RATING.rat_amt_spent < 2200
GROUP BY DESTINATION.dest_name
Order By Travel_Expense DESC;