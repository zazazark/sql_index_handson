SELECT
  indexname,
  to_char(pg_relation_size(t1.indexname::regclass), '999,999,999,999') as bytes 
FROM (
  SELECT
    indexname
  FROM 
  	pg_indexes
  WHERE 
  	schemaname = 'public'
) as t1
ORDER BY bytes desc; 