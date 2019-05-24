SELECT
substr(a.object_name,1,16) "Pack",
NLS_INITCAP(a.status) "pac" ,
TO_CHAR(a.last_ddl_time, 'DD-MON-YYYY HH24:MI:SS') "Ult.pac",
NLS_INITCAP(b.status) "body",
TO_CHAR(b.last_ddl_time, 'DD-MON-YYYY HH24:MI:SS') "Ult.body"
FROM obj a,obj b
WHERE
a.object_type = 'PACKAGE' and
b.object_type (+) = 'PACKAGE BODY' and
a.object_name = b.object_name (+)
order by a.object_name;
