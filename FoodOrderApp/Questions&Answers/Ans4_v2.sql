  WITH cte AS (
    SELECT Orders.date_local, Orders.country_name, Vendors.vendor_name, ROUND(SUM(Orders.gmv_local), 2) AS total_gmv,
           ROW_NUMBER() OVER (PARTITION BY Orders.country_name, Orders.date_local
                              ORDER BY SUM(Orders.gmv_local) DESC) rn
    FROM `Orders` 
    LEFT JOIN `Vendors` 
        ON Orders.vendor_id = Vendors.id
    GROUP BY Orders.country_name, Orders.date_local, Vendors.vendor_name
)

SELECT date_local as year, country_name, vendor_name, total_gmv
FROM cte
