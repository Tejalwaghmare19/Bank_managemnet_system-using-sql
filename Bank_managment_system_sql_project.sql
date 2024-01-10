--Q1.Create Tables:

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    AccountNumber INT UNIQUE
);

CREATE TABLE Accounts (
    AccountNumber INT PRIMARY KEY,
    Balance DECIMAL(10, 2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountNumber INT,
    Amount DECIMAL(10, 2),
    TransactionType VARCHAR(10),
    TransactionDate TIMESTAMP,
    FOREIGN KEY (AccountNumber) REFERENCES Accounts(AccountNumber)
);

--Q2. Insert data
INSERT INTO Customers (CustomerID, FirstName, LastName, AccountNumber)
VALUES (1, 'John', 'Doe', 1001),
       (2, 'Jane', 'Smith', 1002);

INSERT INTO Accounts (AccountNumber, Balance, CustomerID)
VALUES (1001, 5000.00, 1),
       (1002, 7500.00, 2);

INSERT INTO Transactions (TransactionID, AccountNumber, Amount, TransactionType, TransactionDate)
VALUES (1, 1001, 1000.00, 'Deposit', '2023-01-01 12:00:00'),
       (2, 1002, 500.00, 'Withdrawal', '2023-01-02 14:30:00');

--Q3. Select statements(Get all statments)
SELECT * FROM Customers;

--Q4.Get account details for a specific customer
SELECT * FROM Accounts WHERE CustomerID = 1;

Q5.Get transaction history for an account
SELECT * FROM Transactions WHERE AccountNumber = 1001;

--Q6.Calculate the total balance for a customer:
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(a.Balance) AS TotalBalance
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID
WHERE c.CustomerID = 1
GROUP BY c.CustomerID, c.FirstName, c.LastName;

--Q7.Update Statements(Update customer information)
UPDATE Customers SET FirstName = 'Johnny' WHERE CustomerID = 1;

--Q8.Make a deposit
UPDATE Accounts SET Balance = Balance + 500.00 WHERE AccountNumber = 1001;

--Q9.Delete Statements(Delete a customer and associated account)
DELETE FROM Transactions WHERE AccountNumber IN (SELECT AccountNumber FROM Accounts WHERE CustomerID = 1);
DELETE FROM Accounts WHERE CustomerID = 1;
DELETE FROM Customers WHERE CustomerID = 1;

--Q.10 Delete a transaction
DELETE FROM Transactions WHERE TransactionID = 1;






























































