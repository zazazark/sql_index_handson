DO $BODY$ DECLARE
  i BIGINT;
  BEGIN
  FOR i IN 3000..8000 LOOP
    DELETE FROM index_table
    WHERE unique_id = i;
  END LOOP;
END
$BODY$;