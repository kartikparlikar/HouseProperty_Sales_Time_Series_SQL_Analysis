-- Show The Total Sales For Each Year 
SELECT EXTRACT(YEAR FROM DATESOLD) AS YEAR,
	SUM(PRICE) Annual_sale
FROM ORDERS
GROUP BY YEAR
ORDER BY YEAR ASC

-----------------------------------------------------------------------

--Which date corresponds to the highest number of sales
SELECT DISTINCT DATESOLD,
	COUNT(*) ORDER_COUNT,
	SUM(PRICE) SALE
FROM ORDERS
GROUP BY DATESOLD
ORDER BY SALE DESC

-----------------------------------------------------------------------
--Find out the postcode with the highest average price per sale?
SELECT POSTCODES,
	(SUM(PRICE) / COUNT(*)) AS AVG_PRICE
FROM ORDERS
GROUP BY POSTCODES
ORDER BY AVG_PRICE DESC



-----------------------------------------------------------------------
--Which year witnessed the lowest number of sales?
SELECT EXTRACT(YEAR FROM DATESOLD) AS YEARS,
	SUM(PRICE) AS PRICE
FROM ORDERS
GROUP BY YEARS
ORDER BY PRICE ASC


-----------------------------------------------------------------------
--Use the window function to deduce the top six postcodes by year's price.

WITH ORDERSS AS
	(SELECT POSTCODES,
			EXTRACT(YEAR FROM DATESOLD) AS YEAR,
			SUM(PRICE) AS PRICE
		FROM ORDERS
		GROUP BY POSTCODES,
			YEAR
		ORDER BY YEAR,
			PRICE DESC)
SELECT POSTCODES,
	YEAR,
	MIN(PRICE) OVER(PARTITION BY PRICE ORDER BY price asc)
FROM ORDERSS
LIMIT 6

-----------------------------------------------------------------------


