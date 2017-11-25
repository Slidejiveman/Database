IF EXISTS (SELECT name FROM sysobjects WHERE name = 'trg_updatecustbalance' AND type = 'TR')
BEGIN
DROP TRIGGER trg_updatecustbalance
END
