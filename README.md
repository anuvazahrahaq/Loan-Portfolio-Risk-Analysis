# Loan Portfolio Risk Analysis (SQL + Stata)

I built this project to analyze credit risk across more than 20,000 historical loan records. To make sure my database queries were completely accurate and free of bugs, I took a dual-tool approach: I built the entire data pipeline using SQL, and then wrote an independent script in Stata 14 to replicate and cross-check the exact same metrics. 
Because both systems matched down to the decimal point, I was able to mathematically verify the integrity of the data.

# What's Inside This Repository

*   `01_basic_queries.sql` - Initial data exploration, sorting, and filtering.
*   `02_aggregation_and_schema.sql` - Grouping risk metrics and setting up the target table schema.
*   `03_joins.sql` - Joining tables to analyze risk across customer demographics.
*   `04_vintage_analysis.sql` - Grouping loans by their issuance month to track performance over time.
*   `05_window_functions.sql` - Running totals, cumulative volumes, and partitioned risk metrics.
*   `06_stata_cross_check.do` - The Stata script that automates the verification process.

---

# The Results (And How I Verified Them)

The table below shows the default rates by credit grade. I calculated these first using SQL window functions, and then replicated them using the `collapse` command in Stata. The outputs from both programs matched perfectly:

| Loan Grade | Total Active Loans | Default Rate (%) | Risk Level |
| :--- | :---: | :---: | :---: |
| A | 59,427 | 0.04% | Very Low |
| B | 55,209 | 0.09% | Low |
| C | 48,458 | 0.10% | Moderate |
| D | 26,980 | 0.20% | Medium-High |
| E | 8,650 | 0.39% | High |
| F | 1,037 | 0.87% | Very High |
| G | 239 | 2.09% | Extreme |

# What the data actually tells us:
Looking at the numbers, there is a massive jump in risk as you go down the credit tiers. Grade G loans make up a tiny sliver of the portfolio, but their default rate is **over 52 times higher** than Grade A loans. The risk really starts to escalate once you get past Grade D, which suggests that tightening the underwriting rules for Grades E, F, and G would be the quickest way to protect the portfolio's overall yield.

## My Workflow

1.  Building the SQL Pipeline: I designed a relational schema (`loan_risk.db`) to keep static loan details separate from dynamic, changing loan statuses. I used **Common Table Expressions (CTEs)** and **Window Functions** to handle the running balances and the cohort vintage analysis.
2.  The Stata Cross-Check: I loaded the raw CSV data into Stata, wrote logic to flag defaults (`Charged Off` or `Default` statuses), and aggregated the metrics. This let me independently prove that my SQL calculations were 100% correct.

# How to Run the Code

Because the raw dataset (`loans_raw.csv`) contains tens of thousands of records, it exceeds GitHub's 25MB direct web upload limit. To run these scripts yourself:

1.  Clone this repository to your local machine.
2.  Place your raw `loans_raw.csv` data file in the same folder as these scripts.
3.  Run the SQL scripts in order from `01` to `05`.
4.  Open Stata, open `06_stata_cross_check.do`, update the file path to point to your local folder, and run the script.


Developed by Anuva Zahra Haq
