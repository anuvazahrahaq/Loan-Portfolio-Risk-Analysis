SELECT AVG(int_rate) FROM loans_raw;

SELECT
  grade,
  COUNT(*) AS total_loans,
  SUM(CASE WHEN loan_status IN ('Charged Off','Default') THEN 1 ELSE 0 END) AS defaults,
  ROUND(100.0 * SUM(CASE WHEN loan_status IN ('Charged Off','Default') THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_pct
FROM loans_raw
GROUP BY grade
ORDER BY grade;
