USE Homework_9 --Database name
GO
CREATE PROCEDURE prc_invoice_add @inv_num int, @cust_num int, @inv_date date, @inv_amount float(8)
AS
INSERT INTO INVOICE VALUES(@inv_num, @cust_num, @inv_date, @inv_amount)
GO