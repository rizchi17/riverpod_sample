import 'dart:math' as math;
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'async_notifier_provider_controller.g.dart';

@riverpod
class AsyncNotifierScreenController extends _$AsyncNotifierScreenController {
  @override
  Future<int> build() async {
    await Future.delayed(const Duration(seconds: 3));
    return 0;
  }

  Future<int> getNewWord() async {
    await Future.delayed(const Duration(seconds: 2));
    return math.Random().nextInt(10);
  }

  Future<void> setNewWord() async {
    state = const AsyncLoading();
    state = AsyncValue.data(await getNewWord());
  }

  void deleteWord() {
    state = const AsyncValue.data(0);
  }
}