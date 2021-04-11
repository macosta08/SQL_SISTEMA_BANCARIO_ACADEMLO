CREATE TABLE "Customers" (
  "ID" int PRIMARY KEY,
  "ID_ACCOUNT" int,
  "NAME" varchar,
  "PHONE" varchar,
  "ADDRESS" varchar
);

CREATE TABLE "Accounts" (
  "ID" int PRIMARY KEY,
  "ACCOUNT" int,
  "ID_CUSTOMER" int,
  "ID_ACCOUNT_TYPE" int,
  "ACCOUNT_BALANCE" INT
);

CREATE TABLE "Transactions_Types" (
  "ID" int PRIMARY KEY,
  "TRANSACTION_TYPE" varchar
);

CREATE TABLE "Account_Types" (
  "ID" int PRIMARY KEY,
  "ACCOUNT_TYPE" varchar
);

CREATE TABLE "Transactions" (
  "ID" int PRIMARY KEY,
  "ID_ACCOUNT" int,
  "ID_TRANSACTION_TYPE" int,
  "AMOUNT" int,
  "REFERENCE" int
);

ALTER TABLE "Accounts" ADD FOREIGN KEY ("ID_ACCOUNT_TYPE") REFERENCES "Account_Types" ("ID");

ALTER TABLE "Accounts" ADD FOREIGN KEY ("ID_CUSTOMER") REFERENCES "Customers" ("ID");

ALTER TABLE "Transactions" ADD FOREIGN KEY ("ID_ACCOUNT") REFERENCES "Accounts" ("ID");

ALTER TABLE "Transactions" ADD FOREIGN KEY ("ID_TRANSACTION_TYPE") REFERENCES "Transactions_Types" ("ID");

ALTER TABLE "Transactions" ADD FOREIGN KEY ("REFERENCE") REFERENCES "Transactions" ("ID");
