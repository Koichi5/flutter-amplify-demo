import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isShowInfoScreenProvider = StateProvider<bool>(((ref) => false));

class AboutScreen extends HookConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("About"),
            ElevatedButton(
                onPressed: () {
                  ref.watch(isShowInfoScreenProvider.notifier).state = true;
                },
                child: const Text("アップデート情報を見る"))
          ],
        ),
      ),
    );
  }
}
