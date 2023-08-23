import 'dart:developer';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amplify_demo/home_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> _configureAmplify() async {
    try {
      AmplifyDataStore datastorePlugin =
          AmplifyDataStore(modelProvider: ModelProvider.instance);
      await Amplify.addPlugin(datastorePlugin);
      await Amplify.addPlugin(AmplifyAPI());
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
      return null;
    }, []);

    return Authenticator(
      child: MaterialApp(
        builder: Authenticator.builder(),
        home: HomePage(),
        locale: const Locale("ja", "JP"),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale("ja", "JP")],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class LoggedInScreen extends HookWidget {
  const LoggedInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
