-- Write your SQL code here
DELIMITER //
CREATE FUNCTION CalculateLoanDuration(loan_id INT) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE start_date DATE;
    DECLARE end_date DATE;
    SELECT StartDate, EndDate INTO start_date, end_date FROM LOAN WHERE LoanId = loan_id;
    RETURN DATEDIFF(end_date, start_date);
END //
DELIMITER ;
