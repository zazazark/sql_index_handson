## 概要
社内での勉強会資料用に作成されたものです。
postgreSQLのindexについて実験しながら理解を深める目的で作られています。

動作確認バージョンは12.0、10.10です。

## 準備
sql/table 以下のcrate_table.sqlをDBに流してください。index_tableとnon_index_tableの2テーブルができていたらokです。

## 問題

### 基礎編
1. index_tableのカラム、unique_idにindexを張ってみましょう。sql/query/q1.sqlを実行してみてください。
2. sql/query/q2.sqlの内容を確認し、実行してみましょう。さらに指定されているテーブル名をnon_index_tableに書き換えて実行し、結果の比較を行いましょう。(ヒント:読み方がよくわからない場合は、execution timeやcostの数字の右側に着目すると良いでしょう。)
3. sql/query/q3.sqlの内容を確認し、実行してみましょう。さらに指定されているテーブル名をnon_index_tableに書き換えて実行し、結果の比較を行いましょう。(ヒント:問2での結果と比べて比べてどうでしょうか)
4. sql/query/q4.sqlの内容を確認し、実行してみましょう。そしてその結果を問2の結果と比較してみましょう。
5. index_tableのindexのサイズを測ってみましょう。q5.sqlを実行すると、public以下にあるテーブルのindexを確認できます。
6. q6.sqlはindex_tableのレコードを5000件削除します。これを実行した後に再びindexのサイズを計測するとどうなるでしょうか。
7. q7.sqlは問6で消したレコードのidを使ってindex_tableのレコードを5000件追加します。これを実行した後に再びindexのサイズを計測するとどうなるでしょうか。
8. q8.sqlはindex_tableへ新たにレコードを5000件追加します。これを実行した後に再びindexのサイズを計測するとどうなるでしょうか。
9. sql/table 以下のcrate_table.sqlを流し直し、今度はindex_tableのrecord_typeにindexを張ってみてください。そしてsql/query/q9.sqlの内容を確認し、実行してみましょう。さらに指定されているテーブル名をnon_index_tableに書き換えて実行し、結果の比較を行いましょう。
10. 以上をふまえて、indexが有効に働くような状況について考察を行ってください。
