import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('アップデート情報')),
      body: const Center(child: Column(
        children: [
          Text('９月のアップデート情報'),
          Text('〇〇機能が新たに追加されます！'),
        ],
      )),
    );
  }
}
