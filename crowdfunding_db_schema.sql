-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Category] (
    [Category] varchar(50)  NOT NULL ,
    [category_id] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED (
        [category_id] ASC
    )
)

CREATE TABLE [Subcategory] (
    [Subategory] varchar(50)  NOT NULL ,
    [subcategory_id] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_Subcategory] PRIMARY KEY CLUSTERED (
        [subcategory_id] ASC
    )
)

CREATE TABLE [campaign] (
    [cf_id] int  NOT NULL ,
    [contact_id] int  NOT NULL ,
    [company_name] varchar(120)  NOT NULL ,
    [description] varchar(500)  NOT NULL ,
    [goal] float  NOT NULL ,
    [pledged] float  NOT NULL ,
    [outcome] varchar(50)  NOT NULL ,
    [backers_count] int  NOT NULL ,
    [country] varchar(50)  NOT NULL ,
    [currency] varchar(50)  NOT NULL ,
    [launched_date] date  NOT NULL ,
    [end_date] date  NOT NULL ,
    [category_id] varchar(50)  NOT NULL ,
    [subcategory_id] varchar(50)  NOT NULL 
)

CREATE TABLE [contact] (
    [contact_id] int  NOT NULL ,
    [first_name] varchar(50)  NOT NULL ,
    [last_name] varchar(50)  NOT NULL ,
    [email] varchar(100)  NOT NULL ,
    CONSTRAINT [PK_contact] PRIMARY KEY CLUSTERED (
        [contact_id] ASC
    )
)

ALTER TABLE [campaign] WITH CHECK ADD CONSTRAINT [FK_campaign_contact_id] FOREIGN KEY([contact_id])
REFERENCES [contact] ([contact_id])

ALTER TABLE [campaign] CHECK CONSTRAINT [FK_campaign_contact_id]

ALTER TABLE [campaign] WITH CHECK ADD CONSTRAINT [FK_campaign_category_id] FOREIGN KEY([category_id])
REFERENCES [Category] ([category_id])

ALTER TABLE [campaign] CHECK CONSTRAINT [FK_campaign_category_id]

ALTER TABLE [campaign] WITH CHECK ADD CONSTRAINT [FK_campaign_subcategory_id] FOREIGN KEY([subcategory_id])
REFERENCES [Subcategory] ([subcategory_id])

ALTER TABLE [campaign] CHECK CONSTRAINT [FK_campaign_subcategory_id]

COMMIT TRANSACTION QUICKDBD