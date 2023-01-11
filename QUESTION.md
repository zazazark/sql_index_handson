## 概要
社内での勉強会資料用に作成されたものです。
PostgreSQLのindexについて実験しながら理解を深める目的で作られています。

動作確認バージョンは14.1です。

## 準備
パスワードを求められたら"postgres"と入力してください

### コンテナ起動まで
```sh
cd infra
docker-compose up
```

### SQLのデータを作成しDBに接続するまで(コンソール別タブで実施)
```sh
docker exec -it index-handson bash
psql -h localhost -p 5432 -U user -f ../sql/table/init_table.sql 2023
psql -h localhost -p 5432 -U user 2023
```

## 作成されるテーブル

### index_table
  - primary_id BIGINT NOT NULL 
    - 主キー
  - unique_id BIGINT
    - ユニークな数字
  - record_type TEXT
    - oddまたはevenの2種類
  - r_time TIMESTAMPTZ
    - ユニークな日時
  - nested_json JSONB NOT NULL DEFAULT '{}'
    - ユニークなjson
### non_index_table
  - primary_id BIGINT NOT NULL 
    - こちらでは主キーではない
  - unique_id BIGINT
    - ユニークな数字
  - record_type TEXT
    - oddまたはevenの2種類
  - r_time TIMESTAMPTZ
    - ユニークな日時
  - nested_json JSONB NOT NULL DEFAULT '{}'
    - ユニークなjson

## 問題

1. index_tableのカラム、unique_idにindexを張ってみましょう。sql/query/q1.sqlを実行してみてください。
2. sql/query/q2_a.sqlの内容を確認し、実行してみましょう。さらにsql/query/q2_b.sqlの内容も確認して実行し、aとbの結果の比較を行いましょう。(実行計画がよくわからない人へのヒント:actual timeやcostの数字の右側に着目すると実際にかかった時間やどれくらい重たい処理なのかがわかります。またSeq ScanをしているかIndex Scanをしているかも重要な情報です。前者の場合はindexは使われていません。)
3. sql/query/q3_a.sqlの内容を確認し、実行してみましょう。さらにsql/query/q3_b.sqlの内容も確認して実行し、aとbの結果の比較を行いましょう。
4. sql/query/q4_a.sqlの内容を確認し、実行してみましょう。sql/query/q4_b.sqlの内容を確認し、実行してみましょう。さらにsql/query/q4_c.sqlの内容も確認して実行し、bとcの結果の比較を行いましょう。
5. q5_a.sqlは今まで作成したindexを削除するsqlです。またq5_b.sqlはindexを4つ作るsqlです。a→bと実行したのち、cとd、eとf、gとh、iとjについて実行し、結果を比較してください。余力があれば、indexの数を変えた時に、これらの実行コストがどのようになるか、確認してみてください。

## まとめ文
indexが有効に使えるケースとそうでないケース
・index scanは参照するデータの（①）が（②）ときや、データの（③）が（④）ときにむしろ遅くなる。

indexを作ることで、何とのトレードオフが起きるのか？
・indexは（⑤）文と（⑥）文には、パフォーマンス的に良い影響も悪い影響も与える。（⑦）文には悪影響を与える。

