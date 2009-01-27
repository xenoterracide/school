set wrap off linesize 132 pages 80

column tab format a20
column col format a15
column pos format 990
column typ format a10
column tbs format a25
BREAK ON tab NODUPLICATES SKIP 2 ON NAME NODUPLICATES 

select	 t.table_name "Tab"
	,c.column_name "Col"
	,c.column_id "Pos"
	,c.data_type "Typ"
	,DECODE(c.nullable,'N','NOT NULL',NULL) "Null"
	,t.tablespace_name "Tbs"
from user_tables t, user_tab_columns c
where t.table_name = c.table_name
order by t.table_name, c.column_id;

