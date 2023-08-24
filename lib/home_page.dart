import 'package:flutter/material.dart';
import 'package:flutter_amplify_demo/small_talk_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  HomePage({super.key});
  
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _handleNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ルーム作成"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "ハンドル名",
                  hintText: "",
                ),
                controller: _handleNameController,
                maxLength: 20,
                autovalidateMode: AutovalidateMode.disabled,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "ハンドル名を入力してください。";
                  }
                  return null;
                },
              ),
              Container(
                padding: const EdgeInsets.all(30.0),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SmallTalkPage(
                          handleName: _handleNameController.text,
                        );
                      }));
                    }
                  },
                  child: const Text('入室'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
