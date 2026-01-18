# 🏦 Banking Management System

##  Overview
This project is a mini banking backend system developed using **Oracle SQL and PL/SQL**.  
It simulates real-world banking operations such as account management, secure fund transfers, audit logging, and bulk customer onboarding while ensuring **data consistency and transactional integrity**.

The project demonstrates how enterprise databases implement business logic using **packages, triggers, exceptions, and bulk operations**.

---

## Key Features
- Account creation with balance validation
- Secure fund transfer with commit and rollback control
- Automatic audit logging for balance changes using triggers
- Custom business exception handling (insufficient funds)
- High-performance bulk customer onboarding using `FORALL`
- Transaction history tracking

---

## Database Objects Used
- Tables  
- Triggers  
- Packages (Specification & Body)  
- Procedures  
- Exceptions  
- Row-level locking (`SELECT ... FOR UPDATE`)  
- Bulk processing (`FORALL`)

---

## Technologies Used
- Oracle SQL  
- PL/SQL  
- SQL Developer  
- GitHub  

---

## Execution Order
Run the SQL files in the following order using **Oracle SQL Developer**:

1. `schema.sql`
2. `triggers.sql`
3. `package_spec.sql`
4. `test_cases.sql`

---

## Sample Operations
- Transfer funds between two accounts with validation
- Automatically log balance changes into the audit table
- Handle insufficient balance scenarios using custom exceptions
- Bulk insert new customers efficiently

---

## Business Logic Highlights
- Uses `SELECT ... FOR UPDATE` to prevent concurrent update issues
- Ensures atomic transactions using `COMMIT` and `ROLLBACK`
- Captures old and new balances using `:OLD` and `:NEW`
- Improves performance through bulk processing techniques

---

## Learning Outcomes
- Practical implementation of PL/SQL packages and triggers
- Strong understanding of transaction control and exception handling
- Exposure to enterprise-level database design patterns
- Hands-on experience with real-world banking use cases


