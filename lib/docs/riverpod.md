# Riverpod とは

- ウィジェットの再構築時に状態を失わない（StatefulWidget の State では再作成時(例えば画面遷移)にリセットされる）
- Provider をグローバル変数として定義するので、アクセスがしやすい
- 従来の package:provider と違い、 Riverpod では、同じ型のProviderを複数公開できる
