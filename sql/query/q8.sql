DO $BODY$ DECLARE
  i BIGINT;
  BEGIN
  FOR i IN 10001..15000 LOOP
    INSERT INTO index_table VALUES(
      i,
      i,
      CASE i%2
        WHEN 0 THEN 'even'
        WHEN 1 THEN 'odd'
      END
      ,
      NOW() + CAST( i || 'days' AS interval),
      jsonb_build_object(
        'name'
		    ,md5(i::text)
		    ,'nest'
  	    ,json_build_array(
  		    jsonb_build_object('detail_id',100+i,'name',md5(i::text))
  		    ,jsonb_build_object('detail_id',101+i,'name',md5(i::text))
	      )
	    )
    );  
  END LOOP;
END
$BODY$;