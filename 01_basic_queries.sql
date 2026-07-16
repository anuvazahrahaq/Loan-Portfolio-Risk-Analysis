-- Day 1: Basics
SELECT * FROM loans_raw LIMIT 10;
SELECT id, loan_amnt, grade, loan_status FROM loans_raw LIMIT 10;
SELECT * FROM loans_raw WHERE grade = 'C' LIMIT 10;
SELECT id, loan_amnt, int_rate FROM loans_raw ORDER BY int_rate DESC LIMIT 10;
