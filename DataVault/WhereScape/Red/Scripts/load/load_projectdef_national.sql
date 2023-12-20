Truncate table WSDataVault_dev_incremental.load.load_projectdef_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_projectdef_national
(
acctnum
,projectnum
,description
,startdate
,stopdate
,ponumber
,site
,manager
,projref
,sales1code
,sales1plan
,sales2code
,sales2plan
,termcode
,lastdate
,lasttool
,lastuser
,locator
,permitnum
,dss_record_source
,dss_load_date
)
Select PROJECTDEF.ACCTNUM
,PROJECTDEF.PROJECTNUM
,PROJECTDEF.DESCRIPTION
,PROJECTDEF.STARTDATE
,PROJECTDEF.STOPDATE
,PROJECTDEF.PONUMBER
,PROJECTDEF.SITE
,PROJECTDEF.MANAGER
,PROJECTDEF.PROJREF
,PROJECTDEF.SALES1CODE
,PROJECTDEF.SALES1PLAN
,PROJECTDEF.SALES2CODE
,PROJECTDEF.SALES2PLAN
,PROJECTDEF.TERMCODE
,PROJECTDEF.LASTDATE
,PROJECTDEF.LASTTOOL
,PROJECTDEF.LASTUSER
,PROJECTDEF.LOCATOR
,PROJECTDEF.PERMITNUM
,''
,''
From
SEEDPAK.PROJECTDEF PROJECTDEF
WHERE lastdate > to_date('$Plast_lastdate_projectdef$','YYYY-MM-DD HH24:MI:SS')  
;
UPDATE WSDataVault_dev_incremental.load.load_projectdef_national SET dss_record_source = 'National.SEEDPAK.PROJECTDEF'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;