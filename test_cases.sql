BEGIN
    pkg_banking_ops.transfer_funds(101, 102, 5000);
END;
/

BEGIN
    pkg_banking_ops.transfer_funds(102, 101, 100000);
END;
/

BEGIN
    pkg_banking_ops.bulk_onboard_customers;
END;
/

SELECT * FROM accounts;
SELECT * FROM transactions;
SELECT * FROM audit_log;
