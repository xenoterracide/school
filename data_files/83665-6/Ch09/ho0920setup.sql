SELECT 'I own the ' || UT.TABLE_NAME ||
' table in the '||UT.TABLESPACE_NAME || 
' tablespace.'
FROM USER_TABLES UT
ORDER BY TABLE_NAME;