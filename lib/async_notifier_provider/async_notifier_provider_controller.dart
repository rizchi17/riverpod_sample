import 'dart:math' as math;
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'async_notifier_provider_controller.g.dart';

@riverpod
class AsyncNotifierScreenController extends _$AsyncNotifierScreenController {
  @override
  Future<int> build() async {
    await Future.delayed(const Duration(seconds: 1));
    return 0;
  }

  Future<int> getNewWord() async {
    await Future.delayed(const Duration(seconds: 1));
    return math.Random().nextInt(10)+1;
  }

  Future<void> setNewWord() async {
    state = const AsyncLoading();
    state = AsyncValue.data(state.value! + await getNewWord());
  }

  void deleteWord() {
    state = const AsyncValue.data(0);
  }
}
