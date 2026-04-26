-- Customer Support Performance Dashboard SQL Queries

-- 1. Total tickets by status
SELECT status, COUNT(*) AS total_tickets
FROM support_tickets
GROUP BY status;

-- 2. Average first response time by priority
SELECT priority, AVG(first_response_hours) AS avg_first_response_hours
FROM support_tickets
WHERE first_response_hours IS NOT NULL
GROUP BY priority
ORDER BY avg_first_response_hours DESC;

-- 3. Average resolution time by category
SELECT category, AVG(resolution_hours) AS avg_resolution_hours
FROM support_tickets
WHERE status = 'Resolved'
GROUP BY category
ORDER BY avg_resolution_hours DESC;

-- 4. Tickets by channel
SELECT channel, COUNT(*) AS total_tickets
FROM support_tickets
GROUP BY channel
ORDER BY total_tickets DESC;

-- 5. Average CSAT score by category
SELECT category, AVG(csat_score) AS avg_csat_score
FROM support_tickets
WHERE status = 'Resolved'
GROUP BY category
ORDER BY avg_csat_score DESC;
