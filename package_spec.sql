CREATE OR REPLACE PACKAGE pkg_banking_ops AS

    insufficient_funds EXCEPTION;

    PROCEDURE transfer_funds(
        p_sender   NUMBER,
        p_receiver NUMBER,
        p_amount   NUMBER
    );

    PROCEDURE bulk_onboard_customers;

END pkg_banking_ops;
/

CREATE OR REPLACE PACKAGE BODY pkg_banking_ops AS

    PROCEDURE transfer_funds(
        p_sender   NUMBER,
        p_receiver NUMBER,
        p_amount   NUMBER
    ) AS
        v_sender_balance NUMBER;
    BEGIN
        SELECT balance
        INTO v_sender_balance
        FROM accounts
        WHERE acc_id = p_sender
        FOR UPDATE;

        IF v_sender_balance < p_amount THEN
            RAISE insufficient_funds;
        END IF;

        UPDATE accounts
        SET balance = balance - p_amount
        WHERE acc_id = p_sender;

        UPDATE accounts
        SET balance = balance + p_amount
        WHERE acc_id = p_receiver;

        INSERT INTO transactions (from_acc, to_acc, amount)
        VALUES (p_sender, p_receiver, p_amount);

        COMMIT;

    EXCEPTION
        WHEN insufficient_funds THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds');

        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20002, SQLERRM);
    END transfer_funds;

    PROCEDURE bulk_onboard_customers AS
        TYPE t_ids IS TABLE OF NUMBER;
        v_ids t_ids := t_ids(201,202,203,204,205);
    BEGIN
        FORALL i IN v_ids.FIRST .. v_ids.LAST
            INSERT INTO accounts (acc_id, customer_name, balance, status)
            VALUES (v_ids(i), 'Customer_' || v_ids(i), 1000, 'ACTIVE');

        COMMIT;
    END bulk_onboard_customers;

END pkg_banking_ops;
/
