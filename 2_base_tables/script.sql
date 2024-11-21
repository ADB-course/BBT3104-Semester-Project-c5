CREATE TABLE CUSTOMER (
    CustomerId INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    ContactInfo VARCHAR(255),
    INDEX (Name)
) ENGINE=InnoDB;

CREATE TABLE ACCOUNT (
    AccountId INT AUTO_INCREMENT PRIMARY KEY,
    Balance DECIMAL(15, 2) NOT NULL,
    AccountType ENUM('Checking', 'Savings') NOT NULL,
    AmountDate DATE NOT NULL,
    CustomerId INT NOT NULL,
    INDEX (AccountType),
    FOREIGN KEY (CustomerId) REFERENCES CUSTOMER(CustomerId)
) ENGINE=InnoDB;

CREATE TABLE CHECKING_ACCOUNT (
    AccountId INT PRIMARY KEY,
    OverdraftLimit DECIMAL(15, 2),
    FOREIGN KEY (AccountId) REFERENCES ACCOUNT(AccountId)
) ENGINE=InnoDB;

CREATE TABLE SAVINGS_ACCOUNT (
    AccountId INT PRIMARY KEY,
    InterestRate DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (AccountId) REFERENCES ACCOUNT(AccountId)
) ENGINE=InnoDB;

CREATE TABLE LOAN (
    LoanId INT AUTO_INCREMENT PRIMARY KEY,
    InterestRate DECIMAL(5, 2) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    CustomerId INT NOT NULL,
    INDEX (StartDate),
    FOREIGN KEY (CustomerId) REFERENCES CUSTOMER(CustomerId)
) ENGINE=InnoDB;

CREATE TABLE TRANSACTION (
    TransactionId INT AUTO_INCREMENT PRIMARY KEY,
    Amount DECIMAL(15, 2) NOT NULL,
    Date DATETIME NOT NULL,
    TypeOfTransaction VARCHAR(50),
    AccountId INT NOT NULL,
    INDEX (AccountId),
    FOREIGN KEY (AccountId) REFERENCES ACCOUNT(AccountId)
) ENGINE=InnoDB;

CREATE TABLE BRANCH (
    BranchId INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(255),
    INDEX (Name)
) ENGINE=InnoDB;

CREATE TABLE EMPLOYEE (
    EmployeeId INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    BranchId INT NOT NULL,
    INDEX (BranchId),
    FOREIGN KEY (BranchId) REFERENCES BRANCH(BranchId)
) ENGINE=InnoDB;-- Write your SQL code here