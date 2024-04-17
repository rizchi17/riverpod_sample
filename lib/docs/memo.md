# Riverpod

## provider
### 用途
- 計算のキャッシュ
- 他のプロバイダ（Repository/HttpClientなど）に値を公開
- テストやウィジェットが値をオーバーライドする方法を提供
- selectを使用することなく、プロバイダーやウィジェットの再構築を減らすことが可能

- 値を代入することはできない → つまり値を監視して、適当な処理をした値を返す用途として使える

## notifierProvider
Provider名に _$ をつけた形にする
管理している状態には state でアクセスすることができる

## AsyncNotifierProvider
build の返り値が Future型になっている
返り値が Future型の場合は Riverpod Generator の方で自動的に AsyncNotifier を生成するようになっている

## StateNotifierProvider
代わりにNotifierProvider推奨


## riverpod_generator
コード生成
`flutter pub run build_runner build --delete-conflicting-outputs`