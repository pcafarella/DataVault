CREATE TABLE "customer_project"
(
    "account_no" varchar(50) not null
    , "account_no_bkcc" varchar(255) not null
    , "account_no_tenant_id" VARCHAR(255) not null
    , "project_no" nvarchar(50) not null
    , "project_no_bkcc" varchar(255) not null
    , "project_no_tenant_id" varchar(255) not null
    , PRIMARY KEY ("account_no", "account_no_bkcc", "account_no_tenant_id", "project_no", "project_no_bkcc", "project_no_tenant_id")
);

CREATE INDEX Client
ON "customer_project" ("account_no");

CREATE INDEX Project
ON "customer_project" ("project_no");

CREATE UNIQUE INDEX PROJECT_PK
ON "customer_project" ("project_no");

