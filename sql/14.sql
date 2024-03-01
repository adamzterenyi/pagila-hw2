/*
 * Create a report that shows the total revenue per month and year.
 *
 * HINT:
 * This query is very similar to the previous problem,
 * but requires an additional JOIN.
 */

SELECT
    EXTRACT (YEAR from rental_date) "Year",
    EXTRACT (MONTH from rental_date) "Month",
    SUM (amount) AS "Total Revenue"
FROM
    rental
    JOIN payment USING (rental_id)
GROUP BY 
    ROLLUP (
        EXTRACT (YEAR from rental_date),
        EXTRACT (MONTH from rental_date)
)
ORDER BY "Year", "Month";                      
