CREATE TABLE `productlines` (
  `productLine` int PRIMARY KEY,
  `textDescription` text,
  `htmlDescription` text,
  `image` varchar(255)
);

CREATE TABLE `products` (
  `productCode` int PRIMARY KEY,
  `productName` varchar(255),
  `productLine` varchar(255),
  `productVendor` varchar(255),
  `productDescription` text,
  `quantityinStock` varchar(255),
  `buyPrice` int,
  `MSRP` varchar(255)
);

CREATE TABLE `orderdetails` (
  `orderNumber` int PRIMARY KEY,
  `productCode` int,
  `quantityOrdered` int,
  `priceEach` int,
  `orderLineNumber` int
);

CREATE TABLE `orders` (
  `orderNumber` int PRIMARY KEY,
  `ordetDate` int,
  `requiredDate` int,
  `shippedDate` int,
  `status` varchar(255),
  `comments` varchar(255),
  `customerNumber` int
);

CREATE TABLE `customers` (
  `customerNumber` int PRIMARY KEY,
  `customerName` varchar(255),
  `contactLastsName` int,
  `contactFirstName` int,
  `phone` int,
  `addressLine1` varchar(255),
  `addressLine2` varchar(255),
  `city` varchar(255),
  `state` varchar(255),
  `postalCode` int,
  `country` varchar(255),
  `salesRepEmployeeNumber` int,
  `creditLine` int
);

CREATE TABLE `employees` (
  `employeeNumber` int PRIMARY KEY,
  `lastName` varchar(255),
  `firstName` varchar(255),
  `extension` varchar(255),
  `email` varchar(255),
  `officeCode` int,
  `reportsTo` varchar(255),
  `jobTitle` varchar(255)
);

CREATE TABLE `offices` (
  `officeCode` int PRIMARY KEY,
  `city` varchar(255),
  `phone` int,
  `addressLine1` varchar(255),
  `addressLine2` varchar(255),
  `state` varchar(255),
  `country` varchar(255),
  `postalCode` int,
  `territory` varchar(255)
);

CREATE TABLE `payments` (
  `customerNumber` int PRIMARY KEY,
  `checkNumber` int,
  `paymentDate` int,
  `amount` int
);

ALTER TABLE `products` ADD FOREIGN KEY (`productLine`) REFERENCES `productlines` (`htmlDescription`);

ALTER TABLE `orderdetails` ADD FOREIGN KEY (`quantityOrdered`) REFERENCES `products` (`productLine`);

ALTER TABLE `orders` ADD FOREIGN KEY (`orderNumber`) REFERENCES `orderdetails` (`orderLineNumber`);

ALTER TABLE `orders` ADD FOREIGN KEY (`status`) REFERENCES `customers` (`customerName`);

ALTER TABLE `payments` ADD FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`postalCode`);

ALTER TABLE `employees` ADD FOREIGN KEY (`employeeNumber`) REFERENCES `employees` (`reportsTo`);

ALTER TABLE `customers` ADD FOREIGN KEY (`contactLastsName`) REFERENCES `employees` (`jobTitle`);

ALTER TABLE `employees` ADD FOREIGN KEY (`firstName`) REFERENCES `offices` (`addressLine2`);
