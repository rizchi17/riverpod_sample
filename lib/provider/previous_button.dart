import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 注意：例としてStateProviderも使うが、今回のメインはProvider
final pageIndexProvider = StateProvider<int>((ref) => 5);

// 今回のメイン
// ユーザが前のページに戻れるかどうかを計算するプロバイダ
final canGoToPreviousPageProvider = Provider<bool>((ref) {
  // ここにロジックがある
  return ref.watch(pageIndexProvider) != 0;
});

class PreviousButton extends ConsumerWidget {
  const PreviousButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerの特徴
    // 1. このウィジェットは値が変わった時に更新されるので、無駄な更新をせずに済む
    // 2. ウィジェットはこれでもう前のページに戻れるかの計算をする必要がない　
    // → ロジックとウィジェットを分離して管理できる
    
    // 値を監視するだけ。変更があったときにウィジェットが更新される。
    final canGoToPreviousPage = ref.watch(canGoToPreviousPageProvider);
    
    void goToPreviousPage() {
      // これは今回のメインではない
      ref.read(pageIndexProvider.notifier).update((state) => state - 1);
    }

    return ElevatedButton(
      onPressed: canGoToPreviousPage ? goToPreviousPage : null,
      child: const Text('previous'),
    );
  }
}

// 比較
// 以下では、ページが変わるたびにボタンが更新される
// 理想は、有効・無効が切り替わる時のみ更新

// final pageIndexProvider = StateProvider<int>((ref) => 0);

// class PreviousButton extends ConsumerWidget {
//   const PreviousButton({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // 現在のページが最初のページ（0）でない場合、戻るボタンを有効にする
//     final canGoToPreviousPage = ref.watch(pageIndexProvider) != 0;

//     void goToPreviousPage() {
//       ref.read(pageIndexProvider.notifier).update((state) => state - 1);
//     }

//     return ElevatedButton(
//       onPressed: canGoToPreviousPage ? goToPreviousPage : null,
//       child: const Text('previous'),
//     );
//   }
// }
