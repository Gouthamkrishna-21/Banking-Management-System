CREATE TABLE accounts (
    acc_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100),
    balance NUMBER CHECK (balance >= 0),
    status VARCHAR2(20) DEFAULT 'ACTIVE'
);

CREATE TABLE transactions (
    tran_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    from_acc NUMBER,
    to_acc NUMBER,
    amount NUMBER,
    tran_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE audit_log (
    log_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    acc_id NUMBER,
    old_balance NUMBER,
    new_balance NUMBER,
    changed_by VARCHAR2(100),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO accounts (acc_id, customer_name, balance, status)
        VALUES (100 + i, 'Customer_' || i, 10000 + (i * 500), 'ACTIVE');
    END LOOP;
    COMMIT;
END;
/
