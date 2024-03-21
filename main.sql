-- Create a new table with selected columns
CREATE TABLE extracted_data AS
SELECT 
    age, job, marital, education, `default`, housing, loan, contact, 'month', day_of_week, 
    duration, campaign, pdays, previous, poutcome, 'emp.var.rate', 'cons.price.idx', 
    'cons.conf.idx', euribor3m, 'nr.employed', y
FROM `bank_telemarketing`.`bank_tele`;

-- Add the 'total_previous_contacts' column
ALTER TABLE extracted_data
ADD COLUMN total_previous_contacts INT;

-- Update the 'total_previous_contacts' column
UPDATE extracted_data
SET total_previous_contacts = previous + CASE WHEN pdays = 999 THEN 0 ELSE 1 END;

-- Add the 'contacted_last_month' column
ALTER TABLE extracted_data
ADD COLUMN contacted_last_month INT;

-- Update the 'contacted_last_month' column
UPDATE extracted_data
SET contacted_last_month = CASE WHEN month = 'feb' THEN 1 ELSE 0 END;
