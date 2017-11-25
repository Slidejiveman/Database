USE Homework_9 --Database name
GO
CREATE PROCEDURE prc_invoice_delete @inv_num int
AS
DELETE FROM INVOICE
WHERE INV_NUM = @inv_num
GO