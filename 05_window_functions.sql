WITH monthly AS (
  SELECT issue_d AS month, SUM(loan_amnt) AS monthly_volume
  FROM loans
  GROUP BY month
)
SELECT
  month,
  monthly_volume,
  SUM(monthly_volume) OVER (ORDER BY month) AS running_total
FROM monthly
ORDER BY month;
