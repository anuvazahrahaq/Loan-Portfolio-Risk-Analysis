WITH cohort AS (
  SELECT
    l.loan_id,
    l.issue_d AS cohort_month,
    s.status
  FROM loans l
  JOIN loan_status s ON l.loan_id = s.loan_id
)
SELECT
  cohort_month,
  COUNT(*) AS total_loans,
  ROUND(100.0 * SUM(CASE WHEN status IN ('Charged Off','Default') THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_pct
FROM cohort
GROUP BY cohort_month
ORDER BY cohort_month;
