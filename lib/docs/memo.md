# Riverpod
2025.01.18更新

## provider名
### メリット・得意なこと
### デメリット・不得意なこと

## Provider
- ref.watchと組み合わせることで、同期的な処理の結果をキャッシュする
### メリット・得意なこと（これは他のプロバイダにも言える）
- 値にアクセスしやすい。グローバルに定義されるので、バケツリレーみたいにページ間で値をやりとりしなくて済む
- 画面更新の最適化ができる。更新範囲を決めることができるので、描画にかかる時間を減らすことができる
- ロジックとウィジェットを分離できる
### デメリット・不得意なこと
- 値を代入することはできない → 値を監視して、適当な処理をした値を返す用途として使える

## NotifierProvider
- ユーザーの操作に応じて変化する可能性がある状態を管理するのに推奨される
- 管理している状態には state でアクセスすることができる
- Riverpod2.0で登場
### メリット・得意なこと
- ユーザーの操作に応じて変化する状態を管理（カウンターなど）
### デメリット・不得意なこと

## AsyncNotifierProvider
- NotifierProviderの非同期ver.
- Riverpod2.0で登場
- AsyncValueでStateをラップしAsyncLoading,AsyncData,AsyncErrorの3つの状態で管理
### メリット・得意なこと
### デメリット・不得意なこと

### 補足:AsyncValue
非同期処理によって状態が生成される場合、ref.watch()やref.read()で取得する値はAsyncValue<T>となる

## StateProvider
- 使えるけどレガシー（代わりにNotifierProvider推奨）
- stateはミュータブルで、外部から直接値を変更できる
### メリット・得意なこと
StateProviderにが得意な値
- 列挙型（enum）、例えばフィルタの種類など
- 文字列型、例えばテキストフィールドの入力内容など
- bool 型、例えばチェックボックスの値など
- 数値型、例えばページネーションのページ数やフォームの年齢など
### デメリット・不得意なこと
- 複雑なオブジェクトはStateNotifierProviderを使うべき
- 使うべきでないケース
    - ステートの算出に何かしらのバリデーション（検証）ロジックが必要
    - ステート自体が複雑なオブジェクトである（カスタムのクラスや List/Map など）
    - ステートを変更するためのロジックが単純な count++ よりは高度である必要がある

## StateNotifierProvider
- 使えるけどレガシー（代わりにNotifierProvider推奨）
- stateはイミュータブルで、外部から値を変更できない。そのためclass内の関数で、新しい値を上書きするような形で変更する。
### メリット・得意なこと
### デメリット・不得意なこと

## FutureProvider
- AsyncValueでStateをラップしAsyncLoading,AsyncData,AsyncErrorの3つの状態で管理
### メリット・得意なこと
### デメリット・不得意なこと
- ユーザーの操作の後にデータを変更する手段がない

## StreamProvider
一定時間毎に更新される状態を監視し、変化があったらウィジェットを更新する
### メリット・得意なこと
- 「断続的なデータ取得」において、「非同期操作」が可能
- ユースケース:ログイン状態によって画面を遷移
#### StreamBuilderではなくStreamProviderのメリット
- ref.watchを通じて監視可能
- AsyncValueで適切にステートを処理可能
### デメリット・不得意なこと

Streamの場合は async ではなく async*、return ではなく yield を使用する

## ChangeNotifierProvider
非推奨(可能な限り StateNotifierProviderを推奨)
更新にはnotifyListeners()が必要
### メリット・得意なこと
### デメリット・不得意なこと
現在非推奨(ミュータブルなステート管理により保守性を損ない、想定外の動作をする恐れがある)

## riverpod_generator
コード生成
`flutter pub run build_runner build --delete-conflicting-outputs`

## ref.read, watch, listen, refresh, invalidate
- read : 取得するが監視はしない
- watch : 監視し、状態変更時にリビルド
- listen : 監視し、状態変更時に引数に渡した関数を呼び出す
- refresh, invalidate : 任意の処理の中で能動的に状態を破棄させる
### ref.refreshとref.invalidateの違い
ref.refresh = invalidate + read。invalidateした後に最新値を取得したい場合はrefreshを使うと良い

## .select
String name = ref.watch(userProvider.select((user) => user.name));
selectを使用することで、不必要なデータの変化でUIの更新をするという無駄な処理を避けることが可能
