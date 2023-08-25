import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ホーム")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/about');
          },
          child: const Text(
            "詳細へ",
          ),
        ),
      ),
    );
  }
}
