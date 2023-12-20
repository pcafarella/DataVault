Truncate table WSDataVault_dev_incremental.load.load_accountdef_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_accountdef_national
(
acctnum
,pace_acct_code
,acctname
,acctfactor
,lastdate
,lasttool
,lastuser
,mas90code
,date_establishd
,dso
,customertype
,creationdate
,national_acct_flag
,exclude_scinfl
,dss_record_source
,dss_load_date
)
Select ACCOUNTDEF.ACCTNUM
,ACCOUNTDEF.PACE_ACCT_CODE
,ACCOUNTDEF.ACCTNAME
,ACCOUNTDEF.ACCTFACTOR
,ACCOUNTDEF.LASTDATE
,ACCOUNTDEF.LASTTOOL
,ACCOUNTDEF.LASTUSER
,ACCOUNTDEF.MAS90CODE
,ACCOUNTDEF.DATE_ESTABLISHD
,ACCOUNTDEF.DSO
,ACCOUNTDEF.CUSTOMERTYPE
,ACCOUNTDEF.CREATIONDATE
,ACCOUNTDEF.NATIONAL_ACCT_FLAG
,ACCOUNTDEF.EXCLUDE_SCINFL
,''
,''
From
SEEDPAK.ACCOUNTDEF ACCOUNTDEF;
UPDATE WSDataVault_dev_incremental.load.load_accountdef_national SET dss_record_source = 'National.SEEDPAK.ACCOUNTDEF'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;