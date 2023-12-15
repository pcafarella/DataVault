CREATE TABLE "seedpak_methods"
(
    "methodref" VARCHAR2(40) not null unique
    , "description" VARCHAR2(80)
    , PRIMARY KEY ("methodref")
);

