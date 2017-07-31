
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/16/2016 16:02:33
-- Generated from EDMX file: F:\SE project\NewOnlineBookStore\OnlineBookStore\BookModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [BookDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Book__BookStatus__29572725]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Book] DROP CONSTRAINT [FK__Book__BookStatus__29572725];
GO
IF OBJECT_ID(N'[dbo].[FK__Book__CategoryID__286302EC]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Book] DROP CONSTRAINT [FK__Book__CategoryID__286302EC];
GO
IF OBJECT_ID(N'[dbo].[FK__BooksInKa__BookI__403A8C7D]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BooksInKart] DROP CONSTRAINT [FK__BooksInKa__BookI__403A8C7D];
GO
IF OBJECT_ID(N'[dbo].[FK__OrderByIt__BookI__3D5E1FD2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderByItem] DROP CONSTRAINT [FK__OrderByIt__BookI__3D5E1FD2];
GO
IF OBJECT_ID(N'[dbo].[FK__BooksInKa__UserI__412EB0B6]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BooksInKart] DROP CONSTRAINT [FK__BooksInKa__UserI__412EB0B6];
GO
IF OBJECT_ID(N'[dbo].[FK__OrderByIt__Order__3C69FB99]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderByItem] DROP CONSTRAINT [FK__OrderByIt__Order__3C69FB99];
GO
IF OBJECT_ID(N'[dbo].[FK__Orders__PaymentT__38996AB5]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK__Orders__PaymentT__38996AB5];
GO
IF OBJECT_ID(N'[dbo].[FK__Orders__UserID__37A5467C]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK__Orders__UserID__37A5467C];
GO
IF OBJECT_ID(N'[dbo].[FK__ShippingA__USerI__32E0915F]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ShippingAddress] DROP CONSTRAINT [FK__ShippingA__USerI__32E0915F];
GO
IF OBJECT_ID(N'[dbo].[FK__BooksInKa__Order__01142BA1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BooksInKart] DROP CONSTRAINT [FK__BooksInKa__Order__01142BA1];
GO
IF OBJECT_ID(N'[dbo].[FK__Orders__Shipping__14270015]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK__Orders__Shipping__14270015];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Admins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Admins];
GO
IF OBJECT_ID(N'[dbo].[Book]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Book];
GO
IF OBJECT_ID(N'[dbo].[BooksInKart]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BooksInKart];
GO
IF OBJECT_ID(N'[dbo].[BookStatus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BookStatus];
GO
IF OBJECT_ID(N'[dbo].[Category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Category];
GO
IF OBJECT_ID(N'[dbo].[OrderByItem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderByItem];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
IF OBJECT_ID(N'[dbo].[PaymentType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PaymentType];
GO
IF OBJECT_ID(N'[dbo].[ShippingAddress]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ShippingAddress];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[CustomerMessage]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CustomerMessage];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Admins'
CREATE TABLE [dbo].[Admins] (
    [AdminID] int IDENTITY(1,1) NOT NULL,
    [AdminUserName] nvarchar(100)  NOT NULL,
    [AdminPassword] nvarchar(20)  NOT NULL,
    [FirstName] nvarchar(100)  NOT NULL,
    [LastName] nvarchar(100)  NULL,
    [AccountStatus] nvarchar(8)  NULL,
    [Email] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'Book'
CREATE TABLE [dbo].[Book] (
    [BookID] int IDENTITY(1,1) NOT NULL,
    [AuthorName] nvarchar(500)  NULL,
    [CategoryID] int  NULL,
    [BookDescription] nvarchar(max)  NOT NULL,
    [BookStatusId] int  NULL,
    [Price] decimal(10,2)  NOT NULL,
    [DateAdded] datetime  NULL,
    [DateUpdated] datetime  NULL,
    [BookName] nvarchar(100)  NULL,
    [BookURL] nvarchar(500)  NULL
);
GO

-- Creating table 'BooksInKart'
CREATE TABLE [dbo].[BooksInKart] (
    [BooksInKart1] int IDENTITY(1,1) NOT NULL,
    [BookID] int  NULL,
    [UserID] int  NULL,
    [Quantity] int  NULL,
    [kartTotal] decimal(18,2)  NULL,
    [OrderId] int  NULL,
    [StatusId] bit  NULL
);
GO

-- Creating table 'BookStatus'
CREATE TABLE [dbo].[BookStatus] (
    [StatusID] int  NOT NULL,
    [StatusName] nvarchar(10)  NULL
);
GO

-- Creating table 'Category'
CREATE TABLE [dbo].[Category] (
    [CategoryId] int IDENTITY(1,1) NOT NULL,
    [CategoryName] nvarchar(200)  NOT NULL
);
GO

-- Creating table 'OrderByItem'
CREATE TABLE [dbo].[OrderByItem] (
    [OrderByItemID] int IDENTITY(1,1) NOT NULL,
    [OrderID] int  NULL,
    [BookID] int  NULL,
    [Quantity] int  NOT NULL,
    [ItemTotal] decimal(10,2)  NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [OrderID] int IDENTITY(1,1) NOT NULL,
    [UserID] int  NULL,
    [PaymentTypeID] int  NULL,
    [OrderTotal] decimal(10,2)  NULL,
    [OrderDate] datetime  NULL,
    [OrderStatusID] int  NULL,
    [ShippingAddressId] int  NULL
);
GO

-- Creating table 'PaymentType'
CREATE TABLE [dbo].[PaymentType] (
    [PaymentTypeID] int  NOT NULL,
    [PaymentName] nvarchar(100)  NULL,
    [CardNumber] nvarchar(200)  NULL,
    [CVV] smallint  NULL,
    [ExpiryDate] nvarchar(10)  NULL,
    [PaymentDetails] nvarchar(200)  NULL
);
GO

-- Creating table 'ShippingAddress'
CREATE TABLE [dbo].[ShippingAddress] (
    [ShippingAddressId] int IDENTITY(1,1) NOT NULL,
    [USerID] int  NULL,
    [FirstName] nvarchar(100)  NOT NULL,
    [LastName] nvarchar(100)  NOT NULL,
    [Phone1] nvarchar(15)  NOT NULL,
    [Phone2] nvarchar(15)  NOT NULL,
    [Email] nvarchar(100)  NOT NULL,
    [Street] nvarchar(200)  NOT NULL,
    [City] nvarchar(100)  NOT NULL,
    [State] nvarchar(100)  NOT NULL,
    [Zip] nvarchar(10)  NULL,
    [HouseNumber] nvarchar(100)  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserID] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(500)  NOT NULL,
    [Password] nvarchar(20)  NOT NULL,
    [FirstName] nvarchar(100)  NOT NULL,
    [LastName] nvarchar(100)  NULL,
    [AccountStatus] nvarchar(8)  NULL,
    [Email] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'CustomerMessage'
CREATE TABLE [dbo].[CustomerMessage] (
    [MessageID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(200)  NULL,
    [Email] nvarchar(500)  NULL,
    [Message] nvarchar(max)  NULL,
    [DateOfMessage] datetime  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AdminID] in table 'Admins'
ALTER TABLE [dbo].[Admins]
ADD CONSTRAINT [PK_Admins]
    PRIMARY KEY CLUSTERED ([AdminID] ASC);
GO

-- Creating primary key on [BookID] in table 'Book'
ALTER TABLE [dbo].[Book]
ADD CONSTRAINT [PK_Book]
    PRIMARY KEY CLUSTERED ([BookID] ASC);
GO

-- Creating primary key on [BooksInKart1] in table 'BooksInKart'
ALTER TABLE [dbo].[BooksInKart]
ADD CONSTRAINT [PK_BooksInKart]
    PRIMARY KEY CLUSTERED ([BooksInKart1] ASC);
GO

-- Creating primary key on [StatusID] in table 'BookStatus'
ALTER TABLE [dbo].[BookStatus]
ADD CONSTRAINT [PK_BookStatus]
    PRIMARY KEY CLUSTERED ([StatusID] ASC);
GO

-- Creating primary key on [CategoryId] in table 'Category'
ALTER TABLE [dbo].[Category]
ADD CONSTRAINT [PK_Category]
    PRIMARY KEY CLUSTERED ([CategoryId] ASC);
GO

-- Creating primary key on [OrderByItemID] in table 'OrderByItem'
ALTER TABLE [dbo].[OrderByItem]
ADD CONSTRAINT [PK_OrderByItem]
    PRIMARY KEY CLUSTERED ([OrderByItemID] ASC);
GO

-- Creating primary key on [OrderID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([OrderID] ASC);
GO

-- Creating primary key on [PaymentTypeID] in table 'PaymentType'
ALTER TABLE [dbo].[PaymentType]
ADD CONSTRAINT [PK_PaymentType]
    PRIMARY KEY CLUSTERED ([PaymentTypeID] ASC);
GO

-- Creating primary key on [ShippingAddressId] in table 'ShippingAddress'
ALTER TABLE [dbo].[ShippingAddress]
ADD CONSTRAINT [PK_ShippingAddress]
    PRIMARY KEY CLUSTERED ([ShippingAddressId] ASC);
GO

-- Creating primary key on [UserID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- Creating primary key on [MessageID] in table 'CustomerMessage'
ALTER TABLE [dbo].[CustomerMessage]
ADD CONSTRAINT [PK_CustomerMessage]
    PRIMARY KEY CLUSTERED ([MessageID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [BookStatusId] in table 'Book'
ALTER TABLE [dbo].[Book]
ADD CONSTRAINT [FK__Book__BookStatus__29572725]
    FOREIGN KEY ([BookStatusId])
    REFERENCES [dbo].[BookStatus]
        ([StatusID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Book__BookStatus__29572725'
CREATE INDEX [IX_FK__Book__BookStatus__29572725]
ON [dbo].[Book]
    ([BookStatusId]);
GO

-- Creating foreign key on [CategoryID] in table 'Book'
ALTER TABLE [dbo].[Book]
ADD CONSTRAINT [FK__Book__CategoryID__286302EC]
    FOREIGN KEY ([CategoryID])
    REFERENCES [dbo].[Category]
        ([CategoryId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Book__CategoryID__286302EC'
CREATE INDEX [IX_FK__Book__CategoryID__286302EC]
ON [dbo].[Book]
    ([CategoryID]);
GO

-- Creating foreign key on [BookID] in table 'BooksInKart'
ALTER TABLE [dbo].[BooksInKart]
ADD CONSTRAINT [FK__BooksInKa__BookI__403A8C7D]
    FOREIGN KEY ([BookID])
    REFERENCES [dbo].[Book]
        ([BookID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__BooksInKa__BookI__403A8C7D'
CREATE INDEX [IX_FK__BooksInKa__BookI__403A8C7D]
ON [dbo].[BooksInKart]
    ([BookID]);
GO

-- Creating foreign key on [BookID] in table 'OrderByItem'
ALTER TABLE [dbo].[OrderByItem]
ADD CONSTRAINT [FK__OrderByIt__BookI__3D5E1FD2]
    FOREIGN KEY ([BookID])
    REFERENCES [dbo].[Book]
        ([BookID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__OrderByIt__BookI__3D5E1FD2'
CREATE INDEX [IX_FK__OrderByIt__BookI__3D5E1FD2]
ON [dbo].[OrderByItem]
    ([BookID]);
GO

-- Creating foreign key on [UserID] in table 'BooksInKart'
ALTER TABLE [dbo].[BooksInKart]
ADD CONSTRAINT [FK__BooksInKa__UserI__412EB0B6]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__BooksInKa__UserI__412EB0B6'
CREATE INDEX [IX_FK__BooksInKa__UserI__412EB0B6]
ON [dbo].[BooksInKart]
    ([UserID]);
GO

-- Creating foreign key on [OrderID] in table 'OrderByItem'
ALTER TABLE [dbo].[OrderByItem]
ADD CONSTRAINT [FK__OrderByIt__Order__3C69FB99]
    FOREIGN KEY ([OrderID])
    REFERENCES [dbo].[Orders]
        ([OrderID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__OrderByIt__Order__3C69FB99'
CREATE INDEX [IX_FK__OrderByIt__Order__3C69FB99]
ON [dbo].[OrderByItem]
    ([OrderID]);
GO

-- Creating foreign key on [PaymentTypeID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK__Orders__PaymentT__38996AB5]
    FOREIGN KEY ([PaymentTypeID])
    REFERENCES [dbo].[PaymentType]
        ([PaymentTypeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Orders__PaymentT__38996AB5'
CREATE INDEX [IX_FK__Orders__PaymentT__38996AB5]
ON [dbo].[Orders]
    ([PaymentTypeID]);
GO

-- Creating foreign key on [UserID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK__Orders__UserID__37A5467C]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Orders__UserID__37A5467C'
CREATE INDEX [IX_FK__Orders__UserID__37A5467C]
ON [dbo].[Orders]
    ([UserID]);
GO

-- Creating foreign key on [USerID] in table 'ShippingAddress'
ALTER TABLE [dbo].[ShippingAddress]
ADD CONSTRAINT [FK__ShippingA__USerI__32E0915F]
    FOREIGN KEY ([USerID])
    REFERENCES [dbo].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__ShippingA__USerI__32E0915F'
CREATE INDEX [IX_FK__ShippingA__USerI__32E0915F]
ON [dbo].[ShippingAddress]
    ([USerID]);
GO

-- Creating foreign key on [OrderId] in table 'BooksInKart'
ALTER TABLE [dbo].[BooksInKart]
ADD CONSTRAINT [FK__BooksInKa__Order__01142BA1]
    FOREIGN KEY ([OrderId])
    REFERENCES [dbo].[Orders]
        ([OrderID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__BooksInKa__Order__01142BA1'
CREATE INDEX [IX_FK__BooksInKa__Order__01142BA1]
ON [dbo].[BooksInKart]
    ([OrderId]);
GO

-- Creating foreign key on [ShippingAddressId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK__Orders__Shipping__14270015]
    FOREIGN KEY ([ShippingAddressId])
    REFERENCES [dbo].[ShippingAddress]
        ([ShippingAddressId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Orders__Shipping__14270015'
CREATE INDEX [IX_FK__Orders__Shipping__14270015]
ON [dbo].[Orders]
    ([ShippingAddressId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------