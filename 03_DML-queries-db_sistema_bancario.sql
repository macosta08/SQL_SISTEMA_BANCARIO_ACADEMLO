-- Query para consultar el balance de las cuentas. Se hacen JOINS para mostrar nombres.
select AC."ID" ,AC."ACCOUNT",  TY."ACCOUNT_TYPE" ,AC."ID_CUSTOMER", CU."NAME" , "ACCOUNT_BALANCE" 
FROM public."Accounts" AC
inner join "Customers" CU on AC."ID_CUSTOMER" = CU."ID"
inner join "Account_Types" TY on AC."ID_ACCOUNT_TYPE" = TY."ID";

--Query para consultar las transacciones. Se hacen JOINS para mostrar nombres.
SELECT 
		TR."ID", 
		AC."ACCOUNT", 
		AT2."ACCOUNT_TYPE",
		CU."NAME",
		TT."TRANSACTION_TYPE",
		TR."AMOUNT" , 
		TR."REFERENCE" 
FROM public."Transactions" TR
inner join "Accounts" AC on TR."ID_ACCOUNT" = AC."ID" 
inner join "Transactions_Types" TT on TR."ID_TRANSACTION_TYPE" = TT."ID" 
inner join "Account_Types" AT2 on AC."ID_ACCOUNT_TYPE" = AT2."ID"
inner join "Customers" CU on AC."ID_CUSTOMER" = CU."ID" 
order by TR."ID";

--Query para consultar todas las cuentas.
SELECT *
FROM public."Accounts";

--Query para consultar todas los clientes.
SELECT *
FROM public."Customers";

--Query para consultar todos los tipos de transacción
SELECT *
FROM public."Transactions_Types";

--Query para consultar todas las transacciones.
SELECT *
FROM public."Transactions";
