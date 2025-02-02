USE [Practices]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 16-01-2025 21:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Demo]    Script Date: 16-01-2025 21:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[V_Demo]
As
select * from Department
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 16-01-2025 21:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Table]    Script Date: 16-01-2025 21:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Table](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [varchar](200) NULL,
	[Product_SKU] [varchar](20) NULL,
	[Product_Status] [bit] NULL,
	[Product_Price] [decimal](10, 2) NULL,
	[Product_Img_Path] [varchar](max) NULL,
 CONSTRAINT [PK__Product___9834FB9A213571D1] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Table]    Script Date: 16-01-2025 21:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Table](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [varchar](200) NOT NULL,
	[User_Email] [varchar](255) NOT NULL,
	[User_Phone] [varchar](10) NOT NULL,
	[User_Password] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 16-01-2025 21:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProduct]
    @Product_ID INT
AS
BEGIN
    DELETE FROM dbo.Product_Table
    WHERE Product_ID = @Product_ID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 16-01-2025 21:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUser]
    @User_ID INT
AS
BEGIN
    DELETE FROM dbo.User_Table
    WHERE User_ID = @User_ID
END
GO
/****** Object:  StoredProcedure [dbo].[InsertProduct]    Script Date: 16-01-2025 21:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertProduct]
    @Product_Name VARCHAR(200),
    @Product_SKU VARCHAR(20),
    @Product_Status BIT,
    @Product_Price DECIMAL(10, 2),
    @Product_Image_Path VARCHAR(MAX)
AS
BEGIN
    INSERT INTO dbo.Product_Table (Product_Name, Product_SKU, Product_Status, Product_Price, Product_Img_Path)
    VALUES (@Product_Name, @Product_SKU, @Product_Status, @Product_Price, @Product_Image_Path)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertUser]    Script Date: 16-01-2025 21:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertUser]
    @User_Name VARCHAR(200),
    @User_Email VARCHAR(255),
    @User_Phone VARCHAR(10),
    @User_Password VARCHAR(10)
AS
BEGIN
    INSERT INTO dbo.User_Table (User_Name, User_Email, User_Phone, User_Password)
    VALUES (@User_Name, @User_Email, @User_Phone, @User_Password)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Procedure]    Script Date: 16-01-2025 21:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PR_Procedure]
as
begin 
  print 'Stored procedure'
end
GO
/****** Object:  StoredProcedure [dbo].[SelectAllProducts]    Script Date: 16-01-2025 21:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectAllProducts]
AS
BEGIN
    SELECT Product_ID, Product_Name, Product_SKU, Product_Status, Product_Price, Product_Img_Path
    FROM dbo.Product_Table
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllUsers]    Script Date: 16-01-2025 21:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectAllUsers]
AS
BEGIN
    SELECT User_ID, User_Name, User_Email, User_Phone
    FROM dbo.User_Table
END
GO
/****** Object:  StoredProcedure [dbo].[SelectProductByID]    Script Date: 16-01-2025 21:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectProductByID]
    @Product_ID INT
AS
BEGIN
    SELECT Product_ID, Product_Name, Product_SKU, Product_Status, Product_Price, Product_Img_Path
    FROM Product_Table
    WHERE Product_ID = @Product_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectUserByPK]    Script Date: 16-01-2025 21:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PRoc [dbo].[SelectUserByPK]
@User_ID int
AS
Select 
User_Table.User_ID,
User_Table.User_Name,
User_Table.User_Email,
User_Table.User_Password
From User_Table
Where User_Table.User_ID = @User_ID
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 16-01-2025 21:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateProduct]
    @Product_ID INT,
    @Product_Name VARCHAR(200),
    @Product_SKU VARCHAR(20),
    @Product_Status BIT,
    @Product_Price DECIMAL(10, 2),
    @Product_Image_Path VARCHAR(MAX)
AS
BEGIN
    UPDATE dbo.Product_Table
    SET Product_Name = @Product_Name,
        Product_SKU = @Product_SKU,
        Product_Status = @Product_Status,
        Product_Price = @Product_Price,
        Product_Img_Path = @Product_Image_Path
    WHERE Product_ID = @Product_ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 16-01-2025 21:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUser]
    @User_ID INT,
    @User_Name VARCHAR(200),
    @User_Email VARCHAR(255),
    @User_Phone VARCHAR(10),
    @User_Password VARCHAR(10)
AS
BEGIN
    UPDATE dbo.User_Table
    SET User_Name = @User_Name,
        User_Email = @User_Email,
        User_Phone = @User_Phone,
        User_Password = @User_Password
    WHERE User_ID = @User_ID
END
GO
/****** Object:  StoredProcedure [dbo].[UserAuth]    Script Date: 16-01-2025 21:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[UserAuth]
@User_Email Varchar(200),
@User_Pass Varchar(20)
AS
Select 
User_Table.User_ID,
User_Table.User_Name,
User_Table.User_Email,
User_Table.User_Password
From User_Table
Where User_Email = @User_Email AND User_Password = @User_Pass
GO
