SELECT
  CASE
    WHEN s.annual_inc < 40000 THEN 'Under 40k'
    WHEN s.annual_inc < 80000 THEN '40k-80k'
    ELSE 'Over 80k'
  END AS income_bracket,
  COUNT(*) AS total_loans,
  ROUND(100.0 * SUM(CASE WHEN s.status IN ('Charged Off','Default') THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_pct
FROM loans l
JOIN loan_status s ON l.loan_id = s.loan_id
GROUP BY income_bracket;
