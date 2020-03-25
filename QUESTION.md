## 概要
社内での勉強会資料用に作成されたものです。
postgreSQLのindexについて実験しながら理解を深める目的で作られています。

動作確認バージョンは12.0、10.10です。

## 準備
sql/table 以下のcrate_table.sqlをDBに流してください。index_tableとnon_index_tableの2テーブルができていたらokです。

## 問題

### 基礎編
1. index_tableのカラム、unique_idにindexを張ってみましょう。sql/query/q1.sqlを実行してみてください。
2. sql/query/q2.sqlの内容を確認し、実行してみましょう。さらに指定されているテーブル名をnon_index_tableに書き換えて実行し、結果の比較を行いましょう。(実行計画がよくわからない人へのヒント:execution timeやcostの数字の右側に着目するとかかった時間や使ったメモリがわかります。またSeq ScanをしているかIndex Scanをしているかも重要な情報です。前者の場合はindexは使われていません。)
3. sql/query/q3.sqlの内容を確認し、実行してみましょう。さらに指定されているテーブル名をnon_index_tableに書き換えて実行し、結果の比較を行いましょう。問2との結果とも比較してみましょう。
4. sql/query/q4.sqlの内容を確認し、実行してみましょう。そしてその結果を問2の結果と比較してみましょう。
5. index_tableのindexのサイズを測ってみましょう。q5.sqlを実行すると、public以下にあるテーブルのindexを確認できます。
6. q6.sqlはindex_tableのレコードを5000件削除します。これを実行した後に再びindexのサイズを計測するとどうなるでしょうか。
7. q7.sqlは問6で消したレコードのidを使ってindex_tableのレコードを5000件追加します。これを実行した後に再びindexのサイズを計測するとどうなるでしょうか。
8. q8.sqlはindex_tableへ新たにレコードを5000件追加します。これを実行した後に再びindexのサイズを計測するとどうなるでしょうか。
9.  REINDEX コマンドを使うとindexを再構築することができます。[テーブルをロックするので非常事態以外では使わないほうがいいでしょう。](https://www.postgresql.jp/document/11/html/sql-reindex.html)q9.sqlを流すとindex_tableのindexが全て再構築されます。再構築後のindexのサイズも測定してみましょう。
10. sql/table 以下のcrate_table.sqlを流し直し、今度はindex_tableのrecord_typeにindexを張ってみてください。そしてsql/query/q10.sqlの内容を確認し、実行してみましょう。さらに指定されているテーブル名をnon_index_tableに書き換えて実行し、結果の比較を行いましょう。
11. 以上をふまえて、indexが有効に働くような状況について考察を行ってください。
