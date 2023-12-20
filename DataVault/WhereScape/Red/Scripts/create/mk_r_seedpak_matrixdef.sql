CREATE TABLE WSDataVault_dev_incremental.ref.r_seedpak_matrixdef (
  matnum nvarchar(4) -- stage_seedpak_matrixdef.matnum 
, matrix nvarchar(10) -- stage_seedpak_matrixdef.matrix 
, pace_matrix nvarchar(10) -- stage_seedpak_matrixdef.pace_matrix 
, dss_record_source nvarchar(255) -- stage_seedpak_matrixdef.dss_record_source 
, dss_load_date datetime2 -- stage_seedpak_matrixdef.dss_load_date 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX r_seedpak_mat_d5dbdde1_idx_A ON WSDataVault_dev_incremental.ref.r_seedpak_matrixdef (matnum) WITH (SORT_IN_TEMPDB = OFF);

