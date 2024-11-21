-- Write your SQL code here
DELIMITER $$
CREATE PROCEDURE GetAccountBalance(IN account_id INT, OUT balance DECIMAL(15, 2))
BEGIN
    SELECT Balance INTO balance FROM ACCOUNT WHERE AccountId = account_id;
END $$
DELIMITER ;