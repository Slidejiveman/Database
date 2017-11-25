CREATE TRIGGER trg_updatecustbalance2 ON INVOICE
FOR DELETE
AS 
    --declare variables to recieve values
	DECLARE @cust_num int;
	DECLARE @inv_amount float(8);

	--Fill the variables with values
	SELECT @inv_amount = I.INV_AMOUNT 
	FROM INVOICE I;

	SELECT @cust_num = I.CUST_NUM
	FROM   INVOICE I;

	--Update the customer table at the given cust_num
	--by adding the amount of the invoice to their balance
	UPDATE CUSTOMER
	SET    CUST_BALANCE = CUST_BALANCE - @inv_amount
	WHERE  CUST_NUM = @cust_num;

    PRINT 'AFTER DELETE trigger fired.'
GO