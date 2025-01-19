import 'package:riverpod_annotation/riverpod_annotation.dart';
// 生成ファイルのインポートを記述
part 'up_down_count.g.dart';

// 生成は以下のコマンド
// flutter pub run build_runner build --delete-conflicting-outputs

// アノテーション
@riverpod
class UpDownCount extends _$UpDownCount {
  @override
  int build() {
    return 10;
  }

  void decrease() {
    state -= 1;
  }

  void increase() {
    state += 1;
  }
}
