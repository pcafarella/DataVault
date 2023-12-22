/****** Object:  View [bus].[s_analytical_instrument_mroc_national_current]    Script Date: 12/21/2023 12:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [bus].[s_analytical_instrument_mroc_national_current](
hk_h_analytical_instrument, 
certification_req, 
service_status, 
instrument_type, 
instrument_model, 
serial_number, 
description, 
location, 
calib_days, 
calib_desc, 
last_calib, 
next_calib, 
service_days, 
service_desc, 
last_service, 
next_service, 
capacity, 
capacity_samp_test, 
instrument_cost, 
lasttool, 
lastuser, 
lastdate, 
computername, 
datapath, 
raw_data_mode, 
analysis_location_code, 
tzcode, 
dss_change_hash, 
dss_record_source, 
dss_load_date, 
dss_start_date, 
dss_version, 
dss_create_time)
AS
SELECT 
s_analytical_instrument_mroc_national.hk_h_analytical_instrument, 
s_analytical_instrument_mroc_national.certification_req, 
s_analytical_instrument_mroc_national.service_status, 
s_analytical_instrument_mroc_national.instrument_type, 
s_analytical_instrument_mroc_national.instrument_model, 
s_analytical_instrument_mroc_national.serial_number, 
s_analytical_instrument_mroc_national.description, 
s_analytical_instrument_mroc_national.location, 
s_analytical_instrument_mroc_national.calib_days, 
s_analytical_instrument_mroc_national.calib_desc, 
s_analytical_instrument_mroc_national.last_calib, 
s_analytical_instrument_mroc_national.next_calib, 
s_analytical_instrument_mroc_national.service_days, 
s_analytical_instrument_mroc_national.service_desc, 
s_analytical_instrument_mroc_national.last_service, 
s_analytical_instrument_mroc_national.next_service, 
s_analytical_instrument_mroc_national.capacity, 
s_analytical_instrument_mroc_national.capacity_samp_test, 
s_analytical_instrument_mroc_national.instrument_cost, 
s_analytical_instrument_mroc_national.lasttool, 
s_analytical_instrument_mroc_national.lastuser, 
s_analytical_instrument_mroc_national.lastdate, 
s_analytical_instrument_mroc_national.computername, 
s_analytical_instrument_mroc_national.datapath, 
s_analytical_instrument_mroc_national.raw_data_mode, 
s_analytical_instrument_mroc_national.analysis_location_code, 
s_analytical_instrument_mroc_national.tzcode, 
s_analytical_instrument_mroc_national.dss_change_hash, 
s_analytical_instrument_mroc_national.dss_record_source, 
s_analytical_instrument_mroc_national.dss_load_date, 
s_analytical_instrument_mroc_national.dss_start_date, 
s_analytical_instrument_mroc_national.dss_version, 
s_analytical_instrument_mroc_national.dss_create_time 
FROM WSDataVault_dev_incremental.raw.s_analytical_instrument_mroc_national s_analytical_instrument_mroc_national
INNER JOIN (
    SELECT 
    hk_h_analytical_instrument, 
    MAX(dss_start_date) AS dss_start_date
    FROM WSDataVault_dev_incremental.raw.s_analytical_instrument_mroc_national
    GROUP BY hk_h_analytical_instrument) curr
ON curr.hk_h_analytical_instrument = s_analytical_instrument_mroc_national.hk_h_analytical_instrument
AND curr.dss_start_date = s_analytical_instrument_mroc_national.dss_start_date
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'The changing hash' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_analytical_instrument_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Record source' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_analytical_instrument_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was loaded in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_analytical_instrument_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row started in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_analytical_instrument_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Version number of a business key in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_analytical_instrument_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was inserted in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_analytical_instrument_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
