-- Write your SQL code here
START TRANSACTION;
-- Step 1: Deduct repayment from loan balance
UPDATE LOAN
SET Balance = Balance - 1000.00 -- Replace with actual amount
WHERE LoanId = 1;

-- Step 2: Validate if loan balance is negative
IF (SELECT Balance FROM LOAN WHERE LoanId = 1) < 0 THEN
    ROLLBACK;
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Transaction aborted: Negative loan balance not allowed.';
END IF;

-- Step 3: Commit transaction
COMMIT;