Truncate table WSDataVault_dev_incremental.load.load_invoicedef_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_invoicedef_national
(
invoicenum
,invoicedate
,acctnum
,invoiceref
,invoicecomm
,projectnum
,description
,status
,lastdate
,lasttool
,lastuser
,loginnum
,ponumber
,redostatus
,mas90date
,original_invoice_date
,summary_invoice
,dss_record_source
,dss_load_date
)
Select INVOICEDEF.INVOICENUM
,INVOICEDEF.INVOICEDATE
,INVOICEDEF.ACCTNUM
,INVOICEDEF.INVOICEREF
,INVOICEDEF.INVOICECOMM
,INVOICEDEF.PROJECTNUM
,INVOICEDEF.DESCRIPTION
,INVOICEDEF.STATUS
,INVOICEDEF.LASTDATE
,INVOICEDEF.LASTTOOL
,INVOICEDEF.LASTUSER
,INVOICEDEF.LOGINNUM
,INVOICEDEF.PONUMBER
,INVOICEDEF.REDOSTATUS
,INVOICEDEF.MAS90DATE
,INVOICEDEF.ORIGINAL_INVOICE_DATE
,INVOICEDEF.SUMMARY_INVOICE
,''
,''
From
SEEDPAK.INVOICEDEF INVOICEDEF
WHERE lastdate > to_date('$Plast_lastdate_invoicedef$','YYYY-MM-DD HH24:MI:SS')  
AND lastdate < trunc(sysdate) ;
UPDATE WSDataVault_dev_incremental.load.load_invoicedef_national SET dss_record_source = 'National.SEEDPAK.INVOICEDEF'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;