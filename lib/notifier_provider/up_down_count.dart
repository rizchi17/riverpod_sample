import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'up_down_count.g.dart';

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

