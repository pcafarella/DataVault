CREATE TABLE "customer_paceaccount"
(
    "account_no" nvarchar(50) not null
    , "account_no_bkcc" nvarchar(255) not null
    , "account_no_tenant_id" nvarchar(255) not null
    , "pace_account_no" nvarchar(50) not null
    , "pace_account_no_bkcc" nvarchar(255) not null
    , "pace_account_no_tenant_id" nvarchar(255) not null
    , PRIMARY KEY ("account_no", "account_no_bkcc", "account_no_tenant_id", "pace_account_no", "pace_account_no_bkcc", "pace_account_no_tenant_id")
);

CREATE UNIQUE INDEX CLIENT_PK
ON "customer_paceaccount" ("account_no");

