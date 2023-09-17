CREATE TABLE Employees (
    Id INT PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Title NVARCHAR(100),
    Notes NVARCHAR(MAX)
);

CREATE TABLE Customers (
    AccountNumber INT PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    PhoneNumber NVARCHAR(20),
    EmergencyName NVARCHAR(100),
    EmergencyNumber NVARCHAR(20),
    Notes NVARCHAR(MAX)
);

CREATE TABLE RoomStatus (
    RoomStatus NVARCHAR(50) PRIMARY KEY,
    Notes NVARCHAR(MAX)
);

CREATE TABLE RoomTypes (
    RoomType NVARCHAR(50) PRIMARY KEY,
    Notes NVARCHAR(MAX)
);

CREATE TABLE BedTypes (
    BedType NVARCHAR(50) PRIMARY KEY,
    Notes NVARCHAR(MAX)
);

CREATE TABLE Rooms (
    RoomNumber INT PRIMARY KEY,
    RoomType NVARCHAR(50) NOT NULL,
    BedType NVARCHAR(50) NOT NULL,
    Rate DECIMAL(10, 2) NOT NULL,
    RoomStatus NVARCHAR(50) NOT NULL,
    Notes NVARCHAR(MAX),
);

CREATE TABLE Payments (
    Id INT PRIMARY KEY,
    EmployeeId INT NOT NULL,
    PaymentDate DATE NOT NULL,
    AccountNumber INT NOT NULL,
    FirstDateOccupied DATE NOT NULL,
    LastDateOccupied DATE NOT NULL,
    TotalDays INT NOT NULL,
    AmountCharged DECIMAL(10, 2) NOT NULL,
    TaxRate DECIMAL(5, 2) NOT NULL,
    TaxAmount DECIMAL(10, 2) NOT NULL,
    PaymentTotal DECIMAL(10, 2) NOT NULL,
    Notes NVARCHAR(MAX),
);

CREATE TABLE Occupancies (
    Id INT PRIMARY KEY,
    EmployeeId INT NOT NULL,
    DateOccupied DATE NOT NULL,
    AccountNumber INT NOT NULL,
    RoomNumber INT NOT NULL,
    RateApplied DECIMAL(10, 2) NOT NULL,
    PhoneCharge DECIMAL(10, 2),
    Notes NVARCHAR(MAX),
);

INSERT INTO Employees (Id, FirstName, LastName, Title, Notes)
VALUES
    (1, 'John', 'Doe', 'Manager', 'Experienced manager'),
    (2, 'Jane', 'Smith', 'Receptionist', 'Friendly and efficient'),
    (3, 'Mike', 'Johnson', 'Housekeeper', 'Detail-oriented');

INSERT INTO Customers (AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
VALUES
    (1001, 'Alice', 'Johnson', '123-456-7890', 'Bob Johnson', '987-654-3210', 'Frequent guest'),
    (1002, 'Bob', 'Smith', '555-555-5555', 'Eve Smith', '111-111-1111', 'Preferred customer'),
    (1003, 'Eve', 'Davis', '777-777-7777', 'Sam Davis', '888-888-8888', 'New guest');

INSERT INTO RoomStatus (RoomStatus, Notes)
VALUES
    ('Vacant', 'Room is not occupied'),
    ('Occupied', 'Room is currently occupied'),
    ('Under Maintenance', 'Room is being serviced');

INSERT INTO RoomTypes (RoomType, Notes)
VALUES
    ('Standard', 'Basic room type'),
    ('Suite', 'Luxurious suite'),
    ('Executive', 'Executive room');

INSERT INTO BedTypes (BedType, Notes)
VALUES
    ('Single', 'Single bed'),
    ('Double', 'Double bed'),
    ('King', 'King-sized bed');

INSERT INTO Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
VALUES
    (101, 'Standard', 'Double', 100.00, 'Vacant', 'Cozy room'),
    (102, 'Suite', 'King', 250.00, 'Occupied', 'Luxury suite with a view'),
    (103, 'Executive', 'King', 200.00, 'Vacant', 'Spacious executive room');

INSERT INTO Payments (Id, EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
VALUES
    (1, 1, '2023-09-01', 1001, '2023-09-01', '2023-09-04', 4, 400.00, 0.08, 32.00, 432.00, 'Payment received'),
    (2, 2, '2023-09-02', 1002, '2023-09-02', '2023-09-03', 1, 250.00, 0.08, 20.00, 270.00, 'Payment processed'),
    (3, 3, '2023-09-03', 1003, '2023-09-03', '2023-09-05', 2, 400.00, 0.08, 32.00, 432.00, 'Payment completed');

INSERT INTO Occupancies (Id, EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
VALUES
    (1, 1, '2023-09-01', 1001, 101, 100.00, 15.00, 'Phone charges incurred'),
    (2, 2, '2023-09-02', 1002, 102, 250.00, NULL, 'No additional charges'),
    (3, 3, '2023-09-03', 1003, 103, 200.00, 10.00, 'Phone charges applied');