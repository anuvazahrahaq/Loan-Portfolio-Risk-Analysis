# Loan Portfolio Risk Analysis

This project was my way of learning SQL while working with a real dataset instead of simple practice exercises. I used a sample of Lending Club loan data to answer some basic credit risk questions, such as which borrowers default more often and how loan performance changes across credit grades.

The database was built in SQLite, and all analyses were written in SQL. After finishing the SQL portion, I repeated one of the analyses in Stata to make sure I was getting the same results.

## Files

- `01_basic_queries.sql` - Basic SQL practice (SELECT, WHERE, ORDER BY)
- `02_aggregation_and_schema.sql` - Aggregate statistics and database setup
- `03_joins.sql` - JOIN queries
- `04_vintage_analysis.sql` - Loan performance by issue date
- `05_window_functions.sql` - Window function examples
- `06_stata_cross_check.do` - Stata validation

## Example question

One question I looked at was whether borrowers with lower credit grades were more likely to default.

| Grade | Default Rate (%) | Risk Level |
|:---:|:---:|:---:|
| **A** | 0.04% | Very Low |
| **B** | 0.09% | Low |
| **C** | 0.10% | Moderate |
| **D** | 0.20% | Medium-High |
| **E** | 0.39% | High |
| **F** | 0.87% | Very High |
| **G** | 2.09% | Extreme |

The analysis showed that default rates generally increased as credit grades became lower. While Grade G loans made up a tiny sliver of the portfolio, their default rate was over 52 times higher than Grade A loans, showing a massive escalation in risk once you get past Grade D. 

I also compared the SQL output with Stata, and both produced the exact same results for the validation analysis.

## What I learned

This project helped me practice:

- writing SQL queries
- designing a simple relational database
- using JOINs and CTEs
- working with window functions
- validating SQL results in Stata

