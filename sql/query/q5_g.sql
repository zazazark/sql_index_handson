EXPLAIN ANALYZE INSERT INTO index_table VALUES(
  100001,
  100001,
  'odd',
  '2023-01-01 00:00:00+09'::TIMESTAMPTZ + CAST(100001 || 'hours' AS interval),
  jsonb_build_object(
    'name'
	  ,md5(100001::text)
	  ,'nest'
    ,json_build_array(
      jsonb_build_object('detail_id',100+100001,'name',md5(100001::text))
      ,jsonb_build_object('detail_id',101+100001,'name',md5(100001::text))
	  )
	)
);