-- Write your SQL code here
CREATE VIEW CustomerAccountSummary AS
SELECT c.CustomerId, c.Name, a.AccountId, a.Balance, a.AccountType
FROM CUSTOMER c
INNER JOIN ACCOUNT a ON c.CustomerId = a.CustomerId;

CREATE VIEW LoanSummary AS
SELECT l.LoanId, l.InterestRate, l.StartDate, l.EndDate, c.Name AS CustomerName
FROM LOAN l
INNER JOIN CUSTOMER c ON l.CustomerId = c.CustomerId;