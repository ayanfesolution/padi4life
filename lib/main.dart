import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:padi4life/screens/onboarding/splash.dart';
import 'package:padi4life/utils/theme_data.dart';

import 'utils/module.dart';

void main() async {
  await initializeDependencies();

  await getIt.allReady();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Padi4Life',
      theme: Padi4LifeThemeData.appThemeData(context),
      home: const SplashScreen(),
    );
  }
}
