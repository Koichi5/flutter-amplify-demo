import 'package:flutter/material.dart';
import 'package:flutter_amplify_demo/permission/location_permission_handler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      LocationPermissionsHandler().request();
      return null;
    }, []);
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
