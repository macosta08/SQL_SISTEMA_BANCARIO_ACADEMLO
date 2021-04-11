SELECT *
FROM public."Accounts";

SELECT "ID", "NAME", "PHONE", "ADDRESS"
FROM public."Customers";

SELECT "ID", "TRANSACTION_TYPE"
FROM public."Transactions_Types";

SELECT *
FROM public."Transactions";

select AC."ID" ,AC."ACCOUNT",  TY."ACCOUNT_TYPE" ,AC."ID_CUSTOMER", CU."NAME" , "ACCOUNT_BALANCE" 
FROM public."Accounts" AC
inner join "Customers" CU on AC."ID_CUSTOMER" = CU."ID"
inner join "Account_Types" TY on AC."ID_ACCOUNT_TYPE" = TY."ID";