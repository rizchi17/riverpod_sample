import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sample_provider.g.dart';

@riverpod
int randomNumber(Ref ref) {
  print('called sampleFunction');
  // 1~100までのランダムな整数を返す
  return math.Random().nextInt(100);
}
