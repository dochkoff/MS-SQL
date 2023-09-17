CREATE TABLE Categories (
    Id INT PRIMARY KEY,
    CategoryName NVARCHAR(255) NOT NULL,
    DailyRate DECIMAL(10, 2) NOT NULL,
    WeeklyRate DECIMAL(10, 2) NOT NULL,
    MonthlyRate DECIMAL(10, 2) NOT NULL,
    WeekendRate DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Cars (
    Id INT PRIMARY KEY,
    PlateNumber NVARCHAR(20) NOT NULL,
    Manufacturer NVARCHAR(255) NOT NULL,
    Model NVARCHAR(255) NOT NULL,
    CarYear INT NOT NULL,
    CategoryId INT NOT NULL,
    Doors INT,
    Picture NVARCHAR(MAX),
    Condition NVARCHAR(50),
    Available BIT NOT NULL
);

CREATE TABLE Employees (
    Id INT PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Title NVARCHAR(100),
    Notes NVARCHAR(MAX)
);

CREATE TABLE Customers (
    Id INT PRIMARY KEY,
    DriverLicenceNumber NVARCHAR(20) NOT NULL,
    FullName NVARCHAR(255) NOT NULL,
    Address NVARCHAR(255),
    City NVARCHAR(100),
    ZIPCode NVARCHAR(20),
    Notes NVARCHAR(MAX)
);

CREATE TABLE RentalOrders (
    Id INT PRIMARY KEY,
    EmployeeId INT NOT NULL,
    CustomerId INT NOT NULL,
    CarId INT NOT NULL,
    TankLevel DECIMAL(5, 2),
    KilometrageStart INT,
    KilometrageEnd INT,
    TotalKilometrage INT,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    TotalDays INT,
    RateApplied DECIMAL(10, 2),
    TaxRate DECIMAL(5, 2),
    OrderStatus NVARCHAR(50),
    Notes NVARCHAR(MAX),
);

INSERT INTO Categories (Id, CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
VALUES
    (1, 'Compact', 45.00, 280.00, 1100.00, 60.00),
    (2, 'SUV', 60.00, 400.00, 1500.00, 80.00),
    (3, 'Luxury', 100.00, 700.00, 2500.00, 120.00);

-- Insert sample records into Cars table
INSERT INTO Cars (Id, PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Available)
VALUES
    (1, 'ABC123', 'Toyota', 'Corolla', 2020, 1, 4, 1),
    (2, 'XYZ456', 'Ford', 'Explorer', 2019, 2, 4, 1),
    (3, 'DEF789', 'Mercedes-Benz', 'E-Class', 2021, 3, 4, 1);

-- Insert sample records into Employees table
INSERT INTO Employees (Id, FirstName, LastName, Title, Notes)
VALUES
    (1, 'John', 'Doe', 'Manager', 'Experienced manager'),
    (2, 'Jane', 'Smith', 'Sales Associate', 'Friendly and helpful'),
    (3, 'Mike', 'Johnson', 'Mechanic', 'Skilled mechanic');

-- Insert sample records into Customers table
INSERT INTO Customers (Id, DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes)
VALUES
    (1, 'DL12345', 'Alice Johnson', '123 Main St', 'Cityville', '12345', 'Frequent customer'),
    (2, 'DL67890', 'Bob Smith', '456 Elm St', 'Townsville', '67890', 'Preferred customer'),
    (3, 'DL54321', 'Eve Davis', '789 Oak St', 'Villagetown', '54321', 'New customer');

-- Insert sample records into RentalOrders table
INSERT INTO RentalOrders (Id, EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes)
VALUES
    (1, 1, 1, 1, 0.75, 10000, 10500, 500, '2023-09-01 08:00:00', '2023-09-04 15:30:00', 4, 280.00, 0.08, 'Completed', 'Customer was satisfied'),
    (2, 2, 2, 2, 0.90, 7500, 7600, 100, '2023-09-02 10:00:00', '2023-09-03 12:00:00', 1, 60.00, 0.08, 'Completed', 'Car returned in good condition'),
    (3, 3, 3, 3, 0.80, 12000, 12100, 100, '2023-09-03 14:00:00', '2023-09-05 17:45:00', 2, 700.00, 0.08, 'Completed', 'Luxury car rental');