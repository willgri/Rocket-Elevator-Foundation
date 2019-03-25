SELECT
    TO_CHAR(created_at,'Mon') months,
    COUNT(id) num_leads
FROM
    fact_contacts
GROUP BY
months,
 EXTRACT(MONTH FROM created_at)
ORDER BY
 EXTRACT(MONTH FROM created_at) ASC;