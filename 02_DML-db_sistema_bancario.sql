-- Agrega 3 clientes (Hector Hernandez, Andrea Alvarez, Jonh Doe).
	INSERT INTO public."Customers" 
	("ID", "NAME", "PHONE", "ADDRESS")
	VALUES(1000, 'Hector Hernandez', '555-555-555', 'CL 49 51-96');
	
	INSERT INTO public."Customers" 
	("ID", "NAME", "PHONE", "ADDRESS")
	VALUES(2000, 'Andrea Alvarez', '666-666-666', 'CL 50 91-66');
	
	INSERT INTO public."Customers" 
	("ID", "NAME", "PHONE", "ADDRESS")
	VALUES(3000, 'Jonh Doe', '777-777-777', 'CL 74 31-18');

-- 2 tipos de cuentas (cuenta de debito, cuenta de crédito).
	INSERT INTO public."Account_Types" ("ID", "ACCOUNT_TYPE") VALUES(10, 'cuenta de debito');
	INSERT INTO public."Account_Types" ("ID", "ACCOUNT_TYPE") VALUES(20, 'cuenta de crédito');

--3 cuentas con los siguientes saldos ($20000, $25000 y $37000) y asociarlas a los 3 clientes creados
	INSERT INTO public."Accounts"
	("ID", "ACCOUNT", "ID_CUSTOMER", "ID_ACCOUNT_TYPE", "ACCOUNT_BALANCE")
	VALUES(111, 111222, 1000, 10, 20000);
	
	INSERT INTO public."Accounts"
	("ID", "ACCOUNT", "ID_CUSTOMER", "ID_ACCOUNT_TYPE", "ACCOUNT_BALANCE")
	VALUES(112, 111333, 2000, 10, 25000);
	
	INSERT INTO public."Accounts"
	("ID", "ACCOUNT", "ID_CUSTOMER", "ID_ACCOUNT_TYPE", "ACCOUNT_BALANCE")
	VALUES(113, 111444, 3000, 10, 37000);

--Crear 2 tipos de transacciones (Transferencia de efectivo, pago de tarjeta de crédito)
	INSERT INTO public."Transactions_Types"
	("ID", "TRANSACTION_TYPE")
	VALUES(88, 'Transferencia de efectivo');
	
	INSERT INTO public."Transactions_Types"
	("ID", "TRANSACTION_TYPE")
	VALUES(99, 'pago de tarjeta de crédito');


--Crear 4 transacciones

--2 de tipo transferencia de efectivo (ambas con un monto de $10000) para la cuenta de Hector Hernandez
	--salida de transferencia de efectivo de Andrea Alvarez a Hector Hernandez
	INSERT INTO public."Transactions"
	("ID", "ID_ACCOUNT", "ID_TRANSACTION_TYPE", "AMOUNT")
	VALUES(1420, 112, 88, -10000);
	--ACTUALIZANDO EL SALDO
	UPDATE public."Accounts"
	SET "ACCOUNT_BALANCE"="ACCOUNT_BALANCE" - 10000
	WHERE "ID"=112;

	--entrada de transferencia de efectivo a Hector Hernandez 
	INSERT INTO public."Transactions"
	("ID", "ID_ACCOUNT", "ID_TRANSACTION_TYPE", "AMOUNT")
	VALUES(1421, 111, 88, 10000);
	--ACTUALIZANDO EL SALDO
	UPDATE public."Accounts"
	SET "ACCOUNT_BALANCE"="ACCOUNT_BALANCE" + 10000
	WHERE "ID"=111;

	-- actualizaciones de las referencias por al transferencia realizada
	UPDATE public."Transactions"
	SET "REFERENCE"=1421 
	WHERE "ID"=1420;
	UPDATE public."Transactions"
	SET "REFERENCE"=1420 
	WHERE "ID"=1421;
 

	--salida de transferencia de efectivo de Jonh Doe a Hector Hernandez
	INSERT INTO public."Transactions"
	("ID", "ID_ACCOUNT", "ID_TRANSACTION_TYPE", "AMOUNT")
	VALUES(1422, 113, 88, -10000);
	--ACTUALIZANDO EL SALDO
	UPDATE public."Accounts"
	SET "ACCOUNT_BALANCE"="ACCOUNT_BALANCE" - 10000
	WHERE "ID"=113;
	
	--entrada de transferencia de efectivo a Hector Hernandez 
	INSERT INTO public."Transactions"
	("ID", "ID_ACCOUNT", "ID_TRANSACTION_TYPE", "AMOUNT")
	VALUES(1423, 111, 88, 10000);
	--ACTUALIZANDO EL SALDO
	UPDATE public."Accounts"
	SET "ACCOUNT_BALANCE"="ACCOUNT_BALANCE" + 10000
	WHERE "ID"=111;	

	-- actualizaciones de las referencias por al transferencia realizada
	UPDATE public."Transactions"
	SET "REFERENCE"=1423 
	WHERE "ID"=1422;
	UPDATE public."Transactions"
	SET "REFERENCE"=1422 
	WHERE "ID"=1423;

--- 2 de tipo **pago de tarjeta de crédito** con un monto de $7500 para la cuenta de Andrea Alvarez, una con un monto de $5000 para la cuenta de Jonh Doe.

	--**pago de tarjeta de crédito** cuenta de Andrea Alvarez
	INSERT INTO public."Transactions"
	("ID", "ID_ACCOUNT", "ID_TRANSACTION_TYPE", "AMOUNT")
	VALUES(1424, 112, 99, -7500);
	--ACTUALIZANDO EL SALDO
	UPDATE public."Accounts"
	SET "ACCOUNT_BALANCE"="ACCOUNT_BALANCE" - 7500
	WHERE "ID"=112;
	
	--**pago de tarjeta de crédito** cuenta de Jonh Doe
	INSERT INTO public."Transactions"
	("ID", "ID_ACCOUNT", "ID_TRANSACTION_TYPE", "AMOUNT")
	VALUES(1425, 113, 99, -5000);
	--ACTUALIZANDO EL SALDO
	UPDATE public."Accounts"
	SET "ACCOUNT_BALANCE"="ACCOUNT_BALANCE" - 5000
	WHERE "ID"=113;









