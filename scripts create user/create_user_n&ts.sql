--
-- Authors:  N&TS 
--
-- Date: 2019
--
-- Descrizione: Script iniziale di creazione dell'utente 
--
-- Baseline setup (Y/N): Yes
--
-- Parametric script (Y/N): Yes
--
-- Database name:
--
--
Accept utente  prompt "Inserire nome utente per schema : "
Accept passwd  prompt "Inserire password utente per schema  : "
select name TABLESPACE_DISPONIBILI from V$TABLESPACE;
Accept tbls    prompt "Inserire nome del TABLESPACE DATI : "
Accept tblsindx    prompt "Inserire nome del TABLESPACE INDICI : "
create user &utente identified by &passwd default tablespace &tbls  temporary tablespace TEMP;
grant connect, resource to &utente; 
GRANT CREATE VIEW TO &utente;
GRANT CREATE SYNONYM TO &utente;
--
-- QUOTA ON TABLESPACES
--
ALTER USER &utente QUOTA UNLIMITED ON &tbls;
ALTER USER &utente QUOTA UNLIMITED ON &tblsindx;

exit
