-- 1) Upcoming deadlines in the next 7 days
SELECT a.application_id,
       c.name AS company,
       r.title AS role,
       a.deadline_date
FROM applications a
JOIN companies c ON a.company_id = c.company_id
JOIN roles r     ON a.role_id    = r.role_id
WHERE a.deadline_date IS NOT NULL
  AND date(a.deadline_date) BETWEEN date('now') AND date('now', '+7 days')
ORDER BY date(a.deadline_date);

-- 2) Applications by status
SELECT status, COUNT(*) AS num_applications
FROM applications
GROUP BY status
ORDER BY num_applications DESC;

-- 3) Applications per month
SELECT
    substr(applied_date, 1, 7) AS month,   -- 'YYYY-MM'
    COUNT(*) AS applications_sent
FROM applications
GROUP BY month
ORDER BY month;

-- 4) Offer rate by company
SELECT
    c.name AS company,
    SUM(CASE WHEN a.status = 'Offer' THEN 1 ELSE 0 END) AS offers,
    COUNT(*) AS total_applications,
    ROUND(
        100.0 * SUM(CASE WHEN a.status = 'Offer' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS offer_rate_percent
FROM applications a
JOIN companies c ON a.company_id = c.company_id
GROUP BY c.name
ORDER BY offer_rate_percent DESC;

-- 5) Timeline of interactions for one application (example: id = 2)
SELECT i.interaction_date,
       i.type,
       i.summary,
       i.next_step
FROM interactions i
WHERE i.application_id = 2
ORDER BY date(i.interaction_date);