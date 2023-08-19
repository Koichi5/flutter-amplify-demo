import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'amplifyconfiguration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> _configureAmplify() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
      log("amplify initialization successfully finished !");
    } on Exception catch (e) {
      log('Could not configure Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      _configureAmplify();
    }, []);

    return Authenticator(
      child: MaterialApp(
          builder: Authenticator.builder(), home: const LoggedInScreen()),
    );
  }
}

// class MyApp2 extends StatefulWidget {
//   const MyApp2({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp2> {
//   @override
//   void initState() {
//     super.initState();
//     _configureAmplify();
//   }

//   Future<void> _configureAmplify() async {
//     try {
//       await Amplify.addPlugin(AmplifyAuthCognito());
//       await Amplify.configure(amplifyconfig);
//       log("amplify initialization successfully finished !");
//     } on Exception catch (e) {
//       log('Could not configure Amplify: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Authenticator(
//       child: MaterialApp(
//           builder: Authenticator.builder(), home: const LoggedInScreen()),
//     );
//   }
// }

class LoggedInScreen extends HookConsumerWidget {
  const LoggedInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Logged In'),
            SignOutButton(),
          ],
        ),
      ),
    );
  }
}
