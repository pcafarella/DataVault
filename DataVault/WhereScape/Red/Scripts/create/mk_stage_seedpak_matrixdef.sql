CREATE TABLE WSDataVault_dev_incremental.stage.stage_seedpak_matrixdef (
  matnum nvarchar(4) -- load_matrixdef_national.matnum 
, matrix nvarchar(10) -- load_matrixdef_national.matrix 
, pace_matrix nvarchar(10) -- load_matrixdef_national.pace_matrix 
, dss_record_source nvarchar(255) -- load_matrixdef_national.dss_record_source 
, dss_load_date datetime2 -- load_matrixdef_national.dss_load_date 
, dss_create_time datetime2 
) 
;


