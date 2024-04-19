# Riverpod

## provider
計算のキャッシュ
他のプロバイダ（Repository/HttpClientなど）に値を公開
テストやウィジェットが値をオーバーライドする方法を提供
selectを使用することなく、プロバイダーやウィジェットの再構築を減らすことが可能
データを受け渡せればOKな時に使う(データは更新されない)

値を代入することはできない → つまり値を監視して、適当な処理をした値を返す用途として使える

## NotifierProvider
Provider名に _$ をつけた形にする
管理している状態には state でアクセスすることができる

## AsyncNotifierProvider
build の返り値が Future型になっている
返り値が Future型の場合は Riverpod Generator の方で自動的に AsyncNotifier を生成するようになっている

## StateNotifierProvider
代わりにNotifierProvider推奨

## FutureProvider
非同期データの取得に使用して、データが使用可能（取得完了）になるとWidgetを更新する

ユーザーの操作の後にデータを変更する手段がない
FutureProvider < AsyncNotifierProvider でより高度なケースに使用
「単一のデータ取得」において、「非同期操作」が可能

## StreamProvider
「断続的なデータ取得」において、「非同期操作」が可能
Streamの場合は async ではなく async*、return ではなく yield を使用する
変更が確認されたらwidgetが更新される

## StateProvider
Providerのnotifierを参照し、直接値を変更する。（変数チック）

簡単な値向き
使えるけどレガシー
StateProvider => Notifier
StateNotifier => Notifierまたは（非同期処理を含むなら）AsyncNotifier

StateProviderに適したシンプルな状態
- 列挙型（enum）、例えばフィルタの種類など
- 文字列型、例えばテキストフィールドの入力内容など
- bool 型、例えばチェックボックスの値など
- 数値型、例えばページネーションのページ数やフォームの年齢など

使うべきでないケースとして
- ステートの算出に何かしらのバリデーション（検証）ロジックが必要
- ステート自体が複雑なオブジェクトである（カスタムのクラスや List/Map など）
- ステートを変更するためのロジックが単純な count++ よりは高度である必要がある

https://zenn.dev/3ta/articles/fb2329ba2ab1dd

## ChangeNotifierProvider
非推奨
notifyListeners()がないと更新されない


## riverpod_generator
コード生成
`flutter pub run build_runner build --delete-conflicting-outputs`