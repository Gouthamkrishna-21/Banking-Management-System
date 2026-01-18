CREATE OR REPLACE TRIGGER trg_balance_audit
AFTER UPDATE OF balance ON accounts
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (
        acc_id,
        old_balance,
        new_balance,
        changed_by,
        change_date
    )
    VALUES (
        :OLD.acc_id,
        :OLD.balance,
        :NEW.balance,
        USER,
        SYSTIMESTAMP
    );
END;
/
