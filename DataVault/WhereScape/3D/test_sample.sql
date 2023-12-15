CREATE TABLE "test_sample"
(
    "test_no" nvarchar(max) not null
    , "test_no_bkcc" varchar(255) not null
    , "test_no_tenant_id" varchar(255) not null
    , "sample_no" nvarchar(50) not null
    , "sample_no_bkcc" nvarchar(255) not null
    , "sample_no_tenant_id" varchar(255) not null
    , PRIMARY KEY ("test_no", "test_no_bkcc", "test_no_tenant_id", "sample_no", "sample_no_bkcc", "sample_no_tenant_id")
);

CREATE INDEX Analysis
ON "test_sample" ("test_no");

CREATE INDEX Sample
ON "test_sample" ("sample_no");

CREATE UNIQUE INDEX SAMPLEEXTRACTION_PK
ON "test_sample" ("sample_no_bkcc","sample_no","test_no");

