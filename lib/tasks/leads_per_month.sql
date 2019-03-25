SELECT TO_CHAR(created_at,'Mon') months, COUNT(id)
FROM factcontact
GROUP BY months,EXTRACT(MONTH FROM created_at)
ORDER BY EXTRACT(MONTH FROM created_at) ASC;
