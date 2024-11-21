-- Write your SQL code here
CREATE TABLE ACCOUNT (
    AccountId INT AUTO_INCREMENT PRIMARY KEY,
    Balance DECIMAL(15, 2) NOT NULL,
    AccountType ENUM('Checking', 'Savings') NOT NULL,
    AmountDate DATE NOT NULL,
    CustomerId INT NOT NULL,
    CHECK (Balance >= 0),
    INDEX (AccountType),
    FOREIGN KEY (CustomerId) REFERENCES CUSTOMER(CustomerId)
) ENGINE=InnoDB;