CREATE TABLE "pace_account"
(
    "pace_account_no" nvarchar(50) not null
    , "pace_account_no_bkcc" nvarchar(255) not null
    , "tenant_id" nvarchar(255) not null
    , PRIMARY KEY ("pace_account_no", "pace_account_no_bkcc", "tenant_id")
);

CREATE UNIQUE INDEX CLIENT_PK
ON "pace_account" ();

