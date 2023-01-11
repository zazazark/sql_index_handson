DROP TABLE IF EXISTS public.index_table;
DROP TABLE IF EXISTS public.non_index_table;

CREATE TABLE IF NOT EXISTS public.index_table (
  primary_id BIGINT NOT NULL
  ,unique_id BIGINT
  ,record_type TEXT
  ,r_time TIMESTAMPTZ
  ,nested_json JSONB NOT NULL DEFAULT '{}'
  ,PRIMARY KEY(primary_id)
);

CREATE TABLE IF NOT EXISTS public.non_index_table (
  primary_id BIGINT NOT NULL
  ,unique_id BIGINT
  ,record_type TEXT
  ,r_time TIMESTAMPTZ
  ,nested_json JSONB NOT NULL DEFAULT '{}'
);

DO $BODY$ DECLARE
  i BIGINT;
  BEGIN
  FOR i IN 1..100000 LOOP
    INSERT INTO index_table VALUES(
      i,
      i,
      CASE i%2
        WHEN 0 THEN 'even'
        WHEN 1 THEN 'odd'
      END
      ,
      '2023-01-01 00:00:00+09'::TIMESTAMPTZ + CAST( i || 'hours' AS interval),
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
    
    INSERT INTO non_index_table VALUES(
      i,
      i,
      CASE i%2
        WHEN 0 THEN 'even'
        WHEN 1 THEN 'odd'
      END,
      '2023-01-01 00:00:00+09'::TIMESTAMPTZ + CAST( i || 'hours' AS interval),
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